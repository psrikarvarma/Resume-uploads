module IEEE754_Adder(
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] O
);

    reg [31:0] mantissa_A, mantissa_B, mantissa_O;
    reg [7:0] exp_A, exp_B, exp_O;
    reg sign_A, sign_B, sign_O;
    
    // Extracting components from input A
    always @(*) begin
        mantissa_A = {1'b1, A[22:0]};
        exp_A = A[30:23];
        sign_A = A[31];
    end
    
    // Extracting components from input B
    always @(*) begin
        mantissa_B = {1'b1, B[22:0]};
        exp_B = B[30:23];
        sign_B = B[31];
    end
    
    // Adder logic
    always @(*) begin
        if (exp_A > exp_B) begin
            mantissa_B = mantissa_B >> (exp_A - exp_B);
            exp_O = exp_A;
        end else begin
            mantissa_A = mantissa_A >> (exp_B - exp_A);
            exp_O = exp_B;
        end
        
        if (sign_A == sign_B) begin
            mantissa_O = mantissa_A + mantissa_B;
            sign_O = sign_A;
        end else begin
            mantissa_O = mantissa_A - mantissa_B;
            sign_O = (mantissa_A >= mantissa_B) ? sign_A : sign_B;
        end
        
        // Normalize the result
        if (mantissa_O[24]) begin
            mantissa_O = mantissa_O >> 1;
            exp_O = exp_O + 1;
        end
    end
    
    // Combining components to form output
    always @(*) begin
        O[31] = sign_O;
        O[30:23] = exp_O;
        O[22:0] = mantissa_O[23:1];
    end

endmodule