module halfadder_tb;

//inputs
    reg a;
    reg b;
//outputs
    wire s;
    wire c;
//instantiate uut
    halfadder uut (
        .s(s),
        .c(c),
        .a(a),
        .b(b)
    );

    initial begin

        $dumpfile("halfadder.vcd");
        $dumpvars(0, halfadder_tb);
      
        a=1'b0; b=1'b0;

        #2 a=1'b0; b=1'b1;

        #2 a=1'b1; b=1'b0;

        #2 a=1'b1; b=1'b1;

    end
        initial $monitor ("time =%g ns, s=%b, c=%b, a=%b, b=%b", $time,s,c,a,b);
        initial #10 $finish;

endmodule