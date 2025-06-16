module sample(a,b,c,o);
    input a,b,c;
    output o;
    wire w;
    or (w,a,b);
    and (o,w,c);
endmodule