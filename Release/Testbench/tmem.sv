module tmem(
	//control signal
	input  logic 		req_i,

	input  logic 	    data_we_i,
	input  logic [31:0] data_wdata_i,
	input  logic [31:0] data_addr_i,

	output logic [31:0] data_rdata_o
);

reg [31:0] mem [7999:0];

always_ff @(posedge(req_i)) begin
	if(data_we_i) begin
		mem[data_addr_i] <= data_wdata_i;
	end
	else begin
		data_rdata_o <= mem[data_addr_i];
	end
end
endmodule
