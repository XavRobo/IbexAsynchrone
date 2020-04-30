//Written by Xavier Lesage

/*
* Load and Store Unit
* TODO: gestion des reset 
*/

module load_store_unit(
	// control signal
	input  logic rst_ni,

	// lsu/ mem interface
	output logic 		lsu2mem_req_o,
	output logic 		lsu2mem_ack_o,

	input  logic 		mem2lsu_req_i,
	input  logic 		mem2lsu_ack_i,

	output logic [31:0] data_addr_o,
	output logic        data_we_o,
	output logic [31:0] data_wdata_o,
	input  logic [31:0] data_rdata_i,
	input  logic [31:0] data_err_i,	

	// lsu / next interface
	output logic 		lsu2next_req_o,
	output logic 		lsu2next_ack_o,

	input  logic 		next2lsu_req_i,
	input  logic 		next2lsu_ack_i,

	input  logic [31:0]	lsu_addr_i,
	input  logic 		lsu_we_i,
	input  logic [31:0] lsu_wdata_i,
	output logic [31:0] lsu_rdata_o,
	output logic [31:0] lsu_err_o
		
);

//Gestion de la requete du block next pour un acces en memoire (a)
//step 2 next2lsu and step 1 lsu2mem
always_ff @(posedge(next2lsu_req_i)) begin
	data_addr_o    <= lsu_addr_i;
	data_we_o 	   <= lsu_we_i;
	data_wdata_o   <= lsu_wdata_i;
	lsu2next_ack_o <= 1'b1;
	lsu2mem_req_o  <= 1'b1;
end

//step 4 next2lsu
always_ff @(negedge(next2lsu_req_i)) begin
	lsu2next_ack_o <= 1'b0;
end

//demande acces memoire du controleur (b)
//setp 3 lsu2mem (Invalidate)
always_ff @(posedge(mem2lsu_ack_i)) begin
	data_addr_o    <= 0;
	data_we_o 	   <= 0;
	data_wdata_o   <= 0;
	lsu2mem_req_o  <= 1'b0;
end

//memoire envoie une requete avec la valeur charger dans les registres (c)
//Step 2 mem2lsu et step 1 lsu2next
always_ff @(posedge(mem2lsu_req_i)) begin
	lsu_rdata_o    <= data_rdata_i;
	lsu_err_o      <= data_err_i;
	lsu2mem_ack_o  <= 1'b1;
	lsu2next_req_o <= 1'b1;
end

//step 4 mem2lsu
always_ff @(negedge(mem2lsu_req_i)) begin
	lsu2mem_ack_o  <= 1'b0;
end

//setp 3 lsu2next (Invalidate)
always_ff @(posedge(next2lsu_ack_i)) begin
	lsu_rdata_o    <= 0;
	lsu_err_o      <= 0;
	lsu2next_req_o <= 1'b0;
end

endmodule
