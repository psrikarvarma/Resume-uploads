module lemming_2(
    input clk,bump_left,bump_right,areset,ground,
    output reg walk_left,
    output reg walk_right,aaah
);

reg dum;
reg fall;

always@(posedge clk, posedge areset)begin
    if(areset)begin
        aaah=1'b0;
        fall=1'b0;
        walk_left=1'b1;
        walk_right=~walk_left;
        dum=walk_left;end
    
    else begin
        if(ground)begin
            aaah=1'b0;
            walk_left=dum;
            walk_right=~dum;   
            if(walk_left)begin
                walk_left=(bump_left)?(fall)?walk_left:~walk_left:walk_left;
                fall=1'b0;
                walk_right=~walk_left;end
            
            else if(walk_right)begin
                walk_right=(bump_right)?(fall)?walk_right:~walk_right:walk_right;
                fall=1'b0;
                walk_left=~walk_right;end
                
            dum=walk_left;end
        else begin
            fall=1'b1;
            walk_left=1'b0;
            walk_right=1'b0;
            aaah=1'b1;
        end
    end
end
endmodule