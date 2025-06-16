`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 10:48:51
// Design Name: 
// Module Name: Pipeline_Reg
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


module pipeline_res_out (input i_clk,i_en,i_clr,r_mode,
                        input [1:0] r_Ls,
                        input [15:0]r_res_expo,
                        input [51:0]r_res_frac,
                        output reg ou_mode,
                        output reg [1:0] ou_Ls,
                        output reg [15:0]ou_res_expo,
                        output reg [51:0]ou_res_frac);
    always @(posedge i_clk)
    begin
        if(!i_clr)
        begin
            ou_Ls<=0;
            ou_mode<=0;
            ou_res_frac<=0;
            ou_res_expo<=0;
        end
        else if(i_en)
        begin
            ou_Ls<=r_Ls;
            ou_mode<=r_mode;
            ou_res_frac<=r_res_frac;
            ou_res_expo<=r_res_expo;
        end
    end
endmodule
module pipeline_norm_res (input i_clk,i_en,i_clr,n_mode,
                            input [1:0]n_large_expff,n_small_expff,
                            n_large_frac00,n_small_frac00,n_op,n_Ls,
                            input [4:0] n_z24,n_z29,
                            input [5:0]n_z52,
                            input [15:0]n_exp,
                            input [52:0] n_o_res53,n_res53,
                            output reg r_mode,
                            output reg [1:0]r_large_expff,r_small_expff,
                            r_large_frac00,r_small_frac00,r_op,r_Ls,
                            output reg [4:0] r_z24,r_z29,
                            output reg [5:0]r_z52,
                            output reg [15:0]r_exp,
                            output reg [52:0] r_o_res53,r_res53);
    always @(posedge i_clk)
    begin
        if(!i_clr)
        begin
            r_mode<=0;
            r_large_expff<=0;
            r_small_expff<=0;
            r_large_frac00<=0;
            r_small_frac00<=0;
            r_op<=0;
            r_Ls<=0;
            r_z24<=0;
            r_z29<=0;
            r_z52<=0;
            r_exp<=0;
            r_o_res53<=0;
            r_res53<=0;
        end
        else if(i_en)
        begin
            r_mode<=n_mode;
            r_large_expff<=n_large_expff;
            r_small_expff<=n_small_expff;
            r_large_frac00<=n_large_frac00;
            r_small_frac00<=n_small_frac00;
            r_res53<=n_res53;
            r_op<=n_op;
            r_Ls<=n_Ls;
            r_z24<=n_z24;
            r_z29<=n_z29;
            r_z52<=n_z52;
            r_exp<=n_exp;
            r_o_res53<=n_o_res53;
        end
    end
endmodule  
module pipeline_op_norm (input i_clk,i_en,i_clr,o_mode,
                        input [1:0]o_large_expff,o_small_expff,
                        o_large_frac00,o_small_frac00,o_op,o_Ls,
                        input [15:0] o_exp,
                        input [52:0]o_res53,
                        output reg n_mode,
                        output reg [1:0]n_large_expff,n_small_expff,
                        n_large_frac00,n_small_frac00,n_op,n_Ls,
                        output reg [15:0] n_exp,
                        output reg [52:0] n_res53);
    
    always @(posedge i_clk)
    begin
        if(!i_clr)
        begin
            n_mode<=0;
            n_large_expff<=0;
            n_small_expff<=0;
            n_large_frac00<=0;
            n_small_frac00<=0;
            n_op<=0;
            n_Ls<=0;
            n_exp<=0;
            n_res53<=0;
        end
        else if(i_en)
        begin
            n_mode<=o_mode;
            n_large_expff<=o_large_expff;
            n_small_expff<=o_small_expff;
            n_large_frac00<=o_large_frac00;
            n_small_frac00<=o_small_frac00;
            n_op<=o_op;
            n_Ls<=o_Ls;
            n_exp<=o_exp;
            n_res53<=o_res53;
        end
    end
endmodule  
module pipeline_align_op (input i_clk,i_en,i_clr,a_mode,
                        input [1:0]a_large_expff,a_small_expff,
                        a_large_frac00,a_small_frac00,a_op,a_Ls,
                        input [15:0] a_large_exp,
                        input [53:0] a_aligned_small_frac54,a_aligned_large_frac54,
                        output reg o_mode,
                        output reg [1:0]o_large_expff,o_small_expff,
                        o_large_frac00,o_small_frac00,o_op,o_Ls,
                        output reg [15:0] o_large_exp,
                        output reg [53:0] o_aligned_small_frac54,o_aligned_large_frac54);
    
    always @(posedge i_clk)
    begin
        if(!i_clr)
        begin
            o_mode<=0;
            o_op<=0;
            o_Ls<=0;
            o_aligned_small_frac54<=0;
            o_aligned_large_frac54<=0;
            o_large_expff<=0;
            o_small_expff<=0;
            o_large_frac00<=0;
            o_small_frac00<=0;
            o_large_exp<=0;
        end
        else if(i_en)
        begin
            o_mode<=a_mode;
            o_Ls<=a_Ls;
            o_op<=a_op;
            o_large_expff<=a_large_expff;
            o_small_expff<=a_small_expff;
            o_large_frac00<=a_large_frac00;
            o_small_frac00<=a_small_frac00;
            o_aligned_small_frac54<=a_aligned_small_frac54;
            o_aligned_large_frac54<=a_aligned_large_frac54;
            o_large_exp<=a_large_exp;
        end
    end
endmodule 
module pipeline_extract_align(input i_clk,i_en,i_clr,i_mode,
                            input [1:0]e_large_expff,e_small_expff,e_large_frac00,e_small_frac00,
                            e_small_hidden_bit,e_large_hidden_bit,e_op,e_Ls,
                            input [15:0] e_large_exp,e_small_exp,
                            input [52:0] e_large_frac53,e_small_frac53,
                            output reg a_mode,
                            output reg [1:0]a_large_expff,a_small_expff,a_large_frac00,a_small_frac00,
                            a_small_hidden_bit,a_large_hidden_bit,a_op,a_Ls,
                            output reg [15:0] a_large_exp,a_small_exp,
                            output reg [52:0] a_large_frac53,a_small_frac53);
    
    always @(posedge i_clk)
    begin
        if(!i_clr)
        begin
            a_mode<=0;
            a_large_expff<=0;
            a_small_expff<=0;
            a_large_frac00<=0;
            a_small_frac00<=0;
            a_small_hidden_bit<=0;
            a_large_hidden_bit<=0;
            a_op<=0;
            a_Ls<=0;
            a_large_exp<=0;
            a_small_exp<=0;
            a_large_frac53<=0;
            a_small_frac53<=0;
        end
        else if(i_en)
        begin
            a_mode<=i_mode;
            a_large_expff<=e_large_expff;
            a_small_expff<=e_small_expff;
            a_large_frac00<=e_large_frac00;
            a_small_frac00<=e_small_frac00;
            a_small_hidden_bit<=e_small_hidden_bit;
            a_large_hidden_bit<=e_large_hidden_bit;
            a_op<=e_op;
            a_Ls<=e_Ls;
            a_large_exp<=e_large_exp;
            a_small_exp<=e_small_exp;
            a_large_frac53<=e_large_frac53;
            a_small_frac53<=e_small_frac53;
        end
    end
endmodule
