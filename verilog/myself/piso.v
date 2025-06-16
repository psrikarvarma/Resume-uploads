module piso(
    input clk,load,
    input[3:0]d_in,
    output reg q
);

reg[3:0] d;

initial
d=4'b0;

always@(posedge clk)begin
    if(load)
        d=d_in;
    q<=d[0];
    d=d>>1;
end


endmodule