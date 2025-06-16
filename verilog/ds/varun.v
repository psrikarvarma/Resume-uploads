module Clock_Project_TB;

// Define parameters
parameter CLOCK_FREQ = 50_000_000; // 50 MHz
parameter TIMER_FREQ = 1_000; // 1 kHz

// Inputs
reg clk_in = 0;
reg mode_switch = 0;
reg [5:0] hour = 0;
reg [5:0] minute = 0;
reg [5:0] second = 0;
reg [6:0] day = 0;
reg [6:0] month = 0;
reg [7:0] year = 0;
reg [2:0] timezone = 0;
reg [3:0] timer_hours = 0;
reg [5:0] timer_minutes = 0;
reg [5:0] timer_seconds = 0;

// Outputs
wire clk_out;
wire mode_12hr;
wire ampm_led;
wire buzzer;

// Instantiate clock module
Clock clock_inst (
    .clk_in(clk_in),
    .clk_out(clk_out)
);

// Instantiate mode selector module
Mode_Selector mode_selector_inst (
    .mode_switch(mode_switch),
    .mode_12hr(mode_12hr)
);

// Instantiate AM/PM indicator module
AMPM_Indicator ampm_indicator_inst (
    .clk(clk_out),
    .mode_12hr(mode_12hr),
    .ampm_led(ampm_led)
);

// Instantiate LCD display module
LCD_Display lcd_display_inst (
    .clk(clk_out),
    .hour(hour),
    .minute(minute),
    .second(second),
    .day(day),
    .month(month),
    .year(year),
    .timezone(timezone),
    .mode_12hr(mode_12hr),
    .timer_hours(timer_hours),
    .timer_minutes(timer_minutes),
    .timer_seconds(timer_seconds)
);

// Instantiate Timer module
Timer timer_inst (
    .clk(clk_out),
    .hours(timer_hours),
    .minutes(timer_minutes),
    .seconds(timer_seconds),
    .buzzer(buzzer)
);

initial begin
    // Testbench code to simulate clock functionality
    // Simulate clock running for 1 second
    #100 $finish; // Finish simulation after 100 time units (1 second)
end

endmodule

// Define Clock module
module Clock (
    input wire clk_in,
    output reg clk_out
);

reg [31:0] count;

always @(posedge clk_in) begin
    count <= count + 1;
    if (count == (CLOCK_FREQ / 2) - 1) begin
        clk_out <= ~clk_out;
        count <= 0;
    end
end

endmodule

// Define Mode Selector module
module Mode_Selector (
    input wire mode_switch,
    output reg mode_12hr
);

always @(posedge mode_switch) begin
    mode_12hr <= ~mode_12hr; // Toggle mode between 12-hour and 24-hour
end

endmodule

// Define AM/PM Indicator module
module AMPM_Indicator (
    input wire clk,
    input wire mode_12hr,
    output reg ampm_led
);

reg [5:0] hour;

always @(posedge clk) begin
    if (mode_12hr) begin
        // In 12-hour mode, check hours for AM/PM
        if (hour >= 12)
            ampm_led <= 1'b1; // PM
        else
            ampm_led <= 1'b0; // AM
    end else begin
        // In 24-hour mode, no AM/PM distinction
        ampm_led <= 1'b0; // Turn off LED
    end
end

endmodule

// Define LCD Display module
module LCD_Display (
    input wire clk,
    input wire [5:0] hour,
    input wire [5:0] minute,
    input wire [5:0] second,
    input wire [6:0] day,
    input wire [6:0] month,
    input wire [7:0] year,
    input wire [2:0] timezone,
    input wire mode_12hr,
    input wire [3:0] timer_hours,
    input wire [5:0] timer_minutes,
    input wire [5:0] timer_seconds
);
// Implement LCD display functionality here
endmodule

// Define Timer module
module Timer (
    input wire clk,
    output reg buzzer,
    input wire [3:0] hours,
    input wire [5:0] minutes,
    input wire [5:0] seconds
);
// Implement timer functionality here
endmodule