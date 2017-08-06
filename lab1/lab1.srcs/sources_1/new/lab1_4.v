`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/05 11:23:16
// Design Name: 
// Module Name: lab1_4
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


module lab1_4(a, b, c, aluctr , d, e);
    input [3:0] a,b;
    input [1:0] aluctr;
    input c;
    output [3:0] d;
    output e;
    wire e1,e2,e3;
    lab1_2 bit0(a[0],b[0],c,aluctr,d[0],e1);
    lab1_2 bit1(a[1],b[1],e1,aluctr,d[1],e2);
    lab1_2 bit2(a[2],b[2],e2,aluctr,d[2],e3);
    lab1_2 bit3(a[3],b[3],e3,aluctr,d[3],e);
endmodule
