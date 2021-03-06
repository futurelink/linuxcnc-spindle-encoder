EESchema Schematic File Version 4
LIBS:interface-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "modbus-encoder v1.4"
Date "2019-10-25"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny2313A-SU IC1
U 1 1 5D7ACC5C
P 4750 4200
F 0 "IC1" H 3800 5200 50  0000 C CNN
F 1 "ATTINY2313-S" H 5050 3150 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 4750 4200 50  0001 C CIN
F 3 "" H 4750 4200 50  0000 C CNN
	1    4750 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5D7ACD47
P 4750 2550
F 0 "#PWR01" H 4750 2400 50  0001 C CNN
F 1 "+5V" H 4750 2690 50  0000 C CNN
F 2 "" H 4750 2550 50  0000 C CNN
F 3 "" H 4750 2550 50  0000 C CNN
	1    4750 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D7ACD6A
P 4750 5400
F 0 "#PWR02" H 4750 5150 50  0001 C CNN
F 1 "GND" H 4750 5250 50  0000 C CNN
F 2 "" H 4750 5400 50  0000 C CNN
F 3 "" H 4750 5400 50  0000 C CNN
	1    4750 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5D7ACDAE
P 3500 3700
F 0 "Y1" H 3500 3850 50  0000 C CNN
F 1 "16MHz" H 3500 3550 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_5032-2Pin_5.0x3.2mm" H 3500 3700 50  0001 C CNN
F 3 "" H 3500 3700 50  0000 C CNN
	1    3500 3700
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5D7ACE7D
P 3150 3450
F 0 "C1" H 3175 3550 50  0000 L CNN
F 1 "22pF" H 3175 3350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3188 3300 50  0001 C CNN
F 3 "" H 3150 3450 50  0000 C CNN
	1    3150 3450
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5D7ACF14
P 3150 3950
F 0 "C2" H 3175 4050 50  0000 L CNN
F 1 "22pF" H 3175 3850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3188 3800 50  0001 C CNN
F 3 "" H 3150 3950 50  0000 C CNN
	1    3150 3950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D7ACFC7
P 2800 3800
F 0 "#PWR03" H 2800 3550 50  0001 C CNN
F 1 "GND" H 2800 3650 50  0000 C CNN
F 2 "" H 2800 3800 50  0000 C CNN
F 3 "" H 2800 3800 50  0000 C CNN
	1    2800 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5D7AD0B6
P 3850 1600
F 0 "J1" H 3850 1750 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 3950 1550 50  0001 C TNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3850 1375 50  0001 C CNN
F 3 "" H 3825 1600 50  0001 C CNN
	1    3850 1600
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P1
U 1 1 5D7AD1A5
P 10350 4550
F 0 "P1" H 10350 4900 50  0000 C CNN
F 1 "CONN_01X06" V 10450 4550 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S6B-XH-A_1x06_P2.50mm_Horizontal" H 10350 4550 50  0001 C CNN
F 3 "" H 10350 4550 50  0000 C CNN
	1    10350 4550
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 4300 5650 4400
Entry Wire Line
	5550 4400 5650 4500
Entry Wire Line
	5550 3400 5650 3500
Entry Wire Line
	5550 3500 5650 3600
Entry Wire Line
	5550 3600 5650 3700
Entry Wire Line
	6950 4150 7050 4250
Entry Wire Line
	6950 4250 7050 4350
Entry Wire Line
	6950 4350 7050 4450
$Comp
L power:GND #PWR04
U 1 1 5D7AD550
P 10100 5000
F 0 "#PWR04" H 10100 4750 50  0001 C CNN
F 1 "GND" H 10100 4850 50  0000 C CNN
F 2 "" H 10100 5000 50  0000 C CNN
F 3 "" H 10100 5000 50  0000 C CNN
	1    10100 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5D7ADEB8
P 4000 3150
F 0 "R1" V 4080 3150 50  0000 C CNN
F 1 "10K" V 4000 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3930 3150 50  0001 C CNN
F 3 "" H 4000 3150 50  0000 C CNN
	1    4000 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5D7AE818
P 5250 2000
F 0 "#PWR05" H 5250 1750 50  0001 C CNN
F 1 "GND" H 5250 1850 50  0000 C CNN
F 2 "" H 5250 2000 50  0000 C CNN
F 3 "" H 5250 2000 50  0000 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C4
U 1 1 5D7AE870
P 4800 1700
F 0 "C4" H 4825 1800 50  0000 L CNN
F 1 "100uF" H 4825 1600 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x10.5" H 4838 1550 50  0001 C CNN
F 3 "" H 4800 1700 50  0000 C CNN
	1    4800 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5D7AEC74
