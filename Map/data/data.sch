EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 18
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
S 2300 2700 750  200 
U 5EAC7CD9
F0 "Decode" 50
F1 "Block.sch" 50
F2 "req_in" I L 2300 2800 50 
F3 "req_out" O R 3050 2800 50 
$EndSheet
$Sheet
S 4050 2200 750  200 
U 5EAC8282
F0 "RF r" 50
F1 "Block.sch" 50
F2 "req_in" I L 4050 2300 50 
F3 "req_out" O R 4800 2300 50 
$EndSheet
$Sheet
S 4050 2600 750  200 
U 5EAC82B1
F0 "PC/CSR" 50
F1 "Block.sch" 50
F2 "req_in" I L 4050 2700 50 
F3 "req_out" O R 4800 2700 50 
$EndSheet
$Sheet
S 5850 2700 750  200 
U 5EAC8327
F0 "Issue" 50
F1 "Block.sch" 50
F2 "req_in" I L 5850 2800 50 
F3 "req_out" O R 6600 2800 50 
$EndSheet
$Sheet
S 10050 2400 750  200 
U 5EAC837E
F0 "LSU" 50
F1 "Block.sch" 50
F2 "req_in" I L 10050 2500 50 
F3 "req_out" O R 10800 2500 50 
$EndSheet
$Sheet
S 7550 2350 750  200 
U 5EAC83C0
F0 "ALU" 50
F1 "Block.sch" 50
F2 "req_in" I L 7550 2450 50 
F3 "req_out" O R 8300 2450 50 
$EndSheet
$Sheet
S 10850 3800 200  750 
U 5EAC83D2
F0 "RF w" 50
F1 "Block.sch" 50
F2 "req_in" I T 10950 3800 50 
F3 "req_out" O B 10950 4550 50 
$EndSheet
$Sheet
S 1500 2700 750  200 
U 5EAC8445
F0 "Fetch" 50
F1 "Block.sch" 50
F2 "req_in" I L 1500 2800 50 
F3 "req_out" O R 2250 2800 50 
$EndSheet
$Sheet
S 4300 4000 750  200 
U 5EAC8457
F0 "PC ALU" 50
F1 "Block.sch" 50
F2 "req_in" I R 5050 4100 50 
F3 "req_out" O L 4300 4100 50 
$EndSheet
Wire Wire Line
	2250 2800 2300 2800
Wire Wire Line
	3050 2800 3100 2800
NoConn ~ 10950 4650
Wire Wire Line
	10950 4550 10950 4650
Wire Wire Line
	1450 2800 1500 2800
Text GLabel 550  2350 1    50   Input ~ 0
rst
Text Label 10950 4650 3    50   ~ 0
req_moa
$Sheet
S 650  2700 800  200 
U 5EAD46D6
F0 "j_ife" 50
F1 "Join2.sch" 50
F2 "req_out" O R 1450 2800 50 
F3 "req_in1" I L 650 2750 50 
F4 "req_in2" I L 650 2850 50 
$EndSheet
Wire Wire Line
	650  2750 550  2750
Wire Wire Line
	550  2350 550  2750
Wire Wire Line
	550  4100 550  2850
Wire Wire Line
	550  2850 650  2850
Wire Wire Line
	550  4100 4300 4100
$Sheet
S 5050 2650 700  300 
U 5EAD7F5E
F0 "j_iss" 50
F1 "Join3.sch" 50
F2 "req_out" O R 5750 2800 50 
F3 "req_in1" I L 5050 2700 50 
F4 "req_in2" I L 5050 2800 50 
F5 "req_in3" I L 5050 2900 50 
$EndSheet
$Sheet
S 3100 2650 700  300 
U 5EAD914F
F0 "f_dec" 50
F1 "fork3.sch" 50
F2 "req_in" I L 3100 2800 50 
F3 "req_out1" O R 3800 2900 50 
F4 "req_out2" O R 3800 2800 50 
F5 "req_out3" O R 3800 2700 50 
$EndSheet
$Sheet
S 8350 2300 700  300 
U 5EAD99A9
F0 "f_alu" 50
F1 "fork3.sch" 50
F2 "req_in" I L 8350 2450 50 
F3 "req_out1" O R 9050 2550 50 
F4 "req_out2" O R 9050 2450 50 
F5 "req_out3" O R 9050 2350 50 
$EndSheet
$Sheet
S 6650 2600 800  450 
U 5EADA059
F0 "f_iss" 50
F1 "fork4.sch" 50
F2 "req_in" I L 6650 2800 50 
F3 "req_out1" O R 7450 2850 50 
F4 "req_out2" O R 7450 2750 50 
F5 "req_out3" O R 7450 2650 50 
F6 "req_out4" O R 7450 2950 50 
$EndSheet
$Sheet
S 10800 3050 300  700 
U 5EADC794
F0 "j_rfw" 50
F1 "Join3.sch" 50
F2 "req_out" O B 10950 3750 50 
F3 "req_in1" I T 11050 3050 50 
F4 "req_in2" I T 10950 3050 50 
F5 "req_in3" I T 10850 3050 50 
$EndSheet
Wire Wire Line
	5750 2800 5850 2800
