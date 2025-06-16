module sample_1_behave(o,a,b,c);
    output reg o;
    input a,b,c;
    always@(*)
        begin
            o=(a|b)&c;
        end
endmodule