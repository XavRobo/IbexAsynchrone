module async_controler(
	input  logic rst_ni
	
);

controler ctl_ife (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_asypca),
	.ack_out_i(ack_dec2ife),

	.req_out_o(req_ife2dec),
	.ack_in_o(ack_j_asypca)	
);

controler ctl_dec (
	.rst_ni(rst_ni), 

	.req_in_i(req_ife2dec),
	.ack_out_i(ack_f_fiss),

	.req_out_o(req_f_fiss),
	.ack_in_o(ack_dec2ife)	
);

controler ctl_rfr (
	.rst_ni(rst_ni), 

	.req_in_i(req_f_rfrpcs),
	.ack_out_i(ack_j_rfrpcs),

	.req_out_o(req_j_rfrpcs),
	.ack_in_o(ack_f_rfrpcs)	
);

controler ctl_pcs (
	.rst_ni(rst_ni), 

	.req_in_i(req_f_rfrpcs),
	.ack_out_i(ack_j_rfrpcs),

	.req_out_o(req_j_rfrpcs),
	.ack_in_o(ack_f_rfrpcs)	
);

controler ctl_iss (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_fiss),
	.ack_out_i(ack_f_a),

	.req_out_o(req_f_a),
	.ack_in_o(ack_j_fiss)	
);

controler ctl_alu (
	.rst_ni(rst_ni), 

	.req_in_i(req_f_falu),
	.ack_out_i(ack_f_b),

	.req_out_o(req_f_b),
	.ack_in_o(ack_f_falu)	
);

controler ctl_lsu (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_flsu),
	.ack_out_i(ack_j_a),

	.req_out_o(req_j_a),
	.ack_in_o(ack_j_flsu)	
);

controler ctl_pca (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_fpca),
	.ack_out_i(ack_j_asypca),

	.req_out_o(req_j_asypca),
	.ack_in_o(ack_j_fpca)	
);

controler ctl_alu (
	.rst_ni(rst_ni), 

	.req_in_i(req_j_frfw),
	.ack_out_i(req_moa),

	.req_out_o(req_moa),
	.ack_in_o(ack_j_frfw)	
);

endmodule
