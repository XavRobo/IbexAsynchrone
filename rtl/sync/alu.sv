module alu (
	input logic req_i,
	input logic rest_ni,

	input  pkg::alu_op  operator_i, //TODO: modifier avec le package
	input  logic [31:0] op_a_i,
	input  logic [31:0] op_b_i,
	output logic [31:0] result_o
  );

	import alu_pkg::*;

	logic [31:0] operand_a;
	logic [31:0] operand_b;
	pkg::alu_op  operateur;

	always_ff @(posedge(req_i)) begin
	operand_a <= op_a_i;
	operand_b <= op_b_i;
	operateur <= operator_i;
	end

	always_comb begin
		unique case (operateur) begin
			ADD: begin
				result_o = $signed(operand_a) + $signed(operand_b);
			end

			SUB: begin
				result_o = $signed(operand_a) - $signed(operand_b);
			end

			SRA: begin
				result_o = $signed(operand_a) >> operand_b;
			end

			SRL: begin
				result_o = $unsigned(operand_a) >> operand_b;
			end

			SLL: begin
				result_o = $unsigned(operand_a) << operand_b;
			end

			XOR: begin
				result_o = $unsigned(operand_a) ^ $unsigned(operand_b);
			end

			OR: begin
				result_o = $unsigned(operand_a) | $unsigned(operand_b);
			end

			AND: begin
				result_o = $unsigned(operand_a) & $unsigned(operand_b);
			end

			 SLT, LT: begin
				result_o[31] = $signed(operand_a) < $signed(operand_b);
			 end
			 
			 SLTU, LTU: begin
				result_o[31] = $unsigned(operand_a) < $unsigned(operand_b);
			 end

			 GE: begin
				result_o[31] = $signed(operand_a) >= $signed(operand_b);
			 end
			 
			 GEU: begin
 				result_o[31] = $unsigned(operand_a) >= $unsigned(operand_b);
 			 end
 			 
			 EQ: begin
				result_o[31] = $unsigned(operand_a) == $unsigned(operand_b);
			 end

			 NE: begin
				result_o[31] = $unsigned(operand_a) != $unsigned(operand_b);
			 end
		end
	end

endmodule
