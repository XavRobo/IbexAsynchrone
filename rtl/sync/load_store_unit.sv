//Modification of ibex_load_store_unit.sv
//written by Xavier Lesage

/*
* Load and Store Unit
* TODO: gestion des reset
* TODO: gestion des demi-mots et byte 
*/

module load_store_unit(
	// control signal
	input  logic pulse, //entre pour la clk ou controleur
	input  logic rst_ni,

	// lsu/ mem interface
	output logic         data_req_o,
    input  logic         data_gnt_i,
    input  logic         data_rvalid_i,
    input  logic         data_err_i,
    //input  logic         data_pmp_err_i,

    output logic [31:0]  data_addr_o,
    output logic         data_we_o,
    //output logic [3:0]   data_be_o,
    output logic [31:0]  data_wdata_o,
    input  logic [31:0]  data_rdata_i,

	 // signals to/from ID/EX stage
    input  logic         lsu_we_i,             // write enable                     -> from ID/EX
    //input  logic [1:0]   lsu_type_i,           // data type: word, half word, byte -> from ID/EX
    input  logic [31:0]  lsu_wdata_i,          // data to write to memory          -> from ID/EX
    //input  logic         lsu_sign_ext_i,       // sign extension                   -> from ID/EX

    output logic [31:0]  lsu_rdata_o,          // requested data                   -> to ID/EX
    //output logic         lsu_rdata_valid_o,
    //input  logic         lsu_req_i,            // data request                     -> from ID/EX

    input  logic [31:0]  adder_result_ex_i,    // address computed in ALU          -> from ID/EX

    //output logic         addr_incr_req_o,      // request address increment for
                                               // misaligned accesses              -> to ID/EX
    //output logic [31:0]  addr_last_o,          // address of last transaction      -> to controller
                                               // -> mtval
                                               // -> AGU for misaligned accesses

    output logic         lsu_req_done_o,       // Signals that data request is complete
                                               // (only need to await final data
                                               // response)                        -> to ID/EX

    output logic         lsu_resp_valid_o,     // LSU has response from transaction -> to ID/EX
		
);

logic lsu_busy = 0;

always_ff @(posedge(pulse)) begin
	data_req_o = 1'b1;
	
end 

endmodule
