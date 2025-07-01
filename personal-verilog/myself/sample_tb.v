module sample_tb;

    reg[3:0] A=0;
    wire[4:0] A_out;
    
    sample uut_1 (
        .a(A),
        .a_out(A_out)
    );

    integer i;

    initial
    begin
        $dumpfile("sample.vcd");
        $dumpvars(0,sample_tb);

            for(i=1;i<16;i++)begin
                #1 A=i;
            end

        $monitor("%g %b %b",$time,A,A_out);
        #1 $finish;

    end

endmodule