`timescale 1ns / 1ps

module i2c_master_tb;

    reg clk, reset;
    reg sda_drv;         // Drive this signal when master is expected to read
    wire sda;            // Actual SDA line (bidirectional)
    wire scl;
    wire [2:0] slave_select;
    wire [4:0] data_out;

    // Tri-state control to simulate open-drain behavior of SDA line
    assign sda = sda_drv ? 1 : 1'bz;

    i2c_master dut (
        .clk(clk),
        .reset(reset),
        .scl(scl),
        .sda(sda),
        .slave_select(slave_select),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("i2c.vcd");
        $dumpvars(0,i2c_master_tb);
    end

    always #10 clk = ~clk;  // Generate a 50MHz clock

    initial begin
        clk = 0;
        reset = 1;
        sda_drv = 0;  // Ensure SDA is not driven at start
        #20 reset = 0;

        // Drive SDA as needed for testing, followed by high-Z state
        sda_drv = 1; #20;
        sda_drv = 1; #20;
        sda_drv = 0; #20;
        sda_drv = 1; #20;
        sda_drv = 0; // Release the line

        #100 $finish;
    end

    initial begin
        $monitor("Time=%t, SCL=%b, SDA=%b, Slave Select=%b, Data=%b",
                 $time, scl, sda, slave_select, data_out);
    end
endmodule