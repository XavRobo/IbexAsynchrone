module join2(
	input  logic rst_ni,

	input  logic req_in1_i,
	input  logic req_in2_i,
	input  logic ack_out_i,

	output logic ack_in1_o,
	output logic ack_in2_o,
	output logic req_out_o
);

	always_ff @(negedge(rst_ni)) begin
		/*
		ack_in1_o <= 1'b0;
		ack_in2_o <= 1'b0;
		*/
		req_out_o <= 1'b0;
	end

	c_element muller(
	 .a(req_in1_i),
	 .b(req_in2_i),
	 .c(req_out_o)
	);

	assign ack_in1_o = ack_out_i;
	assign ack_in2_o = ack_out_i;

endmodule
