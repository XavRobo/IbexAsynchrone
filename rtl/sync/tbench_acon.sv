module tbench_acon;

timeunit  1ns;
timeprecision 1ns;

	logic rst;
	logic start;

	async_controler aco(
		.rst_ni(rst),
		.req_rst(start)
	);

	initial begin
		rst =1;
		#15 rst =0;
		#5 start = 1;
		#1 start = 0;
	end

endmodule
