`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/01 11:34:23
// Design Name: 
// Module Name: lab1_1
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


module lab1_1(a, b, c, aluctr, d, e);
    input a, b, c;
    input [1:0] aluctr;
    output d, e;
    wire d1,d2,d3,d4;
    wire e1;
    wire tmp1,tmp2,tmp3;
    // 00
    xor(d1,a,b,c);
    and(tmp1,a,b);
    xor(tmp2,a,b);
    and(tmp3,c,tmp2);
    or(e1,tmp1,tmp3);
    //01
    and(d2,a,b);
    //10
    or(d3,a,b);
    //11
    xor(d4,a,b);
    //mux
    mux4_to_1 m1(e,e1,0,0,0,aluctr);
    mux4_to_1 m2(d,d1,d2,d3,d4,aluctr);
endmodule

