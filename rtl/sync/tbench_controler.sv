module tbench_controler;

	logic req_in, bl_ack_out, req_out, anack_in, bl_ack_out2, req_out2;

	controler con (
		.req_in_i(req_in),
		.ack_out_i(bl_ack_out),

		.req_out_o(req_out),
		.ack_in_o(anack_in)		
	);

	defparam con.DELAY = 25;

	controler con_art (
		.req_in_i(req_out),
		.ack_out_i(bl_ack_out2),

		.req_out_o(req_out2),
		.ack_in_o(bl_ack_out)		
	);

	defparam con_art.DELAY = 15;

	initial begin
		req_in = 0; bl_ack_out2 = 0; bl_ack_out = 0;
		#5 req_in = 1;

		#5 req_in = 0;
		#100 bl_ack_out2 = 1;

		#5 bl_ack_out2 = 0;
	end

endmodule
