//Test communication entre 2 controler asynchrone et reglage des délais

module tbench_controler;

timeunit  1ns;
timeprecision 1ns;
	logic rst;
	logic req_in, ack_out, req_out, ack_in, ack_out2, req_out2;

	controler ctl (
		.rst_i(rst),
	
		.req_in_i(req_in),
		.ack_out_i(ack_out),

		.req_out_o(req_out),
		.ack_in_o(ack_in)		
	);

	defparam ctl.DELAY = 25;

	controler ctl2 (
		.rst_i(rst),
	
		.req_in_i(req_out),
		.ack_out_i(ack_out2),

		.req_out_o(req_out2),
		.ack_in_o(ack_out)		
	);

	defparam ctl2.DELAY = 15;

	initial begin
		rst = 1;
	
		req_in = 0; ack_out2 = 0; ack_out = 0;
		#5 req_in = 1;

		#5 req_in = 0;
		#100 ack_out2 = 1;

		#5 ack_out2 = 0;

		rst = 0;
	
		req_in = 0; ack_out2 = 0; ack_out = 0;
		#5 req_in = 1;

		#5 req_in = 0;
		#100 ack_out2 = 1;

		#5 ack_out2 = 0;
	end

endmodule
