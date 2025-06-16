`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 10:36:11
// Design Name: 
// Module Name: align_mantisa
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

module sub(input [15:0]a,input [8:0]b, output [15:0]res);
    assign res=a-b;
endmodule
module subexp(input [15:0]a,input [15:0]b, output [15:0]res);
    assign res=a-b;
endmodule
module align_mantisa(i_mode,e_large_exp,e_small_exp,
                e_small_hidden_bit,e_large_hidden_bit,
                e_large_frac53,e_small_frac53,
                a_aligned_small_frac54,a_aligned_large_frac54);
    input i_mode;
    input [15:0] e_large_exp,e_small_exp;
    input [1:0] e_small_hidden_bit,e_large_hidden_bit;
    input [52:0] e_large_frac53,e_small_frac53;
    output [53:0] a_aligned_large_frac54,a_aligned_small_frac54;
    wire [15:0] a_sa;
    subexp inst(e_large_exp,e_small_exp,a_sa);
    wire [15:0] a_shamt;
    wire sub1=(~e_small_hidden_bit[1]&&e_large_hidden_bit[1]);
    wire sub0=(~e_small_hidden_bit[0]&&e_large_hidden_bit[0]);
    wire [8:0] to_sub=i_mode?(sub1?9'h001:9'h000):(sub1?(sub0?9'h101:9'h100):sub0?9'h001:9'h000);
    sub inst1(a_sa,to_sub,a_shamt);
    wire[10:0] sa0=i_mode?a_shamt:a_shamt[7:0];
    wire[10:0] sa1=i_mode?a_shamt:a_shamt[15:8];
    wire [52:0]f0=e_small_frac53>>sa0;
    wire [52:0]f1=e_small_frac53>>sa1;
    assign a_aligned_small_frac54[23:0]=f0[23:0];
    assign a_aligned_small_frac54[53:29]={1'b0,f1[52:29]};
    assign a_aligned_small_frac54[28:24]=i_mode?f0[28:24]:5'b00000;
    assign a_aligned_large_frac54={1'b0,e_large_frac53};
endmodule