P 4550 1700
F 0 "C3" H 4575 1800 50  0000 L CNN
F 1 "0.1uF" H 4575 1600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4588 1550 50  0001 C CNN
F 3 "" H 4550 1700 50  0000 C CNN
	1    4550 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5D7AEF69
P 6150 1450
F 0 "#PWR06" H 6150 1300 50  0001 C CNN
F 1 "+5V" H 6150 1590 50  0000 C CNN
F 2 "" H 6150 1450 50  0000 C CNN
F 3 "" H 6150 1450 50  0000 C CNN
	1    6150 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even P2
U 1 1 5D7AF118
P 6350 5500
F 0 "P2" H 6350 5700 50  0000 C CNN
F 1 "CONN_02X03" H 6350 5300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 6400 5100 50  0001 C CNN
F 3 "" H 6350 4300 50  0000 C CNN
	1    6350 5500
	1    0    0    -1  
$EndComp
Entry Wire Line
	5950 5300 6050 5400
Entry Wire Line
	5950 5400 6050 5500
Entry Wire Line
	6750 5500 6850 5400
Text Label 5450 3400 0    60   ~ 0
PHASEA
Text Label 5450 3500 0    60   ~ 0
PHASEB
Text Label 5450 3600 0    60   ~ 0
PHASEZ
Text Label 7050 4250 0    60   ~ 0
PHASEA
Text Label 7050 4350 0    60   ~ 0
PHASEB
Text Label 7050 4450 0    60   ~ 0
PHASEZ
Text Label 6050 5400 0    60   ~ 0
MISO
Text Label 6050 5500 0    60   ~ 0
SCK
Text Label 6650 5500 0    60   ~ 0
MOSI
$Comp
L power:GND #PWR07
U 1 1 5D7B02DD
P 6750 5700
F 0 "#PWR07" H 6750 5450 50  0001 C CNN
F 1 "GND" H 6750 5550 50  0000 C CNN
F 2 "" H 6750 5700 50  0000 C CNN
F 3 "" H 6750 5700 50  0000 C CNN
	1    6750 5700
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 4000 5650 4100
Entry Wire Line
	5550 3900 5650 4000
Entry Wire Line
	5550 4100 5650 4200
Text Label 5450 3900 0    60   ~ 0
MOSI
Text Label 5450 4000 0    60   ~ 0
MISO
Text Label 5450 4100 0    60   ~ 0
SCK
$Comp
L power:+5V #PWR08
U 1 1 5D7B0878
P 6750 5300
F 0 "#PWR08" H 6750 5150 50  0001 C CNN
F 1 "+5V" H 6750 5440 50  0000 C CNN
F 2 "" H 6750 5300 50  0000 C CNN
F 3 "" H 6750 5300 50  0000 C CNN
	1    6750 5300
	1    0    0    -1  
$EndComp
Text Label 5450 4300 0    60   ~ 0
RX
Text Label 5450 4400 0    60   ~ 0
TX
$Comp
L power:+5V #PWR09
U 1 1 5D7B14C1
P 10050 4150
F 0 "#PWR09" H 10050 4000 50  0001 C CNN
F 1 "+5V" H 10050 4290 50  0000 C CNN
F 2 "" H 10050 4150 50  0000 C CNN
F 3 "" H 10050 4150 50  0000 C CNN
	1    10050 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR010
U 1 1 5D7B14EB
P 9900 4150
F 0 "#PWR010" H 9900 4000 50  0001 C CNN
F 1 "+24V" H 9900 4290 50  0000 C CNN
F 2 "" H 9900 4150 50  0000 C CNN
F 3 "" H 9900 4150 50  0000 C CNN
	1    9900 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR011
U 1 1 5D7B17EB
P 4550 1400
F 0 "#PWR011" H 4550 1250 50  0001 C CNN
F 1 "+24V" H 4550 1540 50  0000 C CNN
F 2 "" H 4550 1400 50  0000 C CNN
F 3 "" H 4550 1400 50  0000 C CNN
	1    4550 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 P3
U 1 1 5D7B1EFF
P 9000 3450
F 0 "P3" H 9000 3700 50  0000 C CNN
F 1 "CONN_01X04" V 9100 3450 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S4B-XH-A_1x04_P2.50mm_Horizontal" H 9000 3450 50  0001 C CNN
F 3 "" H 9000 3450 50  0000 C CNN
	1    9000 3450
	1    0    0    -1  
$EndComp
Entry Wire Line
	6950 3350 7050 3450
Entry Wire Line
	6950 3450 7050 3550
