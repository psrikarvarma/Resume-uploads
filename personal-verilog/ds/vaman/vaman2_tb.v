`timescale 1ns / 1ps

module tb_h24h12();
  reg [4:0] hour24hex;
  reg [5:0] hour24dec;
  wire nAM_PMhex, nAM_PMdec;
  wire [3:0] hour12hex;
  wire [4:0] hour12dec;

  h24Toh12Hex uuthex(hour24hex,nAM_PMhex,hour12hex);
  h24Toh12Dec uutdec(hour24dec,nAM_PMdec,hour12dec);

  always #100 hour24hex = (hour24hex == 5'd23) ? 0 : hour24hex+1;
  always #100 hour24dec = (hour24dec == 6'h23) ? 0 : (((hour24dec == 6'h9)|(hour24dec == 6'h19)) ? (hour24dec+7) : (hour24dec+1));

  initial
    begin
      hour24hex = 0;
      hour24dec = 0;
    end
  initial
    begin
      $dumpfile("sim_h24h12.vcd");
      $dumpvars(0, hour24hex);
      $dumpvars(1, nAM_PMhex);
      $dumpvars(2, hour12hex);
      $dumpvars(3, hour24dec);
      $dumpvars(4, nAM_PMdec);
      $dumpvars(5, hour12dec);
      #1000000
      $finish;
    end
endmodule

`timescale 1ns / 1ps

module tb_time();
  reg clk_clock, time_ow;
  reg [19:0] time_in;
  wire [19:0] time_out;
  wire [6:0] sec, min;
  wire [5:0] hour;

  always #5  clk_clock = ~clk_clock; //In sim we assume 10ns = 1s
  
  assign {hour, min, sec} = time_out;

  clockWorkDec uut(clk_clock, time_in, time_out, time_ow);

  initial
        begin
            clk_clock = 0;
            time_ow = 0;
            time_in = {6'h23,7'h48,7'h0}; //23:48:00
            #12
            time_ow = 1;
            #10
            time_ow = 0;
            #1000000
            $finish;
        end
  initial //to get simulation outputs
      begin  
        $dumpfile("output_waveform.vcd"); 
        $dumpvars(0, clk_clock);
        $dumpvars(1, hour);
        $dumpvars(2, min);
        $dumpvars(3, sec);
      end
endmodule

`timescale 1ns / 1ps

module tb_cal();
  reg clk, date_ow;
  reg [5:0] hour_in;
  reg [24:0] date_in;
  reg [18:0] date_in2;
  wire [24:0] date_out;
  wire [5:0] day, day2;
  wire [4:0] month, month2;
  wire [13:0] year;
  wire [18:0] date_out2;
  wire [7:0] year2;


  always #1  clk = ~clk;
  always #10  hour_in <= (hour_in == 6'h23) ? 6'd0 : ((hour_in[3:0] == 4'h9) ? ({(hour_in[5:4] + 2'd1),4'h0}) : (hour_in + 6'd1)); 

  assign {day, month, year} = date_out;
  assign {day2, month2, year2} = date_out2;

  clockCalendarDec4 uut(clk, hour_in, date_in, date_out, date_ow);
  clockCalendarDec2 uut2(clk, hour_in, date_in2, date_out2, date_ow);

  initial
        begin
            hour_in = 0;
            clk = 0;
            date_ow = 0;
            date_in = {6'h15,5'h01,14'h2020}; //15.01.2020
            date_in2 = {6'h15,5'h01,8'h20}; //15.01.2020
            #12
            date_ow = 1;
            #10
            date_ow = 0;
            #1000000
            $finish;
        end
  initial //to get simulation outputs
      begin  
        $dumpfile("output_waveform.vcd"); 
        $dumpvars(0, clk);
        $dumpvars(1, hour_in);
        $dumpvars(2, day);
        $dumpvars(3, month);
        $dumpvars(4, year);
        $dumpvars(5, year2);
      end
endmodule

`timescale 1ns / 1ps

module tb_alrm();

    reg clk, rst, en_in, end_ring, set_time;
    wire [10:0] time_in, time_set_in;
    reg [5:0] min_set, min;
    reg [4:0] hour_set, hour;

    wire ring;
    
    assign time_in = {hour, min};
    assign time_set_in = {hour_set, min_set};

    alarmHex uut(clk, rst, en_in, time_in, time_set_in, set_time, ring, end_ring);

    always #5  clk = ~clk; //10 cycle is 10ns

    always #100 //assume a minute is 10 cycle, 100ns
        begin
            if (min == 6'd59)
                begin
                    hour = (hour == 5'd23) ? 5'd0 : (hour + 5'd1);
                end
            min = (min == 6'd59) ? 6'd0 : (min + 6'd1);
        end

    initial
        begin
            clk = 0;
            rst = 0;
            hour = 0;
            min = 0;
            hour_set = 5'd8;
            min_set = 6'd30;
            end_ring = 0;
            set_time = 0;
            en_in = 0;
            #2
            rst = 1;
            #5
            rst = 0;
            #1000
            //set time for 10 min before alarm (23:50)
            hour = 5'd23;
            min = 6'd50;
            #2000 //wait 20 min to test unenabled alarm 
            //set alarm to 8:30
            set_time = 1;
            #10  
            set_time = 0;
            //set time for 10 min before alarm (8:20)
            en_in = 1;
            hour = 5'd8;
            min = 6'd20;
            #1200 //wait 12 min to test alarm
            end_ring <= 1;
            #10
            end_ring <= 0;
            hour_set = 5'd15;
            min_set = 6'd45;
            #10
            //set alarm to 15:45
            set_time = 1;
            #10  
            set_time = 0;
            //set time for 10 min before alarm (15:35)
            hour = 5'd15;
            min = 6'd35;
            #1010 //wait 10 min + 1 cycle to test alarm
            end_ring <= 1;
            #10
            end_ring <= 0;
            #1000000
            $finish;
        end

    initial //to get simulation outputs
      begin  
        $dumpfile("output_waveform.vcd"); 
        $dumpvars(0, tb_alrm);
      end

endmodule // tb