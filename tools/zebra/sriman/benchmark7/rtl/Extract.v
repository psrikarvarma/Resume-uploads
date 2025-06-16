`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 10:25:10
// Design Name: 
// Module Name: Extract
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


module expff(input [7:0] in0,in1,
            output[1:0] out);
    assign out[0]=&in0;
    assign out[1]=&in1;
endmodule
module Extract(i_mode,i_A,i_B,e_large_exp,e_small_exp,
                e_large_frac53,e_small_frac53,
                e_large_expff,e_small_expff,
                e_large_frac00,e_small_frac00,
                e_small_hidden_bit,e_large_hidden_bit,e_op,e_Ls);
    input i_mode;
    input [63:0] i_A,i_B;
    output [15:0] e_large_exp,e_small_exp;
    output [52:0] e_large_frac53,e_small_frac53;
    output [1:0] e_large_expff,e_small_expff,e_large_frac00,e_small_frac00;
    output [1:0] e_small_hidden_bit,e_large_hidden_bit,e_op,e_Ls;
    wire [63:0] e_fp_large,e_fp_small;
    wire e_compl=i_A[62:0]>i_B[62:0];
    wire e_comps=i_A[30:0]>i_B[30:0];
    wire e_hl=|e_fp_large[62:55];
    wire e_hs=|e_fp_small[62:55];
    wire xs=|e_fp_small[54:52];
    wire xl=|e_fp_large[54:52];
    wire e_opl=e_fp_large[63]^e_fp_small[63];
    wire [2:0] e_sff=&e_fp_small[54:52];
    wire [2:0] e_lff=&e_fp_large[54:52];
    wire [7:0] ins1=i_mode?{e_sff&e_fp_small[62],e_fp_small[61:55]}:e_fp_small[62:55];
    wire [7:0] inl1=i_mode?{e_lff&e_fp_large[62],e_fp_large[61:55]}:e_fp_large[62:55];
    wire [7:0] ins0=i_mode?ins1:e_fp_small[30:23];
    wire [7:0] inl0=i_mode?inl1:e_fp_large[30:23];
    wire  e_lfrac00_22bit=~|e_fp_large[22:0];
    wire  e_lfrac00_51_32=~|e_fp_large[51:32];
    wire  e_lfrac00_54_52=~|e_fp_large[54:52];
    wire  e_lfrac00_30_23=~|e_fp_large[30:23];
    wire  e_sfrac00_22bit=~|e_fp_small[22:0];
    wire  e_sfrac00_51_32=~|e_fp_small[51:32];
    wire  e_sfrac00_54_52=~|e_fp_small[54:52];
    wire  e_sfrac00_30_23=~|e_fp_small[30:23];
    wire e_lfrac00=e_lfrac00_22bit&e_lfrac00_51_32&e_lfrac00_30_23;
    wire e_sfrac00=e_sfrac00_22bit&e_sfrac00_51_32&e_sfrac00_30_23;
    assign e_fp_large[31:0]=i_mode?(e_compl?i_A[31:0]:i_B[31:0]):(e_comps?i_A[31:0]:i_B[31:0]);
    assign e_fp_large[63:32]=e_compl?i_A[63:32]:i_B[63:32];
    assign e_fp_small[31:0]=i_mode?(~e_compl?i_A[31:0]:i_B[31:0]):(~e_comps?i_A[31:0]:i_B[31:0]);
    assign e_fp_small[63:32]=~e_compl?i_A[63:32]:i_B[63:32];
    assign e_large_hidden_bit[0]=|e_fp_large[30:23];
    assign e_small_hidden_bit[0]=|e_fp_small[30:23];
    assign e_large_hidden_bit[1]=i_mode?e_hl|xl:e_hl;
    assign e_small_hidden_bit[1]=i_mode?e_hs|xs:e_hs;
    assign e_large_frac53[22:0]=e_fp_large[22:0];
    assign e_small_frac53[22:0]=e_fp_small[22:0];
    assign e_large_frac53[23]=i_mode?e_fp_large[23]:e_large_hidden_bit[0];
    assign e_small_frac53[23]=i_mode?e_fp_small[23]:e_small_hidden_bit[0];
    assign e_large_frac53[52:24]=i_mode?{e_large_hidden_bit[1],e_fp_large[51:24]}:{e_large_hidden_bit[1],e_fp_large[54:32],5'b00000};
    assign e_small_frac53[52:24]=i_mode?{e_small_hidden_bit[1],e_fp_small[51:24]}:{e_small_hidden_bit[1],e_fp_small[54:32],5'b00000};
    assign e_large_exp[7:0]=i_mode?e_fp_large[59:52]:e_fp_large[30:23];
    assign e_small_exp[7:0]=i_mode?e_fp_small[59:52]:e_fp_small[30:23];
    assign e_large_exp[15:8]=i_mode?{5'b000000,e_fp_large[62:60]}:e_fp_large[62:55];
    assign e_small_exp[15:8]=i_mode?{5'b000000,e_fp_small[62:60]}:e_fp_small[62:55];
    assign e_Ls[0]=i_mode?e_fp_large[63]:e_fp_large[31];
    assign e_Ls[1]=e_fp_large[63];
    assign e_op[0]=i_mode?e_opl:e_fp_large[31]^e_fp_small[31];
    assign e_op[1]=e_opl;
    expff small_expff(ins0,ins1,e_small_expff);
    expff large_expff(inl0,inl1,e_large_expff);
    assign e_large_frac00[0]=i_mode?e_lfrac00:e_lfrac00_22bit;
    assign e_small_frac00[0]=i_mode?e_sfrac00:e_sfrac00_22bit;
    assign e_large_frac00[1]=i_mode?e_lfrac00:e_lfrac00_51_32&e_lfrac00_54_52;
    assign e_small_frac00[1]=i_mode?e_sfrac00:e_sfrac00_51_32&e_sfrac00_54_52;
endmodule