Text Label 7100 3450 0    60   ~ 0
RX
Text Label 7100 3550 0    60   ~ 0
TX
$Comp
L power:+5V #PWR012
U 1 1 5D7B218F
P 7200 3300
F 0 "#PWR012" H 7200 3150 50  0001 C CNN
F 1 "+5V" H 7200 3440 50  0000 C CNN
F 2 "" H 7200 3300 50  0000 C CNN
F 3 "" H 7200 3300 50  0000 C CNN
	1    7200 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5D7B21BB
P 7200 3700
F 0 "#PWR013" H 7200 3450 50  0001 C CNN
F 1 "GND" H 7200 3550 50  0000 C CNN
F 2 "" H 7200 3700 50  0000 C CNN
F 3 "" H 7200 3700 50  0000 C CNN
	1    7200 3700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG014
U 1 1 5D7B25FE
P 4800 1350
F 0 "#FLG014" H 4800 1445 50  0001 C CNN
F 1 "PWR_FLAG" H 4800 1530 50  0000 C CNN
F 2 "" H 4800 1350 50  0000 C CNN
F 3 "" H 4800 1350 50  0000 C CNN
	1    4800 1350
	1    0    0    -1  
$EndComp
Text Label 6050 5600 0    60   ~ 0
RST
$Comp
L Device:R R2
U 1 1 5D7B2D58
P 6050 4600
F 0 "R2" V 6130 4600 50  0000 C CNN
F 1 "1K" V 6050 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5980 4600 50  0001 C CNN
F 3 "" H 6050 4600 50  0000 C CNN
	1    6050 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5D7B2DA3
P 6350 4600
F 0 "R3" V 6430 4600 50  0000 C CNN
F 1 "1K" V 6350 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6280 4600 50  0001 C CNN
F 3 "" H 6350 4600 50  0000 C CNN
	1    6350 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5D7B2E24
P 6050 4250
F 0 "D1" H 6050 4350 50  0000 C CNN
F 1 "LED_RED" H 6050 4150 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 6050 4250 50  0001 C CNN
F 3 "" H 6050 4250 50  0000 C CNN
	1    6050 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5D7B2E77
P 6350 4250
F 0 "D2" H 6350 4350 50  0000 C CNN
F 1 "LED_YEL" H 6350 4150 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 6350 4250 50  0001 C CNN
F 3 "" H 6350 4250 50  0000 C CNN
	1    6350 4250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5D7B3067
P 6200 4800
F 0 "#PWR015" H 6200 4550 50  0001 C CNN
F 1 "GND" H 6200 4650 50  0000 C CNN
F 2 "" H 6200 4800 50  0000 C CNN
F 3 "" H 6200 4800 50  0000 C CNN
	1    6200 4800
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 3700 5650 3800
Entry Wire Line
	5550 3800 5650 3900
Text Label 5450 3700 0    60   ~ 0
LED1
Text Label 5450 3800 0    60   ~ 0
LED2
Entry Wire Line
	5650 3700 5750 3800
Entry Wire Line
	5650 3800 5750 3900
Text Label 5750 3800 0    60   ~ 0
LED1
Text Label 5750 3900 0    60   ~ 0
LED2
$Comp
L Device:R R4
U 1 1 5D7AF132
P 8550 5200
F 0 "R4" V 8630 5200 50  0000 C CNN
F 1 "4K7" V 8550 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8480 5200 50  0001 C CNN
F 3 "" H 8550 5200 50  0000 C CNN
	1    8550 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D7AF1A7
P 9000 5200
F 0 "R5" V 9080 5200 50  0000 C CNN
F 1 "4K7" V 9000 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8930 5200 50  0001 C CNN
F 3 "" H 9000 5200 50  0000 C CNN
	1    9000 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5D7AF208
P 9450 5200
F 0 "R6" V 9530 5200 50  0000 C CNN
F 1 "4K7" V 9450 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9380 5200 50  0001 C CNN
F 3 "" H 9450 5200 50  0000 C CNN
	1    9450 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5D7B0713
P 9150 5500
F 0 "#PWR016" H 9150 5250 50  0001 C CNN
F 1 "GND" H 9150 5350 50  0000 C CNN
F 2 "" H 9150 5500 50  0000 C CNN
F 3 "" H 9150 5500 50  0000 C CNN
	1    9150 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2550 4750 2850
Wire Wire Line
	4750 2850 4750 3100
Wire Wire Line
	3500 3550 3500 3450
Wire Wire Line
	3300 3450 3500 3450
Wire Wire Line
	3500 3450 3800 3450
Wire Wire Line
	3500 3850 3500 3950
Wire Wire Line
	3300 3950 3500 3950
