module dataflow_tst;

reg a,b;
wire s,c;

dataflow uut (
    .s(s),
    .c(c),
    .a(a),
    .b(b)

);

initial
begin

    $dumpfile("dataflow.vcd");
    $dumpvars(0, dataflow_tst);
        a=1'b0; b=1'b0;

        #2 a=1'b0; b=1'b1;

        #2 a=1'b1; b=1'b0;

        #2 a=1'b1; b=1'b1;
end 

    initial $monitor ("time = %gns, s = %b, c = %b, a = %b, b = %b",$time,s,c,a,b);
    initial #10 $finish;

endmodule
