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
S 2850 1650 650  600 
U 5EA9965B
F0 "C1" 50
F1 "Mullers_gate.sch" 50
F2 "req_in" I L 2850 1750 50 
F3 "ack_in" I R 3500 2150 50 
F4 "req_o" O R 3500 1750 50 
$EndSheet
$Sheet
S 4200 1650 650  600 
U 5EA99702
F0 "C2" 50
F1 "Mullers_gate.sch" 50
F2 "req_in" I L 4200 1750 50 
F3 "ack_in" I R 4850 2150 50 
F4 "req_o" O R 4850 1750 50 
$EndSheet
$Sheet
S 6450 1650 650  600 
U 5EA9971B
F0 "C3" 50
F1 "Mullers_gate.sch" 50
F2 "req_in" I L 6450 1750 50 
F3 "ack_in" I R 7100 2150 50 
F4 "req_o" O R 7100 1750 50 
$EndSheet
$Sheet
S 4050 2750 1100 450 
U 5EA999FC
F0 "DM" 50
F1 "DataMem.sch" 50
F2 "data_addr_i" I L 4050 3100 50 
F3 "data_we_i" I L 4050 2900 50 
F4 "data_wdata_i" I L 4050 3000 50 
F5 "data_rdata_o" O R 5150 2900 50 
F6 "data_err_o" O R 5150 3000 50 
F7 "en" I L 4050 2800 50 
$EndSheet
Wire Wire Line
	3500 1750 3650 1750
Wire Wire Line
	4850 1750 5050 1750
Text GLabel 2450 1750 0    50   Input ~ 0
req_input
Wire Wire Line
	2450 1750 2850 1750
$Sheet
S 6450 2750 1150 450 
U 5EA99C84
F0 "lsu_out" 50
F1 "LSU_OUT.sch" 50
F2 "data_rdata_i" I L 6450 2900 50 
F3 "data_err_i" I L 6450 3000 50 
F4 "lsu_rdata_o" O R 7600 2900 50 
F5 "en" I L 6450 2800 50 
F6 "lsu_err_o" O R 7600 3000 50 
$EndSheet
Wire Wire Line
	5050 1750 5050 2500
Wire Wire Line
	5050 2500 4000 2500
Wire Wire Line
	3800 2500 3800 2150
Wire Wire Line
	3800 2150 3500 2150
Wire Wire Line
	5750 1750 6450 1750
Wire Wire Line
	7100 1750 7450 1750
Wire Wire Line
	7450 1750 7450 2550
Wire Wire Line
	7450 2550 6000 2550
Wire Wire Line
	6000 2550 6000 2150
Wire Wire Line
	3650 1750 3650 2500
Connection ~ 3650 1750
Wire Wire Line
	3650 1750 4200 1750
Text GLabel 2400 2500 0    50   Output ~ 0
ack_input
Wire Wire Line
	2400 2500 3650 2500
Wire Wire Line
	7450 1750 8250 1750
Connection ~ 7450 1750
Text GLabel 8250 1750 2    50   Output ~ 0
req_output
Text GLabel 8250 2150 2    50   Input ~ 0
ack_output
Wire Wire Line
	7100 2150 8250 2150
Text Label 3700 1750 0    50   ~ 0
data_req_o
Text Label 4100 2500 0    50   ~ 0
data_gnt_i
Text Label 5900 1750 0    50   ~ 0
data_rvalid_i
$Sheet
S 5250 1700 500  150 
U 5EA9BC78
F0 "D1" 50
F1 "Delay.sch" 50
F2 "I" I L 5250 1750 50 
F3 "O" O R 5750 1750 50 
$EndSheet
Wire Wire Line
	5050 1750 5250 1750
Connection ~ 5050 1750
Wire Wire Line
	4850 2150 6000 2150
$Sheet
S 2100 2750 1350 450 
U 5EA99C56
F0 "lsu_in" 50
F1 "LSU_in.sch" 50
F2 "data_addr_o" O R 3450 3100 50 
F3 "data_we_o" O R 3450 2900 50 
F4 "data_wdata_o" O R 3450 3000 50 
F5 "lsu_we_i" I L 2100 2900 50 
F6 "lsu_wdata_i" I L 2100 3000 50 
F7 "adder_result_ex_i" I L 2100 3100 50 
F8 "en" I L 2100 2800 50 
$EndSheet
Text Label 2500 1750 0    50   ~ 0
lsu_req_i
Text Label 2700 2500 0    50   ~ 0
lsu_resp_valid_o
Text Label 6300 2550 0    50   ~ 0
lsu_req_done_o
Wire Wire Line
	2100 2800 2000 2800
Wire Wire Line
	2000 2800 2000 2650
Wire Wire Line
	2000 2650 3650 2650
Wire Wire Line
	3650 2650 3650 2500
Connection ~ 3650 2500
Wire Wire Line
	4050 2800 4000 2800
Wire Wire Line
	4000 2800 4000 2500
Connection ~ 4000 2500
Wire Wire Line
	4000 2500 3800 2500
Wire Wire Line
	6450 2800 6000 2800
Wire Wire Line
	6000 2800 6000 2550
Connection ~ 6000 2550
Wire Wire Line
	3450 2900 4050 2900
Wire Wire Line
	3450 3000 4050 3000
Wire Wire Line
	3450 3100 4050 3100
Wire Wire Line
	5150 2900 6450 2900
Wire Wire Line
	5150 3000 6450 3000
$EndSCHEMATC
