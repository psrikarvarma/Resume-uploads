`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 10:49:51
// Design Name: 
// Module Name: Operation
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


module Operation(i_mode,e_op,e_large_exp,a_aligned_small_frac54,a_aligned_large_frac54,
                o_exp,o_res53);
    input i_mode;
    input [1:0] e_op;
    input [15:0] e_large_exp;
    input [53:0] a_aligned_small_frac54,a_aligned_large_frac54;
    output [15:0] o_exp;
    output [52:0] o_res53;
    wire [53:0] o_res_frac54;
    wire [29:0] o_to_add=i_mode?(e_op[1]?29'h00000001:29'd0):(e_op[0]?(e_op[1]?29'h8000001:29'h0000001):(e_op[1]?29'h80000000:0));
    wire [27:0] o_comp1=e_op[0]?~a_aligned_small_frac54[27:0]:a_aligned_small_frac54[27:0];
    wire [25:0] o_comp2=e_op[1]?~a_aligned_small_frac54[53:28]:a_aligned_small_frac54[53:28];
    wire [53:0] o_small={o_comp2,o_comp1}+o_to_add;
    wire [8:0] o_temp=((e_op[0]==0)&&(i_mode&&o_res_frac54[53])|(~i_mode&&o_res_frac54[24]))?((~i_mode&&o_res_frac54[53])?9'b100000001:9'b000000001):(o_res_frac54[53]?9'd100000000:9'd0);
    assign o_res_frac54=a_aligned_large_frac54+o_small;
    //handling add res overflow
    assign o_exp=e_large_exp+o_temp;
    assign o_res53[23:0]=o_temp[0]?o_res_frac54[24:1]:o_res_frac54[23:0];
    assign o_res53[52:24]=i_mode?(o_temp[0]?o_res_frac54[53:25]:o_res_frac54[52:24]):o_temp[8]?{o_res_frac54[53:30],5'b000000}:{o_res_frac54[52:29],5'b00000};
endmodule
