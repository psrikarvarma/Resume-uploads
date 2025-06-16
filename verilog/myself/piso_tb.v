module piso_tb;
    reg CLK=0,LOAD=1;
    reg[3:0] D_IN=4'b1101;
    wire Q;

    piso uut_1(
        .clk(CLK),
        .load(LOAD),
        .d_in(D_IN),
        .q(Q)
    );

    always#1
        CLK=~CLK;

    initial
    #3 LOAD=0;

    always#11 begin
        LOAD=~LOAD;
        #3 LOAD=~LOAD;end

    integer i;

    initial
        begin
            $dumpfile("piso.vcd");
            $dumpvars(0,piso_tb);
                for(i=0;i<15;i++)
                    #11 D_IN=i;
            $monitor("%g %b",$time,Q);
            #20 $finish;
        end


endmodule