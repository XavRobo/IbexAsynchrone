//Test communication entre 2 controler asynchrone et reglage des délais

module tbench_controler;

timeunit  1ns;
timeprecision 1ns;
	logic rst;
	logic req_in, bl_ack_out, req_out, anack_in, bl_ack_out2, req_out2;

	controler con (
		.rst_i(rst),
	
		.req_in_i(req_in),
		.ack_out_i(bl_ack_out),

		.req_out_o(req_out),
		.ack_in_o(anack_in)		
	);

	defparam con.DELAY = 25;

	controler con_art (
		.rst_i(rst),
	
		.req_in_i(req_out),
		.ack_out_i(bl_ack_out2),

		.req_out_o(req_out2),
		.ack_in_o(bl_ack_out)		
	);

	defparam con_art.DELAY = 15;

	initial begin
		rst = 1;
	
		req_in = 0; bl_ack_out2 = 0; bl_ack_out = 0;
		#5 req_in = 1;

		#5 req_in = 0;
		#100 bl_ack_out2 = 1;

		#5 bl_ack_out2 = 0;

		rst = 0;
	
		req_in = 0; bl_ack_out2 = 0; bl_ack_out = 0;
		#5 req_in = 1;

		#5 req_in = 0;
		#100 bl_ack_out2 = 1;

		#5 bl_ack_out2 = 0;
	end

endmodule
