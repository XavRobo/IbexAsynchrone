module tbench_boot;

timeunit  1ns;
timeprecision 1ns;

logic enable, boot, branch_bool, op_bool;
logic [31:0]  operand_a, operand_b, pc_next;

pc_alu pca(
	.en_i(enable),
	.boot_i(boot),

	//From Issue
	.operand_a_i(operand_a),
	.operand_b_i(operand_b),
	.branch_bool_i(branch_bool),

	//From ALU
	.op_bool_i(op_bool), //boolean result of the comparaison

	//To IF or Issue
	.pc_next_o(pc_next)
);

	initial begin
		boot = 0; enable = 0; branch_bool = 0; op_bool = 0;
		#5 boot = 1;
		#1 boot = 0;

		#5
		operand_a = 1;
		operand_b = 32;
		#5 enable = 1;
	end

endmodule
