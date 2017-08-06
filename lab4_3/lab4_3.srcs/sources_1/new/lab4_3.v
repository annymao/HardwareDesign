`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 15:36:18
// Design Name: 
// Module Name: lab4_3
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


module Lab4_3(DIGIT, DISPLAY, max, min, en, reset, clk);
    input en;
    input reset;
    input clk;
    output [3:0] DIGIT; 
    output [6:0] DISPLAY; 
    output max;
    output min;
    wire rst_d,en_d;
    wire rst_one,en_one;
    reg enabled;
    wire next;
    wire[3:0] BCD0,BCD1;
    wire clk13, clk25;
    wire cout0,cout;
    reg dir;
    assign max = (cout == 1'b1 && BCD0 == 4'd9)? 1'b1 :1'b0;
    assign min = (cout == 1'b1 && BCD0 == 4'd0)? 1'b1 :1'b0;
    always@(posedge clk25)begin
        if(BCD0 == 4'd0 && BCD1 == 4'd0)begin
            dir <= 1'b1;
        end
        else if(BCD0 == 4'd9 && BCD1 == 4'd9)begin
            dir <= 1'b0;
        end
        else begin
            dir<=dir;
        end
    end
    clock_divider #(13) clk_13(clk,clk13);
    clock_divider #(25) clk_25(clk,clk25);
    //button debounce
    debounce rst(rst_d,reset,clk13);
    debounce enable(en_d,en,clk13);
    //7-SEGMENT
    seven_segment display(DIGIT,DISPLAY,clk13,BCD0,BCD1,0,0);
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
    lab2_2 BCD0_counter(clk25, rst_d, enabled, dir, BCD0, cout0);
    lab2_2 BCD1_counter(clk25, rst_d, cout0, dir, BCD1, cout);
    // add your design here
endmodule
