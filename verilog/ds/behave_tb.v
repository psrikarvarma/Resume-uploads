module behave_p;

    reg a;
    reg b;
    wire s;
    wire c;

    behave uut(
        .s(s),
        .c(c),
        .a(a),
        .b(b)

    );

initial
    begin
        $dumpfile("behave.vcd");
        $dumpvars(0,behave_p);

        a=1'b0; b=1'b0;

        #2 a=1'b0; b=1'b1;

        #2 a=1'b1; b=1'b0;

        #2 a=1'b1; b=1'b1;

    end

    initial $monitor("time = %gns, s = %b, c = %b, a = %b, b = %b", $time,s,c,a,b);
    initial #10 $finish;

endmodule
