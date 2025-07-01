`timescale 1ns / 1ps
module testBoothMultiplier;
    reg clk;
    reg reset;
    reg start;
    reg signed [7:0] multiplicand;
    reg signed [7:0] multiplier;
    wire signed [15:0] product;
    wire done;

    BoothMultiplier uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .done(done)
    );

    // Clock generation
    initial begin
        $dumpfile ("booth.vcd");
        $dumpvars(0,testBoothMultiplier);
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Test vectors
    initial begin
        reset = 1; start = 0; #25;
        reset = 0;

        // Test case 1: Positive numbers
        multiplicand = 8'd15; // 15
        multiplier = 8'd10;   // 10
        start = 1;
        #20 start = 0;
        wait(done);
        $display("Test Case 1: (%d) * (%d) = %d", multiplicand, multiplier, product);

        #30;
        reset = 1; #20; reset = 0; // Reset between tests

        // Test case 2: Negative and positive mix
        multiplicand = -8'd20; // -20
        multiplier = 8'd25;    // 25
        start = 1;
        #20 start = 0;
        wait(done);
        $display("Test Case 2: (%d) * (%d) = %d", multiplicand, multiplier, product);

        #30;
        reset = 1; #20; reset = 0;

        // Test case 3: Both numbers negative
        multiplicand = -8'd17; // -17
        multiplier = -8'd11;   // -11
        start = 1;
        #20 start = 0;
        wait(done);
        $display("Test Case 3: (%d) * (%d) = %d", multiplicand, multiplier, product);

        #100;
        $finish;
    end
endmodule