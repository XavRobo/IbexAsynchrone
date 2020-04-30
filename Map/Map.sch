EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2500 2950 1400 1750
U 5EA7F076
F0 "Fetch" 50
F1 "IF.sch" 50
F2 "clk_i" I L 2500 3050 50 
F3 "rst_ni" I L 2500 3150 50 
F4 "instr_req_o" O L 2500 3300 50 
F5 "instr_addr_o" O L 2500 3400 50 
F6 "instr_gnt_i" I L 2500 3550 50 
F7 "instr_rvalid_i" I L 2500 3650 50 
F8 "instr_rdata_i" I L 2500 3750 50 
F9 "instr_err_i" I L 2500 3850 50 
F10 "boot_addr_i" I L 2500 4000 50 
F11 "req_i" I L 2500 4100 50 
F12 "instr_valid_id_o" O R 3900 3050 50 
F13 "instr_new_id_o" O R 3900 3150 50 
F14 "instr_rdata_id_o" O R 3900 3250 50 
F15 "instr_rdata_alu_id_o" O R 3900 3350 50 
F16 "instr_rdata_c_id_o" O R 3900 3450 50 
F17 "instr_is_compressed_id_o" O R 3900 3550 50 
F18 "instr_fetch_err_o" O R 3900 3650 50 
F19 "instr_fetch_err_plus2_o" O R 3900 3750 50 
F20 "illegal_c_insn_id_o" O R 3900 3850 50 
F21 "pc_if_o" O R 3900 4000 50 
F22 "pc_id_o" O R 3900 4100 50 
F23 "branch_target_ex_i" I L 2500 4250 50 
F24 "id_in_ready_i" I R 3900 4250 50 
F25 "if_busy_o" O R 3900 4350 50 
$EndSheet
$Sheet
S 1100 2950 1200 1750
U 5EA7F0EE
F0 "InstructionMemoire" 50
F1 "Imem.sch" 50
F2 "instr_req_i" I R 2300 3300 50 
F3 "instr_addr_i" I R 2300 3400 50 
F4 "instr_gnt_o" O R 2300 3550 50 
F5 "instr_rvalid_o" O R 2300 3650 50 
F6 "instr_rdata_o" O R 2300 3750 50 
F7 "instr_err_o" O R 2300 3850 50 
$EndSheet
$Sheet
S 4750 900  1650 1900
U 5EA7F157
F0 "ControlStatus" 50
F1 "CSR.sch" 50
$EndSheet
$Sheet
S 6600 2950 2250 1750
U 5EA7F189
F0 "LoadStore" 50
F1 "LSU.sch" 50
F2 "clk_i" I L 6600 3000 50 
F3 "rst_ni" I L 6600 3100 50 
F4 "data_req_o" O R 8850 3000 50 
F5 "data_gnt_i" I R 8850 3550 50 
F6 "data_rvalid_i" I R 8850 3650 50 
F7 "data_err_i" I R 8850 3750 50 
F8 "data_pmp_err_i" I R 8850 4000 50 
F9 "data_addr_o" O R 8850 3100 50 
F10 "data_we_o" O R 8850 3200 50 
F11 "data_be_o" O R 8850 3300 50 
F12 "data_wdata_o" O R 8850 3400 50 
F13 "data_rdata_i" O R 8850 3850 50 
F14 "lsu_we_i" I L 6600 3250 50 
F15 "lsu_type_i" I L 6600 3350 50 
F16 "lsu_wdata_i" I L 6600 3450 50 
F17 "lsu_sign_ext_i" I L 6600 3550 50 
F18 "lsu_rdata_o" O L 6600 3700 50 
F19 "lsu_rdata_valid_o" O L 6600 3800 50 
F20 "lsu_req_i" I L 6600 3900 50 
F21 "adder_result_ex_i" I L 6600 4050 50 
F22 "addr_incr_req_o" O L 6600 4150 50 
F23 "addr_last_o" O L 6600 4250 50 
F24 "lsu_req_done_o" O L 6600 4350 50 
F25 "lsu_resp_valid_o" O L 6600 4450 50 
$EndSheet
$Sheet
S 9100 2950 1200 1750
U 5EA7F1B3
F0 "DataMemoire" 50
F1 "Dmem.sch" 50
F2 "data_req_i" I L 9100 3000 50 
F3 "data_addr_i" I L 9100 3100 50 
F4 "data_we_i" I L 9100 3200 50 
F5 "data_be_i" I L 9100 3300 50 
F6 "data_wdata_i" I L 9100 3400 50 
F7 "data_gnt_o" O L 9100 3550 50 
F8 "data_rvalid_o" O L 9100 3650 50 
F9 "data_err_o" O L 9100 3750 50 
F10 "data_rdata_o" O L 9100 3850 50 
$EndSheet
Wire Wire Line
	8850 3000 9100 3000
Wire Wire Line
	8850 3100 9100 3100
Wire Wire Line
	8850 3200 9100 3200
Wire Wire Line
	8850 3300 9100 3300
Wire Wire Line
	8850 3400 9100 3400
Wire Wire Line
	9100 3550 8850 3550
Wire Wire Line
	9100 3650 8850 3650
Wire Wire Line
	9100 3750 8850 3750
Wire Wire Line
	9100 3850 8850 3850
Text Notes 2500 4900 0    50   ~ 0
Pour l'interface avec la memoire instruction comme la LSU mais plus simple car pas d'ecriture\n
Wire Wire Line
	2500 3300 2300 3300
Wire Wire Line
	2500 3400 2300 3400
Wire Wire Line
	2500 3550 2300 3550
Wire Wire Line
	2500 3650 2300 3650
Wire Wire Line
	2500 3750 2300 3750
Wire Wire Line
	2500 3850 2300 3850
Text Notes 1250 6500 0    50   ~ 0
    output logic                  instr_valid_id_o,         // instr in IF-ID is valid\n    output logic                  instr_new_id_o,           // instr in IF-ID is new\n    output logic [31:0]           instr_rdata_id_o,         // instr for ID stage\n    output logic [31:0]           instr_rdata_alu_id_o,     // replicated instr for ID stage\n                                                            // to reduce fan-out\n    output logic [15:0]           instr_rdata_c_id_o,       // compressed instr for ID stage\n                                                            // (mtval), meaningful only if\n                                                            // instr_is_compressed_id_o = 1'b1\n    output logic                  instr_is_compressed_id_o, // compressed decoder thinks this\n                                                            // is a compressed instr\n    output logic                  instr_fetch_err_o,        // bus error on fetch\n    output logic                  instr_fetch_err_plus2_o,  // bus error misaligned\n    output logic                  illegal_c_insn_id_o,      // compressed decoder thinks this\n                                                            // is an invalid instr\n    output logic [31:0]           pc_if_o,\n    output logic [31:0]           pc_id_o,
$Sheet
S 4750 2950 1650 1750
U 5EA81297
F0 "Decode/Execution" 50
F1 "IDEX.sch" 50
$EndSheet
$EndSCHEMATC
