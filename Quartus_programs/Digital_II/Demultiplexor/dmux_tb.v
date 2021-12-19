module dmux_tb;

    reg Data_in_tb;
    reg [2:0] sel_tb;

    wire out_0_tb;
    wire out_1_tb;
    wire out_2_tb;
    wire out_3_tb;
	 wire out_4_tb;
    wire out_5_tb;
    wire out_6_tb;
    wire out_7_tb;
	 
    dmux 
	 DUV(
        .Data_in(Data_in_tb), 
        .sel(sel_tb), 
        .out_0(out_0_tb), 
        .out_1(out_1_tb), 
        .out_2(out_2_tb), 
        .out_3(out_3_tb),
		  .out_4(out_4_tb), 
        .out_5(out_5_tb), 
        .out_6(out_6_tb), 
        .out_7(out_7_tb)
    );

	 initial begin
		Data_in_tb = 1;
		sel_tb = 0;
		#100	sel_tb = 0;
		#100	sel_tb = 1;    
		#100	sel_tb = 2;    
		#100	sel_tb = 3; 
		#100	sel_tb = 4;
		#100	sel_tb = 5;    
		#100	sel_tb = 6;    
		#100	sel_tb = 7; 	  
		Data_in_tb = 0;
	 end
      
endmodule
