// Quartus Prime Verilog Template
// Gray counter

module Counter_gray
#(parameter WIDTH=8)
(
	input clk, enable, reset,
	output reg [WIDTH-1:0] gray_count = 0
);

	// q is the counter, plus the imaginary bit
	reg q [WIDTH-1:-1];

	// no_ones_below[x] = 1 iff there are no 1's in q below q[x]
	reg no_ones_below [WIDTH-1:-1];

	// q_msb is a modification to make the msb logic work
	reg q_msb;

	integer i, j, k;

	always @ (posedge reset or posedge clk)
	begin
		if (reset)
		begin

			// Resetting involves setting the imaginary bit to 1
			q[-1] <= 1;
			for (i = 0; i <= WIDTH-1; i = i + 1)
				q[i] <= 0;

		end
		else if (enable)
		begin
			// Toggle the imaginary bit
			q[-1] <= ~q[-1];

			for (i = 0; i < WIDTH-1; i = i + 1)
			begin

				// Flip q[i] if lower bits are a 1 followed by all 0's
				q[i] <= q[i] ^ (q[i-1] & no_ones_below[i-1]);

			end

			q[WIDTH-1] <= q[WIDTH-1] ^ (q_msb & no_ones_below[WIDTH-2]);
		end
	end


	always @(*)
	begin

		// There are never any 1's beneath the lowest bit
		no_ones_below[-1] <= 1;

		for (j = 0; j < WIDTH-1; j = j + 1)
			no_ones_below[j] <= no_ones_below[j-1] & ~q[j-1];

		q_msb <= q[WIDTH-1] | q[WIDTH-2];

		// Copy over everything but the imaginary bit
		for (k = 0; k < WIDTH; k = k + 1)
			gray_count[k] <= q[k];
	end	


endmodule