Wire Wire Line
	3500 3950 3800 3950
Wire Wire Line
	4150 3800 3800 3800
Wire Wire Line
	3800 3800 3800 3950
Connection ~ 3500 3950
Wire Wire Line
	4150 3600 3800 3600
Wire Wire Line
	3800 3600 3800 3450
Connection ~ 3500 3450
Wire Wire Line
	3000 3450 2950 3450
Wire Wire Line
	2950 3450 2950 3700
Wire Wire Line
	2950 3700 2950 3950
Wire Wire Line
	2950 3950 3000 3950
Wire Wire Line
	2800 3800 2800 3700
Wire Wire Line
	2800 3700 2950 3700
Connection ~ 2950 3700
Wire Wire Line
	10100 4850 10100 5000
Wire Wire Line
	10150 4850 10100 4850
Wire Bus Line
	5650 5100 5950 5100
Wire Wire Line
	4000 3300 4000 3400
Wire Wire Line
	4000 3400 4000 5600
Wire Wire Line
	4000 3000 4000 2850
Wire Wire Line
	4000 2850 4750 2850
Connection ~ 4750 2850
Wire Wire Line
	4550 1500 4800 1500
Wire Wire Line
	4050 1900 4550 1900
Wire Wire Line
	4550 1900 4800 1900
Wire Wire Line
	4800 1900 5250 1900
Wire Wire Line
	5250 1800 5250 1900
Wire Wire Line
	5250 1900 5250 2000
Wire Wire Line
	4800 1350 4800 1500
Wire Wire Line
	4800 1500 4800 1550
Connection ~ 4800 1500
Connection ~ 5250 1900
Wire Wire Line
	4800 1850 4800 1900
Wire Wire Line
	4800 1900 4800 2000
Connection ~ 4800 1900
Wire Wire Line
	4550 1400 4550 1500
Wire Wire Line
	4550 1500 4550 1550
Connection ~ 4550 1500
Connection ~ 4550 1900
Wire Wire Line
	6150 1500 6150 1450
Wire Bus Line
	6850 5100 6850 5400
Wire Wire Line
	6750 5500 6650 5500
Wire Wire Line
	6050 5500 6150 5500
Wire Wire Line
	6150 5400 6050 5400
Wire Wire Line
	6650 5600 6750 5600
Wire Wire Line
	6750 5600 6750 5700
Wire Wire Line
	6650 5400 6750 5400
Wire Wire Line
	6750 5400 6750 5300
Connection ~ 4000 3400
Wire Wire Line
	10050 4150 10050 4650
Wire Wire Line
	10050 4650 10150 4650
Wire Wire Line
	9900 4150 9900 4750
Wire Wire Line
	9900 4750 10150 4750
Wire Wire Line
	6350 4400 6350 4450
Wire Wire Line
	6050 4750 6200 4750
Wire Wire Line
	6200 4750 6350 4750
Wire Wire Line
	6050 4450 6050 4400
Wire Wire Line
	6200 4800 6200 4750
Connection ~ 6200 4750
Wire Wire Line
	5750 3800 6350 3800
Wire Wire Line
	6350 3800 6350 4100
Wire Wire Line
	5750 3900 6050 3900
Wire Wire Line
	6050 3900 6050 4100
Wire Wire Line
	7200 3300 7200 3350
Wire Wire Line
	7200 3350 8600 3350
Wire Wire Line
	8800 3650 7200 3650
Wire Wire Line
	7200 3650 7200 3700
Wire Wire Line
	7050 3550 8800 3550
Wire Wire Line
	8800 3450 8500 3450
Connection ~ 8550 4550
Wire Wire Line
	8550 5000 8800 5000
Wire Wire Line
	8800 5000 8800 5050
Connection ~ 8550 5000
Wire Wire Line
	8550 4550 8550 5000
Wire Wire Line
	8550 5000 8550 5050
Wire Wire Line
	9000 4400 9000 5000
Wire Wire Line
	9000 5000 9000 5050
Wire Wire Line
	9000 5000 9250 5000
Wire Wire Line
	9250 5000 9250 5050
Wire Wire Line
	9450 4250 9450 5000
Wire Wire Line
	9450 5000 9450 5050
Wire Wire Line
	9450 5000 9700 5000
Wire Wire Line
	9700 5000 9700 5050
Wire Wire Line
	9700 5350 9700 5400
Wire Wire Line
	9700 5400 9450 5400
Wire Wire Line
	9450 5400 9250 5400
Wire Wire Line
	9250 5400 9150 5400
Wire Wire Line
	9150 5400 9000 5400
