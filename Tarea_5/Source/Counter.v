

module Counter
#(
	parameter NBITS = 5,
	parameter INIT_VALUE = 5'b00001
)

(
	input clk,
	input reset,
	input rst,
	input start,

	output[NBITS - 1:0] counter
);

reg MaxValue_Bit;

reg [NBITS-1 : 0] counter_reg;

/*********************************************************************************************/

always@(posedge clk or negedge reset) begin
	if (reset == 1'b0)
		counter_reg <= INIT_VALUE;
	else begin
		if (rst == 1'b0)begin
			if(start == 1'b1) 
					counter_reg <= counter_reg + 1'b1;	
		end
		else begin
			counter_reg <= INIT_VALUE;
		end
	end
end	


assign counter = counter_reg;
   
 /*Log Function*/
     function integer CeilLog2;
       input integer data;
       integer i,result;
       begin
          for(i=0; 2**i < data; i=i+1)
             result = i + 1;
          CeilLog2 = result;
       end
    endfunction

/*********************************************************************************************/
endmodule


