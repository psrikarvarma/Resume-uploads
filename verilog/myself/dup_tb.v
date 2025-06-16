module dup_tb;
    reg CLK=0,RST=0;
    wire[3:0] Q;

    always#1
        CLK=~CLK;
    
    initial
    begin
        #5 RST=1;
        #2 RST=0;
    end

    integer i;

    dup uut_1(
        .clk(CLK),
        .rst(RST),
        .q(Q)
    );

    initial
    begin
        $dumpfile("dup.vcd");
        $dumpvars(0,dup_tb);

        $monitor("%g %b %b %d",$time,CLK,RST,Q);
        #50 $finish;
    end 

endmodule 