Wire Wire Line
	5050 2900 3800 2900
Wire Wire Line
	3800 2800 4000 2800
Wire Wire Line
	4000 2800 4000 2700
Wire Wire Line
	4000 2700 4050 2700
Wire Wire Line
	4800 2700 4850 2700
Wire Wire Line
	4850 2700 4850 2800
Wire Wire Line
	4850 2800 5050 2800
Wire Wire Line
	4050 2300 3950 2300
Wire Wire Line
	3950 2300 3950 2700
Wire Wire Line
	3950 2700 3800 2700
Wire Wire Line
	4800 2300 4900 2300
Wire Wire Line
	4900 2300 4900 2700
Wire Wire Line
	6650 2800 6600 2800
$Sheet
S 5150 4000 800  200 
U 5EAEC621
F0 "j_pca" 50
F1 "Join2.sch" 50
F2 "req_out" O L 5150 4100 50 
F3 "req_in1" I R 5950 4150 50 
F4 "req_in2" I R 5950 4050 50 
$EndSheet
Wire Wire Line
	5150 4100 5050 4100
Wire Wire Line
	7450 2950 7500 2950
Wire Wire Line
	7500 2950 7500 4050
Wire Wire Line
	7500 4050 5950 4050
$Sheet
S 9200 2400 800  200 
U 5EAEE0FE
F0 "j_lsu" 50
F1 "Join2.sch" 50
F2 "req_out" O R 10000 2500 50 
F3 "req_in1" I L 9200 2450 50 
F4 "req_in2" I L 9200 2550 50 
$EndSheet
Wire Wire Line
	7550 2450 7500 2450
Wire Wire Line
	7500 2450 7500 2650
Wire Wire Line
	7500 2650 7450 2650
Wire Wire Line
	9050 2550 9100 2550
Wire Wire Line
	9100 2550 9100 4150
Wire Wire Line
	9100 4150 5950 4150
Wire Wire Line
	9050 2450 9200 2450
Wire Wire Line
	9200 2550 9150 2550
Wire Wire Line
	9150 2550 9150 2750
Wire Wire Line
	9150 2750 7450 2750
Wire Wire Line
	10050 2500 10000 2500
Wire Wire Line
	7450 2850 10850 2850
Wire Wire Line
	10850 2850 10850 3050
Wire Wire Line
	10950 3050 10950 2500
Wire Wire Line
	10950 2500 10800 2500
Wire Wire Line
	11050 3050 11050 2350
Wire Wire Line
	11050 2350 9050 2350
Wire Wire Line
	10950 3750 10950 3800
Wire Wire Line
	8300 2450 8350 2450
Text Notes 2000 2600 0    50   ~ 0
req_ife2dec\n
Text Notes 1250 2600 0    50   ~ 0
req_j_ife\n
Text Notes 2850 2650 0    50   ~ 0
req_f_dec\n\n
Text Notes 3900 2650 2    50   ~ 0
req_dec2rfr\n
Text Notes 4250 2800 2    50   ~ 0
req_dec2pcs\n
Text Notes 4350 3000 2    50   ~ 0
req_dec2iss\n
Text Notes 5000 2200 3    50   ~ 0
req_rfr2iss
Text Notes 4850 2850 0    50   ~ 0
req_pcs2iss\n\n
Wire Wire Line
	4900 2700 5050 2700
Text Notes 5300 2850 0    50   ~ 0
req_j_iss
Text Notes 6350 2500 0    50   ~ 0
req_f_iss\n
Text Notes 7200 2200 0    50   ~ 0
req_iss2alu\n
Text Notes 7600 2800 0    50   ~ 0
req_iss2lsu\n\n
Text Notes 7950 2850 0    50   ~ 0
req_iss2rfw\n
Text Notes 6400 4050 0    50   ~ 0
req_iss2pca\n
Text Notes 8100 2150 0    50   ~ 0
req_f_alu\n
Text Notes 9550 2350 0    50   ~ 0
req_alu2rfw\n
Text Notes 8950 2450 0    50   ~ 0
req_alu2lsu\n
Text Notes 6900 4150 0    50   ~ 0
req_alu2pca
Text Notes 10950 3000 1    50   ~ 0
req_lsu2rfw\n
Text Notes 10700 4000 1    50   ~ 0
req_j_rfw\n
Text Notes 5300 3900 2    50   ~ 0
req_j_pca\n
Text Notes 4250 4100 2    50   ~ 0
req_pca2ife\n\n
Text Notes 550  2350 3    50   ~ 0
req_rst\n
Text Notes 9850 2750 0    50   ~ 0
req_j_lsu\n
NoConn ~ 3900 2500
$EndSCHEMATC
