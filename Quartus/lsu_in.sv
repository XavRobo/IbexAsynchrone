//Written by Xavier Lesage

//TODO: gestion des rst

module lsu_in(
	//control signal
	input  logic        req_i,
	input  logic		rst_ni,

	//interface LSU / Previous
	input  logic		lsu_we_i,
	input  logic [31:0] lsu_wdata_i,
	input  logic [31:0]	lsu_addr_i,

	//interface LSU / MEM
	output logic		data_we_o,
	output logic [31:0]	data_wdata_o,
	output logic [31:0]	data_addr_o
);

always_ff @(posedge(req_i)) begin
	data_we_o 	 <= lsu_we_i;
	data_wdata_o <= lsu_wdata_i;
	data_addr_o  <= lsu_addr_i;
end

endmodule
