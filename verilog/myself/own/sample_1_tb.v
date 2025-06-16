module sample_1_tb;

//inputs
    reg a;
    reg b;
    reg c;

//outputs
    wire s;
    wire c0;

//instantiation
    sample_1 uut (
    .s(s),
    .c0(c0),
    .a(a),
    .b(b),
    .c(c)
    );

initial
    begin
        $dumpfile("sample_1.vcd");
        $dumpvars(0,sample_1_tb);

            {a,b,c}=3'b000;
         #2 {a,b,c}=3'b001;
         #2 {a,b,c}=3'b010;
         #2 {a,b,c}=3'b011;
         #2 {a,b,c}=3'b100;
         #2 {a,b,c}=3'b101;
         #2 {a,b,c}=3'b110;
         #2 {a,b,c}=3'b111;
    end

initial $monitor ("time=%g, a=%b, b=%b, c=%b, c0=%b, s=%b", $time,a,b,c,c0,s);

initial #20 $finish;

endmodule