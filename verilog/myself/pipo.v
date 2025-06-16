module pipo(
    input clk,load,
    input[7:0]d_in,
    output reg[3:0]q
);

reg[7:0]d;

initial
    d=8'd0;

always@(posedge clk)begin
    if(load)
        d=d_in;
    d=d>>1;
    q<=d[3:0];
end


endmodule