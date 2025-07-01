module dup(
    input clk,rst,
    output reg[3:0] q
);


always@(negedge clk)
    begin
        if(rst)
            q=4'd0;
        else
            if(q>13)
                q<=4'd0;
            else
                q=q+4'd1;
    end

endmodule 