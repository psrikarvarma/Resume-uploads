module top_tb;

reg[2:0]R;
reg LOAD=0;
reg CLOCK=0;

wire[2:0]OUT;

top_module dut_4(
    .r(R),
    .L(LOAD),
    .clk(CLOCK),
    .Q(OUT)
);

initial begin
#4 LOAD=~LOAD;
#2 LOAD=~LOAD;end

always#5
CLOCK=~CLOCK;

integer i;

initial
begin
        $dumpfile("tu_3.vcd");
        $dumpvars(0,top_tb);
        #4 R=3'b001;
        $monitor("%b %b",R,OUT);
        #100 $finish;

end

endmodule