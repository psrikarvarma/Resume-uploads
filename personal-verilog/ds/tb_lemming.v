`timescale 1ns / 1ns

module top_module_tb;

    reg clk;
    reg areset;
    reg bump_left;
    reg bump_right;
    reg ground;

    wire walk_left;
    wire walk_right;
    wire aaah;

    top_module uut (
        .clk(clk),
        .areset(areset),
        .bump_left(bump_left),
        .bump_right(bump_right),
        .ground(ground),
        .walk_left(walk_left),
        .walk_right(walk_right),
        .aaah(aaah)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        areset = 1;
        bump_left = 0;
        bump_right = 0;
        ground = 0;

        #10;
        areset = 0;

        // Test scenarios
        // Scenario 1: Walking left without obstacles
        #20;
        bump_left = 0;
        bump_right = 0;
        ground = 1;

        // Scenario 2: Bump on the left side, change direction
        #20;
        bump_left = 1;
        bump_right = 0;
        ground = 1;

        // Scenario 3: Falling on the right side
        #20;
        bump_left = 1;
        bump_right = 0;
        ground = 0;

        // Scenario 4: Walking right without obstacles
        #20;
        bump_left = 0;
        bump_right = 0;
        ground = 1;

        // Scenario 5: Bump on the right side, change direction
        #20;
        bump_left = 0;
        bump_right = 1;
        ground = 1;

        // Scenario 6: Falling on the left side
        #20;
        bump_left = 0;
        bump_right = 1;
        ground = 0;

        #20;
        $finish;
    end

    initial begin
        $dumpfile("Lemming.vcd");
        $dumpvars(0);
    end

endmodule
