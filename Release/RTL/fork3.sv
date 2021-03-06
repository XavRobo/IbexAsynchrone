module fork3(
	input  logic rst_i,

	input  logic ack_out1_i,
	input  logic ack_out2_i,
	input  logic ack_out3_i,
	input  logic req_in_i,

	output logic req_out1_o,
	output logic req_out2_o,
	output logic req_out3_o,
	output logic ack_in_o
);

	wire ack_t1;

	c_element muller1(
	 .rst(rst_i),
	 .a(ack_out1_i),
	 .b(ack_out2_i),
	 .c(ack_t1)
	);

	c_element muller2(
	 .rst(rst_i),
	 .a(ack_out3_i),
	 .b(ack_t1),
	 .c(ack_in_o)
	);

	assign req_out1_o = req_in_i;
	assign req_out2_o = req_in_i;
	assign req_out3_o = req_in_i;

endmodule
