module clock_tb;

    reg clock=1;
    reg[2:0] d;
    reg[2:0] q;
    clock dut(.clk(clock));
    
    always#(2)
        begin
            clock=~clock;
        end

    always@(posedge clock)
        begin
            q<=d;
        end

    initial
        begin
            $dumpfile("clock.vcd");
            $dumpvars(0,clock_tb);
                d=3'd00;
            #2  d=3'd01;
            #2  d=3'd02;
            #2  d=3'd03;
            #2  d=3'd04;
            #2  d=3'd05;
            #2  d=3'd06;
            #2  d=3'd07;

            $monitor("%b %b %b",d,q,clock,$time);
            #2 $finish;
        end
endmodule 