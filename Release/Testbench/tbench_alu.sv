//OUTDATED avec l'ajout des controleurs asynchrone
// I / O plus correspondant, signal enable

module tbench_alu;

	timeunit  1ns;
	timeprecision 1ns;

	import pkg::*;

	logic req;
	logic rst;
	pkg::alu_op operateur;
	logic [31:0] operand_a;
	logic [31:0] operand_b;
	logic [31:0] resultat;
	
	alu alucard(
		.req_i(req),
		.rst_ni(rst),

		.operator_i(operateur),
		.op_a_i(operand_a),
		.op_b_i(operand_b),
		.result_o(resultat)
	);

	initial begin
		#5 req = 0;
		operateur = ADD;
		operand_a = 32'b00000000000000000000000000000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = SUB;
		operand_a = 32'b00000000000000000000000001000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = SUB;
		operand_a = 32'b00000000000000000000000000000000;
		operand_b = 32'b00000000000000000000000100000000;
		#5 req = 1;

		#5 req = 0;
		operateur = SRA;
		operand_a = 32'b10000000000000000000000000000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = SRL;
		operand_a = 32'b10000000000000000000000000000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = SLL;
		operand_a = 32'b00000000000001000000000000000000;
		operand_b = 32'b00000000000000000000000000000010;
		#5 req = 1;

		#5 req = 0;
		operateur = XOR;
		operand_a = 32'b00000000000010000000000000000001;
		operand_b = 32'b00000000000000010000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = OR;
		operand_a = 32'b00000000000001000000000000000001;
		operand_b = 32'b00000000000000010000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = AND;
		operand_a = 32'b00000000000000100000000000000001;
		operand_b = 32'b00000000000000010000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = LT;
		operand_a = 32'b00000000000000000000100000000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = LT;
		operand_b = 32'b00000000000000000000100000000000;
		operand_a = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = LTU;
		operand_a = 32'b00000000000000000100000000000000;
		operand_b = 32'b10000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = LTU;
		operand_b = 32'b00000000000000000100000000000000;
		operand_a = 32'b10000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = GE;
		operand_a = 32'b00000000000000000000100000000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = GE;
		operand_b = 32'b00000000000000000000100000000000;
		operand_a = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = GEU;
		operand_a = 32'b00000000000000000000000000000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = EQ;
		operand_a = 32'b00000000000000000000000000000001;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = EQ;
		operand_a = 32'b0000000000000000000000000000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operateur = NE;
		operand_a = 32'b00000000000000000000000000000000;
		operand_b = 32'b00000000000000000000000000000001;
		#5 req = 1;
    end

endmodule
