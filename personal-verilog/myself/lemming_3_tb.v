module lemming_3_tb;
    reg CLK=0,BUMP_LEFT=0,BUMP_RIGHT=0,ARESET=1,GROUND=1,DIG=0;
    wire WALK_LEFT,WALK_RIGHT,AAAH,DIGGING;

    always#1
        CLK=~CLK;

    initial begin
        #3 ARESET=~ARESET;end

    initial begin
        #9 BUMP_LEFT=~BUMP_LEFT;
        #2 BUMP_LEFT=~BUMP_LEFT;end

    initial begin
        #5 DIG=~DIG;
        #2 DIG=~DIG;
        #12 DIG=~DIG;
        #2 DIG=~DIG;
        /*#24 BUMP_RIGHT=~BUMP_RIGHT;*/end

    initial begin
        #13 GROUND=~GROUND;
        #6 GROUND=~GROUND;end

    lemming_3 uut(
        .clk(CLK),
        .bump_left(BUMP_LEFT),
        .bump_right(BUMP_RIGHT),
        .areset(ARESET),
        .ground(GROUND),
        .dig(DIG),
        .walk_left(WALK_LEFT),
        .walk_right(WALK_RIGHT),
        .aaah(AAAH),
        .digging(DIGGING)
    );

    initial begin
        $dumpfile("lemming_3.vcd");
        $dumpvars(0,lemming_3_tb);        
        #50 $finish;
    end

endmodule