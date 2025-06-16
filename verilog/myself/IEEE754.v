module IEEE754_adder(
    input[31:0] a,
    input[31:0] b,
    output[31:0] sum
);

wire sign_a=a[31];
wire sign_b=b[31];

wire[7:0] exp_a=a[30:23];
wire[7:0] exp_b=b[30:23];

wire[23:0] mantissa_a={1'b1,a[22:0]};
wire[23:0] mantissa_b={1'b1,b[22:0]};

wire[23:0] aligned_mantissa_a;
wire[23:0] aligned_mantissa_b;

wire sign_sum;
wire[7:0] exp_sum;
wire[23:0] mantissa_sum;
wire carry;


assign aligned_mantissa_b=(exp_a>exp_b)?(mantissa_b>>(exp_a-exp_b)):mantissa_b;

assign aligned_mantissa_a=(exp_a>exp_b)?mantissa_a:(mantissa_a>>(exp_a-exp_b));

assign {carry,mantissa_sum}=(sign_a==sign_b)?aligned_mantissa_a+aligned_mantissa_b:aligned_mantissa_a-aligned_mantissa_b;

assign exp_sum=(carry)?     (exp_a>exp_b)?exp_a+1:exp_b+1 :     (exp_a>exp_b)?exp_a:exp_b;

assign sign_sum=(sign_a==sign_b)?sign_a:mantissa_sum[23];

assign sum={sign_sum,exp_sum,mantissa_sum[22:0]};


endmodule