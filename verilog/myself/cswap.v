module cswap(a,b,c,a_out,b_out,c_out);
    input a,b,c;
    output a_out,b_out,c_out;

    assign a_out=a;
    assign b_out=(~a&b)|(a&c);
    assign c_out=(a&b)|(~a&c);
    
endmodule