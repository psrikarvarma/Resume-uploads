module sample_tb;

reg a,b,c;
wire o;

sample uut(
    .a(a),
    .b(b),
    .c(c),
    .o(o)

);

initial
    begin
        $dumpfile("sample.vcd");
        $dumpvars(0,sample_tb);
            {a,b,c}=3'b000;
        #2  {a,b,c}=3'b001;
        #2  {a,b,c}=3'b010;
        #2  {a,b,c}=3'b011;
        #2  {a,b,c}=3'b100;
        #2  {a,b,c}=3'b101;
        #2  {a,b,c}=3'b110;
        #2  {a,b,c}=3'b111;
    end

initial $monitor("time=%g, a=%b, b=%b, c=%b",$time,a,b,c);
initial #20 $finish;

endmodule