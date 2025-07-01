module clk_tb;

reg clk=0;

parameter para =2;

clk uut(
    .clk(clk)
);

always#(para/2)
    begin
        clk = ~clk;
    end 

initial
    begin
        $dumpfile("clk.vcd");
        $dumpvars(0,clk_tb);
        $monitor("time = %g, clk = %b", $time, clk);
        #10 $finish;
    end
endmodule