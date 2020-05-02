module async_controler(
	input  logic rst_ni,
	input  logic req_start
);

timeunit  1ns;
timeprecision 1ns;

logic req_f_dec, ack_f_dec, req_j_iss, ack_j_iss;
logic req_f_iss, ack_f_iss, req_f_alu, ack_f_alu, req_j_lsu, ack_j_lsu;
logic req_j_rfw, ack_j_rfw, req_j_pca, ack_j_pca;

logic req_ife2dec, ack_dec2ife, req_dec2rfr, ack_rfr2dec, req_dec2pcs, ack_pcs2dec;
logic req_dec2iss, ack_iss2dec, req_rfr2iss, ack_iss2rfr, req_pcs2iss, ack_iss2pcs;
logic req_iss2alu, ack_alu2iss, req_iss2lsu, ack_lsu2iss, req_iss2rfw, ack_rfw2iss;
logic req_iss2pca, ack_pca2iss, req_alu2pca, ack_pca2alu, req_pca2ife, ack_ife2pca;
logic req_alu2rfw, ack_rfw2alu, req_alu2lsu, ack_lsu2alu, req_lsu2rfw, ack_rfw2lsu;
logic req_moa;

controler ctl_ife (
	.rst_ni(rst_ni), 

	.req_in_i(req_pca2ife | req_start),
	.ack_out_i(ack_dec2ife),

	.req_out_o(req_ife2dec),
	.ack_in_o(ack_ife2pca)	
);

controler ctl_dec (
	.rst_ni(rst_ni), 

	.req_in_i(req_ife2dec),
	.ack_out_i(ack_f_dec),

	.req_out_o(req_f_dec),
	.ack_in_o(ack_dec2ife)	
);

controler ctl_rfr (
	.rst_ni(rst_ni), 

	.req_in_i(req_dec2rfr),
	.ack_out_i(ack_iss2rfr),

	.req_out_o(req_rfr2iss),
	.ack_in_o(ack_rfr2dec)	
);

controler ctl_pcs (
	.rst_ni(rst_ni), 

	.req_in_i(req_dec2pcs),
	.ack_out_i(ack_iss2pcs),

	.req_out_o(req_pcs2iss),
	.ack_in_o(ack_pcs2dec)	
);

controler ctl_iss (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_iss),
	.ack_out_i(ack_f_iss),

	.req_out_o(req_f_iss),
	.ack_in_o(ack_j_iss)	
);

controler ctl_alu (
	.rst_ni(rst_ni), 

	.req_in_i(req_iss2alu),
	.ack_out_i(ack_f_alu),

	.req_out_o(req_f_alu),
	.ack_in_o(ack_alu2iss)	
);

controler ctl_lsu (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_lsu),
	.ack_out_i(ack_rfw2lsu),

	.req_out_o(req_lsu2rfw),
	.ack_in_o(ack_j_lsu)	
);

controler ctl_pca (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_pca),
	.ack_out_i(ack_ife2pca),

	.req_out_o(req_pca2ife),
	.ack_in_o(ack_j_pca)	
);

//test pour la tbench
defparam ctl_pca.DELAY = 150;

controler ctl_rfw (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_rfw),
	.ack_out_i(req_moa),

	.req_out_o(req_moa),
	.ack_in_o(ack_j_rfw)	
);

/*
join2 j_ife(
	.rst_ni(rst_ni),

	.req_in1_i(rst_ni),
	.req_in2_i(req_pca2ife),
	.ack_out_i(ack_j_ife),

	.ack_in1_o(ack_levent), //TODO dans le vent
	.ack_in2_o(ack_ife2pca),
	.req_out_o(req_j_ife)	
);
*/

fork3 f_dec(
	.rst_ni(rst_ni),

	.ack_out1_i(ack_iss2dec),
	.ack_out2_i(ack_pcs2dec),
	.ack_out3_i(ack_rfr2dec),
	.req_in_i(req_f_dec),

	.req_out1_o(req_dec2iss),
	.req_out2_o(req_dec2pcs),
	.req_out3_o(req_dec2rfr),
	.ack_in_o(ack_f_dec)	
);

join3 j_iss(
	.rst_ni(rst_ni),

	.req_in1_i(req_dec2iss),
	.req_in2_i(req_pcs2iss),
	.req_in3_i(req_rfr2iss),
	.ack_out_i(ack_j_iss),

	.ack_in1_o(ack_iss2dec),
	.ack_in2_o(ack_iss2pcs),
	.ack_in3_o(ack_iss2rfr),
	.req_out_o(req_j_iss)	
);

fork4 f_iss(
	.rst_ni(rst_ni),

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
	.rst_ni(rst_ni),

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
	.rst_ni(rst_ni),

	.req_in1_i(req_alu2lsu),
	.req_in2_i(req_iss2lsu),
	.ack_out_i(ack_j_lsu),

	.ack_in1_o(ack_lsu2alu),
	.ack_in2_o(ack_lsu2iss),
	.req_out_o(req_j_lsu)	
);

join3 j_rfw(
	.rst_ni(rst_ni),

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
	.rst_ni(rst_ni),

	.req_in1_i(req_iss2pca),
	.req_in2_i(req_alu2pca),
	.ack_out_i(ack_j_pca),

	.ack_in1_o(ack_pca2iss),
	.ack_in2_o(ack_pca2alu),
	.req_out_o(req_j_pca)	
);



endmodule
