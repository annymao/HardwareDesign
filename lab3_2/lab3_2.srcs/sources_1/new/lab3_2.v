`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/08 17:29:35
// Design Name: 
// Module Name: lab3_2
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

module lab3_2(clk,reset,sel_clk,LED);
    input clk, reset, sel_clk;
    output reg [15:0]LED;
    reg [15:0] next_LED;
    reg[1:0] dir,next_dir;
    wire clk26,clk19,clk_selected;
    parameter LEFT_ON = 2'b00, LEFT_OFF = 2'b01, RIGHT_ON = 2'b10, RIGHT_OFF = 2'b11;
    clock_divider clk_26(clk,clk26);
    clock_divider #(19) clk_19(clk,clk19);
    assign clk_selected = (sel_clk)? clk19 : clk26;
    always @(posedge clk_selected)begin
        if(reset)begin
            LED <= 16'b0;
            dir <= LEFT_ON;
        end
        else begin
            LED <= next_LED;
            dir <= next_dir;
        end
    end
    always@(*)begin
        case (dir)
            LEFT_ON:begin
                next_LED[15:8] = (LED[15:8]<<1)+1;
                if(LED[15:8]==8'b0111_1111)begin
                    next_dir = LEFT_OFF;
                end
                else begin
                    next_dir = dir;
                end
            end
            LEFT_OFF:begin
                next_LED[15:8] = (LED[15:8])>>1;
                if(LED[15:8]==8'b0000_0001)begin
                    next_dir = RIGHT_ON;
                end
                else begin
                    next_dir = dir;
                end
            end
            RIGHT_ON:begin
                next_LED[7:0] = (LED[7:0]>>1) + 8'b1000_0000;
                if(LED[7:0] == 8'b1111_1110)begin
                    next_dir = RIGHT_OFF;
                end
                else begin
                    next_dir = dir;
                end
            end
            RIGHT_OFF:begin
                next_LED[7:0] = LED[7:0] << 1;
                if(LED[7:0] == 8'b1000_0000)begin
                    next_dir = LEFT_ON;
                end
                else begin
                    next_dir = dir;
                end
            end
        endcase
    end
endmodule