Wire Wire Line
	9000 5400 8800 5400
Wire Wire Line
	8800 5400 8550 5400
Wire Wire Line
	8550 5400 8550 5350
Wire Wire Line
	8800 5350 8800 5400
Connection ~ 8800 5400
Wire Wire Line
	9000 5350 9000 5400
Connection ~ 9000 5400
Wire Wire Line
	9250 5350 9250 5400
Connection ~ 9250 5400
Wire Wire Line
	9450 5350 9450 5400
Connection ~ 9450 5400
Wire Wire Line
	9150 5500 9150 5400
Connection ~ 9150 5400
Connection ~ 9000 4400
Connection ~ 9000 5000
Connection ~ 9450 4250
Connection ~ 9450 5000
$Comp
L Device:R R7
U 1 1 5D7B22B2
P 9700 4250
F 0 "R7" V 9780 4250 50  0000 C CNN
F 1 "4K7" V 9700 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9630 4250 50  0001 C CNN
F 3 "" H 9700 4250 50  0000 C CNN
	1    9700 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5D7B22FF
P 9700 4400
F 0 "R8" V 9780 4400 50  0000 C CNN
F 1 "4K7" V 9700 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9630 4400 50  0001 C CNN
F 3 "" H 9700 4400 50  0000 C CNN
	1    9700 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5D7B23BE
P 9700 4550
F 0 "R9" V 9780 4550 50  0000 C CNN
F 1 "4K7" V 9700 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9630 4550 50  0001 C CNN
F 3 "" H 9700 4550 50  0000 C CNN
	1    9700 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	10150 4550 9850 4550
Wire Wire Line
	10150 4450 9950 4450
Wire Wire Line
	9950 4450 9950 4400
Wire Wire Line
	9950 4400 9850 4400
Wire Wire Line
	10150 4350 9950 4350
Wire Wire Line
	9950 4350 9950 4250
Wire Wire Line
	9950 4250 9850 4250
Wire Wire Line
	8400 4550 8550 4550
Wire Wire Line
	8550 4550 9550 4550
Wire Wire Line
	9550 4400 9000 4400
Wire Wire Line
	8800 4250 9450 4250
Wire Wire Line
	9450 4250 9550 4250
$Comp
L power:PWR_FLAG #FLG017
U 1 1 5D7B40A8
P 4800 2000
F 0 "#FLG017" H 4800 2095 50  0001 C CNN
F 1 "PWR_FLAG" H 4800 2180 50  0000 C CNN
F 2 "" H 4800 2000 50  0000 C CNN
F 3 "" H 4800 2000 50  0000 C CNN
	1    4800 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	4550 1900 4550 1850
$Comp
L Regulator_Linear:L7805 U1
U 1 1 5D7B3C1B
P 5250 1500
F 0 "U1" H 5250 1742 50  0000 C CNN
F 1 "L7805" H 5250 1651 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 5275 1350 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 5250 1450 50  0001 C CNN
	1    5250 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1500 4950 1500
Wire Wire Line
	5550 1500 5650 1500
Wire Wire Line
	4750 5300 4750 5400
Wire Wire Line
	4000 5600 6150 5600
Connection ~ 5950 5100
Wire Bus Line
	5950 5100 6850 5100
Connection ~ 6850 5100
Wire Bus Line
	6850 5100 6950 5100
Wire Wire Line
	5350 3400 5550 3400
Wire Wire Line
	5350 3500 5550 3500
Wire Wire Line
	5350 3600 5550 3600
Wire Wire Line
	5350 3700 5550 3700
Wire Wire Line
	5350 3800 5550 3800
Wire Wire Line
	5350 3900 5550 3900
Wire Wire Line
	5350 4000 5550 4000
Wire Wire Line
	5350 4100 5550 4100
Wire Wire Line
	5350 4300 5550 4300
Wire Wire Line
	5350 4400 5550 4400
Wire Wire Line
	4000 3400 4150 3400
$Comp
L Interface_UART:MAX483E U2
U 1 1 5D8224FF
P 7800 2350
F 0 "U2" H 8000 2900 50  0000 C CNN
F 1 "MAX483E" H 8000 2800 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7800 1650 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX1487E-MAX491E.pdf" H 7800 2400 50  0001 C CNN
	1    7800 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5D832058
P 7800 3050
F 0 "#PWR0101" H 7800 2800 50  0001 C CNN
F 1 "GND" H 7805 2877 50  0000 C CNN
F 2 "" H 7800 3050 50  0001 C CNN
F 3 "" H 7800 3050 50  0001 C CNN
	1    7800 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5D8320F2
