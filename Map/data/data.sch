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
S 1700 1500 750  200 
U 5EAC7CD9
F0 "Decode" 50
F1 "Block.sch" 50
F2 "req_in" I L 1700 1600 50 
F3 "req_out" O R 2450 1600 50 
$EndSheet
$Sheet
S 3450 1000 750  200 
U 5EAC8282
F0 "RF r" 50
F1 "Block.sch" 50
F2 "req_in" I L 3450 1100 50 
F3 "req_out" O R 4200 1100 50 
$EndSheet
$Sheet
S 5250 1500 750  200 
U 5EAC8327
F0 "Issue" 50
F1 "Block.sch" 50
F2 "req_in" I L 5250 1600 50 
F3 "req_out" O R 6000 1600 50 
$EndSheet
$Sheet
S 9450 1200 750  200 
U 5EAC837E
F0 "LSU" 50
F1 "Block.sch" 50
F2 "req_in" I L 9450 1300 50 
F3 "req_out" O R 10200 1300 50 
$EndSheet
$Sheet
S 6950 1150 750  200 
U 5EAC83C0
F0 "ALU" 50
F1 "Block.sch" 50
F2 "req_in" I L 6950 1250 50 
F3 "req_out" O R 7700 1250 50 
$EndSheet
$Sheet
S 10250 2600 200  750 
U 5EAC83D2
F0 "RF w" 50
F1 "Block.sch" 50
F2 "req_in" I T 10350 2600 50 
F3 "req_out" O B 10350 3350 50 
$EndSheet
$Sheet
S 900  1500 750  200 
U 5EAC8445
F0 "Fetch" 50
F1 "Block.sch" 50
F2 "req_in" I L 900 1600 50 
F3 "req_out" O R 1650 1600 50 
$EndSheet
$Sheet
S 4700 2800 750  200 
U 5EAC8457
F0 "PC ALU" 50
F1 "Block.sch" 50
F2 "req_in" I R 5450 2900 50 
F3 "req_out" O L 4700 2900 50 
$EndSheet
Wire Wire Line
	1650 1600 1700 1600
Wire Wire Line
	2450 1600 2500 1600
NoConn ~ 10350 3450
Wire Wire Line
	10350 3350 10350 3450
Wire Wire Line
	850  1600 900  1600
Text Label 10350 3450 3    50   ~ 0
req_moa
$Sheet
S 4450 1450 700  300 
U 5EAD7F5E
F0 "j_iss" 50
F1 "Join3.sch" 50
F2 "req_out" O R 5150 1600 50 
F3 "req_in1" I L 4450 1500 50 
F4 "req_in2" I L 4450 1600 50 
F5 "req_in3" I L 4450 1700 50 
$EndSheet
$Sheet
S 7750 1100 700  300 
U 5EAD99A9
F0 "f_alu" 50
F1 "fork3.sch" 50
F2 "req_in" I L 7750 1250 50 
F3 "req_out1" O R 8450 1350 50 
F4 "req_out2" O R 8450 1250 50 
F5 "req_out3" O R 8450 1150 50 
$EndSheet
$Sheet
S 6050 1400 800  450 
U 5EADA059
F0 "f_iss" 50
F1 "fork4.sch" 50
F2 "req_in" I L 6050 1600 50 
F3 "req_out1" O R 6850 1650 50 
F4 "req_out2" O R 6850 1550 50 
F5 "req_out3" O R 6850 1450 50 
F6 "req_out4" O R 6850 1750 50 
$EndSheet
$Sheet
S 10200 1850 300  700 
U 5EADC794
F0 "j_rfw" 50
F1 "Join3.sch" 50
F2 "req_out" O B 10350 2550 50 
F3 "req_in1" I T 10450 1850 50 
F4 "req_in2" I T 10350 1850 50 
F5 "req_in3" I T 10250 1850 50 
$EndSheet
Wire Wire Line
	5150 1600 5250 1600
Wire Wire Line
	4450 1700 3200 1700
Wire Wire Line
	4250 1600 4450 1600
Wire Wire Line
	3450 1100 3350 1100
Wire Wire Line
	3350 1100 3350 1500
Wire Wire Line
	3350 1500 3200 1500
Wire Wire Line
	4200 1100 4300 1100
Wire Wire Line
	4300 1100 4300 1500
Wire Wire Line
	6050 1600 6000 1600
$Sheet
S 5550 2800 800  200 
U 5EAEC621
F0 "j_pca" 50
F1 "Join2.sch" 50
F2 "req_out" O L 5550 2900 50 
F3 "req_in1" I R 6350 2950 50 
F4 "req_in2" I R 6350 2850 50 
$EndSheet
Wire Wire Line
	5550 2900 5450 2900
