module lemming_1(
    input clk,bump_left,bump_right,areset,
    output reg walk_left,
    output reg walk_right
);
reg dum;
always@(posedge clk, posedge areset)begin
    if(areset)begin
        walk_left=1'b1;
        walk_right=~walk_left;
        dum=walk_left;end
    
    else begin
        walk_left=dum;
        walk_right=~dum;   
        if(walk_left)begin
            walk_left=(bump_left)?~walk_left:walk_left;
            walk_right=~walk_left;end
        
        else if(walk_right)begin
            walk_right=(bump_right)?~walk_right:walk_right;
            walk_left=~walk_right;end

        dum=walk_left;
    end
end
endmodule