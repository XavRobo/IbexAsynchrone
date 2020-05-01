module tbench_rf;

	logic req_ra, req_rb, req_w, rst;

	logic [4:0] raddr_a, raddr_b, waddr_a;
	logic [31:0] rdata_a, rdata_b, wdata_a;
	

	register_file regis(
		.req_ra_i(req_ra),
		.req_rb_i(req_rb),
		.req_w_i(req_w),
		.rst_ni(rst),

		.raddr_a_i(raddr_a),
		.rdata_a_o(rdata_a),

		.raddr_b_i(raddr_b),
		.rdata_b_o(rdata_b),

		.waddr_a_i(waddr_a),
		.wdata_a_i(wdata_a)		
	);

	initial begin
		req_ra = 0; req_rb = 0;
		#5 req_w = 0;
		waddr_a = 5'b00100;
		wdata_a = 32'b00000000000000000000000000000001;
		#5 req_w = 1;

		#5 req_w = 0;
		waddr_a = 5'b00010;
		wdata_a = 32'b00000000000011000000000000000001;
		#5 req_w = 1;

		#5 raddr_a = 5'b00100; raddr_b = 5'b00010;
		#5 req_ra = 1; req_rb = 1;
	end
	

endmodule
