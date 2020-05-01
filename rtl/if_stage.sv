//Written Xavier Lesage

module if_stage(
	// control signal
	input  logic req_i,
	input  logic rst_ni,

	// lsu/ mem interface
	output logic 		instr_req_o,
	output logic [31:0]	instr_addr_o,
	
	input  logic 		instr_gnt_i,
	input  logic 		instr_rvalid_i,
	input  logic [31:0] instr_rdata_i,
	input  logic 		instr_err_i,

	// IF / ID Interface
	output logic [31:0]	masortie_o,
	input  logic [31:0] monaddr_i	
);

reg [31:0] mon_pc;

//FSM

typedef enum logic [1:0]  {
    IDLE, WAIT_GNT, WAIT_VALID, COMPUTING_PC
} ls_fsm_e;

ls_fsm_e ls_state=IDLE;

always_ff @(req_i, instr_gnt_i, instr_rvalid_i) begin
	unique case(ls_state) begin
		IDLE: begin	
			if(req_i)begin
				ls_state 	 <= WAIT_GNT;
				instr_req_o  <= 1'b1;
				instr_addr_o <= monaddr_i;
			end
			else begin
				ls_state	 <= IDLE;
			end
		end
		
		WAIT_GNT: begin
			if(instr_gnt_i)begin
				ls_state 	 <= WAIT_VALID;
				instr_req_o  <= 1'b0;
			end
			else begin
				ls_state 	 <= WAIT_GNT;
			end
		end
		
		WAIT_VALID: begin
			if(instr_rvalid_i)begin
				ls_state 	 <= IDLE;
				masortie_o   <= instr_rdata_i;
			end
			else begin
				ls_state 	 <= WAIT_VALID;
			end
		end
	end
end

endmodule
