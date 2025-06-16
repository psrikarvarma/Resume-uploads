module counter(
    input clk,
    input reset,
    input increment,
    input decrement,
    output reg [3:0] count = 0  // Initializing count to 0
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'd0;
    end else if (increment && !decrement) begin
        count <= count + 1;
    end else if (decrement && !increment) begin
        count <= count - 1;
    end
end

endmodule