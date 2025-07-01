module fulladder_tb;

//inputs
    reg a;
    reg b;
    reg c;

//outputs
    wire s;
    wire c0;

//instantiate the UUT
    fulladder_str uut(
        .s(s),
        .c0(c0),
        .a(a),
        .b(b),
        .c(c)
    );

    initial
        begin
            $dumpfile("fulladder.vcd");
            $dumpvars(0,fulladder_tb);

                {a,b,c}=3'b000;
            #2  {a,b,c}=3'b001;
            #2  {a,b,c}=3'b010;
            #2  {a,b,c}=3'b011;
            #2  {a,b,c}=3'b100;
            #2  {a,b,c}=3'b101;
            #2  {a,b,c}=3'b110;
            #2  {a,b,c}=3'b111;
        end

    initial $monitor("time=%g, c0=%b, s=%b, a=%b, b=%b, c=%b", $time,c0,s,a,b,c);
    initial #20 $finish;

endmodule