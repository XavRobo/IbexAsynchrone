module asmodee(
	input logic rst_i, //vide les mullers
	input logic start_i, //premiere requete pour lancer la boucle
	input logic boot_i //charge boot addr
);

import pkg::*;

//used for boot
logic start;
//TODO
//assign #10 start = rst_i;

//enable
logic en_ife_in, en_ins_mem, en_ife_out;
logic en_lsu_in, en_lsu_out, en_dat_mem;
logic en_dec, en_rfr, en_iss, en_alu, en_pca, en_rfw;

async_controler tete(
	.rst_i(rst_i),
	.start_i(start),

	.en_ife_in_o(en_ife_in),
	.en_ins_mem_o(en_ins_mem),
	.en_ife_out_o(en_ife_out),
	
	.en_dec_o(en_dec),
	.en_rfr_o(en_rfr),
	.en_iss_o(en_iss),
	.en_alu_o(en_alu),
	
	.en_lsu_in_o(en_lsu_in),
	.en_dat_mem_o(en_dat_mem),
	.en_lsu_out_o(en_lsu_out),
	
	.en_pca_o(en_pca),
	.en_rfw_o(en_rfw)
);

// LOGIC BEGIN //

//Issue / ALU
logic alu_req, alu_operateur;

//Issue / PC ALU
logic branch_bool;

//Issue / LSU
logic data_req, data_we;
logic [31:0] lsu_wdata;

//Issue / RF w
logic soursel, req_rf_w;
//operand
logic [31:0] operand_alu_a, operand_alu_b, operand_pc_alu_a, operand_pc_alu_b;   

// IFE / MEM
logic [31:0] pc_addr, instr_rdata;


logic [31:0] instruction;

//BUS Immediat
logic [31:0] imm_i_type, imm_s_type, imm_b_type, imm_u_type, imm_j_type, imm_o_type, imm_n_type;

//req DECODE
logic req_rf_ra, req_rf_rb, req_pc_alu, req_alu, req_data;

//addr DECODE
logic [4:0] rf_waddr, rf_raddr_a, rf_raddr_b;

//
logic we_data;

//OP DECODE
pkg::op_a_sel type_operand_a; pkg::op_b_sel type_operand_b;
pkg::imm_b_sel type_imm_b;
pkg::alu_op operateur_alu, operateur_alu_o;
pkg::pc_op operateur_pc_alu;

logic [31:0] rf_rdata_a, rf_rdata_b;

logic [31:0] result_alu;

logic [31:0] datmem_rdata;

logic we_datmem;
logic [31:0] addr_datmem, wdata_datmem, data_rdata;

// LOGIC END //

tinsmem insmem(
	.req_i(en_ins_mem),

	.instr_addr_i(pc_addr),

	.instr_rdata_o(instr_rdata)
);


//IFE BEGIN//

if_stage_in ife_in(
	//control signal
	.en_i(en_ife_in),

	//interface ext / fetch
	.pc_addr_i(instr_rdata),
	

	//interface fetch / MEM
	.instr_addr_o(pc_addr)
);

if_stage_out ife_out(
	//control signal
	.en_i(en_ife_out),

	//interface ext / fetch
	.insmem_rdata_o(instruction),
	
	//interface fetch / MEM
	.instr_rdata_i(instr_rdata)
);

//IFE END//


//DECODE BEGIN//

decode dec(
	.en_i(en_dec),

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
	.rf_waddr_o(rf_waddr),

	// LSU
	.req_data_o(req_data),            // start transaction to data memory
	.we_data_o(we_data),             // write enable

	.req_pc_alu_o(req_pc_alu),
	.operateur_pc_alu_o(operateur_pc_alu),

	.req_alu_o(req_alu),
	.operateur_alu_o(operateur_alu),

	.type_operand_a_o(type_operand_a),
	.type_operand_b_o(type_operand_b),
	.type_imm_b_o(type_imm_b)
);

//DECODE END//

// RF BEGIN//

