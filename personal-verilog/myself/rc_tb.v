module rc_tb;
    reg CLK=0,RST=1;
    reg[3:0] D=4'b1010; //adjust number here to have it's ring counter
    wire[3:0] Q;

    always#100
        CLK=~CLK;
    
    initial
        begin
            #300 RST=0;
        end


    rc uut_1(
        .clk(CLK),
        .rst(RST),
        .d(D),
        .q(Q)
    );

    initial
        begin
            $dumpfile("rc.vcd");
            $dumpvars(0,rc_tb);

            $monitor("%g %b %b",$time,D,Q);
            #2000 $finish;
        end 
endmodule