//define constqnt used in core

package pkg;

unsigned int offset = 4'h8000;

typedef enum logic [4:0] {
	// Arithmetics
	 ADD,
	 SUB,

	// Logics
	 XOR,
	 OR,
	 AND,
	// RV32B
	/*
	 XNOR,
	 ORN,
	 ANDN,
	*/

	// Shifts
	 SRA,
	 SRL,
	 SLL,
	// RV32B
	/*
	 SRO,
	 SLO,
	 ROR,
	 ROL,
	 REV,
	 REV8,
	 ORCB,
	*/

	// Comparisons
	 LT,
	 LTU,
	 GE,
	 GEU,
	 EQ,
	 NE,
	// RV32B
	/*
	 MIN,
	 MINU,
	 MAX,
	 MAXU,
	*/

	/*
	// Pack
	// RV32B
	 PACK,
	 PACKU,
	 PACKH,


	// Bitcounting
	// RV32B
	 CLZ,
	 CTZ,
	 PCNT,

	// Set lower than
	 SLT,
	 SLTU,

	// Ternary Bitmanip Operations
	// RV32B
	 CMOV,
	 CMIX,
	 FSL,
	 FSR,

	// Single-Bit Operations
	// RV32B
	 SBSET,
	 SBCLR,
	 SBINV,
	 SBEXT
	*/
}  alu_op;

typedef enum logic [1:0] {
	JAL,
	JALR,
	BRANCH,
} pc_op;

typedef enum logic [6:0] {
	OPCODE_LOAD     = 7'h03,
	OPCODE_MISC_MEM = 7'h0f,
	OPCODE_OP_IMM   = 7'h13,
	OPCODE_AUIPC    = 7'h17, //PC ALU
	OPCODE_STORE    = 7'h23,
	OPCODE_OP       = 7'h33,
	OPCODE_LUI      = 7'h37,
	OPCODE_BRANCH   = 7'h63, //PC ALU
	OPCODE_JALR     = 7'h67, //PC ALU
	OPCODE_JAL      = 7'h6f, //PC ALU
	OPCODE_SYSTEM   = 7'h73
} opcode;

// Regfile write data selection
//used with CSR
/*
typedef enum logic {
  RF_WD_EX,
  RF_WD_CSR
} rf_wd_sel_e;
*/

typedef enum logic [1:0] {
	OP_A_REG,
	OP_A_IMM,
	OP_A_CURRPC
} op_a_sel;

typedef enum logic {
	OP_B_REG,
	OP_B_IMM,
} op_b_sel;

typedef enum logic [2:0] {
	IMM_B_I, 
	IMM_B_S,
	IMM_B_B,
	IMM_B_U, //upper
	IMM_B_J, //jump
	IMM_B_O, //offset (boot address)
	IMM_B_N  //incr (length(instr)=4)
} imm_b_sel;

endpackage