P 7800 1750
F 0 "#PWR0102" H 7800 1600 50  0001 C CNN
F 1 "+5V" H 7815 1923 50  0000 C CNN
F 2 "" H 7800 1750 50  0001 C CNN
F 3 "" H 7800 1750 50  0001 C CNN
	1    7800 1750
	1    0    0    -1  
$EndComp
Entry Wire Line
	6950 2150 7050 2250
Entry Wire Line
	6950 2300 7050 2400
Entry Wire Line
	6950 2450 7050 2550
Text Label 7050 2250 0    50   ~ 0
RX
Text Label 7050 2550 0    50   ~ 0
TX
Text Label 7050 2400 0    50   ~ 0
RDE
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5D84B0D2
P 8600 2450
F 0 "J2" H 8679 2396 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 8680 2351 50  0001 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 8600 2450 50  0001 C CNN
F 3 "~" H 8600 2450 50  0001 C CNN
	1    8600 2450
	1    0    0    1   
$EndComp
Wire Wire Line
	7050 2250 7300 2250
Wire Wire Line
	7400 2350 7400 2400
Wire Wire Line
	7400 2400 7300 2400
Connection ~ 7400 2400
Wire Wire Line
	7400 2400 7400 2450
$Comp
L Device:R R11
U 1 1 5D8AA239
P 7300 2750
F 0 "R11" H 7370 2796 50  0000 L CNN
F 1 "10K" H 7370 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7230 2750 50  0001 C CNN
F 3 "~" H 7300 2750 50  0001 C CNN
	1    7300 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2900 7300 3000
Wire Wire Line
	7300 2600 7300 2400
Connection ~ 7300 2400
Wire Wire Line
	7300 2400 7050 2400
Wire Wire Line
	7800 2950 7800 3000
Wire Wire Line
	7800 3000 7300 3000
Connection ~ 7800 3000
Wire Wire Line
	7800 3000 7800 3050
Wire Wire Line
	7800 1850 7800 1800
Wire Wire Line
	7050 2550 7400 2550
$Comp
L Device:R R10
U 1 1 5D8E7F14
P 7300 2000
F 0 "R10" H 7370 2046 50  0000 L CNN
F 1 "10K" H 7370 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7230 2000 50  0001 C CNN
F 3 "~" H 7300 2000 50  0001 C CNN
	1    7300 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1800 7300 1800
Wire Wire Line
	7300 1800 7300 1850
Connection ~ 7800 1800
Wire Wire Line
	7800 1800 7800 1750
Wire Wire Line
	7300 2150 7300 2250
Connection ~ 7300 2250
Wire Wire Line
	7300 2250 7400 2250
Entry Wire Line
	5550 4500 5650 4600
Wire Wire Line
	5350 4500 5550 4500
Text Label 5450 4500 0    50   ~ 0
RDE
$Comp
L Device:D D6
U 1 1 5D9084EA
P 4300 1500
F 0 "D6" H 4300 1284 50  0000 C CNN
F 1 "D" H 4300 1375 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric" H 4300 1500 50  0001 C CNN
F 3 "~" H 4300 1500 50  0001 C CNN
	1    4300 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4550 1500 4450 1500
Wire Wire Line
	4150 1500 4050 1500
Wire Wire Line
	4050 1700 4050 1900
Wire Wire Line
	4050 1600 4050 1500
Wire Wire Line
	8400 2250 8400 2350
Wire Wire Line
	8200 2250 8400 2250
Wire Wire Line
	8400 2550 8400 2450
Wire Wire Line
	8200 2550 8400 2550
$Comp
L Switch:SW_DIP_x04 SW1
U 1 1 5D7BE9E3
P 6200 3050
F 0 "SW1" H 6200 3517 50  0000 C CNN
F 1 "ADDRESS_SW" H 6200 3426 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx04_Slide_9.78x12.34mm_W7.62mm_P2.54mm" H 6200 3050 50  0001 C CNN
F 3 "" H 6200 3050 50  0001 C CNN
	1    6200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2850 6500 2950
Wire Wire Line
	6500 3050 6500 2950
Connection ~ 6500 2950
Wire Wire Line
	6500 3150 6500 3050
Connection ~ 6500 3050
$Comp
L power:+5V #PWR0103
U 1 1 5D7CF99B
P 6600 2900
F 0 "#PWR0103" H 6600 2750 50  0001 C CNN
F 1 "+5V" H 6615 3073 50  0000 C CNN
F 2 "" H 6600 2900 50  0001 C CNN
F 3 "" H 6600 2900 50  0001 C CNN
	1    6600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2900 6600 2950
Wire Wire Line
	6600 2950 6500 2950
