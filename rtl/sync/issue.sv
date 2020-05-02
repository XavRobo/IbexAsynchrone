module issue(
	//control signal
	input  logic req_i,
	input  logic rst_ni,

	//sortie de RF
	input  logic [31:0] rf_rdata_a_i,
	input  logic [31:0] rf_rdata_b_i,

	//valeur de pc
	input  logic [31:0] pc_rdata_i,

	//immediates
    input  logic [31:0] imm_i_type_i,
    input  logic [31:0] imm_s_type_i,
    input  logic [31:0] imm_b_type_i,
    input  logic [31:0] imm_u_type_i,
    input  logic [31:0] imm_j_type_i,
    input  logic [31:0] imm_o_type_i,
    input  logic [31:0] imm_n_type_i,

    //type requiered
    input  pkg::op_a_sel 			type_operand_a_i,
	input  pkg::op_b_sel 			type_operand_b_i,
	input  pkg::imm_b_sel 			type_imm_b_i,

	//To ALU
	input  logic 		req_alu_i,
	output logic		req_alu_o,

	input  pkg::alu_op  operateur_alu_i,
	
	output logic [31:0] operand_alu_a_o,
	output logic [31:0] operand_alu_b_o,
	output pkg::alu_op  operateur_alu_o, 

	//To PC_ALU
	input  logic 		req_pc_alu_i,
	input  pkg::pc_op 	operateur_pc_alu_i,
	

	output logic [31:0] operand_pc_alu_a_o,
	output logic [31:0] operand_pc_alu_b_o,
	output logic 		branch_bool_o,

	//To LSU
	input  logic 				 data_req_i,
	output logic                 data_req_o,            // start transaction to data memory

	input  logic 				 data_we_i,
    output logic                 data_we_o,             // write enable

    output logic [31:0]			 lsu_wdata_o,
    //output logic [31:0] 		 lsu_addr_o, //adresse caluculer dans l'ALU

    //To RF write
	input  logic [4:0] rf_waddr_i,
    
    output logic [4:0] rf_waddr_o,
    output logic 	   rf_soursel_o,//0 for ALU and 1 for LSU
    output logic 	   req_rf_w_o	
);

	import pkg::*;

	logic [31:0] operand_b;

	always_ff @(posedge(req_i)) begin
		unique case (type_imm_b_i)
			IMM_B_I: begin
				operand_b <= imm_i_type_i;
			end
			
			IMM_B_S: begin
				operand_b <= imm_s_type_i;
			end

			IMM_B_B: begin
				operand_b <= imm_b_type_i;
			end

			IMM_B_U: begin
				operand_b <= imm_u_type_i;
			end

			IMM_B_J: begin
				operand_b <= imm_j_type_i;
			end

			IMM_B_O: begin
				operand_b <= imm_o_type_i;
			end

			IMM_B_N: begin
				operand_b <= imm_n_type_i;
			end

			default: begin
				operand_b <= 0;
			end
		endcase

		data_req_o 	 <= data_req_i;
		req_alu_o    <= req_alu_i;

		//valeur par defaut
		rf_soursel_o <= 1'b0;
		req_rf_w_o   <= 1'b1;

		operand_alu_a_o    <= 0;
		operand_alu_b_o    <= 0;
		operateur_alu_o    <= ADD;

		operand_pc_alu_a_o <= pc_rdata_i;
		operand_pc_alu_b_o <= 0;
		branch_bool_o 	   <= 1'b0;
			
		lsu_wdata_o 	   <= 0;
		//lsu_addr_o 		   <= 0;
		rf_waddr_o 		   <= rf_waddr_i;
		
		//PC_ALU
		if(req_pc_alu_i) begin
			unique case (operateur_pc_alu_i)
				JAL: begin
					operand_pc_alu_b_o <= imm_n_type_i;
				end

				JALR: begin //TODO comprendre instruction
					
				end
				
				BRANCH: begin
					operand_pc_alu_b_o <= imm_n_type_i;
					branch_bool_o 	   <= 1'b1;
				end
			endcase

			req_rf_w_o <= 0;
		end
		else begin

			operand_pc_alu_b_o  <=  imm_n_type_i;

			req_rf_w_o <= 0;
		end

		//LSU
		if(data_req_i) begin
			req_rf_w_o <= 1'b1;
			data_we_o 	<= data_we_i;
			if(data_we_i) begin //ecriture mem
				 lsu_wdata_o <= rf_rdata_b_i;
			end
			else begin //lecture mem
				lsu_wdata_o <= 32'b0;
				rf_soursel_o <= 1'b1;
				req_rf_w_o <= 1'b1;
			end
		end

		//ALU
		if(req_alu_i) begin
			req_rf_w_o <= 1'b1;
		
			unique case (type_operand_a_i)
				OP_A_REG: begin
					operand_alu_a_o <= rf_rdata_a_i;
				end

				OP_A_IMM: begin //TODO pas ouf ouf la gestion
					operand_alu_a_o <= 0;
				end

				OP_A_CURRPC: begin
					operand_alu_a_o <= pc_rdata_i;
				end
			endcase

			unique case (type_operand_b_i)
				OP_B_REG: begin
					operand_alu_b_o <= rf_rdata_b_i;
				end

				OP_B_IMM: begin 
					operand_alu_b_o <= operand_b;
				end
			endcase
			
			operateur_alu_o <=  operateur_alu_i;	
		end
	end

endmodule
