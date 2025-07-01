module BoothMultiplier (
    input wire clk,
    input wire reset,
    input wire start,
    input wire signed [7:0] multiplicand,
    input wire signed [7:0] multiplier,
    output reg signed [15:0] product,
    output reg done
);

    reg [2:0] state;
    reg signed [7:0] A;
    reg signed [15:0] Q;
    reg Q_minus_1;
    reg [3:0] count;

    parameter IDLE = 3'd0, LOAD = 3'd1, PROCESS = 3'd2, SHIFT = 3'd3, DONE = 3'd4;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start) begin
                        state <= LOAD;
                    end
                end
                LOAD: begin
                    A <= multiplicand;
                    Q <= {8'b0, multiplier};
                    Q_minus_1 <= 0;
                    count <= 8;
                    state <= PROCESS;
                end
                PROCESS: begin
                    case ({Q[0], Q_minus_1})
                        2'b01: Q[15:8] <= Q[15:8] + A;
                        2'b10: Q[15:8] <= Q[15:8] - A;
                    endcase
                    state <= SHIFT;
                end
                SHIFT: begin
                    Q <= {Q[15], Q[15:1]};
                    Q_minus_1 <= Q[0];
                    count <= count - 1;
                    if (count == 0)
                        state <= DONE;
                    else
                        state <= PROCESS;
                end
                DONE: begin
                    product <= Q;
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule