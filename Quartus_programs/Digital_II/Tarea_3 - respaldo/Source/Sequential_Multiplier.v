module Sequential_Multiplier 
#(
    parameter WORD_LENGTH = 5
) 
(
    input clk,
    input reset,
	 
    input start,
	 input load,
	 input op,
    input [WORD_LENGTH-1 : 0] Data,
	 
    output ready,
    output [2*WORD_LENGTH-1 : 0] Result,
	 output stored
);



wire [2*WORD_LENGTH-1 : 0]Mux_Show_wire;


wire Select_Data_wire;
wire Loaded_1_wire;
wire Loaded_2_wire;
wire Rst_wire;
wire Shift_wire;


wire Shot_Data_wire;
wire Demux_0_wire;
wire Demux_1_wire;
wire [WORD_LENGTH-1 : 0]reg_1_wire;
wire [WORD_LENGTH-1 : 0]reg_2_wire;
wire [2*WORD_LENGTH-1 : 0]Shift_l_out_wire;
wire Serial_l_out_wire;
wire [2*WORD_LENGTH-1 : 0]mux_out_wire;
wire [2*WORD_LENGTH-1 : 0]c_wire;
wire [2*WORD_LENGTH-1 : 0]Result_wire;
wire Shot_Loaded_1_wire;
wire Shot_Loaded_2_wire;
wire Result_reg_wire;
wire Load_1_wire;
wire Load_2_wire;


Control
#(
    .WORD_LENGTH(WORD_LENGTH)
) 
Control_1
(
	 .clk(clk),
	 .reset(reset),
	 .One_Shot(Shot_Data_wire),
	 .Start(start),
	 
    .Ready(ready),
	 .Select_Data(Select_Data_wire),
	 .Loaded_1(Loaded_1_wire),
	 .Loaded_2(Loaded_2_wire),
	 .Rst(Rst_wire),
	 .Shift(Shift_wire),
	 .Result_reg(Result_reg_wire),
	 .Load_1(Load_1_wire),
	 .Load_2(Load_2_wire)
);


One_Shot
One_Shot_Data
(
	.clk(clk),
	.reset(reset),
	.Start(load),

	.Shot(Shot_Data_wire)
);

Demux
Demux_Data
(
    .sel(Select_Data_wire),
    .data(Shot_Data_wire),

    .y0(Demux_0_wire),
    .y1(Demux_1_wire)
);

Register_With_Enable
#(
	.WORD_LENGTH(WORD_LENGTH)
)
Register_check_neg_1
(
	.clk(clk),
	.reset(reset),
	.enable(Demux_0_wire),
	.Data_Input(Data),

	.Data_Output(reg_1_wire)
);

Register_With_Enable
#(
	.WORD_LENGTH(WORD_LENGTH)
)
Register_check_neg_2
(
	.clk(clk),
	.reset(reset),
	.enable(Demux_1_wire),
	.Data_Input(Data),

	.Data_Output(reg_2_wire)
);

Shift_Register_left
#(
	.WORD_LENGTH(2*WORD_LENGTH)
)
Shift_left
(
	.clk(clk),
	.reset(reset),
	.load(Load_1_wire),
	.shift(Shift_wire),
	.parallelInput({{WORD_LENGTH{reg_1_wire[WORD_LENGTH-1]}}, reg_1_wire}),
	
	.parallelOutput(Shift_l_out_wire)

);

Shift_Register_rigth
#(
	.WORD_LENGTH(2*WORD_LENGTH)
)
Shift_right
(
	.clk(clk),
	.reset(reset),
	.load(Load_2_wire),
	.shift(Shift_wire),
	.parallelInput({{WORD_LENGTH{reg_2_wire[WORD_LENGTH-1]}}, reg_2_wire}),
	
	.serialOutput(Serial_r_out_wire)

);

Mux_Two_To_One
#(
	.N_BITS(2*WORD_LENGTH)
)
Mux_Data_or_0
(
	.Selector(Serial_r_out_wire),
	.Data_0({2*WORD_LENGTH{1'b0}}),
	.Data_1(Shift_l_out_wire),

	.Mux_Output(mux_out_wire)
);

Add_Sub
#(
   .WORD_LENGTH(2*WORD_LENGTH)
) 
Add_Sub_1
(
	 .sel(op),
    .a(mux_out_wire),
    .b(Result_wire),
	 
    .sum(c_wire)   
);

Register_With_Reset
#(
	.WORD_LENGTH(2*WORD_LENGTH)
)
Register_Rst
(
	.clk(clk),
	.reset(reset),
	.Rst(Rst_wire),
	.Data_Input(c_wire),

	.Data_Output(Result_wire)
);

One_Shot
One_Shot_Load_1
(
	.clk(clk),
	.reset(reset),
	.Start(Loaded_1_wire),

	.Shot(Shot_Loaded_1_wire)
);

One_Shot
One_Shot_Load_2
(
	.clk(clk),
	.reset(reset),
	.Start(Loaded_2_wire),

	.Shot(Shot_Loaded_2_wire)
);

Or_Gate
#(
	.N_BITS(WORD_LENGTH)
)
Or
(
	.A(Shot_Loaded_1_wire),
	.B(Shot_Loaded_2_wire),

	.C(stored)
);

Register_With_Enable
#(
	.WORD_LENGTH(2*WORD_LENGTH)
)
Register_Result
(
	.clk(clk),
	.reset(reset),
	.enable(Result_reg_wire),
	.Data_Input(Result_wire),

	.Data_Output(Result)
);
  
endmodule
