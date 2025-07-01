module IEEE754_Adder_Testbench;

    reg [31:0] A, B;
    wire [31:0] O;
    
    // Instantiate the adder
    IEEE754_Adder UUT(
        .A(A),
        .B(B),
        .O(O)
    );
    
    // Test cases
    initial begin
        // Test case 1
        A = 32'h40C80000; // 6.25 in IEEE 754 format
        B = 32'h3F000000; // 0.5 in IEEE 754 format
        #10;
        $display("Test case 1:");
        $display("A = %f", convert_to_float(A));
        $display("B = %f", convert_to_float(B));
        $display("Expected Output = %f", convert_to_float(32'h40D00000)); // 6.5
        $display("Actual Output = %f", convert_to_float(O));
        $display("");
        
        // Test case 2
        A = 32'h40000000; // 2.0 in IEEE 754 format
        B = 32'hC0000000; // -2.0 in IEEE 754 format
        #10;
        $display("Test case 2:");
        $display("A = %f", convert_to_float(A));
        $display("B = %f", convert_to_float(B));
        $display("Expected Output = %f", convert_to_float(32'h00000000)); // 0.0
        $display("Actual Output = %f", convert_to_float(O));
        $display("");
        
        // End simulation
        $finish;
    end
    
    // Function to convert 32-bit bit-vector to floating-point number
    function real convert_to_float(input [31:0] bits);
        real real_value;
        real_value = $bitstoshortreal(bits);
        return real_value;
    endfunction
    
endmodule