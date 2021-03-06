module async_controler(
	input  logic rst_i,
	input  logic start_i,

	output logic en_ife_in_o,
	output logic en_ins_mem_o,
	output logic en_ife_out_o,

	output logic en_dec_o,
	output logic en_rfr_o,
	output logic en_iss_o,
	output logic en_alu_o,
	
	output logic en_lsu_in_o,
	output logic en_dat_mem_o,
	output logic en_lsu_out_o,
	
	output logic en_pca_o,
	output logic en_boo_o,
	output logic en_rfw_o
);

timeunit  1ns;
timeprecision 1ns;

logic req_f_dec, ack_f_dec, req_j_iss, ack_j_iss;
logic req_f_iss, ack_f_iss, req_f_alu, ack_f_alu, req_j_lsu, ack_j_lsu;
logic req_j_rfw, ack_j_rfw, req_j_pca, ack_j_pca, req_f_pca, ack_f_pca;

logic req_ife2dec, ack_dec2ife, req_dec2rfr, ack_rfr2dec, req_pca2boo, ack_boo2pca;
logic req_dec2iss, ack_iss2dec, req_rfr2iss, ack_iss2rfr;
logic req_iss2alu, ack_alu2iss, req_iss2lsu, ack_lsu2iss, req_iss2rfw, ack_rfw2iss;
logic req_iss2pca, ack_pca2iss, req_alu2pca, ack_pca2alu, req_pca2ife, ack_ife2pca;
logic req_alu2rfw, ack_rfw2alu, req_alu2lsu, ack_lsu2alu, req_lsu2rfw, ack_rfw2lsu;
logic req_moa, instr_gnt, instr_req, instr_rvalid, instr_r;
logic data_req, data_gnt, data_rvalid, lsu_req_done;

assign en_ife_in_o  = ack_ife2pca;
assign en_ins_mem_o = instr_gnt;
assign en_ife_out_o = instr_rvalid;

assign en_dec_o = ack_dec2ife;
assign en_rfr_o = ack_rfr2dec;
assign en_iss_o = ack_j_iss;
assign en_alu_o = ack_alu2iss;

assign en_lsu_in_o = ack_j_lsu;
assign en_dat_mem_o = data_gnt;
assign en_lsu_out_o = lsu_req_done;


assign en_pca_o	= ack_j_pca;
assign en_boo_o = ack_boo2pca;

assign en_rfw_o	= ack_j_rfw;

//IFE//
controler ctl_ife_in (
	.rst_i(rst_i), 

	.req_in_i(req_pca2ife),
	.ack_out_i(instr_gnt),

	.req_out_o(instr_req),
	.ack_in_o(ack_ife2pca)	
);

controler ctl_ins_mem (
	.rst_i(rst_i), 

	.req_in_i(instr_req),
	.ack_out_i(instr_rvalid),

	.req_out_o(instr_r),
	.ack_in_o(instr_gnt)	
);

controler ctl_ife_out (
	.rst_i(rst_i), 

	.req_in_i(instr_r),
	.ack_out_i(ack_dec2ife),

	.req_out_o(req_ife2dec),
	.ack_in_o(instr_rvalid)	
);
//IFE END//

controler ctl_dec (
	.rst_i(rst_i), 

	.req_in_i(req_ife2dec),
	.ack_out_i(ack_f_dec),

	.req_out_o(req_f_dec),
	.ack_in_o(ack_dec2ife)	
);

controler ctl_rfr (
	.rst_i(rst_i), 

	.req_in_i(req_dec2rfr),
	.ack_out_i(ack_iss2rfr),

	.req_out_o(req_rfr2iss),
	.ack_in_o(ack_rfr2dec)	
);

controler ctl_iss (
	.rst_i(rst_i), 

	.req_in_i(req_j_iss),
	.ack_out_i(ack_f_iss),

	.req_out_o(req_f_iss),
	.ack_in_o(ack_j_iss)	
);

controler ctl_alu (
	.rst_i(rst_i), 

	.req_in_i(req_iss2alu),
	.ack_out_i(ack_f_alu),

	.req_out_o(req_f_alu),
	.ack_in_o(ack_alu2iss)	
);

//LSU//
controler ctl_lsu_in (
	.rst_i(rst_i), 

	.req_in_i(req_j_lsu),
	.ack_out_i(data_gnt),

	.req_out_o(data_req),
	.ack_in_o(ack_j_lsu)	
);

