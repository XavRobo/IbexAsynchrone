//Written by Xavier Lesage

/*
* Fetch Instruction
* TODO: gestion des reset 
* TODO: gestion des queues (FIFO) d'instructions
*/

module if_stage(
	// control signal
	input  logic rst_ni,

	// Instruction-Side Memory Interface
	output logic        f2instr_req_o,
	output logic        f2instr_ack_o,
	input  logic        instr2f_req_i,
	input  logic        instr2f_ack_i,
	
	output logic [31:0] instr_addr_o,
	input  logic [31:0] instr_rdata_i,
	input  logic        instr_err_i,

	//communication entre les étages
	output logic        f2d_req_o,
	output logic        f2d_ack_o,
	input  logic        d2f_req_i,
	input  logic        d2f_ack_i,	
);

  /////////////////////////
  //   LOAD STORE UNIT	 //
  /////////////////////////

  load_store_unit lsu (
  	.rst_ni(rst_ni),

	.lsu2mem_req_o  (f2instr_req_o),
	.lsu2mem_ack_o  (f2instr_ack_o),
	.mem2lsu_req_i  (instr2f_req_i),
	.mem2lsu_ack_i  (instr2f_ack_i),
	.data_addr_o    (instr_addr_o),
	.data_we_o 		(1'b0),
	.data_wdata_o 	(0),
	.data_rdata_i   (instr_rdata_i),
	.data_err_i 	(instr_err_i),

	.lsu2next_req_o (f2d_req_o),
	.lsu2next_ack_o (f2d_ack_o),
	.next2lsu_req_i (d2f_req_i),
	.next2lsu_ack_i (d2f_ack_i),
	.lsu_addr_i 	(),
	.lsu_we_i 		(),
	.lsu_wdata_i 	(),
	.lsu_rdata_o 	(),
	.lsu_err_o 		()
  );

endmodule
