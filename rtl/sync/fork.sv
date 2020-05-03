module fork2(
	input  logic rst_i,

	input  logic ack_out1_i,
	input  logic ack_out2_i,
	input  logic req_in_i,

	output logic req_out1_o,
	output logic req_out2_o,
	output logic ack_in_o
);

	
	assign req_out1_o = req_in_i;
	assign req_out2_o = req_in_i;

	c_element muller(
	 .rst(rst_i),
	 .a(ack_out1_i),
	 .b(ack_out2_i),
	 .c(ack_in_o)
	);


endmodule

