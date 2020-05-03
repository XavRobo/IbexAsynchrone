//OUTDATED avec l'ajout des controleurs asynchrone
// I / O plus correspondant, signaux enable

//Test de issue qui redirige les flux sortant de decode vers les unités suivantes

module tbench_issue;
	import pkg::*;

	logic [31:0] rf_rdata_a, rf_rdata_b, pc_rdata, instruction;
	logic [31:0] imm_i_type, imm_s_type, imm_b_type, imm_u_type, imm_j_type, imm_o_type, imm_n_type;
	logic req_issue, req_decode, rst, req_pc_alu, req_alu_i, req_alu_o, bb, req_data, data_req, we_data, data_we, ss, req_w;
	logic req_rf_ra, req_rf_rb;
	pkg::op_a_sel type_operand_a; pkg::op_b_sel type_operand_b;
	pkg::imm_b_sel type_imm_b;
	pkg::alu_op operateur_alu, operateur_alu_o;
	pkg::pc_op operateur_pc_alu;

	logic [4:0] waddr_i, waddr_o, rf_raddr_a, rf_raddr_b;

	logic [31:0] operand_alu_a, operand_alu_b, operand_pc_alu_a, operand_pc_alu_b, lsu_wdata;

  issue issue_m (
    .req_i            (req_issue),
    .rst_ni           (rst),
    
    .rf_rdata_a_i     (rf_rdata_a),
    .rf_rdata_b_i     (rf_rdata_b),
    .pc_rdata_i       (pc_rdata),
    
    .imm_i_type_i     (imm_i_type),
    .imm_s_type_i     (imm_s_type),
    .imm_b_type_i     (imm_b_type),
    .imm_u_type_i     (imm_u_type),
    .imm_j_type_i     (imm_j_type),
    .imm_o_type_i     (imm_o_type),
    .imm_n_type_i     (imm_n_type),

    .type_operand_a_i (type_operand_a),
    .type_operand_b_i (type_operand_b),
    .type_imm_b_i     (type_imm_b),

    .req_alu_i        (req_alu_i),
    .req_alu_o        (req_alu_o),

    .operateur_alu_i(operateur_alu),
    .operand_alu_a_o(operand_alu_a),
    .operand_alu_b_o(operand_alu_b),
    .operateur_alu_o(operateur_alu_o), 
    
    	//To PC_ALU
    .req_pc_alu_i(req_pc_alu),
    .operateur_pc_alu_i(operateur_pc_alu),
    	
    
    .operand_pc_alu_a_o(operand_pc_alu_a),
    .operand_pc_alu_b_o(operand_pc_alu_b),
    .branch_bool_o(bb),
    
    	//To LSU
    .data_req_i(req_data),
    .data_req_o(data_req),            // start transaction to data memory
    
    .data_we_i(we_data),
    .data_we_o(data_we),             // write enable
    
    .lsu_wdata_o(lsu_wdata),
        //output logic [31:0] 		 lsu_addr_o, //adresse caluculer dans l'ALU
    
        //To RF write
    .rf_waddr_i(waddr_i),
        
     .rf_waddr_o(waddr_o),
     .rf_soursel_o(ss),//0 for ALU and 1 for LSU
     .req_rf_w_o(req_w)	
  );

  decode deco(
  	.req_i(req_decode),
    .rst_ni(rst),

    //from IF
   .instr_rdata_i(instruction),

    //immediates
    .imm_i_type_o(imm_i_type),
    .imm_s_type_o(imm_s_type),
    .imm_b_type_o(imm_b_type),
    .imm_u_type_o(imm_u_type),
    .imm_j_type_o(imm_j_type),
    .imm_o_type_o(imm_o_type),
    .imm_n_type_o(imm_n_type),

	//Decode / RF
	//req
	.req_rf_ra_o(req_rf_ra),
	.req_rf_rb_o(req_rf_rb),
	//source register address
    .rf_raddr_a_o(rf_raddr_a),
    .rf_raddr_b_o(rf_raddr_b),

	//destination register addr
	.rf_waddr_o(waddr_i),

    // LSU
    .req_data_o(req_data),            // start transaction to data memory
    .we_data_o(we_data),             // write enable

	.req_pc_alu_o(req_pc_alu),
	.operateur_pc_alu_o(operateur_pc_alu),

	.req_alu_o(req_alu_i),
	.operateur_alu_o(operateur_alu),

	.type_operand_a_o(type_operand_a),
	.type_operand_b_o(type_operand_b),
	.type_imm_b_o(type_imm_b)
  );

//req_decode, rst, instruction, rf_rdata_a, rf_rdata_b, pc_rdata, req_issue

	initial begin
		#5 req_decode = 0; rst = 0; req_issue = 0;
		instruction = 32'b0000000_00001_10000_000_01010_0110011;
		#5 req_decode = 1;
		rf_rdata_a  = 32'b00000000000110000000010100110011;
		rf_rdata_b  = 32'b00000000000110000000010100000000;
		pc_rdata	= 32'b00000000000000000000000100000000;
		#5 req_issue = 1;

		#5 req_decode = 0; rst = 0; req_issue = 0;
		instruction = 32'b0000000_00001_10000_100_01010_0110011;
		#5 req_decode = 1;
		rf_rdata_a  = 32'b00000000000110000000010100110011;
		rf_rdata_b  = 32'b00000000000110000000010100000000;
		pc_rdata	= 32'b00000000000000000000000100000000;
		#5 req_issue = 1;

		#5 req_decode = 0; rst = 0; req_issue = 0;
		instruction = 32'b???????_?????_?????_???_?????_1101111;
		#5 req_decode = 1;
		rf_rdata_a  = 32'b00000000000110000000010100110011;
		rf_rdata_b  = 32'b00000000000110000000010100000000;
		pc_rdata	= 32'b00000000000000000000000100000000;
		#5 req_issue = 1;

		#5 req_decode = 0; rst = 0; req_issue = 0;
		instruction = 32'b???????_?????_?????_010_?????_0100011;
		#5 req_decode = 1;
		rf_rdata_a  = 32'b00000000000110000000010100110011;
		rf_rdata_b  = 32'b00000000000110000000010100000000;
		pc_rdata	= 32'b00000000000000000000000100000000;
		#5 req_issue = 1;

		#5 req_decode = 0; rst = 0; req_issue = 0;
		instruction = 32'b0100000_?????_?????_101_?????_0110011;
		#5 req_decode = 1;
		rf_rdata_a  = 32'b00000000000110000000010100110011;
		rf_rdata_b  = 32'b00000000000110000000010100000000;
		pc_rdata	= 32'b00000000000000000000000100000000;
		#5 req_issue = 1;

		#5 req_decode = 0; rst = 0; req_issue = 0;
		instruction = 32'b???????_?????_?????_000_?????_1100011;
		#5 req_decode = 1;
		rf_rdata_a  = 32'b00000000000110000000010100110011;
		rf_rdata_b  = 32'b00000000000110000000010100000000;
		pc_rdata	= 32'b00000000000000000000000100000000;
		#5 req_issue = 1;
	end 
endmodule
