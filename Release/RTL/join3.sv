module join3(
	input  logic rst_i,

	input  logic req_in1_i,
	input  logic req_in2_i,
	input  logic req_in3_i,
	input  logic ack_out_i,

	output logic ack_in1_o,
	output logic ack_in2_o,
	output logic ack_in3_o,
	output logic req_out_o
);

	wire req_t1;

	c_element muller1(
	 .rst(rst_i),
	 .a(req_in1_i),
	 .b(req_in2_i),
	 .c(req_t1)
	);

	c_element muller2(
	 .rst(rst_i),
	 .a(req_in3_i),
	 .b(req_t1),
	 .c(req_out_o)
	);

	assign ack_in1_o = ack_out_i;
	assign ack_in2_o = ack_out_i;
	assign ack_in3_o = ack_out_i;

endmodule