Wire Wire Line
	6850 1750 6900 1750
Wire Wire Line
	6900 1750 6900 2850
$Sheet
S 8600 1200 800  200 
U 5EAEE0FE
F0 "j_lsu" 50
F1 "Join2.sch" 50
F2 "req_out" O R 9400 1300 50 
F3 "req_in1" I L 8600 1250 50 
F4 "req_in2" I L 8600 1350 50 
$EndSheet
Wire Wire Line
	6950 1250 6900 1250
Wire Wire Line
	6900 1250 6900 1450
Wire Wire Line
	6900 1450 6850 1450
Wire Wire Line
	8450 1350 8500 1350
Wire Wire Line
	8500 1350 8500 2950
Wire Wire Line
	8450 1250 8600 1250
Wire Wire Line
	8600 1350 8550 1350
Wire Wire Line
	8550 1350 8550 1550
Wire Wire Line
	8550 1550 6850 1550
Wire Wire Line
	9450 1300 9400 1300
Wire Wire Line
	6850 1650 10250 1650
Wire Wire Line
	10250 1650 10250 1850
Wire Wire Line
	10350 1850 10350 1300
Wire Wire Line
	10350 1300 10200 1300
Wire Wire Line
	10450 1850 10450 1150
Wire Wire Line
	10450 1150 8450 1150
Wire Wire Line
	10350 2550 10350 2600
Wire Wire Line
	7700 1250 7750 1250
Text Notes 1400 1400 0    50   ~ 0
req_ife2dec\n
Text Notes 2250 1450 0    50   ~ 0
req_f_dec\n\n
Text Notes 4050 1800 2    50   ~ 0
req_dec2iss\n
Text Notes 4400 1000 3    50   ~ 0
req_rfr2iss
Wire Wire Line
	4300 1500 4450 1500
Text Notes 5100 1900 0    50   ~ 0
req_j_iss
Text Notes 5750 1300 0    50   ~ 0
req_f_iss\n
Text Notes 6600 1000 0    50   ~ 0
req_iss2alu\n
Text Notes 7000 1600 0    50   ~ 0
req_iss2lsu\n\n
Text Notes 7350 1650 0    50   ~ 0
req_iss2rfw\n
Text Notes 6450 2850 0    50   ~ 0
req_iss2pca\n
Text Notes 7500 950  0    50   ~ 0
req_f_alu\n
Text Notes 8950 1150 0    50   ~ 0
req_alu2rfw\n
Text Notes 8350 1250 0    50   ~ 0
req_alu2lsu\n
Text Notes 6500 2950 0    50   ~ 0
req_alu2pca
Text Notes 10350 1800 1    50   ~ 0
req_lsu2rfw\n
Text Notes 10100 2800 1    50   ~ 0
req_j_rfw\n
Text Notes 5650 2750 2    50   ~ 0
req_j_pca\n
Text Notes 2600 3100 2    50   ~ 0
req_pca2ife\n\n
Text Notes 9250 1550 0    50   ~ 0
req_j_lsu\n
$Sheet
S 2850 2800 800  200 
U 5EB0D305
F0 "f_pca" 50
F1 "fork2.sch" 50
F2 "req_in" I R 3650 2900 50 
F3 "req_out1" O L 2850 2850 50 
F4 "req_out2" O L 2850 2950 50 
$EndSheet
Text Notes 3850 2750 2    50   ~ 0
req_f_pca
Wire Wire Line
	2850 2950 850  2950
Wire Wire Line
	850  2950 850  1600
Text Notes 3300 1450 1    50   ~ 0
req_dec2rfr\n
$Sheet
S 2500 1450 700  300 
U 5EAD914F
F0 "f_dec" 50
F1 "fork2.sch" 50
F2 "req_in" I L 2500 1600 50 
F3 "req_out1" O R 3200 1700 50 
F4 "req_out3" O R 3200 1500 50 
$EndSheet
Wire Wire Line
	4250 1600 4250 2650
Wire Wire Line
	4250 2650 2800 2650
Wire Wire Line
	2800 2650 2800 2850
Wire Wire Line
	2800 2850 2850 2850
Text Notes 3350 2600 2    50   ~ 0
req_pca2iss\n
Wire Wire Line
	6900 2850 6350 2850
Wire Wire Line
	8500 2950 6350 2950
$Sheet
S 3800 2800 750  200 
U 5EB2231F
F0 "Boot" 50
F1 "Block.sch" 50
F2 "req_in" I R 4550 2900 50 
F3 "req_out" O L 3800 2900 50 
$EndSheet
Wire Wire Line
	4550 2900 4700 2900
Wire Wire Line
	3800 2900 3650 2900
Text Notes 4850 3150 2    50   ~ 0
req_pca2boo\n
$EndSCHEMATC
