module tb_counter;
    reg clk;
    reg reset;
    reg increment;
    reg decrement;
    wire [3:0] count;  // This should match the width in the counter module.

    // Instance of the counter
    counter uut(
        .clk(clk),
        .reset(reset),
        .increment(increment),
        .decrement(decrement),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(1, tb_counter);

        reset = 0;
        increment = 0;
        decrement = 0;

        @(posedge clk) reset = 1;
        @(posedge clk) reset = 0;

        @(posedge clk) increment = 1;
        repeat(2) @(posedge clk);
        increment = 0;
        decrement = 1;

        @(posedge clk);
        decrement = 0;

        repeat(20) @(posedge clk);

        $finish;
    end
endmodule