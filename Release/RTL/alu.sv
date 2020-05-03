module alu (
	input  logic en_i,
	input  logic req_i,

	input  pkg::alu_op  operator_i, //TODO: modifier avec le package
	input  logic [31:0] op_a_i,
	input  logic [31:0] op_b_i,
	output logic [31:0] result_o
  );

	import pkg::*;

	logic [31:0] operand_a;
	logic [31:0] operand_b;
	pkg::alu_op  operateur;

	always_ff @(posedge(en_i)) begin
		if(req_i) begin
			operand_a <= op_a_i;
			operand_b <= op_b_i;
			operateur <= operator_i;
		end
	end
	
	logic [32:0] shift_a_ext;
	logic signed [32:0] result_signed;
	logic [32:0] result_ext;

	always_comb begin
		unique case (operateur)
			ADD: begin
				result_o = $signed(operand_a) + $signed(operand_b);
			end

			SUB: begin
				result_o = $signed(operand_a) - $signed(operand_b);
			end

			SRA: begin
				result_o = $signed($signed(operand_a) >> $signed(operand_b));
			end

			SRL: begin //TODO

				shift_a_ext = {operand_a[31],operand_a}; //on duplique le msb de a si arithmetique


				result_signed = $signed(shift_a_ext) >>> operand_b[4:0];
				result_ext = $unsigned(result_signed);

				result_o = result_ext[31:0];
			end

			SLL: begin
				result_o = $unsigned(operand_a) << $unsigned(operand_b);
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
				result_o = $signed(operand_a) < $signed(operand_b);
			 end
			 
			 SLTU, LTU: begin
				result_o = $unsigned(operand_a) < $unsigned(operand_b);
			 end

			 GE: begin
				result_o = $signed(operand_a) >= $signed(operand_b);
			 end
			 
			 GEU: begin
 				result_o = $unsigned(operand_a) >= $unsigned(operand_b);
 			 end
 			 
			 EQ: begin
				result_o = $unsigned(operand_a) == $unsigned(operand_b);
			 end

			 NE: begin
				result_o = $unsigned(operand_a) != $unsigned(operand_b);
			 end
		endcase
	end

endmodule