Entry Wire Line
	5650 2750 5750 2850
Entry Wire Line
	5650 2850 5750 2950
Entry Wire Line
	5650 2950 5750 3050
Entry Wire Line
	5650 3050 5750 3150
Wire Wire Line
	5900 2850 5750 2850
Wire Wire Line
	5900 2950 5750 2950
Wire Wire Line
	5900 3050 5750 3050
Wire Wire Line
	5900 3150 5750 3150
Text Label 5750 2850 0    50   ~ 0
A0
Text Label 5750 2950 0    50   ~ 0
A1
Text Label 5750 3050 0    50   ~ 0
A2
Text Label 5750 3150 0    50   ~ 0
A3
Entry Wire Line
	5550 4600 5650 4700
Entry Wire Line
	5550 4700 5650 4800
Entry Wire Line
	5550 4800 5650 4900
Entry Wire Line
	5550 4900 5650 5000
Entry Wire Line
	5550 4600 5650 4700
Wire Wire Line
	5550 4600 5350 4600
Wire Wire Line
	5550 4700 5350 4700
Wire Wire Line
	5550 4800 5350 4800
Wire Wire Line
	5550 4900 5350 4900
Text Label 5450 4600 0    50   ~ 0
A0
Text Label 5450 4700 0    50   ~ 0
A1
Text Label 5450 4800 0    50   ~ 0
A2
Text Label 5450 4900 0    50   ~ 0
A3
$Comp
L Graphic:Logo_Open_Hardware_Small #LOGO1
U 1 1 5D7D2E28
P 10900 6850
F 0 "#LOGO1" H 10900 7125 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 10900 6625 50  0001 C CNN
F 2 "" H 10900 6850 50  0001 C CNN
F 3 "~" H 10900 6850 50  0001 C CNN
	1    10900 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5D7F3A01
P 5950 1700
F 0 "C6" H 6000 1800 50  0000 L CNN
F 1 "0,1uF" H 6000 1600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5988 1550 50  0001 C CNN
F 3 "~" H 5950 1700 50  0001 C CNN
	1    5950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1550 5650 1500
Connection ~ 5650 1500
Wire Wire Line
	5650 1500 5950 1500
Wire Wire Line
	5950 1550 5950 1500
Connection ~ 5950 1500
Wire Wire Line
	5950 1500 6150 1500
Wire Wire Line
	5650 1850 5650 1900
Wire Wire Line
	5650 1900 5250 1900
Wire Wire Line
	5950 1850 5950 1900
Wire Wire Line
	5950 1900 5650 1900
Connection ~ 5650 1900
$Comp
L Device:R R12
U 1 1 5D81B686
P 8600 3100
F 0 "R12" H 8670 3146 50  0000 L CNN
F 1 "10K" H 8670 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8530 3100 50  0001 C CNN
F 3 "~" H 8600 3100 50  0001 C CNN
	1    8600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 2950 8500 2950
Wire Wire Line
	8500 2950 8500 3450
Connection ~ 8500 3450
Wire Wire Line
	8500 3450 7050 3450
Wire Wire Line
	8600 3250 8600 3350
Connection ~ 8600 3350
Wire Wire Line
	8600 3350 8800 3350
$Comp
L Diode:BZX84Cxx D3
U 1 1 5DA7FB40
P 8800 5200
F 0 "D3" V 8900 5200 50  0000 L CNN
F 1 "BZX84C5" V 8550 5000 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 8800 5025 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 8800 5200 50  0001 C CNN
	1    8800 5200
	0    1    1    0   
$EndComp
$Comp
L Diode:BZX84Cxx D4
U 1 1 5DA83569
P 9250 5200
F 0 "D4" V 9350 5200 50  0000 L CNN
F 1 "BZX84C5" V 9000 5000 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 9250 5025 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 9250 5200 50  0001 C CNN
	1    9250 5200
	0    1    1    0   
$EndComp
$Comp
L Diode:BZX84Cxx D5
U 1 1 5DA84DFB
P 9700 5200
F 0 "D5" V 9800 5200 50  0000 L CNN
F 1 "BZX84C5" V 9450 5050 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 9700 5025 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 9700 5200 50  0001 C CNN
	1    9700 5200
	0    1    1    0   
$EndComp
$Comp
L Device:CP C5
U 1 1 5DAA3A79
P 5650 1700
F 0 "C5" H 5700 1800 50  0000 L CNN
F 1 "100uF" H 5650 1600 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.3" H 5688 1550 50  0001 C CNN
F 3 "~" H 5650 1700 50  0001 C CNN
	1    5650 1700
	1    0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U3
