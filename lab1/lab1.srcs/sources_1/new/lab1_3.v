`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/01 11:56:24
// Design Name: 
// Module Name: lab1_3
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


module lab1_3(a, b, c, aluctr, d, e);
    input a, b, c;
    input [1:0] aluctr;
    output reg d, e;
    always@(*)begin
        e=1'b0;
        if(aluctr == 2'b00)begin
            {e,d} = a+b+c;
        end
        else if(aluctr == 2'b01)begin
            d = a&b;
        end
        else if(aluctr == 2'b10)begin
            d = a|b;
        end
        else begin
            d = a^b;
        end
    end
endmodule
