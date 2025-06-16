module cswap_tb;
    reg A,B,C;
    wire A_out,B_out,C_out;

    cswap uut_1(
        .a(A),
        .b(B),
        .c(C),
        .a_out(A_out),
        .b_out(B_out),
        .c_out(C_out)
    );

    integer i;

    initial
        begin
            $dumpfile("cswap.vcd");
            $dumpvars(0,cswap_tb);

                for(i=0;i<8;i++)begin
                    #5 {A,B,C}=i;
                end

            $monitor("%g %b %b %b %b %b %b",$time,A,B,C,A_out,B_out,C_out);
            #5 $finish;
        end
endmodule