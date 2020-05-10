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
assign mem[64] = 32'b0000000_10000_00000_000_00001_0010011; //ADD r0+16 -> r1
assign mem[65] = 32'b0000000_10101_00000_000_00010_0010011; //ADD r0+21 -> r2
assign mem[66] = 32'b0000000_00010_00001_100_00011_0110011; //XOR r1,r2 -> r3
endmodule
