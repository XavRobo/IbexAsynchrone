module pc_alu(
	//control signal
	input  logic 		en_i,
	input  logic 		boot_i,

	//From Issue
	input  logic [31:0] operand_a_i,
	input  logic [31:0] operand_b_i,
	input  logic 		branch_bool_i,

	//From ALU
	input  logic [31:0] op_bool_i, //boolean result of the comparaison

	//To IF or Issue
	output logic [31:0] pc_next_o
);

	import pkg::*;

	always_ff @(posedge(en_i)) begin
		if(branch_bool_i & ~op_bool_i[0]) begin
			pc_next_o <= operand_a_i + 4;
		end
		else begin
			pc_next_o <= operand_a_i + operand_b_i;
		end
	end

	always_ff @(posedge(boot_i)) begin
		pc_next_o <= offset;
	end

endmodule
