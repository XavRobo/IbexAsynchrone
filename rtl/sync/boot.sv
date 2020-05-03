module boot(
	//control signal
	input  logic        en_i,

	output logic [31:0] boot_addr_o, 
	
	input  logic [31:0] boot_addr_i
);

always_ff @(posedge(en_i)) begin
	boot_addr_o <= boot_addr_i;
end

endmodule
