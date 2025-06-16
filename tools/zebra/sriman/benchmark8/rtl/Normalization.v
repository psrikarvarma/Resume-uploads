`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 11:00:36
// Design Name: 
// Module Name: Normalization
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

module Normalization(i_mode,o_res53,n_z24,n_z29,
                    n_res53,n_z52);
    input i_mode;
    input [52:0] o_res53;
    output [4:0] n_z24,n_z29;
    output [5:0] n_z52;
    output [52:0] n_res53;    
    wire [52:0] n_frac24=o_res53;
    wire [52:0] n_frac29=o_res53;
    //2nd number
    wire [52:0] n_f24_3,n_f24_2,n_f24_1,n_f24_0,n_res24;
    wire lt24=~(n_z24[4:3]==2'b11);
    wire [52:0] n_f29_3,n_f29_2,n_f29_1,n_f29_0,n_res29;
    wire lt29=~(n_z29[4:2]==3'b111);
    assign n_z24[4]=~|n_frac24[23:8];//16 zeroes
    assign n_f24_3=n_z24[4]?n_frac24<<16:n_frac24;
    assign n_z24[3]=~|n_f24_3[23:16];//8 zeroes
    assign n_f24_2=n_z24[3]?n_f24_3<<8:n_f24_3;
    assign n_z24[2]=(~|n_f24_2[23:20])&lt24;//4 zeroes
    assign n_f24_1=n_z24[2]?n_f24_2<<4:n_f24_2;
    assign n_z24[1]=(~|n_f24_1[23:22])&lt24;//2 zeroes
    assign n_f24_0=n_z24[1]?n_f24_1<<2:n_f24_1;
    assign n_z24[0]=(~n_f24_0[23])&lt24;//1 zeroes
    assign n_res24=n_z24[0]?n_f24_0<<1:n_f24_0;
    //1st number
    assign n_z29[4]=~|n_frac29[52:37];//16 zeroes
    assign n_f29_3=n_z29[4]?n_frac29<<16:n_frac29;
    assign n_z29[3]=~|n_f29_3[52:45];//8 zeroes
    assign n_f29_2=n_z29[3]?n_f29_3<<8:n_f29_3;
    assign n_z29[2]=~|n_f29_2[52:49];//4 zeroes
    assign n_f29_1=n_z29[2]?n_f29_2<<4:n_f29_2;
    assign n_z29[1]=(~|n_f29_1[52:51])&lt29;//2 zeroes
    assign n_f29_0=n_z29[1]?n_f29_1<<2:n_f29_1;
    assign n_z29[0]=~n_f29_0[52];//1 zeroes
    assign n_res29=n_z29[0]?n_f29_0<<1:n_f29_0;
    assign n_res53=i_mode?(n_z29==29?{n_res24[23:0],29'h00000000}:n_res29):{n_res29[52:24],n_res24[23:0]};
    assign n_z52=n_z29>=29?n_z29+n_z24:n_z29;
endmodule
