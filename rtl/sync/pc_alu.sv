module pc_alu(
	//control signal
	input  logic 		req_i,
	input  logic 		rst_ni,

	//From Issue
	input  logic [31:0] operand_a_i,
	input  logic [31:0] operand_b_i,
	input  logic 		branch_bool_i,

	//From ALU
	input  logic [31:0] op_bool_i, //boolean result of the comparaison

	//To IF
	output logic [31:0] pc_next_o
);

	always_ff @(posedge(req_i)) begin
		if(branch_bool_i & ~op_bool_i[31]) begin
			pc_next_o <= operand_a_i + 4;
		end
		else begin
			pc_next_o <= operand_a_i + operand_b_i;
		end
	end

endmodule
