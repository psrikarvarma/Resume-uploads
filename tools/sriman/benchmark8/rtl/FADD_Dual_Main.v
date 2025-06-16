`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2024 12:34:01
// Design Name: 
// Module Name: FADD
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


module FADD_dual_mode_pipelined(i_mode,i_clk,i_en,i_clr,i_A,i_B,o_res);
    input i_mode,i_clk,i_clr,i_en;
    input [63:0] i_A,i_B;
    output [63:0] o_res;
    //extraction 232       130
    Extract e_module(i_mode,i_A,i_B,e_large_exp,e_small_exp,
                e_large_frac53,e_small_frac53,
                e_large_expff,e_small_expff,
                e_large_frac00,e_small_frac00,
                e_small_hidden_bit,e_large_hidden_bit,e_op,e_Ls);
    wire [15:0] e_large_exp,e_small_exp;
    wire [52:0] e_large_frac53,e_small_frac53;
    wire [1:0] e_large_expff,e_small_expff,e_large_frac00,e_small_frac00;
    wire [1:0] e_small_hidden_bit,e_large_hidden_bit,e_op,e_Ls;
    pipeline_extract_align p0(i_clk,i_en,i_clr,i_mode,e_large_expff,e_small_expff,e_large_frac00,e_small_frac00,
                            e_small_hidden_bit,e_large_hidden_bit,e_op,e_Ls,e_large_exp,e_small_exp,
                            e_large_frac53,e_small_frac53,a_mode,a_large_expff,a_small_expff,a_large_frac00,a_small_frac00,
                            a_small_hidden_bit,a_large_hidden_bit,a_op,a_Ls,
                            a_large_exp,a_small_exp,a_large_frac53,a_small_frac53);
     wire a_mode;
     wire[1:0] a_large_expff,a_small_expff,a_large_frac00,a_small_frac00,a_small_hidden_bit,a_large_hidden_bit,a_op,a_Ls;
     wire [15:0] a_large_exp,a_small_exp;
     wire [52:0] a_large_frac53,a_small_frac53;
    //alignment 188    25
     align_mantisa a_module(a_mode,a_large_exp,a_small_exp,
                a_small_hidden_bit,a_large_hidden_bit,
                a_large_frac53,a_small_frac53,
                a_aligned_small_frac54,a_aligned_large_frac54);
    
    wire [53:0] a_aligned_small_frac54,a_aligned_large_frac54;
    
    pipeline_align_op p1(i_clk,i_en,i_clr,a_mode,a_large_expff,a_small_expff,
                        a_large_frac00,a_small_frac00,a_op,a_Ls,a_large_exp,
                        a_aligned_small_frac54,a_aligned_large_frac54,o_mode,
                        o_large_expff,o_small_expff,o_large_frac00,o_small_frac00,
                        o_op,o_Ls,o_large_exp,o_aligned_small_frac54,
                        o_aligned_large_frac54);
     wire o_mode;
     wire [1:0]o_large_expff,o_small_expff,o_large_frac00,o_small_frac00,o_op,o_Ls;
     wire [15:0] o_large_exp;
     wire [53:0] o_aligned_small_frac54,o_aligned_large_frac54;
    //operation 110    0
    Operation o_module(o_mode,o_op,o_large_exp,o_aligned_small_frac54,o_aligned_large_frac54,
                o_exp,o_res53);
    wire [15:0] o_exp;
    wire [52:0] o_res53;
    pipeline_op_norm p2(i_clk,i_en,i_clr,o_mode,o_large_expff,o_small_expff,
                        o_large_frac00,o_small_frac00,o_op,o_Ls,o_exp,o_res53,
                        n_mode,n_large_expff,n_small_expff,n_large_frac00,
                        n_small_frac00,n_op,n_Ls,n_exp,n_o_res53);
    wire n_mode;
    wire [1:0]n_large_expff,n_small_expff,n_large_frac00,n_small_frac00,n_op,n_Ls;
    wire [15:0] n_exp;
    wire [52:0] n_o_res53;
    //normalization 237   37
    Normalization n_module(n_mode,n_o_res53,n_z24,n_z29,
                    n_res53,n_z52);
    wire [4:0] n_z24,n_z29;
    wire [5:0] n_z52;
    wire [52:0] n_res53;
    pipeline_norm_res p3(i_clk,i_en,i_clr,n_mode,n_large_expff,n_small_expff,
                            n_large_frac00,n_small_frac00,n_op,n_Ls, n_z24,n_z29,
                            n_z52,n_exp,n_o_res53,n_res53,r_mode,
                            r_large_expff,r_small_expff,r_large_frac00,r_small_frac00,r_op,r_Ls,
                            r_z24,r_z29,r_z52,r_exp,r_o_res53,r_res53);
     wire r_mode;
     wire [1:0]r_large_expff,r_small_expff,r_large_frac00,r_small_frac00,r_op,r_Ls;
     wire [4:0] r_z24,r_z29;
     wire [5:0]r_z52;
     wire [15:0]r_exp;
     wire [52:0] r_o_res53,r_res53;
    //final result and exceptions 392    30
    Result_and_exception r_module(r_mode,r_op,r_large_expff,r_large_frac00,
                            r_small_expff,r_small_frac00,r_o_res53,
                            r_z24,r_z29,r_res53,r_z52,r_exp,
                            r_res_frac,r_res_expo);
    wire [51:0] r_res_frac;
    wire [15:0] r_res_expo;
    pipeline_res_out p4(i_clk,i_en,i_clr,r_mode,r_Ls,r_res_expo,r_res_frac,
                        ou_mode,ou_Ls,ou_res_expo,ou_res_frac);
     wire ou_mode;
     wire [1:0] ou_Ls;
     wire [15:0]ou_res_expo;
     wire [51:0]ou_res_frac;                  
    assign o_res=ou_mode?{ou_Ls[1],ou_res_expo[10:0],ou_res_frac}:{ou_Ls[1],ou_res_expo[15:8],ou_res_frac[51:29],ou_Ls[0],ou_res_expo[7:0],ou_res_frac[22:0]};
 endmodule
