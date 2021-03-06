//OUTDATED avec l'ajout des controleurs asynchrone
// I / O plus correspondant, signaux enable

//Test réalisé avec la premiere version de decode pour les instructions reg / imm

module tbench;

timeunit  1ns;
timeprecision 1ns;

//input
bit request;//input
bit rst;//input
logic [31:0] instruction;//input


//output
logic [31:0] imm_i_type;
logic [31:0] imm_s_type;
logic [31:0] imm_b_type;
logic [31:0] imm_u_type;
logic [31:0] imm_j_type;
logic [31:0] imm_o_type;
logic [31:0] imm_n_type;

logic 		 req_rf_ra;
logic 		 req_rf_rb;
logic [04:0] rf_raddr_a;
logic [04:0] rf_raddr_b;

logic [04:0] rf_waddr;

logic 		 req_data;
logic 		 we_data;

logic 		 req_pc_alu;
logic [1:0]  ope_pc_alu;

logic		 req_alu;
logic [4:0]  ope_alu;
logic [1:0]  type_operand_a;
logic 		 type_operand_b;
logic [2:0]  type_imm_b;

decode dec(
	.req_i(request),
	.rst_ni(rst),
	.instr_rdata_i(instruction),

	.imm_i_type_o(imm_i_type),
	.imm_s_type_o(imm_s_type),
	.imm_b_type_o(imm_b_type),
	.imm_u_type_o(imm_u_type),
	.imm_j_type_o(imm_j_type),
	.imm_o_type_o(imm_o_type),
	.imm_n_type_o(imm_n_type),

	.req_rf_ra_o(req_rf_ra),
	.req_rf_rb_o(req_rf_rb),
	.rf_raddr_a_o(rf_raddr_a),
	.rf_raddr_b_o(rf_raddr_b),
	.rf_waddr_o(rf_waddr),

	.req_data_o(req_data),
	.we_data_o(we_data),

	.req_pc_alu_o(req_pc_alu),
	.operateur_pc_alu_o(ope_pc_alu),

	.req_alu_o(req_alu),
	.operateur_alu_o(ope_alu),
	.type_operand_a_o(type_operand_a),
	.type_operand_b_o(type_operand_b),
	.type_imm_b_o(type_imm_b)
);

	initial begin
		#5 request = 0; instruction = 32'b000011110000_10010_000_00001_0010011;//ADDI
		#5 request = 1;

		#5 request = 0; instruction = 32'b000011110000_11010_010_01001_0010011;//SLTI
		#5 request = 1;

		#5 request = 0; instruction = 32'b???????_?????_?????_011_?????_0010011;//SLTUI
		#5 request = 1;

		#5 request = 0; instruction = 32'b???????_?????_?????_100_?????_0010011;//XORI
		#5 request = 1;

		#5 request = 0; instruction = 32'b???????_?????_?????_110_?????_0010011;
		#5 request = 1;
		
		#5 request = 0; instruction = 32'b???????_?????_?????_111_?????_0010011;
		#5 request = 1;

		#5 request = 0; instruction = 32'b0000000_?????_?????_001_?????_0010011;
		#5 request = 1;

		#5 request = 0; instruction = 32'b0000000_?????_?????_101_?????_0010011;
		#5 request = 1;

		#5 request = 0; instruction = 32'b0100000_?????_?????_101_?????_0010011;
		#5 request = 1;

		#5 request = 0; instruction = 32'b0000000_?????_?????_111_?????_0110011;
		#5 request = 1;
	end
	    


endmodule
