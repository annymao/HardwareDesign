`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/05 15:22:52
// Design Name: 
// Module Name: lab2_2
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


module lab2_2(clk, reset, en, dir, BCD, cout);
    input clk, reset, en, dir;
    output reg [3:0] BCD;
    output cout;
    wire [3:0]inputs;
    lab2_1 Counter(BCD,en,dir,inputs,cout);
    always@(negedge clk or posedge reset)begin
        if(reset)begin
            BCD <= 4'b0000;
        end
        else begin
            BCD <= inputs;
        end
    end
endmodule
