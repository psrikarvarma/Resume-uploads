module sample_1(s,c0,a,b,c);
    output s,c0;
    input a,b,c;
    wire w1,w2,w3;
    xor(s,a,b,c);
    and(w1,a,b);
    and(w2,c,b);
    and(w3,a,c);
    or(c0,w1,w2,w3);
endmodule