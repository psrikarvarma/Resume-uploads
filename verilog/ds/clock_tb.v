module clock_tb;
reg clk=0;
clock uut(
    .clk(clk)
);
always#(10)
    begin
        clk=~clk;
    end
initial
    begin
      $dumpfile("clock.vcd");
      $dumpvars(0,clock_tb);
    end
initial
    #100 $finish;
    
endmodule