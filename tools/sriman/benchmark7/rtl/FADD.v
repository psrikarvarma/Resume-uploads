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


module FADD(i_mode,i_A,i_B,o_res);
    input i_mode;
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

    //alignment 188    25
     align_mantisa a_module(i_mode,e_large_exp,e_small_exp,
                e_small_hidden_bit,e_large_hidden_bit,
                e_large_frac53,e_small_frac53,
                a_aligned_small_frac54,a_aligned_large_frac54);
    
    wire [53:0] a_aligned_small_frac54,a_aligned_large_frac54;
    //operation 110    0
    Operation o_module(i_mode,e_op,e_large_exp,a_aligned_small_frac54,a_aligned_large_frac54,
                o_exp,o_res53);
    wire [15:0] o_exp;
    wire [52:0] o_res53;
    //normalization 237   37
    Normalization n_module(i_mode,o_res53,n_z24,n_z29,
                    n_res53,n_z52);
    wire [4:0] n_z24,n_z29;
    wire [5:0] n_z52;
    wire [55:0] n_res53;
    //final result and exceptions 392    30
    Result_and_exception r_module(i_mode,e_op,e_large_expff,e_large_frac00,
                            e_small_expff,e_small_frac00,o_res53,
                            n_z24,n_z29,n_res53,n_z52,o_exp,
                            r_res_frac,r_res_expo);
    wire [51:0] r_res_frac;
    wire [15:0] r_res_expo;
    
    assign o_res=i_mode?{e_Ls[1],r_res_expo[10:0],r_res_frac}:{e_Ls[1],r_res_expo[15:8],r_res_frac[51:29],e_Ls[0],r_res_expo[7:0],r_res_frac[22:0]};
 endmodule
