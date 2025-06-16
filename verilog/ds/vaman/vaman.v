module clock(
    input wire clk,
    input wire reset,
    output wire [6:0] lcd_data,
    output wire [3:0] led,
    output wire buzzer
);

reg [4:0] hours_24, minutes, seconds;
reg [3:0] hours_12;
reg am_pm;
reg [7:0] timer;

// Internal signals for displaying on LCD
reg [1:0] lcd_hours, lcd_minutes, lcd_seconds;
reg [3:0] lcd_hours_10, lcd_hours_1, lcd_minutes_10, lcd_minutes_1, lcd_seconds_10, lcd_seconds_1;

// Timer control
reg timer_enable;
reg timer_done;

// Clock mode control
reg clock_mode; // 0 for 24-hour format, 1 for 12-hour format

// Counter for AM/PM LED
reg [23:0] am_pm_counter;

// Internal signal to handle AM/PM LED
wire am_pm_led;

// Internal signals for buzzer control
reg buzzer_enable;
reg buzzer_ring;

// Clock module
always @(posedge clk or posedge reset) begin
    if (reset) begin
        hours_24 <= 0;
        minutes <= 0;
        seconds <= 0;
        hours_12 <= 0;
        am_pm <= 0;
        timer <= 0;
        $display("Reset: hours_24=%h, minutes=%h, seconds=%h, hours_12=%h, am_pm=%h, timer=%h", hours_24, minutes, seconds, hours_12, am_pm, timer);
    end
    else if (timer_enable && !timer_done) begin
        if (seconds == 0) begin
            if (minutes == 0) begin
                if (hours_24 == 0) begin
                    timer_done <= 1;
                end
                else begin
                    hours_24 <= hours_24 - 1;
                    minutes <= 59;
                    seconds <= 59;
                end
            end
            else begin
                minutes <= minutes - 1;
                seconds <= 59;
            end
        end
        else begin
            seconds <= seconds - 1;
        end
    end
    else begin
        if (seconds == 59) begin
            if (minutes == 59) begin
                if (hours_24 == 23) begin
                    hours_24 <= 0;
                end
                else begin
                    hours_24 <= hours_24 + 1;
                end
                minutes <= 0;
            end
            else begin
                minutes <= minutes + 1;
            end
            seconds <= 0;
        end
        else begin
            seconds <= seconds + 1;
        end
    end
    $display("Clock: hours_24=%h, minutes=%h, seconds=%h, hours_12=%h, am_pm=%h, timer=%h", hours_24, minutes, seconds, hours_12, am_pm, timer);
end

// Timer module
always @(posedge clk or posedge reset) begin
    if (reset) begin
        timer_enable <= 0;
        timer_done <= 0;
        $display("Reset Timer: timer_enable=%b, timer_done=%b", timer_enable, timer_done);
    end
    else begin
        if (timer_enable && !timer_done) begin
            if (timer == 0) begin
                buzzer_enable <= 1;
                timer_done <= 1;
            end
            else begin
                timer <= timer - 1;
            end
        end
    end
    $display("Timer: timer_enable=%b, timer_done=%b, timer=%h", timer_enable, timer_done, timer);
end

// LCD display module
always @(posedge clk or posedge reset) begin
    if (reset) begin
        lcd_hours <= 0;
        lcd_minutes <= 0;
        lcd_seconds <= 0;
        lcd_hours_10 <= 0;
        lcd_hours_1 <= 0;
        lcd_minutes_10 <= 0;
        lcd_minutes_1 <= 0;
        lcd_seconds_10 <= 0;
        lcd_seconds_1 <= 0;
        $display("Reset LCD: lcd_hours=%h, lcd_minutes=%h, lcd_seconds=%h, lcd_hours_10=%h, lcd_hours_1=%h, lcd_minutes_10=%h, lcd_minutes_1=%h, lcd_seconds_10=%h, lcd_seconds_1=%h", lcd_hours, lcd_minutes, lcd_seconds, lcd_hours_10, lcd_hours_1, lcd_minutes_10, lcd_minutes_1, lcd_seconds_10, lcd_seconds_1);
    end
    else begin
        if (clock_mode) begin // 12-hour format
            lcd_hours <= hours_12;
            lcd_minutes <= minutes;
            lcd_seconds <= seconds;
        end
        else begin // 24-hour format
            lcd_hours <= hours_24;
            lcd_minutes <= minutes;
            lcd_seconds <= seconds;
        end

        // Extract digits for display
        lcd_hours_10 <= lcd_hours / 10;
        lcd_hours_1 <= lcd_hours % 10;
        lcd_minutes_10 <= lcd_minutes / 10;
        lcd_minutes_1 <= lcd_minutes % 10;
        lcd_seconds_10 <= lcd_seconds / 10;
        lcd_seconds_1 <= lcd_seconds % 10;
    end
    $display("LCD: lcd_hours=%h, lcd_minutes=%h, lcd_seconds=%h, lcd_hours_10=%h, lcd_hours_1=%h, lcd_minutes_10=%h, lcd_minutes_1=%h, lcd_seconds_10=%h, lcd_seconds_1=%h", lcd_hours, lcd_minutes, lcd_seconds, lcd_hours_10, lcd_hours_1, lcd_minutes_10, lcd_minutes_1, lcd_seconds_10, lcd_seconds_1);
end

// AM/PM LED module
always @(posedge clk or posedge reset) begin
    if (reset) begin
        am_pm_counter <= 0;
        $display("Reset AM/PM: am_pm_counter=%d", am_pm_counter);
    end
    else if (am_pm_counter == 23999999) begin // 1 second delay for toggling
        am_pm_counter <= 0;
        am_pm <= ~am_pm;
    end
    else begin
        am_pm_counter <= am_pm_counter + 1;
    end
    $display("AM/PM: am_pm=%b, am_pm_counter=%d", am_pm, am_pm_counter);
end

assign am_pm_led = (am_pm && clock_mode); // AM is indicated when clock mode is 12-hour

// Buzzer module
always @(posedge clk or posedge reset) begin
    if (reset) begin
        buzzer_enable <= 0;
        buzzer_ring <= 0;
        $display("Reset Buzzer: buzzer_enable=%b, buzzer_ring=%b", buzzer_enable, buzzer_ring);
    end
    else begin
        if (buzzer_enable) begin
            buzzer_ring <= 1;
        end
        else begin
            buzzer_ring <= 0;
        end
    end
    $display("Buzzer: buzzer_enable=%b, buzzer_ring=%b", buzzer_enable, buzzer_ring);
end

// Assign output ports
assign lcd_data = {lcd_hours_10, lcd_hours_1, 10'b0, lcd_minutes_10, lcd_minutes_1, 10'b0, lcd_seconds_10, lcd_seconds_1};
assign led = {4'b0, am_pm_led};
assign buzzer = buzzer_ring;

endmodule
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
    #10 reset = 0; // De-assert reset after 10 time units
    // Run simulation for sufficient time
    #100000 $finish; // Finish simulation after 100,000 time units
end

endmodule