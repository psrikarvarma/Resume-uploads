module cswap(p,q,r,m,n,o);

input p,q,r;
output m,n,o;

assign m=p;
assign n=(p&r)|(~p&q);
assign o=(p&q)|(~p&r);

endmodule

module full_adder(a,b,c_in,c_out,s);

input a,b,c_in;
output s,c_out;

wire x,y,z;

cswap uut_2(
    .p(a),
    .q(b),
    .r(c_in),
    .m(x),
    .n(y),
    .o(z)
);

assign c_out=(x&y)|(y&z)|(z&x);
assign s=x&~(y^z)|(~x&(y^z));

endmodule 