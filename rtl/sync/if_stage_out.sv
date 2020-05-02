//Written by Xavier Lesage

//TODO: gestion du boot

module if_stage_out(
	//control signal
	input  logic        en_i,

	//interface ext / fetch
	output logic [31:0] insmem_rdata_o, //ce nom est pas top
	//output logic 		insmem_err_o,
	
	//interface fetch / MEM
	input  logic [31:0] instr_rdata_i,
	//input  logic 		instr_err_i
);

always_ff @(posedge(en_i)) begin
	insmem_rdata_o <= instr_rdata_i;
	//insmem_err_o   <= instr_err_i;
end

endmodule
