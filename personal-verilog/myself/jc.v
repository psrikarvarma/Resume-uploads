module rc(clk,rst,d,q);

input clk,rst;
input [3:0] d;
output reg[3:0]q;
reg w;
reg[3:0]z;

always@(posedge clk)begin
    if(rst)begin
        z<=d;
        q<=4'b0000;
        #1 w<=z[0];end
    else begin
        w<=~z[0];
        q<=z>>1;
        #1 q[3]<=w;
        #1 z<=q;end
end

endmodule 