register_file rf(
	//control signal
	.en_r_i(en_rfr),
	.en_w_i(en_rfw),
	.req_ra_i(req_rf_ra),
	.req_rb_i(req_rf_rb),
	.req_w_i(req_rf_w),

	//Read port R1
    .raddr_a_i(rf_raddr_a),
    .rdata_a_o(rf_rdata_a),

    //Read port R2
    .raddr_b_i(rf_raddr_b),
    .rdata_b_o(rf_rdata_b),

    // Write port W1
    .waddr_a_i(waddr_rf),
    .wdata_alu_i(result_alu),
    .wdata_lsu_i(data_rdata),
    .soursel_i(soursel)
);

// RF END //

// ISSUE BEGIN //

issue issue_m (
    .en_i            (en_iss),
    
    .rf_rdata_a_i     (rf_rdata_a),
    .rf_rdata_b_i     (rf_rdata_b),
    .pc_rdata_i       (pc_addr),
    
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
    .req_alu_o        (alu_req),

    .operateur_alu_i(operateur_alu),
    .operand_alu_a_o(operand_alu_a),
    .operand_alu_b_o(operand_alu_b),
    .operateur_alu_o(alu_operateur), 
    
    	//To PC_ALU
    .req_pc_alu_i(req_pc_alu),
    .operateur_pc_alu_i(operateur_pc_alu),
    	
    
    .operand_pc_alu_a_o(operand_pc_alu_a),
    .operand_pc_alu_b_o(operand_pc_alu_b),
    .branch_bool_o(branch_bool),
    
    	//To LSU
    .data_req_i(req_data),
    .data_req_o(data_req),            // start transaction to data memory
    
    .data_we_i(we_data),
    .data_we_o(data_we),             // write enable
    
    .lsu_wdata_o(lsu_wdata),
        //output logic [31:0] 		 lsu_addr_o, //adresse calculee dans l'ALU
    
        //To RF write
    .rf_waddr_i(rf_waddr),
        
     .rf_waddr_o(waddr_rf),
     .rf_soursel_o(soursel),//0 for ALU and 1 for LSU
     .req_rf_w_o(req_rf_w)	
  );

// ISSUE END //

// ALU BEGIN //

alu alu(
	.en_i(en_alu),
	.req_i(alu_req),

	.operator_i(alu_operateur), 
	.op_a_i(operand_alu_a),
	.op_b_i(operand_alu_b),
	.result_o(result_alu)
);

// ALU END //

// DATA MEM

tmem datmem(
	//control signal
	.req_i(en_dat_mem),

	.data_we_i(we_datmem),
	.data_wdata_i(wdata_datmem),
	.data_addr_i(addr_datmem),

	.data_rdata_o(datmem_rdata)
);

// LSU BEGIN //

lsu_in lsu_in(
	//control signal
	.req_i(req_data),
	.en_i(en_lsu_in),

	//interface LSU / Previous
	.lsu_we_i(data_we),
	.lsu_wdata_i(lsu_wdata),
	.lsu_addr_i(result_alu),

	//interface LSU / MEM
	.data_we_o(we_datmem),
	.data_wdata_o(wdata_datmem),
	.data_addr_o(addr_datmem)
);

lsu_out lsu_out(
	//control signal
	.en_i(en_lsu_out),

	//interface LSU / Next
	.lsu_rdata_o(data_rdata),
	//output logic		lsu_err_o,

	//interface LSU / Mem
	.data_rdata_i(datmem_rdata)
	//input  logic 		data_err_i	
);

// LSU END //

// PC ALU BEGIN //

pc_alu pca(
	//control signal
	.en_i(en_pca),
	.boot_i(boot),

	//From Issue
	.operand_a_i(operand_pc_alu_a),
	.operand_b_i(operand_pc_alu_b),
	.branch_bool_i(branch_bool),

	//From ALU
	.op_bool_i(result_alu), //boolean result of the comparaison

	//To IF or Issue
	.pc_next_o(pc_addr)
);

// PC ALU END //


endmodule
