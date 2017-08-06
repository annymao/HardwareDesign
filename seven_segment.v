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


module seven_segment(DIGIT,DISPLAY,clk,BCD0,BCD1,BCD2,BCD3);
    input clk;
    input [3:0]BCD0, BCD1, BCD2, BCD3;
    output reg [3:0]DIGIT;
    output [6:0]DISPLAY;
    reg [3:0] value;
    always @(posedge clk)begin
        case(DIGIT)
            4'b1110:begin
                value<=BCD1;
                DIGIT<=4'b1101;
            end
            4'b1101:begin
                value<=BCD0;
                DIGIT<=4'b1110;
            end
           /* 4'b1011:begin
            value<=BCD3;
            DIGIT<=4'b0111;
            end
            4'b0111:begin
                value<=BCD0;
                DIGIT<=4'b1110;            
            end*/
            default:begin
                DIGIT<=4'b1110;
            end
        endcase
    end
    assign DISPLAY = (value==4'd0) ? 7'b0000001 :
    (value==4'd1) ? 7'b1001111 :
    (value==4'd2) ? 7'b0010010 :
    (value==4'd3) ? 7'b0000110 :
    (value==4'd4) ? 7'b1001100 :
    (value==4'd5) ? 7'b0100100 :
    (value==4'd6) ? 7'b0100000 :
    (value==4'd7) ? 7'b0001111 :
    (value==4'd8) ? 7'b0000000 :
    (value==4'd9) ? 7'b0000100 : 
    7'b1111111 ;
endmodule
