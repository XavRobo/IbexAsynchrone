module tbench_issue;

timeunit  1ns;
timeprecision 1ns;

	import pkg::*;

//DECODE
	//input
	bit req_decode;//input
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
	pkg::pc_op  ope_pc_alu;

	logic		 req_alu;
	pkg::alu_op  ope_alu;
	pkg::op_a_sel  type_operand_a;
	pkg::op_b_sel 		 type_operand_b;
	pkg::imm_b_sel  type_imm_b;

	decode dec(
	.req_i(req_decode),
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


//ISSUE
	logic req_issue;

	//contenu des registre a et b
	logic [31:0] rf_rdata_a;
	logic [31:0] rf_rdata_b;

	//contenu de PC
	logic [31:0] pc_rdata;

	//ALU

	logic		     req_2alu;
	logic [31:0] operand_alu_a;
	logic [31:0] operand_alu_b;
	pkg::alu_op operateur_alu;

	//pc ALU

	logic [31:0] operand_pc_alu_a;
	logic [31:0] operand_pc_alu_b;
	logic 		   branch_bool;

	//LSU

	logic              data_req;
	logic              data_we;
	logic [31:0]			 lsu_wdata;

	//RF write

	logic [4:0] rf_2waddr;
	logic 	    rf_soursel;
	logic 	    req_rf_w;

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

	.req_alu_i        (req_alu),
	.req_alu_o        (req_2alu),

	.operateur_alu_i (ope_alu),

	.operand_alu_a_o (operand_alu_a),
	.operand_alu_b_o (operand_alu_b),
	.operateur_alu_o (operateur_alu),

	.req_pc_alu_i (req_pc_alu),
	.operateur_pc_alu_i (ope_pc_alu),

	.operand_pc_alu_a_o (operand_pc_alu_a),
	.operand_pc_alu_b_o (operand_pc_alu_b),
	.branch_bool_o (branch_bool),

	.data_req_i (req_data),
	.data_req_o (data_req),

	.data_we_i (we_data),
	.data_we_o (data_we),

	.lsu_wdata_o (lsu_wdata),

	.rf_waddr_i (rf_waddr),
	.rf_waddr_o (rf_2waddr),
	.rf_soursel_o (rf_soursel),
	.req_rf_w_o (req_rf_w)
	);

//a definir req_decode, req_issue, instruction, rf_rdata_a, rf_rdata_b, pc_rdata

	initial begin
			#5 
			req_decode = 0; req_issue = 0; 
			instruction   = 32'b0000000_00001_10000_000_01010_0110011;//ADD ra + rb into rc
			#5
			req_decode    = 1'b1;
			#5
			rf_rdata_a    = 32'b0000000_00000_00000_000_00000_1111111;
			rf_rdata_b    = 32'b0000000_00000_00000_000_11111_0000000;
			pc_rdata      = 32'b0000000_00000_00000_000_00000_0000001;
			req_issue	  = 1'b1;

			#5 
			req_decode = 0; req_issue = 0; 
			instruction   = 32'b???????_01100_10000_100_01010_0010011;//XORI
			#5
			req_decode    = 1'b1;
			#5
			rf_rdata_a    = 32'b0000000_00000_00000_000_00000_1111111;
			rf_rdata_b    = 32'b0000000_00000_00000_000_11111_0000000;
			pc_rdata      = 32'b0000000_00000_00000_000_00000_0000001;
			req_issue	  = 1'b1;

			#5 
			req_decode = 0; req_issue = 0; 
			instruction   = 32'b???????_?????_?????_000_?????_1100011;//BEQ
			#5
			req_decode    = 1'b1;
			#5
			rf_rdata_a    = 32'b0000000_00000_00000_000_00000_1111111;
			rf_rdata_b    = 32'b0000000_00000_00000_000_11111_0000000;
			pc_rdata      = 32'b0000000_00000_00000_000_00000_0000001;
			req_issue	  = 1'b1;

			#5 
			req_decode = 0; req_issue = 0; 
			instruction   = 32'b???????_?????_?????_010_?????_0100011;//SW
			#5
			req_decode    = 1'b1;
			#5
			rf_rdata_a    = 32'b0000000_00000_00000_000_00000_1111111;
			rf_rdata_b    = 32'b0000000_00000_00000_000_11111_0000000;
			pc_rdata      = 32'b0000000_00000_00000_000_00000_0000001;
			req_issue	  = 1'b1;

			#5 
			req_decode = 0; req_issue = 0; 
			instruction   = 32'b???????_?????_?????_???_?????_0110111;//LUI
			#5
			req_decode    = 1'b1;
			#5
			rf_rdata_a    = 32'b0000000_00000_00000_000_00000_1111111;
			rf_rdata_b    = 32'b0000000_00000_00000_000_11111_0000000;
			pc_rdata      = 32'b0000000_00000_00000_000_00000_0000001;
			req_issue	  = 1'b1;			
	end

endmodule
