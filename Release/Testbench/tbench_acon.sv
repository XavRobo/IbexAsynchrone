//OUTDATED avec l'ajout des controleurs asynchrone
// I / O plus correspondant, on ne prend pas en compte les sorties enables

module tbench_acon;

timeunit  1ns;
timeprecision 1ns;

	logic rst;
	logic start;

	async_controler aco(
		.rst_ni(rst),
		.req_start(start)
	);

	initial begin
		rst = 1; start = 0;
		#200 rst =0;
		#5 start = 1;
		#1 start = 0;
	end

endmodule
