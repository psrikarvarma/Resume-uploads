module sample_1_data_tb;

//outputs
    wire o;

//inputs 
    reg a,b,c;

//instantiation
    sample_1_data uut(
        .a(a),
        .b(b),
        .c(c),
        .o(o)
    );

initial
    begin
        $dumpfile("sample_1_data.vcd");
        $dumpvars(0,sample_1_data_tb);
            {a,b,c}=3'b000;
          #1{a,b,c}=3'b001;
          #1{a,b,c}=3'b010;
          #1{a,b,c}=3'b011;
          #1{a,b,c}=3'b100;
          #1{a,b,c}=3'b101;
          #1{a,b,c}=3'b110;
          #1{a,b,c}=3'b111;
    end

initial $monitor("time=%gns, a=%b, b=%b, c=%b, o=%b",$time,a,b,c,o);

initial #10 $finish;

endmodule
