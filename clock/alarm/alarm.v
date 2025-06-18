module co9 (output reg rs , output reg en, output reg buzz, output reg [7:4] data);
reg [7:0] one_sec,min9,hour9;
reg [7:0] ten_sec,min5,hour2;
reg [7:0] ten_sec_,min5_,hour2_,one_sec_,min9_,hour9_;
reg [7:0] alatensec,alaonesec,alamin9,alamin5,alahour9,alahour2;
// up counter
integer i=1;
integer count=0;
reg counter=1'b0;

reg [3:0] nibs [1:51];
//reg [3:0] delay;//delay should go up till 10
reg [26:0] delay;
integer x=0;
initial begin
delay = 8'd48;

end
wire clk;
qlal4s3b_cell_macro u_qlal4s3b_cell_macro (
.Sys_Clk0 (clk),
);


always @(posedge clk) begin
  if(delay<12000000)
              delay<=delay+1;

else
begin
   delay<=27'b0000;	
if (x==0)begin
one_sec = 8'd0;
min9 = 8'd8;
hour9 = 8'd1;
ten_sec = 8'd0;
min5 = 8'd5;
hour2 = 8'd1;
ten_sec_=8'd48;
min5_=8'd48;
hour2_=8'd48;
one_sec_=8'd48;
min9_=8'd48;
hour9_=8'd48;
alahour2=8'd1;
alahour9=8'd1;
alamin5=8'd5;
alamin9=8'd9;
alatensec=8'd3;
alaonesec=8'd0;
x=1;
buzz=1'b0;
end
else if(x==1)
begin
if (ten_sec==8'd5 && one_sec==8'd9 && min5==8'd5 && min9==8'd9 && hour9==8'd1 && hour2==8'd1) begin
   ten_sec<=8'd0;
   one_sec<=8'd0;
   min9<=8'd0;
   min5<=8'd0;
   hour9<=8'd0;
   hour2<=8'd0;
   counter <= ~counter;
  end
  else if (ten_sec==8'd5 && one_sec==8'd9 && min5==8'd5 && min9==8'd9 && hour9==8'd9) begin
   ten_sec<=8'd0;
   one_sec<=8'd0;
   min9<=8'd0;
   min5<=8'd0;
   hour9<=8'd0;
   hour2<= hour2+8'd1;
  end
  else if (ten_sec==8'd5 && one_sec==8'd9 && min5==8'd5 && min9==8'd9) begin
   ten_sec<=8'd0;
   one_sec<=8'd0;
   min9<=8'd0;
   min5<=8'd0;
   hour9<=hour9+8'd1;
   end

  else if (ten_sec==8'd5 && one_sec==8'd9 && min9==8'd9 ) begin
   ten_sec<=8'd0;
   one_sec<=8'd0;
   min9<=8'd0;
   min5 <= min5 + 8'd1;
  end
  else if (ten_sec==8'd5 && one_sec==8'd9) begin
   ten_sec<=8'd0;
   one_sec<=8'd0;
   min9 <= min9 + 8'd1;
  end
 else if(one_sec==8'd9) begin
  one_sec<=8'd0;
  ten_sec<=ten_sec+3'd1;
  end
 
else if(one_sec<8'd9) begin

one_sec <= one_sec + 8'd1;

 end

if (ten_sec == alatensec && one_sec == alaonesec && min5 == alamin5 && min9 == alamin9 && hour2 == alahour2 && hour9 == alahour9)
    begin
    buzz <= 1'b1;
     end

end
end
end

always @(posedge clk) begin
ten_sec_= ten_sec + 8'd48;
one_sec_ = one_sec + 8'd48;
min5_ = min5 + 8'd48;
hour2_ = hour2 + 8'd48;
min9_ = min9 + 8'd48;
hour9_ = hour9 + 8'd48 ;

if (counter == 1'b1) begin
   nibs[34]=4'h5;
   nibs[35]=4'h0;
   nibs[36]=4'h4;
   nibs[37]=4'hD;
    end
  else if (counter == 1'b0) begin
   nibs[34]=4'h4;
   nibs[35]=4'h1;
   nibs[36]=4'h4;
   nibs[37]=4'hD;
   end

nibs[1]=4'h3;
nibs[2]=4'h3;
nibs[3]=4'h3;
nibs[4]=4'h2;
nibs[5]=4'h2;
nibs[6]=4'h8;
nibs[7]=4'h0;
nibs[8]=4'hC;
nibs[9]=4'h0;
nibs[10]=4'h6;
nibs[11]=4'h0;
nibs[12]=4'h1;
nibs[13]=4'h8;
nibs[14]=4'h0;
nibs[15]=1'b1;
nibs[16]=hour2_[7:4];//hours
nibs[17]=hour2_[3:0];
nibs[18]=hour9_[7:4];
nibs[19]=hour9_[3:0];
nibs[20]=4'h3;
nibs[21]=4'hA;
nibs[22]=min5_[7:4];//mins
nibs[23]=min5_[3:0];
nibs[24]=min9_[7:4];
nibs[25]=min9_[3:0];
nibs[26]=4'h3;
nibs[27]=4'hA;
nibs[28]=ten_sec_[7:4];//sec						
nibs[29]=ten_sec_[3:0];
nibs[30]=one_sec_[7:4];
nibs[31]=one_sec_[3:0];
nibs[32]=4'h2;
nibs[33]=4'h0;
nibs[38]=4'hC;
nibs[39]=4'h0;
nibs[40]=4'h2;
nibs[41]=4'h0;
nibs[42]=4'h2;
nibs[43]=4'h0;
nibs[44]=4'h2;
nibs[45]=4'h0;
nibs[46]=4'h2;
nibs[47]=4'h0;
nibs[48]=4'h2;
nibs[49]=4'h0;
nibs[50]=4'h2;
nibs[51]=4'h0;

	
if(i<15)
 begin 
    rs<=1'b0;
    data=nibs[i];
    en<=1'b1;
    if(count == 800)
    begin 
       en<=1'b0;
       count<=0;
       i<=i+1;
    end
    else 
       count<=count+1;
end
    if(i==15)
    begin
       if(count==60000)
       begin
         count<=8'd0;
         i<=i+1;
       end
         else
         count<=count+1;
    end
    
    if((i>15 && i<38)||(i>39 && i<=51))
    begin
     rs<=1'b1;
     data=nibs[i];
     en<=1'b1;
     if(count==800)
     begin
       en<=1'b0;
       count<=8'd0;
       i<=i+1;
     end
     else
       count<=count+1;
     end
if(i>=38 && i<=39)
    begin
       rs<=1'b0;
       data = nibs[i];
       en<=1'b1;
       if(count==800)
       begin
         en<=1'b0;
         count<=8'd0;
         i<=i+1;
       end
       else
         count<=count+1;
       end 
       if(i>51)
	 i<=13;
end


endmodule


