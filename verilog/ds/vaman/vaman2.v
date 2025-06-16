module h24Toh12Hex(
  input [4:0] hour24,
  output nAM_PM,
  output [3:0] hour12);

  wire [4:0] hour24Sub;

  assign hour24Sub = hour24 - 5'd12;
  
  assign nAM_PM = (hour24 > 5'd11);
  assign hour12 = ((hour24 == 5'd0)|(hour24 == 5'd12)) ? 4'd12 : ((nAM_PM) ? hour24Sub[3:0] : hour24[3:0]);
endmodule

module h24Toh12Dec(
  input [5:0] hour24,
  output nAM_PM,
  output [4:0] hour12);

  wire [5:0] hour24Sub;

  assign hour24Sub = hour24 - ((hour24[5:1]==5'b10000) ? 6'h18 : 6'h12);
  
  assign nAM_PM = (hour24 > 6'h11);
  assign hour12 = ((hour24 == 6'h0)|(hour24 == 6'h12)) ? 5'h12 : ((nAM_PM) ? hour24Sub[4:0] : hour24[4:0]);
endmodule

module clockWorkHex(clk_1hz, time_in, time_out, time_ow);
  input clk_1hz, time_ow; //1 Hz clock (clock), Time overwrite (asynchronous reset)
  //Time signal format: hhhhh:mmmmmm:ssssss
  input [16:0] time_in; //time input
  output [16:0] time_out; //main output

  //separated time signals to respective meaning
  wire [5:0] sec_in, min_in;
  wire [4:0] hour_in;
  reg [5:0] sec_reg, min_reg;
  reg [4:0] hour_reg;

  //separation and combination of time signals
  assign {hour_in, min_in, sec_in} = time_in;
  assign time_out = {hour_reg, min_reg, sec_reg};

  //handle seconds
  always@(posedge clk_1hz or posedge time_ow)
    begin
      if(time_ow)
        begin
          sec_reg <= sec_in;
        end
      else
        begin
          sec_reg <= (sec_reg == 6'd59) ? 6'd0 : (sec_reg + 6'd1);
        end
    end

  //handle minutes
  always@(posedge clk_1hz or posedge time_ow)
    begin
      if(time_ow)
        begin
          min_reg <= min_in;
        end
      else
        begin
          if(sec_reg == 6'd59)
            begin
              min_reg <= (min_reg == 6'd59) ? 6'd0 : (min_reg + 6'd1);
            end
        end
    end

  //handle hours
  always@(posedge clk_1hz or posedge time_ow)
    begin
      if(time_ow)
        begin
          hour_reg <= hour_in;
        end
      else
        begin
          if((sec_reg == 6'd59)&(min_reg == 6'd59))
            begin
              hour_reg <= (hour_reg == 5'd23) ? 5'd0 : (hour_reg + 5'd1);
            end
        end
    end  
endmodule

module clockWorkDec(clk_1hz, time_in, time_out, time_ow);
  input clk_1hz, time_ow; //1 Hz clock (clock), Time overwrite (asynchronous reset)
  //Time signal format: hh_hhhh:mmm_mmmm:sss_ssss only decimal values
  input [19:0] time_in; //time input
  output [19:0] time_out; //main output

  //separated time signals to respective meaning
  wire [6:0] sec_in, min_in;
  wire [5:0] hour_in;
  reg [6:0] sec_reg, min_reg;
  reg [5:0] hour_reg;

  //separation and combination of time signals
  assign {hour_in, min_in, sec_in} = time_in;
  assign time_out = {hour_reg, min_reg, sec_reg};

  //handle seconds
  always@(posedge clk_1hz or posedge time_ow)
    begin
      if(time_ow)
        begin
          sec_reg <= sec_in;
        end
      else
        begin
          casex(sec_reg)
            7'h59:
              begin
                sec_reg <= 7'd0;
              end
            7'h?9:
              begin
                sec_reg <= {(sec_reg[6:4]+3'd1),4'h0};
              end
            default:
              begin
                sec_reg <= sec_reg + 7'd1;
              end
          endcase
        end
    end

  //handle minutes
  always@(posedge clk_1hz or posedge time_ow)
    begin
      if(time_ow)
        begin
          min_reg <= min_in;
        end
      else
        begin
          if(sec_reg == 7'h59)
            begin
              casex(min_reg)
                7'h59:
                  begin
                    min_reg <= 7'h0;
                  end
                7'h?9:
                  begin
                    min_reg <= {(min_reg[6:4]+3'd1),4'h0};
                  end
                default:
                  begin
                    min_reg <= min_reg + 7'd1;
                  end
              endcase
            end
        end
    end

  //handle hours
  always@(posedge clk_1hz or posedge time_ow)
    begin
      if(time_ow)
        begin
          hour_reg <= hour_in;
        end
      else
        begin
          if((sec_reg == 7'h59)&(min_reg == 7'h59))
            begin
              casex(hour_reg)
                6'h23:
                  begin
                    hour_reg <= 6'd0;
                  end
                6'b0?1001: //09 & 19
                  begin
                    hour_reg <= {(hour_reg[5:4]+3'd1),4'd0};
                  end
                default:
                  begin
                    hour_reg <= hour_reg + 6'd1;
                  end
              endcase
            end
        end
    end  
endmodule

module clockCalendarHex#(parameter YEARRES = 12)(clk, hour_in, date_in, date_out, date_ow);
  input clk, date_ow; //System clock, Date overwrite (asynchronous reset)
  //Time signal format: hhhhh_mmmmmm_ssssss
  input [4:0] hour_in; //hour data

  //Date signal format: ddddd_mmmm_yyyyyyyyyyyy
  //Year signal can be adjusted to count from another refence than 0, e.g. 1900, to reduce bit size
  input [(YEARRES+8):0] date_in; //date input
  output [(YEARRES+8):0] date_out; //main output

  //separated date signals to respective meaning
  wire [4:0] day_in;
  wire [3:0] month_in;
  wire [(YEARRES-1):0] year_in;
  reg [4:0] day_reg, day_reg_del; //day_reg_del: delayed signal
  reg [3:0] month_reg, month_reg_del; //month_reg_del: delayed signal
  reg [(YEARRES-1):0] year_reg;

  reg [4:0] hour_reg; //Store previous hour data
  reg new_day; //Detect new day
  wire new_year, new_month; //Detect new year/month

  //separation and combination of date signals
  assign {day_in, month_in, year_in} = date_in;
  assign date_out = {day_reg, month_reg, year_reg};

  //edge detaction for year & month changes
  assign new_year = (month_reg == 4'd1) & (month_reg_del != 4'd1);
  assign new_month = (day_reg == 4'd1) & (day_reg_del != 4'd1);

  always@(posedge clk) //edge detection
    begin
      new_day <= (hour_in == 5'd0) & (hour_reg == 5'd23);
    end

  always@(posedge clk) //generate delayed signals for edge detection
    begin
      hour_reg <= hour_in;
      day_reg_del <= day_reg;
      month_reg_del <= month_reg;
    end

  //handle year
  always@(posedge clk or posedge date_ow)
    begin
      if(date_ow)
        begin
          year_reg <= year_in;
        end
      else
        begin
          if(new_year)
            begin
              year_reg <= year_reg +{{(YEARRES-1){1'd0}},1'd1}; 
            end
        end
    end     

  //handle month
  always@(posedge clk or posedge date_ow)
    begin
      if(date_ow)
        begin
          month_reg <= month_in;
        end
      else
        begin
          if(new_month)
            begin
              month_reg <= (month_reg == 4'd12) ? 4'd1 : (month_reg + 4'd1); 
            end
        end
    end     
    
  //handle day
  always@(posedge clk or posedge date_ow) 
    begin
      if(date_ow)
        begin
          day_reg <= day_in;
        end
      else
        begin
          if(new_day)
            begin
              casex(month_reg)
                4'd2: //spacial case febuary
                  begin
                    /*
                     *  leap years:
                     *  if (year is not divisible by 4) then (it is a common year)
                     *  else if (year is not divisible by 100) then (it is a leap year)
                     *  else if (year is not divisible by 400) then (it is a common year)
                     *  else (it is a leap year)
                     */
                    if(year_reg[1:0] == 2'b00)
                      begin
                        day_reg <= (day_reg == 5'd29) ? 5'd1 : (day_reg + 5'd1);  
                      end
                    else
                      begin
                         day_reg <= (day_reg == 5'd28) ? 5'd1 : (day_reg + 5'd1);
                      end
                  end
                4'b0??0: //even months; April and June
                  begin
                    day_reg <= (day_reg == 5'd30) ? 5'd1 : (day_reg + 5'd1);
                  end
                4'b0??1: //odd months; January, March, May and July
                  begin
                    day_reg <= (day_reg == 5'd31) ? 5'd1 : (day_reg + 5'd1);
                  end
                4'b1??0: //even months; August, October, December
                  begin
                    day_reg <= (day_reg == 5'd31) ? 5'd1 : (day_reg + 5'd1);
                  end
                4'b1??1: //odd months; September, November
                  begin
                    day_reg <= (day_reg == 5'd30) ? 5'd1 : (day_reg + 5'd1);
                  end
              endcase
            end
        end
    end
endmodule

module clockCalendarDec4(clk, hour_in, date_in, date_out, date_ow);
  input clk, date_ow; //System clock, Date overwrite (asynchronous reset)
  //Time signal format: hh_hhhh:mmm_mmmm:sss_ssss
  input [5:0] hour_in; //hour data

  //Date signal format: dd_dddd.m_mmmm.yy_yyyy_yyyy_yyyy
  //Year signal can be adjusted to count from another refence than 0, e.g. 1900, to reduce bit size
  input [24:0] date_in; //date input
  output [24:0] date_out; //main output

  //separated date signals to respective meaning
  wire [5:0] day_in;
  wire [4:0] month_in;
  wire [13:0] year_in;
  reg [5:0] day_reg, day_reg_del; //day_reg_del: delayed signal
  reg [4:0] month_reg, month_reg_del; //month_reg_del: delayed signal
  reg [13:0] year_reg;

  reg [5:0] hour_reg; //Store previous hour data
  reg new_day; //Detect new day
  wire new_year, new_month; //Detect new year/month

  //separation and combination of date signals
  assign {day_in, month_in, year_in} = date_in;
  assign date_out = {day_reg, month_reg, year_reg};

  //edge detaction for year & month changes
  assign new_year = (month_reg == 5'h1) & (month_reg_del != 5'h1);
  assign new_month = (day_reg == 5'h1) & (day_reg_del != 5'h1);

  always@(posedge clk) //edge detection
    begin
      new_day <= (hour_in == 6'h0) & (hour_reg == 6'h23);
    end

  always@(posedge clk) //generate delayed signals for edge detection
    begin
      hour_reg <= hour_in;
      day_reg_del <= day_reg;
      month_reg_del <= month_reg;
    end

  //handle year
  always@(posedge clk or posedge date_ow)
    begin
      if(date_ow)
        begin
          year_reg <= year_in;
        end
      else
        begin
          if(new_year)
            begin
              casex(year_reg)
                14'h?999: year_reg <= {(year_reg[13:12]+2'd1),12'h000};
                14'h??99: year_reg <= {(year_reg[13:8]+6'd1),8'h00};
                14'h???9: year_reg <= {(year_reg[13:4]+10'd1),4'h0};
                default: year_reg <= year_reg + 14'b1;
              endcase 
            end
        end
    end     

  //handle month
  always@(posedge clk or posedge date_ow)
    begin
      if(date_ow)
        begin
          month_reg <= month_in;
        end
      else
        begin
          if(new_month)
            begin
              case(month_reg)
                5'h12: month_reg <= 5'h1;
                5'h09: month_reg <= 5'h10;
                default: month_reg <= month_reg + 5'd1;
              endcase 
            end
        end
    end     
    
  //handle day
  always@(posedge clk or posedge date_ow) 
    begin
      if(date_ow)
        begin
          day_reg <= day_in;
        end
      else
        begin
          if(new_day)
            begin
              casex(month_reg)
                5'd2: //spacial case febuary
                    /*
                     *  leap years:
                     *  if (year is not divisible by 4) then (it is a common year)
                     *  else if (year is not divisible by 100) then (it is a leap year)
                     *  else if (year is not divisible by 400) then (it is a common year)
                     *  else (it is a leap year)
                     */
                    casex(day_reg)
                      6'h29: day_reg <= 6'h1;
                      6'h28: day_reg <= (year_reg[1:0] == 2'b00) ? 6'h29 : 6'h1;
                      6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                      default: day_reg <= day_reg + 6'd1;
                    endcase
                5'b00??0: //even months; April and June; 4, 6
                  casex(day_reg)
                    6'h30: day_reg <= 6'd1;
                    6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                    default: day_reg <= day_reg + 6'd1;
                  endcase
                5'b00??1: //odd months; January, March, May and July; 1, 3, 5, 7
                  casex(day_reg)
                    6'h31: day_reg <= 6'd1;
                    6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                    default: day_reg <= day_reg + 6'd1;
                  endcase
                5'b????0: //even months; August, October, December; 8, 10, 12
                  casex(day_reg)
                    6'h31: day_reg <= 6'd1;
                    6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                    default: day_reg <= day_reg + 6'd1;
                  endcase
                5'b????1: //odd months; September, November; 9, 11
                  casex(day_reg)
                    6'h30: day_reg <= 6'd1;
                    6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                    default: day_reg <= day_reg + 6'd1;
                  endcase
              endcase
            end
        end
    end
endmodule

module clockCalendarDec2(clk, hour_in, date_in, date_out, date_ow);
  input clk, date_ow; //System clock, Date overwrite (asynchronous reset)
  //Time signal format: hh_hhhh:mmm_mmmm:sss_ssss
  input [5:0] hour_in; //hour data

  //Date signal format: dd_dddd.m_mmmm.yy_yyyy_yyyy_yyyy
  //Year signal can be adjusted to count from another refence than 0, e.g. 1900, to reduce bit size
  input [18:0] date_in; //date input
  output [18:0] date_out; //main output

  //separated date signals to respective meaning
  wire [5:0] day_in;
  wire [4:0] month_in;
  wire [7:0] year_in;
  reg [5:0] day_reg, day_reg_del; //day_reg_del: delayed signal
  reg [4:0] month_reg, month_reg_del; //month_reg_del: delayed signal
  reg [7:0] year_reg;

  reg [5:0] hour_reg; //Store previous hour data
  reg new_day; //Detect new day
  wire new_year, new_month; //Detect new year/month

  //separation and combination of date signals
  assign {day_in, month_in, year_in} = date_in;
  assign date_out = {day_reg, month_reg, year_reg};

  //edge detaction for year & month changes
  assign new_year = (month_reg == 5'h1) & (month_reg_del != 5'h1);
  assign new_month = (day_reg == 5'h1) & (day_reg_del != 5'h1);

  always@(posedge clk) //edge detection
    begin
      new_day <= (hour_in == 6'h0) & (hour_reg == 6'h23);
    end

  always@(posedge clk) //generate delayed signals for edge detection
    begin
      hour_reg <= hour_in;
      day_reg_del <= day_reg;
      month_reg_del <= month_reg;
    end

  //handle year
  always@(posedge clk or posedge date_ow)
    begin
      if(date_ow)
        begin
          year_reg <= year_in;
        end
      else
        begin
          if(new_year)
            begin
              casex(year_reg)
                8'h?9: year_reg <= {(year_reg[7:4]+4'd1),4'h0};
                default: year_reg <= year_reg + 8'b1;
              endcase 
            end
        end
    end     

  //handle month
  always@(posedge clk or posedge date_ow)
    begin
      if(date_ow)
        begin
          month_reg <= month_in;
        end
      else
        begin
          if(new_month)
            begin
              case(month_reg)
                5'h12: month_reg <= 5'h1;
                5'h09: month_reg <= 5'h10;
                default: month_reg <= month_reg + 5'd1;
              endcase 
            end
        end
    end     
    
  //handle day
  always@(posedge clk or posedge date_ow) 
    begin
      if(date_ow)
        begin
          day_reg <= day_in;
        end
      else
        begin
          if(new_day)
            begin
              casex(month_reg)
                5'd2: //spacial case febuary
                    /*
                     *  leap years:
                     *  if (year is not divisible by 4) then (it is a common year)
                     *  else if (year is not divisible by 100) then (it is a leap year)
                     *  else if (year is not divisible by 400) then (it is a common year)
                     *  else (it is a leap year)
                     */
                    casex(day_reg)
                      6'h29: day_reg <= 6'h1;
                      6'h28: day_reg <= (year_reg[1:0] == 2'b00) ? 6'h29 : 6'h1;
                      6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                      default: day_reg <= day_reg + 6'd1;
                    endcase
                5'b00??0: //even months; April and June; 4, 6
                  casex(day_reg)
                    6'h30: day_reg <= 6'd1;
                    6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                    default: day_reg <= day_reg + 6'd1;
                  endcase
                5'b00??1: //odd months; January, March, May and July; 1, 3, 5, 7
                  casex(day_reg)
                    6'h31: day_reg <= 6'd1;
                    6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                    default: day_reg <= day_reg + 6'd1;
                  endcase
                5'b????0: //even months; August, October, December; 8, 10, 12
                  casex(day_reg)
                    6'h31: day_reg <= 6'd1;
                    6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                    default: day_reg <= day_reg + 6'd1;
                  endcase
                5'b????1: //odd months; September, November; 9, 11
                  casex(day_reg)
                    6'h30: day_reg <= 6'd1;
                    6'h?9: day_reg <= {(day_reg[5:4]+2'h1),4'h0};
                    default: day_reg <= day_reg + 6'd1;
                  endcase
              endcase
            end
        end
    end
endmodule

module alarmHex(clk, rst, en_in, time_in, time_set_in, set_time, ring, end_ring);
  input clk, rst, set_time, end_ring, en_in;
  output reg ring;

  //Alarm is not sensitive to seconds
  input [10:0] time_set_in, time_in;
  reg [10:0] time_alarm;
    
  reg en;

  //set alarm time
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          time_alarm <= 11'd0;
        end
      else
        begin
          time_alarm <= (set_time) ? time_set_in : time_alarm;
        end
    end
    
  //handle to ringing of the alarm
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          ring <= 1'b0;
        end
      else
        begin
          if(en)
            begin
              //while ringing: stop if  end ring pressed
              //otherwise start ringing when time is equal to snooze
              ring <= (ring) ? (~end_ring) : (time_alarm == time_in);
            end
        end
    end

  //keep ringing shut after end_ring if high, but not disable for next day
  always@(posedge clk)
    begin
      if(time_alarm == time_in)
        begin
          en <= (end_ring) ? 1'b0 : en;
        end
      else
        begin
          en <= en_in;
        end
    end
endmodule//alarm

module alarmDec(clk, rst, en_in, time_in, time_set_in, set_time, ring, end_ring);
  input clk, rst, set_time, end_ring, en_in;
  output reg ring;

  //Alarm is not sensitive to seconds
  input [12:0] time_set_in, time_in;
  reg [12:0] time_alarm;
    
  reg en;

  //set alarm time
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          time_alarm <= 13'd0;
        end
      else
        begin
          time_alarm <= (set_time) ? time_set_in : time_alarm;
        end
    end
    
  //handle to ringing of the alarm
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          ring <= 1'b0;
        end
      else
        begin
          if(en)
            begin
              //while ringing: stop if  end ring pressed
              //otherwise start ringing when time is equal to snooze
              ring <= (ring) ? (~end_ring) : (time_alarm == time_in);
            end
        end
    end

  //keep ringing shut after end_ring if high, but not disable for next day
  always@(posedge clk)
    begin
      if(time_alarm == time_in)
        begin
          en <= (end_ring) ? 1'b0 : en;
        end
      else
        begin
          en <= en_in;
        end
    end
endmodule//alarm