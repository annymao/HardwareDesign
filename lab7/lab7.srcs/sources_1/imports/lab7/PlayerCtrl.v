//
//
//
//

module PlayerCtrl (
	input clk,
	input reset,
	input Repeat,
	input pause,
	output reg [8:0] ibeat
);
parameter BEATLEAGTH = 127;

always @(posedge clk, posedge reset, posedge pause) begin
	if (reset)
		ibeat <= 0;
	else if (pause)
	   ibeat <= ibeat;
	else if (ibeat < BEATLEAGTH) 
		ibeat <= ibeat + 1;
	else begin
	   if(Repeat)
		ibeat <= 0;
	   else ibeat = BEATLEAGTH;
    end
end

endmodule