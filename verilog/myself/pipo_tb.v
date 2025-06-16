module pipo_tb;
    reg CLK=0,LOAD=1;
    reg[7:0]D_IN=8'b11010000;
    wire[3:0] Q;

    pipo uut_1(
        .clk(CLK),
        .load(LOAD),
        .d_in(D_IN),
        .q(Q)
    );

    always#2
        CLK=~CLK;

    initial
    #5 LOAD=0;

    initial
        begin
            $dumpfile("pipo.vcd");
            $dumpvars(0,pipo_tb);

            $monitor("%g %d %d",$time,D_IN,Q);
            #40 $finish;
        end

endmodule