`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/25 11:21:19
// Design Name: 
// Module Name: onepulse
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


module onepulse(PB_debounced,clk,PB_single_pulse);
    input PB_debounced,clk;
    output reg PB_single_pulse;
    reg PB_debounced_delay;
    always @(posedge clk)begin
        if(PB_debounced & !PB_debounced_delay)begin
            PB_single_pulse<=1'b1;
        end else begin
            PB_single_pulse<=1'b0;
        end
        PB_debounced_delay <= PB_debounced;
    end
endmodule
