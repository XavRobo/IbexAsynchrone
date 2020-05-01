module tbench_alu;

	timeunit  1ns;
	timeprecision 1ns;

	import pkg::*;

	logic req;
	logic rst;
	
	logic [31:0] operand_a;
	logic [31:0] operand_b;
	logic branch_bool;
	logic [31:0] op_bool;

	logic [31:0] resultat;
	
	pc_alu alucard(
		.req_i(req),
		.rst_ni(rst),

		.operand_a_i(operand_a),
		.operand_b_i(operand_b),
		.branch_bool_i(branch_bool),
		.op_bool_i(op_bool),
		.pc_next_o(resultat)
	);

	initial begin
		#5 req = 0;
		operand_a = 32'b00000000000000000000000001111111;
		operand_b = 32'b00000000000000000000000000000001;
		branch_bool = 1;
		op_bool = 32'b00000000000000000000000000000000;
		#5 req = 1;

		#5 req = 0;
		operand_a = 32'b00000000000000000000000111111111;
		operand_b = 32'b00000000000000000000000000000001;
		branch_bool = 1;
		op_bool = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operand_a = 32'b00000000000000000000000111111111;
		operand_b = 32'b00000000000000000000000000000001;
		branch_bool = 0;
		op_bool = 32'b00000000000000000000000000000001;
		#5 req = 1;

		#5 req = 0;
		operand_a = 32'b00000000000000000000000111111111;
		operand_b = 32'b00000000000000000000000000000001;
		branch_bool = 0;
		op_bool = 32'b00000000000000000000000000000000;
		#5 req = 1;
    end

endmodule
