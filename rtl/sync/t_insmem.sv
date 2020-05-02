module tinsmem(
	//control signal
	input  logic 		req_i,

	input  logic [31:0] instr_addr_i,

	output logic [31:0] instr_rdata_o
);

reg [31:0] mem [7999:0];

always_ff @(posedge(req_i)) begin
	instr_rdata_o <= mem[instr_addr_i];
end
endmodule