U 1 1 5DB9AAC5
P 7950 4100
F 0 "U3" H 8100 3900 50  0000 C CNN
F 1 "PC817" H 7800 3900 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_SMDSocket_SmallPads" H 7750 3900 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 7950 4100 50  0001 L CNN
	1    7950 4100
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U4
U 1 1 5DBABB09
P 7950 4500
F 0 "U4" H 8100 4300 50  0000 C CNN
F 1 "PC817" H 7800 4300 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_SMDSocket_SmallPads" H 7750 4300 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 7950 4500 50  0001 L CNN
	1    7950 4500
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U5
U 1 1 5DBB6579
P 7950 4900
F 0 "U5" H 8100 4700 50  0000 C CNN
F 1 "PC817" H 7800 4700 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_SMDSocket_SmallPads" H 7750 4700 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 7950 4900 50  0001 L CNN
	1    7950 4900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7050 4350 7200 4350
Wire Wire Line
	7200 4350 7200 4600
Wire Wire Line
	7200 4600 7300 4600
Wire Wire Line
	7050 4450 7100 4450
Wire Wire Line
	7100 4450 7100 5000
Wire Wire Line
	7650 4250 7650 4200
$Comp
L power:+5V #PWR0104
U 1 1 5DC093E4
P 7600 3900
F 0 "#PWR0104" H 7600 3750 50  0001 C CNN
F 1 "+5V" H 7615 4073 50  0000 C CNN
F 2 "" H 7600 3900 50  0001 C CNN
F 3 "" H 7600 3900 50  0001 C CNN
	1    7600 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3900 7600 4000
Wire Wire Line
	7600 4000 7650 4000
Wire Wire Line
	7650 4800 7600 4800
Wire Wire Line
	7600 4800 7600 4400
Connection ~ 7600 4000
Wire Wire Line
	7650 4400 7600 4400
Connection ~ 7600 4400
Wire Wire Line
	7600 4400 7600 4000
Wire Wire Line
	8300 5000 8250 5000
Wire Wire Line
	8300 5000 8300 4600
Wire Wire Line
	8300 4600 8250 4600
Wire Wire Line
	8300 4200 8250 4200
Wire Wire Line
	8300 5000 8300 5400
Wire Wire Line
	8300 5400 8550 5400
Connection ~ 8300 5000
Connection ~ 8550 5400
Wire Wire Line
	8400 4550 8400 4800
Wire Wire Line
	8400 4800 8250 4800
Wire Wire Line
	8250 4400 9000 4400
Wire Wire Line
	8300 4200 8300 4600
Connection ~ 8300 4600
Wire Wire Line
	8800 4000 8250 4000
Wire Wire Line
	8800 4000 8800 4250
$Comp
L Device:R R13
U 1 1 5DCF073B
P 7100 5200
F 0 "R13" V 7200 5150 50  0000 L CNN
F 1 "4K7" V 7100 5100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7030 5200 50  0001 C CNN
F 3 "~" H 7100 5200 50  0001 C CNN
	1    7100 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5DCF2F43
P 7300 5200
F 0 "R14" V 7400 5150 50  0000 L CNN
F 1 "4K7" V 7300 5100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7230 5200 50  0001 C CNN
F 3 "~" H 7300 5200 50  0001 C CNN
	1    7300 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5DCF3D64
P 7500 5200
F 0 "R15" V 7600 5150 50  0000 L CNN
F 1 "4K7" V 7500 5100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7430 5200 50  0001 C CNN
F 3 "~" H 7500 5200 50  0001 C CNN
	1    7500 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4250 7500 4250
Wire Wire Line
	7100 5000 7650 5000
Wire Wire Line
	7500 5050 7500 4250
Connection ~ 7500 4250
Wire Wire Line
	7500 4250 7650 4250
Wire Wire Line
	7300 5050 7300 4600
Connection ~ 7300 4600
Wire Wire Line
	7300 4600 7650 4600
Wire Wire Line
	7100 5050 7100 5000
Connection ~ 7100 5000
Wire Wire Line
	7100 5350 7100 5400
Wire Wire Line
	7100 5400 7300 5400
Wire Wire Line
	7500 5400 7500 5350
Wire Wire Line
	7300 5350 7300 5400
Connection ~ 7300 5400
Wire Wire Line
	7300 5400 7500 5400
Wire Wire Line
	7500 5400 8300 5400
Wire Bus Line
	5950 5100 5950 5400
Wire Bus Line
	6950 2150 6950 5100
Wire Bus Line
	5650 2750 5650 5100
Connection ~ 7500 5400
Connection ~ 8300 5400
$EndSCHEMATC
