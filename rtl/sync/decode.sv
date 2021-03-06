// Source/Destination register instruction index
`define REG_S1 19:15
`define REG_S2 24:20
`define REG_S3 31:27
`define REG_D  11:07

module decode(
	//control signal
	input  logic        		  en_i,

    //from IF
    input  logic [31:0] 		  instr_rdata_i,

    //immediates
    output logic [31:0]           imm_i_type_o,
    output logic [31:0]           imm_s_type_o,
    output logic [31:0]           imm_b_type_o,
    output logic [31:0]           imm_u_type_o,
    output logic [31:0]           imm_j_type_o,
    output logic [31:0]           imm_o_type_o,
    output logic [31:0]           imm_n_type_o,

	//Decode / RF
	//req
	output logic 				req_rf_ra_o,
	output logic 				req_rf_rb_o,
	//source register address
    output logic [4:0]           rf_raddr_a_o,
    output logic [4:0]           rf_raddr_b_o,

	//destination register addr
	output logic [4:0]           rf_waddr_o,

    // LSU
    output logic                 req_data_o,            // start transaction to data memory
    output logic                 we_data_o,             // write enable
    //output logic [1:0]           data_type_o,           //TODO: size of transaction: byte, half
                                                        // word or word
    //output logic                 data_sign_extension_o, //TODO: sign extension for data read from
                                                        // memory
	// jump/branches
	//req to PC ALU
	/*
	output logic                 jump_in_dec_o,         // jump is being calculated in PC ALU
	output logic                 branch_in_dec_o,
	*/

	output logic 				   req_pc_alu_o,
	output pkg::pc_op 			   operateur_pc_alu_o,
	//output logic [31:0] 		   operand_pc_alu

	//output logic                 jump_set_o,            //TODO: jump taken set signal, used with buffer to flush
	//output logic                 icache_inval_o,

	//ALU
	output logic 					req_alu_o,
	output pkg::alu_op 				operateur_alu_o,

	output pkg::op_a_sel 			type_operand_a_o,
	output pkg::op_b_sel 			type_operand_b_o,
	output pkg::imm_b_sel 			type_imm_b_o
);

	import pkg::*;

	logic [31:0] instr;

	opcode op;

	always_ff @(posedge(en_i)) begin
		//MAJ instruction
		instr <= instr_rdata_i;

		// immediate extraction and sign extension
		imm_i_type_o <= { {20{instr_rdata_i[31]}}, instr_rdata_i[31:20] };
		imm_s_type_o <= { {20{instr_rdata_i[31]}}, instr_rdata_i[31:25], instr_rdata_i[11:7] };
		imm_b_type_o <= { {19{instr_rdata_i[31]}}, instr_rdata_i[31], instr_rdata_i[7], instr_rdata_i[30:25], instr[11:8], 1'b0 };
		imm_u_type_o <= { instr_rdata_i[31:12], 12'b0 };
		imm_j_type_o <= { {12{instr_rdata_i[31]}}, instr_rdata_i[19:12], instr_rdata_i[20], instr_rdata_i[30:21], 1'b0 };
		imm_o_type_o <= offset;
		imm_n_type_o <= 4;


		//source register
		rf_raddr_a_o <= instr_rdata_i[`REG_S1]; // rs3 / rs1
		rf_raddr_b_o <= instr_rdata_i[`REG_S2]; // rs2

		// destination register
		rf_waddr_o   <= instr_rdata_i[`REG_D]; // rd
	end

	/////////////
	// Decoder //
	/////////////

	always_comb begin
		//default values
		req_rf_ra_o  	   = 1'b0;
		req_rf_rb_o  	   = 1'b0;
		req_data_o   	   = 1'b0;
		we_data_o    	   = 1'b0;
		req_pc_alu_o 	   = 1'b0;
		operateur_pc_alu_o = JALR;
		req_alu_o 		   = 1'b0;
		operateur_alu_o    = ADD;
		type_operand_a_o   = OP_A_IMM;
		type_operand_b_o   = OP_B_IMM;
		type_imm_b_o  	   = IMM_B_N;

		//case selection
		op = opcode'(instr[6:0]);

		unique case (op)

			//////////////////
			// Load / Store //
			//////////////////

			OPCODE_LOAD: begin
				req_rf_ra_o = 1'b1;

				req_alu_o 		 = 1'b1;
				operateur_alu_o  = ADD;
				type_operand_a_o = OP_A_REG;
				type_operand_b_o = OP_B_IMM;
				type_imm_b_o 	 = IMM_B_O;

				req_data_o 		 = 1'b1;
				we_data_o 		 = 1'b0;
			end

			OPCODE_STORE: begin
				req_rf_ra_o = 1'b1;
				req_rf_rb_o = 1'b1;

				req_alu_o 		 = 1'b1;
				operateur_alu_o  = ADD;
				type_operand_a_o = OP_A_REG;
				type_operand_b_o = OP_B_IMM;
				type_imm_b_o 	 = IMM_B_O;

				req_data_o 		 = 1'b1;
				we_data_o 		 = 1'b1;
			end

			//////////
			// Jump //
			//////////

			OPCODE_JAL: begin
				req_alu_o 		 = 1'b1;
				operateur_alu_o  = ADD;
				type_operand_a_o = OP_A_CURRPC;
				type_operand_b_o = OP_B_IMM;
				type_imm_b_o 	 = IMM_B_N;

				req_pc_alu_o 	 = 1'b1;
				operateur_pc_alu_o = JAL;
			end

			OPCODE_JALR: begin
			//TODO Comprendre

			end

			OPCODE_BRANCH: begin
				req_rf_ra_o  	   = 1'b1;
				req_rf_rb_o  	   = 1'b1;

				req_alu_o 		 = 1'b1;
				type_operand_a_o = OP_A_REG;
				type_operand_b_o = OP_B_REG;

				req_pc_alu_o 	 = 1'b1;
				operateur_pc_alu_o = BRANCH;

				unique case (instr[14:12])
					3'b000:  operateur_alu_o = EQ;
					3'b001:  operateur_alu_o = NE;
					3'b100:  operateur_alu_o = LT;
					3'b101:  operateur_alu_o = GE;
					3'b110:  operateur_alu_o = LTU;
					3'b111:  operateur_alu_o = GEU;
					default: ;
				endcase
			end

			/////////
			// ALU //
			/////////

			OPCODE_LUI: begin
				req_alu_o 		 = 1'b1;
				operateur_alu_o  = ADD;
				type_operand_a_o = OP_A_IMM;
				type_operand_b_o = OP_B_IMM;
				type_imm_b_o 	 = IMM_B_U;
			end

			OPCODE_AUIPC: begin
				req_alu_o 		 = 1'b1;
				operateur_alu_o  = ADD;
				type_operand_a_o = OP_A_CURRPC;
				type_operand_b_o = OP_B_IMM;
				type_imm_b_o 	 = IMM_B_U;
			end

			OPCODE_OP_IMM: begin
				req_alu_o 		   = 1'b1;
			
				req_rf_ra_o  	   = 1'b1;

				type_operand_a_o = OP_A_REG;
				type_operand_b_o = OP_B_IMM;
				type_imm_b_o 	 = IMM_B_I;

				unique case (instr[14:12])
					3'b000: operateur_alu_o = ADD;  // Add Immediate
					3'b010: operateur_alu_o = SLT;  // Set to one if Lower Than Immediate
					3'b011: operateur_alu_o = SLTU; // Set to one if Lower Than Immediate Unsigned
					3'b100: operateur_alu_o = XOR;  // Exclusive Or with Immediate
					3'b110: operateur_alu_o = OR;   // Or with Immediate
					3'b111: operateur_alu_o = AND;  // And with Immediate
					3'b001: operateur_alu_o = SLL; // Shift Left Logical by Immediate

					3'b101: begin
						if (instr[31:27] == 5'b0_0000) begin
						 	 operateur_alu_o = SRL;            // Shift Right Logical by Immediate
						end
						else if (instr[31:27] == 5'b0_1000) begin
						  	operateur_alu_o = SRA;            // Shift Right Arithmetically by Immediate
						end
					end

			      	default: ;
				endcase
			end

			OPCODE_OP: begin
				req_alu_o 	 = 1'b1;
				
				req_rf_ra_o  = 1'b1;
				req_rf_rb_o  = 1'b1;

				type_operand_a_o = OP_A_REG;
				type_operand_b_o = OP_B_REG;

				unique case ({instr[31:25], instr[14:12]})
					 // RV32I ALU operations
		            {7'b000_0000, 3'b000}: operateur_alu_o = ADD;   // Add
		            {7'b010_0000, 3'b000}: operateur_alu_o = SUB;   // Sub
		            {7'b000_0000, 3'b010}: operateur_alu_o = SLT;   // Set Lower Than
		            {7'b000_0000, 3'b011}: operateur_alu_o = SLTU;  // Set Lower Than Unsigned
		            {7'b000_0000, 3'b100}: operateur_alu_o = XOR;   // Xor
		            {7'b000_0000, 3'b110}: operateur_alu_o = OR;    // Or
		            {7'b000_0000, 3'b111}: operateur_alu_o = AND;   // And
		            {7'b000_0000, 3'b001}: operateur_alu_o = SLL;   // Shift Left Logical
		            {7'b000_0000, 3'b101}: operateur_alu_o = SRL;   // Shift Right Logical
		            {7'b010_0000, 3'b101}: operateur_alu_o = SRA;   // Shift Right Arithmetic
				endcase
								
			end

			default: begin
			//NOP
				req_alu_o 		 = 1'b1;
				operateur_alu_o  = ADD;
				type_operand_a_o = OP_A_IMM;
				type_operand_b_o = OP_B_IMM;
				type_imm_b_o 	 = IMM_B_I;
			end


			//TODO gestion des MISC MEM et appel systeme
		endcase
	end



endmodule
