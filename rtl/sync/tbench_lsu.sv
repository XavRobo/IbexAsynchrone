module tbench_lsu;
	int valeur = 5;

	logic req_mem, req_lin, req_loutre, rst;

	logic data_we, lsu_we;
	logic [31:0] data_wdata, data_addr, data_rdata, lsu_wdata, lsu_addr, lsu_rdata;

	tmem mem(
		.req_i(req_mem),

		.data_we_i(data_we),
		.data_wdata_i(data_wdata),
		.data_addr_i(data_addr),
		
		.data_rdata_o(data_rdata)	
	);

	lsu_in lin(
		//control signal
		.req_i(req_lin),
		.rst_ni(rst),
	
		//interface LSU / Previous
		.lsu_we_i(lsu_we),
		.lsu_wdata_i(lsu_wdata),
		.lsu_addr_i(lsu_addr),
	
		//interface LSU / MEM
		.data_we_o(data_we),
		.data_wdata_o(data_wdata),
		.data_addr_o(data_addr)
	);

	lsu_out loutre(
		//control signal
		.req_i(req_loutre),
		.rst_ni(rst),
	
		//interface LSU / Next
		.lsu_rdata_o(lsu_rdata),
		//output logic		lsu_err_o,
	
		//interface LSU / Mem
		.data_rdata_i(data_rdata)
		//input  logic 		data_err_i	
	);

//entree lsu_we, lsu_wdata, lsu_addr ,req_mem, req_lin, req_loutre

	initial begin
		req_mem = 0; req_lin = 0; req_loutre = 0;
		#valeur lsu_we = 1; 
		lsu_addr  = 32'b00000000000000000000000000000001;
		lsu_wdata = 32'b00000000000000000000000000001111;
		#5 req_lin = 1;
		#5 req_mem = 1;
		#5 req_loutre = 1;

		#5 req_mem = 0; req_lin = 0; req_loutre = 0;
		#5 lsu_we = 0; 
		lsu_addr =  32'b00000000000000000000000000000001;
		#5 req_lin = 1;
		#5 req_mem = 1;
		#5 req_loutre = 1;
	end
endmodule
