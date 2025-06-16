`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 11:07:12
// Design Name: 
// Module Name: Result_and_exception
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module r_sub(input [16:0]a,input [9:0]b, output [16:0]res);
    assign res=a-b;
endmodule
module bit_and(input [10:0] a,output s);
    assign s=&a;
endmodule
module Result_and_exception(i_mode,e_op,e_large_expff,e_large_frac00,
                            e_small_expff,e_small_frac00,o_res53,
                            n_z24,n_z29,n_res53,n_z52,o_exp,
                            r_res_frac,r_res_expo);
    input i_mode;
    input [1:0] e_op,e_large_expff,e_large_frac00,e_small_expff,e_small_frac00;
    input [4:0] n_z24,n_z29;
    input [5:0] n_z52;
    input [15:0] o_exp;
    input [52:0] n_res53,o_res53;
    output [51:0] r_res_frac;
    output [15:0] r_res_expo;
    wire [1:0] r_fp_largeff;
    wire [1:0] r_fp_smallff ;
    wire [1:0] r_fp_large_nan;
    wire [1:0] r_fp_small_nan;
    wire [1:0] r_s_is_ff;
    wire [1:0] r_s_is_nan;
    wire[1:0] r_fp,r_subnormal;
    wire check0=(o_exp[7:0]>n_z24);
    wire check1=(o_exp[15:8]>n_z29);
    wire check2=(o_exp>n_z52);
    wire [16:0] r_exp=i_mode?o_exp:{o_exp[15:8],1'b1,o_exp[7:0]};
    wire [16:0] r_subsa;
    wire [52:0] r_subres2,r_subres1;
    wire r_exp001=~(o_exp[7:0]==0),r_exp002=~(o_exp[15:8]==0);
    wire [9:0] to_minus=r_exp001?(r_exp002?10'b1000000001:10'b0000000001):(r_exp002?10'b1000000000:10'h000);
    wire [7:0] r_exp1,r_exp2;
    wire [16:0] r_et0;
    wire [16:0] r_in1=i_mode?n_z52:{3'b000,n_z29,4'b0000,n_z24};
    wire [10:0] op0=i_mode?r_exp[10:0]:{r_et0[7],r_exp[7],r_et0[7],r_et0[7:0]};
    wire [10:0] op1=i_mode?r_exp[10:0]:{r_et0[16],r_et0[16],r_et0[16],r_exp[16:9]};
    wire overflow0,overflow1;
    wire [15:0] r_temp_expo;
    wire fr0=(n_z24==24)&(~r_fp_largeff[0]);
    wire fr1=(n_z29==29)&(~r_fp_largeff[1]);
    wire [1:0] res_frac00=i_mode?{fr1&fr0,fr1&fr0}:{fr1,fr0};
    wire [1:0] check_overflow;
    assign r_fp_largeff[0] = e_large_expff[0] & (e_large_frac00[0]);
    assign r_fp_largeff[1] = e_large_expff[1] & (e_large_frac00[1]);
    assign r_fp_smallff[0] = e_small_expff[0] & e_small_frac00[0];
    assign r_fp_smallff[1] = e_small_expff[1] & e_small_frac00[1];
    assign r_fp_large_nan[0] = e_large_expff[0] & (~e_large_frac00[0]);
    assign r_fp_large_nan[1] = e_large_expff[1] & (~e_large_frac00[1]);
    assign r_fp_small_nan[0] = e_small_expff[0] & ~e_small_frac00[0];
    assign r_fp_small_nan[1] = e_small_expff[1] & ~e_small_frac00[1];
    assign r_s_is_ff[0] = r_fp_largeff[0] | r_fp_smallff[0]|overflow0;
    assign r_s_is_ff[1] = r_fp_largeff[1] | r_fp_smallff[1]|overflow1;
    assign r_s_is_nan[0] = r_fp_large_nan[0] | r_fp_small_nan[0] | (e_op[0] & r_fp_largeff[0] & r_fp_smallff[0]);
    assign r_s_is_nan[1] = r_fp_large_nan[1] | r_fp_small_nan[1] | (e_op[1] & r_fp_largeff[1] & r_fp_smallff[1]);
    assign r_fp[0]=(i_mode?(check2):(check0))&&~r_s_is_nan[0]&&~r_s_is_ff[0];
    assign r_fp[1]=(i_mode?(check2):(check1))&&~r_s_is_nan[1]&&~r_s_is_ff[1];
    assign r_subnormal[0]=~r_fp[0]&&~r_s_is_nan[0]&&~r_s_is_ff[0];
    assign r_subnormal[1]=~r_fp[1]&&~r_s_is_nan[1]&&~r_s_is_ff[1];
    r_sub inst2(r_exp,to_minus,r_subsa);
    assign r_subres1=o_res53<<r_subsa[7:0];
    assign r_subres2=o_res53<<r_subsa[16:9];
    r_sub inst1(r_exp,r_in1,r_et0);
    assign r_exp1=r_et0[7:0];
    assign r_exp2=i_mode?{5'b00000,r_et0[10:8]}:r_et0[16:9];
    bit_and and0(op0,overflow0);
    bit_and and1(op1,overflow1);
    assign r_res_frac[22:0]=r_fp[0]?n_res53[22:0]:(r_subnormal[0]?r_subres1[22:0]:(r_s_is_nan[0]?23'hfffffff:23'h000000));
    assign r_res_frac[51:23]=r_fp[1]?n_res53[51:23]:(r_subnormal[1]?(i_mode?r_subres1[51:23]:r_subres2[51:23]):(r_s_is_nan[1]?29'hffffffff:29'h000000000));
    assign r_temp_expo[7:0]=r_fp[0]?r_exp1[7:0]:(r_subnormal[0]?0:8'hff);
    assign r_temp_expo[15:8]=r_fp[1]?r_exp2[7:0]:(r_subnormal[1]?0:8'hff);
    assign check_overflow[0]=(r_subnormal[0]&(~e_op[0]))?(i_mode?o_res53[52]:o_res53[23]):1'b0;
    assign check_overflow[1]=(r_subnormal[1]&(~i_mode)&(~e_op[1]))?o_res53[52]:1'b0;
    assign r_res_expo[7:0]=check_overflow[0]?8'd1:(res_frac00[0]?8'd0:r_temp_expo[7:0]);
    assign r_res_expo[15:8]=check_overflow[1]?8'd1:((res_frac00[1])?8'd0:r_temp_expo[15:8]);
endmodule
