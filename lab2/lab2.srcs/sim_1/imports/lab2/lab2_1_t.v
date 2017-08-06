`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/29 19:32:56
// Design Name: 
// Module Name: lab2_1_t
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


module lab2_1_t;
    reg[3:0]inputs;
    reg en,dir;
    wire[3:0] outputs;
    wire cout;
    reg pass;
    lab2_1 BCD(.inputs(inputs),
            .en(en),
            .dir(dir),
            .outputs(outputs),
            .cout(cout));
    initial begin
        #0 inputs=4'b0000;en=1'b0;dir=1'b0;pass=1'b1;
        $display("Starting simulation");
        $monitor("%g\tinputs=%d\ten=%b\tdir=%b\toutputs=%d\tcout=%b",$time,inputs, en, dir, outputs, cout);
        #32 en=1'b1;
        #32 dir=1'b1;
        #32
        $finish;
    end
    
    always #2  inputs=inputs+1;

    always @(*)begin
    #1      if (en == 0 && (inputs!=outputs || cout != 0)) begin                
                    printerror(1);
                end 
              else if (en == 1 && dir==1&& inputs < 4'b1001) begin
                    if (outputs !== inputs+1 || cout != 0) begin        
                        printerror(2);
                    end
                end
                else if(en==1 && dir==1 && inputs==4'b1001)begin
                           if(cout!=1)
                            printerror(3);
                end
                else if(en==1 &&dir==1 && inputs>4'b1001)begin
                         if(  cout!=0 && outputs!=4'b0000)
                            printerror(4);
                 end
                 else if(en==1 && dir==0&&inputs>4'b1001)begin
                        if(cout!=0&&outputs!=4'b0000)
                              printerror(7);
                  end
                else if (en == 1 && dir == 0 && inputs>4'b0000&&inputs<=4'b0000) begin
                        if (outputs !== inputs-1 || cout != 0) begin                 
                            printerror(5);
                        end
                 else if(en==1&& dir==0&&inputs==4'b0000)begin
                        if(cout!=1&&outputs!=4'b1001)
                            printerror(6);
                 end
            end
        end
            
            
        
        task printerror;
            input [3:0] error_num;
            begin
                pass=0;
                $display("[NOT_PASS_%1d] :  en : %d, dir : %d,inputs : %d,outputs:%d, cout : %d", error_num,  en, dir, inputs,outputs, cout);
            end
        endtask


endmodule
