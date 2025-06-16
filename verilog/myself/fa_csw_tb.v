module fa_tb;
    reg A,B,C;
    wire S,C_O;

    full_adder uut_1(
        .a(A),
        .b(B),
        .c_in(C),
        .c_out(C_O),
        .s(S)
    );

    integer i;

    initial
        begin
            $dumpfile("fa_csw.vcd");
            $dumpvars(0,fa_tb);
            
            for(i=0;i<8;i++)
                #5 {A,B,C}=i;

            $monitor("%g %b %b %b %b %b",$time,A,B,C,C_O,S);
            #5 $finish;
        end

endmodule 