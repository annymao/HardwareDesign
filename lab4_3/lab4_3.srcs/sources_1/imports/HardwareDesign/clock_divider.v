`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/06 14:21:18
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(clk, clk26);
    input clk;
    output clk26;
    parameter size = 26;
    reg[size-1:0] count;
    wire[size-1:0] next_count;
    assign next_count = count+1;
    assign clk26 = count[size-1];
    always @(posedge clk)begin
        count<=next_count;
    end
endmodule