controler ctl_dat_mem (
	.rst_i(rst_i), 

	.req_in_i(data_req),
	.ack_out_i(lsu_req_done),

	.req_out_o(data_rvalid),
	.ack_in_o(data_gnt)	
);

controler ctl_lsu_out (
	.rst_i(rst_i), 

	.req_in_i(data_rvalid),
	.ack_out_i(ack_rfw2lsu),

	.req_out_o(req_lsu2rfw),
	.ack_in_o(lsu_req_done)	
);
//LSU END//

controler ctl_pca (
	.rst_i(rst_i), 

	.req_in_i(req_j_pca ),
	.ack_out_i(ack_boo2pca),

	.req_out_o(req_pca2boo),
	.ack_in_o(ack_j_pca)	
);

controler ctl_boo (
	.rst_i(rst_i), 

	.req_in_i(req_pca2boo | start_i),
	.ack_out_i(ack_f_pca),

	.req_out_o(req_f_pca),
	.ack_in_o(ack_boo2pca)	
);

//test pour la tbench
//defparam ctl_pca.DELAY = 150;

controler ctl_rfw (
	.rst_i(rst_i), 

	.req_in_i(req_j_rfw),
	.ack_out_i(req_moa),

	.req_out_o(req_moa),
	.ack_in_o(ack_j_rfw)	
);

fork2 f_dec(
	.rst_i(rst_i),

	.ack_out1_i(ack_iss2dec),
	.ack_out2_i(ack_rfr2dec),
	.req_in_i(req_f_dec),

	.req_out1_o(req_dec2iss),
	.req_out2_o(req_dec2rfr),
	.ack_in_o(ack_f_dec)	
);

join3 j_iss(
	.rst_i(rst_i),

	.req_in1_i(req_dec2iss),
	.req_in2_i(req_pca2iss),
	.req_in3_i(req_rfr2iss),
	.ack_out_i(ack_j_iss),

	.ack_in1_o(ack_iss2dec),
	.ack_in2_o(ack_iss2pca),
	.ack_in3_o(ack_iss2rfr),
	.req_out_o(req_j_iss)	
);

fork4 f_iss(
	.rst_i(rst_i),

	.ack_out1_i(ack_alu2iss),
	.ack_out2_i(ack_lsu2iss),
	.ack_out3_i(ack_pca2iss),
	.ack_out4_i(ack_rfw2iss),
	.req_in_i(req_f_iss),

	.req_out1_o(req_iss2alu),
	.req_out2_o(req_iss2lsu),
	.req_out3_o(req_iss2pca),
	.req_out4_o(req_iss2rfw),
	.ack_in_o(ack_f_iss)
);

fork3 f_alu(
	.rst_i(rst_i),

	.ack_out1_i(ack_lsu2alu),
	.ack_out2_i(ack_pca2alu),
	.ack_out3_i(ack_rfw2alu),
	.req_in_i(req_f_alu),

	.req_out1_o(req_alu2lsu),
	.req_out2_o(req_alu2pca),
	.req_out3_o(req_alu2rfw),
	.ack_in_o(ack_f_alu)	
);

join2 j_lsu(
	.rst_i(rst_i),

	.req_in1_i(req_alu2lsu),
	.req_in2_i(req_iss2lsu),
	.ack_out_i(ack_j_lsu),

	.ack_in1_o(ack_lsu2alu),
	.ack_in2_o(ack_lsu2iss),
	.req_out_o(req_j_lsu)	
);

join3 j_rfw(
	.rst_i(rst_i),

	.req_in1_i(req_alu2rfw),
	.req_in2_i(req_lsu2rfw),
	.req_in3_i(req_iss2rfw),
	.ack_out_i(ack_j_rfw),

	.ack_in1_o(ack_rfw2alu),
	.ack_in2_o(ack_rfw2lsu),
	.ack_in3_o(ack_rfw2iss),
	.req_out_o(req_j_rfw)	
);

join2 j_pca(
	.rst_i(rst_i),

	.req_in1_i(req_iss2pca),
	.req_in2_i(req_alu2pca),
	.ack_out_i(ack_j_pca),

	.ack_in1_o(ack_pca2iss),
	.ack_in2_o(ack_pca2alu),
	.req_out_o(req_j_pca)	
);

fork2 f_pca(
	.rst_i(rst_i),

	.ack_out1_i(ack_iss2pca),
	.ack_out2_i(ack_ife2pca),
	.req_in_i(req_f_pca),

	.req_out1_o(req_pca2iss),
	.req_out2_o(req_pca2ife),
	.ack_in_o(ack_f_pca)	
);

endmodule
