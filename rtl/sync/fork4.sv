module fork4(
	input  logic rst_i,

	input  logic ack_out1_i,
	input  logic ack_out2_i,
	input  logic ack_out3_i,
	input  logic ack_out4_i,
	input  logic req_in_i,

	output logic req_out1_o,
	output logic req_out2_o,
	output logic req_out3_o,
	output logic req_out4_o,
	output logic ack_in_o
);

	wire ack_t1;
	wire ack_t2;

	c_element muller1(
	 .rst(rst_i),
	 .a(ack_out1_i),
	 .b(ack_out2_i),
	 .c(ack_t1)
	);

	c_element muller2(
	 .rst(rst_i),
	 .a(ack_out3_i),
	 .b(ack_out4_i),
	 .c(ack_t2)
	);

	c_element muller3(
	 .rst(rst_i),
	 .a(ack_t1),
	 .b(ack_t2),
	 .c(ack_in_o)
	);

	assign req_out1_o = req_in_i;
	assign req_out2_o = req_in_i;
	assign req_out3_o = req_in_i;
	assign req_out4_o = req_in_i;

endmodule
