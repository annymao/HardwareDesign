`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/01 11:51:28
// Design Name: 
// Module Name: lab1_2
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


module lab1_2(a, b, c, aluctr, d, e);
    input a, b, c;
    input [1:0] aluctr;
    output d, e;
    wire d1,d2,d3,d4;
    wire e1;
    //00
    assign d1=a^b^c;
    assign e1=(a&b)|(c&(a^b));
    //01
    assign d2=a&b;
    //10
    assign d3=a|b;
    //11
    assign d4=a^b;
    //mux
     mux4_to_1 m1(e,e1,0,0,0,aluctr);
     mux4_to_1 m2(d,d1,d2,d3,d4,aluctr);
endmodule
