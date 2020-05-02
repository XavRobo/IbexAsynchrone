module join2(
	input  logic rst_ni,

	input  logic req_in1_i,
	input  logic req_in2_i,
	input  logic ack_out_i,

	output logic ack_in1_o,
	output logic ack_in2_o,
	output logic req_out_o
);

	c_element muller(
	 .rst(rst_ni),
	 .a(req_in1_i),
	 .b(req_in2_i),
	 .c(req_out_o)
	);

	assign ack_in1_o = ack_out_i;
	assign ack_in2_o = ack_out_i;

endmodule
