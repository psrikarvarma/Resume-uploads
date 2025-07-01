module lemming_2_tb;
    reg CLK=1,BUMP_LEFT=0,BUMP_RIGHT=0,ARESET=1,GROUND=1;
    wire WALK_LEFT,WALK_RIGHT,AAAH;

    always#1
        CLK=~CLK;

    initial begin
        #3 ARESET=~ARESET;end

    initial begin
        #12 BUMP_LEFT=~BUMP_LEFT;
        #4 BUMP_LEFT=~BUMP_LEFT;end

    /*initial begin
        #24 BUMP_RIGHT=~BUMP_RIGHT;end*/

    initial begin
        #7 GROUND=~GROUND;
        #5 GROUND=~GROUND;
        #4 GROUND=~GROUND;
        #6 GROUND=~GROUND;end

    lemming_2 uut(
        .clk(CLK),
        .bump_left(BUMP_LEFT),
        .bump_right(BUMP_RIGHT),
        .areset(ARESET),
        .ground(GROUND),
        .walk_left(WALK_LEFT),
        .walk_right(WALK_RIGHT),
        .aaah(AAAH)
    );

    initial begin
        $dumpfile("lemming_2.vcd");
        $dumpvars(0,lemming_2_tb);        
        #50 $finish;
    end

endmodule