module tinsmem(
	//control signal
	input  logic 		req_i,

	input  logic [31:0] instr_addr_i,

	output logic [31:0] instr_rdata_o
);

reg [31:0] mem [127:0];

always_ff @(posedge(req_i)) begin
	instr_rdata_o <= mem[instr_addr_i/4];
end

// DEBUG //
//Chargement en mémoire
assign mem[64] = 32'b0000000_10000_00000_000_00001_0010011;
assign mem[65] = 32'b0000000_10101_00000_000_00010_0010011;
assign mem[66] = 32'b0000000_00010_00001_100_00011_0110011;
endmodule
