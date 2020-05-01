//Written by Xavier Lesage

//TODO: gestion des rst
//TODO: gestion du boot

module if_stage_in(
	//control signal
	input  logic        req_i,
	input  logic		rst_ni,

	//interface ext / fetch
	//input  logic [31:0] boot_addr_i,
	//input  logic        pc_set_i,
	input  logic [31:0] pc_addr_i, //On part du principe que le PC est caluculé autre part
	

	//interface fetch / MEM
	output logic [31:0] instr_addr_o
);

always_ff @(posedge(req_i)) begin
	instr_addr_o <= pc_addr_i;
end

endmodule
