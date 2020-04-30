

module decode #(
	parameter bit RV32E = 0,
    parameter bit RV32M = 1,
    parameter bit RV32B = 0,
) (
	//control signal
	input  logic        req_i,
    input  logic        rst_ni,

    //from IF
    input  logic [31:0] instr_rdata_i,

    
);

	import pkg::*;

endmodule
