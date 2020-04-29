//Modification of ibex_register_file_latch.sv
//Written by Xavier Lesage

module register_file #(
	parameter int unsigned DataWidth = 32	
) (
	//control signal
	input  logic req_ra_i,
	input  logic req_rb_i,
	input  logic req_w,

	//Read port R1
    input  logic [4:0]           raddr_a_i,
    output logic [DataWidth-1:0] rdata_a_o,

    //Read port R2
    input  logic [4:0]           raddr_b_i,
    output logic [DataWidth-1:0] rdata_b_o,

    // Write port W1
    input  logic [4:0]           waddr_a_i,
    input  logic [DataWidth-1:0] wdata_a_i,
);

	//de quoi calculer les positions des registres
	localparam int unsigned ADDR_WIDTH = 5;
	localparam int unsigned NUM_WORDS  = 2**ADDR_WIDTH;

	logic [DataWidth-1:0] mem[NUM_WORDS];

	// internal addresses
	logic [ADDR_WIDTH-1:0] raddr_a_int, raddr_b_int, waddr_a_int;

	assign raddr_a_int = raddr_a_i[ADDR_WIDTH-1:0];
	assign raddr_b_int = raddr_b_i[ADDR_WIDTH-1:0];
	assign waddr_a_int = waddr_a_i[ADDR_WIDTH-1:0];

	//////////
	// READ //
	//////////

	always_ff @(posedge(req_ra_i)) begin
		rdata_a_o <= mem[raddr_a_int];
	end

	always_ff @(posedge(req_rb_i)) begin
		rdata_b_o <= mem[raddr_b_int];
	end

	///////////
	// WRITE //
	///////////

	//TODO: Ecriture dans les registres
	// un essai simpliste
	always_ff @(posedge(req_ra_i)) begin
		mem[waddr_a_int] <= wdata_a_i;
	end	

endmodule
