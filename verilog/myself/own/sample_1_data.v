module sample_1_data(o,a,b,c);
    output wire o;
    input a,b,c;
    assign o=(a|b)&c;
endmodule