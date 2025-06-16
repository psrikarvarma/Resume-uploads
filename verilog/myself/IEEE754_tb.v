module IEEE754_adder_tb;

reg[31:0] A=32'h40C80000;
reg[31:0] B=32'h3E800000;

wire[31:0] SUM;

IEEE754_adder dut_1(
    .a(A),
    .b(B),
    .sum(SUM)
);

initial begin
    $dumpfile("IEEE754.vcd");
    $dumpvars(0,IEEE754_adder_tb);
    $monitor("%b %b %b",A,B,SUM);
end

endmodule 