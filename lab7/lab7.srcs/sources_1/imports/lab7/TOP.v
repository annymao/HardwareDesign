`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/19 14:05:19
// Design Name: 
// Module Name: lab7
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


module TOP(clk,stop,play,speed,quality,mute,Repeat,music,pmod_1,pmod_2,pmod_4);
	input clk,stop,play;
	input[1:0] speed,quality;
	input mute,Repeat,music;
	output pmod_1,pmod_2,pmod_4;
	
	wire prevplay;
	reg nextplay;
	wire stop_d,play_d,play_s;
	
	parameter beat1=32'd8,beat2=32'd4,beat3=32'd12,beat4=32'd16;	//one beat=0.125sec
	parameter duty1=10'd128,duty2=10'd256,duty3=10'd384,duty4=10'd512;	//duty cycle=50%
	wire [31:0]BEAT_FREQ;
	wire [9:0]DUTY_BEST;
	reg pause;
	assign pmod_2 = 1'd1;	//no gain(6dB)
	assign pmod_4 =(mute||pause==1)?1'd0:1'd1;	//turn-on
	
	wire [31:0] freq,freq1,freq2;
	wire [7:0] ibeatNum;
	wire beatFreq;
	reg reset;
	reg nmusic;

	//assign nmusic=music;
	reg nreset;
	reg[1:0] state,nextstate;

	parameter STOP=2'b00,PLAY=2'b01,PAUSE=2'b10;
	always@(state or music )begin
		if(music!=nmusic||state==STOP)begin
			reset<=1'b1;
			nmusic<=music;
		end
		else begin
			reset<=0;
		 //  else reset<=reset;
		end
	end
	always@(posedge clk or posedge reset)begin
		if(reset&&state!=STOP)begin state<=PLAY;
		end
		else begin
			state<=nextstate;
		end
	end
	//Generate beat speed
	assign BEAT_FREQ=(speed==2'b00)?beat1:
					 (speed==2'b01)?beat2:
					 (speed==2'b10)?beat3:
									beat4;
	assign DUTY_BEST=(quality==2'b00)?duty1:
					 (quality==2'b01)?duty2:
					 (quality==2'b10)?duty3:
									  duty4;
	PWM_gen btSpeedGen ( .clk(clk), 
						 .reset(reset),
						 .freq(BEAT_FREQ),
						 .duty(DUTY_BEST), 
						 .PWM(beatFreq)
	);
		
	//manipulate beat
	wire[7:0] ibeatNum1,ibeatNum2;
	//assign ibeatNum=(music)?ibeatNum2:ibeatNum1;
	PlayerCtrl playerCtrl_00 ( .clk(beatFreq),
							   .reset(reset),
							   .Repeat(Repeat),
							   .pause(pause),
							   .ibeat(ibeatNum1)
	);	
	PlayerCtrl #(63) playerCtrl_01 ( .clk(beatFreq),
							   .reset(reset),
							   .Repeat(Repeat),
							   .pause(pause),
							   .ibeat(ibeatNum2)
	);		
	assign ibeatNum=(music)?ibeatNum2:ibeatNum1;
	//Generate variant freq. of tones
	Music music00 ( .ibeatNum(ibeatNum1),
					.tone(freq1)
	);
	Music2 music01 ( .ibeatNum(ibeatNum2),
					.tone(freq2)
	);
	assign freq=(music)?freq2:freq1;
	
	// Generate particular freq. signal
	PWM_gen toneGen ( .clk(clk), 
					  .reset(reset),			  
					  .freq(freq),
					  .duty(DUTY_BEST), 
					  .PWM(pmod_1)
	);	
	//FSM	
	debounce s(stop_d,stop,clk);
	debounce p(play_d,play,clk);
	
	onepulse ps(play_d,clk,play_s);




	always@(*)begin
		case(state)
			STOP:begin 
			pause=0;
				if(play_s)begin
					nextstate=PLAY;
				end
				else nextstate=STOP;
			end
			
			PLAY:begin
			 pause=0;
				if(stop_d==1'b1)begin
					nextstate=STOP;
				end
				else if(play_s)begin
					nextstate=PAUSE;
				end
				else if(((ibeatNum==127&&music==0)||(ibeatNum==63&&music==1))&&!Repeat)nextstate=STOP;
				else nextstate=PLAY;
			end
			PAUSE:begin
			    pause=1;
				if(stop_d)begin
					nextstate=STOP;
					pause=0;
				end
				else if(play_s)begin
					nextstate=PLAY;
					pause=0;
				end
				else nextstate=PAUSE;
			end
			default: nextstate=STOP;
		endcase
	end
	
endmodule
