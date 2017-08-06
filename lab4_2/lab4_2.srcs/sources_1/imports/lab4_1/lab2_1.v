`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/05 15:03:31
// Design Name: 
// Module Name: lab2_1
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


module lab2_1(inputs, en, dir, outputs, cout);
    input [3:0] inputs;
    input en, dir;
    output reg [3:0] outputs;
    output reg cout;
    always@(*) begin
        if(en == 1'b0)begin
            outputs = inputs;
            cout = 1'b0;
        end
        else begin
            if(dir==1)begin
                if(inputs == 4'd9)begin
                    {outputs,cout}=5'b00001;
                end
                else if(inputs > 4'd9)begin
                    {outputs,cout}=5'b0;
                end
                else begin
                    outputs = inputs+1;
                    cout = 1'b0;
                end
            end
            else begin
                if(inputs == 4'd0)begin
                    {outputs,cout}=5'b10011;
                end
                else if(inputs > 4'd9)begin
                    {outputs,cout}=5'b0;
                end
                else begin
                    outputs = inputs-1;
                    cout = 1'b0;
                end
            end
        end
    end
endmodule
