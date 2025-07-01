module d_ff_tb;
//inputs
reg clk=0, d=0, reset=0;
//outputs
wire q;
//parameter
parameter period = 10;
//intsantiate
d_ff dut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

always #(period/2) clk = ~clk;

initial
    begin
        $dumpfile("d_ff.vcd");
        $dumpvars(0,d_ff_tb);
        $monitor("time = %g, d=%b, q=%b",$time,d,q);
        #20 reset =1;
        #10 reset =0;
        #50 d=1;
        #20 d=0;
        #100 $finish;
    end

endmodule