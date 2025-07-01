module lemming_1_tb;
    reg CLK=0,BUMP_LEFT=1,BUMP_RIGHT=1,ARESET=1;
    wire WALK_LEFT,WALK_RIGHT;

    always#1
        CLK=~CLK;

    initial begin
        #3 ARESET=~ARESET;
        #8 ARESET=~ARESET;
        #3 ARESET=~ARESET;end

    initial begin
        #20 BUMP_LEFT=~BUMP_LEFT;
        #4 BUMP_LEFT=~BUMP_LEFT;end

    initial begin
        #24 BUMP_RIGHT=~BUMP_RIGHT;end

    lemming_1 uut(
        .clk(CLK),
        .bump_left(BUMP_LEFT),
        .bump_right(BUMP_RIGHT),
        .areset(ARESET),
        .walk_left(WALK_LEFT),
        .walk_right(WALK_RIGHT)
    );

    initial begin
        $dumpfile("lemming_1.vcd");
        $dumpvars(0,lemming_1_tb);        
        #50 $finish;
    end

endmodule