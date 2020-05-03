//Written by Xavier Lesage

//TODO: gestion des rst

module lsu_out(
	//control signal
	input  logic        en_i,

	//interface LSU / Next
	output logic [31:0]	lsu_rdata_o,
	//output logic		lsu_err_o,

	//interface LSU / Mem
	input  logic [31:0] data_rdata_i
	//input  logic 		data_err_i	
);

always_ff @(posedge(en_i)) begin
	lsu_rdata_o  <= data_rdata_i;
	//lsu_err_o 	 <= data_err_i;
end

endmodule
