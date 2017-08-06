`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/09 18:57:21
// Design Name: 
// Module Name: seven_segment
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


module Lab4_1(DIGIT, DISPLAY, cout, en, reset, dir, clk);
    input en;
    input reset;
    input dir;
    input clk;
    output [3:0] DIGIT; 
    output [6:0] DISPLAY; 
    output cout;
    wire rst_d,en_d;
    wire rst_one,en_one;
    reg enabled;
    wire next;
    wire[3:0] BCD0;
    wire clk13, clk25;
    clock_divider #(13) clk_13(clk,clk13);
    clock_divider #(25) clk_25(clk,clk25);
    //button debounce
    debounce rst(rst_d,reset,clk13);
    debounce enable(en_d,en,clk13);
    //7-SEGMENT
    seven_segment display(DIGIT,DISPLAY,clk13,BCD0,0,0,0);
    //enable control
    assign next = enabled;
    always @ (posedge en_d or posedge rst_d)begin
        if(rst_d)
            enabled <= 0;
        else begin
            if(en_d)
                enabled <= ~next;
            else 
                enabled <= next;
        end
    end
    //BCD
    lab2_2 BCD_counter(clk25, rst_d, enabled, dir, BCD0, cout);
    // add your design here
endmodule
