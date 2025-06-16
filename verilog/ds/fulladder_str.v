module fulladder_str(output s,c0, input a,b,c);
    wire t1,t2,k;
    xor (s,a,b,c);
    xor (k,a,b);
    and(t1,a,b);
    and(t2,k,c);
    or(c0,t1,t2);
endmodule