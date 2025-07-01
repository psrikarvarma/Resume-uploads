module mux(
    input m_0,m_1,
    input L,
    output reg m_o
);

always@(*)begin
m_o=(L==1'b1)?m_1:m_0;
end

endmodule

module ff(
    input clk,
    input d,
    output reg q
);

always@(posedge clk)
    q<=d;

endmodule

module sub_m(
    input L,in_0,in_1,
    input clk,
    output q
);

wire o;

mux uut_1(
    .m_0(in_0),
    .m_1(in_1),
    .L(L),
    .m_o(o)
);

ff uut_2(
    .clk(clk),
    .d(o),
    .q(q)
);

endmodule

module top_module(
    input[2:0] r,
    input clk,
    input L,
    output[2:0] Q
);

sub_m dut_1(
    .L(L),
    .clk(clk),
    .in_0(Q[0]),
    .in_1(r[2]),
    .q(Q[2])
);

sub_m dut_2(
    .L(L),
    .clk(clk),
    .in_0(Q[2]),
    .in_1(r[1]),
    .q(Q[1])
);

sub_m dut_3(
    .L(L),
    .clk(clk),
    .in_0(Q[1]^Q[0]),
    .in_1(r[0]),
    .q(Q[0])
);



endmodule