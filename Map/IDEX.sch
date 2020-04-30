EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1500 1300 0    50   Input ~ 0
clk_i
Text HLabel 1500 1400 0    50   Input ~ 0
rst_ni
Text HLabel 1500 1550 0    50   Input ~ 0
fetch_enable_i
Text HLabel 1500 1650 0    50   Output ~ 0
ctrl_busy_o
Text HLabel 1500 1950 0    50   Input ~ 0
illegal_insn_i
Text HLabel 1500 2050 0    50   Input ~ 0
ecall_insn_i
Text HLabel 1500 2150 0    50   Input ~ 0
mret_insn_i
Text HLabel 1500 2250 0    50   Input ~ 0
dret_insn_i
Text HLabel 1500 2350 0    50   Input ~ 0
wfi_insn_i
Text HLabel 1500 2450 0    50   Input ~ 0
ebrk_insn_i
Text HLabel 1500 2550 0    50   Input ~ 0
csr_pipe_flush_i
Text Notes 950  1850 0    50   ~ 0
decoder related signals
Text Notes 1000 2750 0    50   ~ 0
from IF-ID pipeline stage
Text HLabel 1500 2850 0    50   Input ~ 0
instr_valid_i
Text HLabel 1500 2950 0    50   Input ~ 0
instr_i
Text HLabel 1500 3050 0    50   Input ~ 0
instr_compressed_i
Text HLabel 1500 3150 0    50   Input ~ 0
instr_is_compressed_i
Text HLabel 1500 3250 0    50   Input ~ 0
instr_fetch_err_i
Text HLabel 1500 3350 0    50   Input ~ 0
instr_fetch_err_plus2_i
Text HLabel 1500 3450 0    50   Input ~ 0
pc_id_i
Text Notes 1050 3650 0    50   ~ 0
to IF-ID pipeline stage
Text HLabel 1500 3750 0    50   Output ~ 0
instr_valid_clear_o
Text HLabel 1500 3850 0    50   Output ~ 0
id_in_ready_o
Text HLabel 1500 3950 0    50   Output ~ 0
controller_run_o
Text Notes 1100 4150 0    50   ~ 0
to prefetcher
Text HLabel 1500 4200 0    50   Output ~ 0
instr_req_o
Text HLabel 1500 4300 0    50   Output ~ 0
pc_set_o
Text HLabel 1500 4400 0    50   Output ~ 0
pc_mux_o
Text HLabel 1500 4500 0    50   Output ~ 0
exc_pc_mux_o
Text HLabel 1500 4600 0    50   Output ~ 0
exc_cause_o
Text Notes 1100 4750 0    50   ~ 0
LSU
Text HLabel 1500 4850 0    50   Input ~ 0
lsu_addr_last_i
Text HLabel 1500 4950 0    50   Input ~ 0
load_err_i
Text HLabel 1500 5050 0    50   Input ~ 0
store_err_i
Text HLabel 1500 5150 0    50   Output ~ 0
wb_exception_o
Text Notes 1100 5350 0    50   ~ 0
jump/branch signals
Text HLabel 1500 5400 0    50   Input ~ 0
branch_set_i
Text HLabel 1500 5500 0    50   Input ~ 0
jump_set_i
Text HLabel 1500 5700 0    50   Input ~ 0
csr_mstatus_mie_i
Text Notes 1100 5650 0    50   ~ 0
interrupt signals
Text HLabel 1500 5800 0    50   Input ~ 0
irq_pending_i
Text HLabel 1500 5900 0    50   Input ~ 0
irqs_i
Text HLabel 1500 6000 0    50   Input ~ 0
irq_nm_i
Text HLabel 1500 6100 0    50   Output ~ 0
nmi_mode_o
$EndSCHEMATC
