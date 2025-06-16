module clock_tb;

reg clk;
reg reset;
wire [6:0] lcd_data;
wire [3:0] led;
wire buzzer;

// Instantiate clock module
clock clock_inst(
    .clk(clk),
    .reset(reset),
    .lcd_data(lcd_data),
    .led(led),
    .buzzer(buzzer)
);

// Clock generation
always #5 clk = ~clk;

// Reset generation
initial begin
    $dumpfile("vaman.vcd");
    $dumpvars(0,clock_tb);
    reset = 1;
    #10 reset = 0;
    #1000 $finish;
end

endmodule