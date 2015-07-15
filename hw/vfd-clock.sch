EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32
LIBS:vfd-clock
LIBS:vfd-clock-cache
EELAYER 25 0
EELAYER END
$Descr USLegal 14000 8500
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3400 2950 1    60   ~ 0
3v3
NoConn ~ 3500 2950
Text Label 3650 5500 3    60   ~ 0
GND
Text Label 3550 5500 3    60   ~ 0
GND
$Comp
L IV-22 V1
U 1 1 556B5084
P 8650 1750
F 0 "V1" H 9000 1300 60  0000 C CNN
F 1 "IV-22" H 8700 2200 60  0000 C CNN
F 2 "VFD:DISP_IV-22_1PIN_SOCKET" H 8650 1750 60  0001 C CNN
F 3 "" H 8650 1750 60  0000 C CNN
	1    8650 1750
	1    0    0    -1  
$EndComp
$Comp
L IV-22 V2
U 1 1 556B50CF
P 8650 3650
F 0 "V2" H 9000 3200 60  0000 C CNN
F 1 "IV-22" H 8700 4100 60  0000 C CNN
F 2 "VFD:DISP_IV-22_1PIN_SOCKET" H 8650 3650 60  0001 C CNN
F 3 "" H 8650 3650 60  0000 C CNN
	1    8650 3650
	1    0    0    -1  
$EndComp
$Comp
L IV-22 V4
U 1 1 556B51AB
P 12200 1750
F 0 "V4" H 12550 1300 60  0000 C CNN
F 1 "IV-22" H 12250 2200 60  0000 C CNN
F 2 "VFD:DISP_IV-22_1PIN_SOCKET" H 12200 1750 60  0001 C CNN
F 3 "" H 12200 1750 60  0000 C CNN
	1    12200 1750
	1    0    0    -1  
$EndComp
$Comp
L IV-22 V5
U 1 1 556B51E6
P 12200 3750
F 0 "V5" H 12550 3300 60  0000 C CNN
F 1 "IV-22" H 12250 4200 60  0000 C CNN
F 2 "VFD:DISP_IV-22_1PIN_SOCKET" H 12200 3750 60  0001 C CNN
F 3 "" H 12200 3750 60  0000 C CNN
	1    12200 3750
	1    0    0    -1  
$EndComp
$Comp
L IV-22 V6
U 1 1 556B520F
P 12200 5800
F 0 "V6" H 12550 5350 60  0000 C CNN
F 1 "IV-22" H 12250 6250 60  0000 C CNN
F 2 "VFD:DISP_IV-22_1PIN_SOCKET" H 12200 5800 60  0001 C CNN
F 3 "" H 12200 5800 60  0000 C CNN
	1    12200 5800
	1    0    0    -1  
$EndComp
Text Label 7550 1000 1    60   ~ 0
GND
Text Label 7500 2300 3    60   ~ 0
GND
Text Label 6850 1350 2    60   ~ 0
DAH
Text Label 6850 1450 2    60   ~ 0
DBH
Text Label 6850 1550 2    60   ~ 0
DCH
Text Label 6850 1650 2    60   ~ 0
DDH
Entry Wire Line
	6600 1350 6500 1450
Entry Wire Line
	6600 1450 6500 1550
Entry Wire Line
	6600 1550 6500 1650
Entry Wire Line
	6600 1650 6500 1750
Text Label 9350 1300 0    60   ~ 0
GND
Text Label 12900 5450 0    60   ~ 0
7v2
Text Label 9350 1700 0    60   ~ 0
GRID
Text Label 12900 1700 0    60   ~ 0
GRID
NoConn ~ 12900 2000
Text Label 9350 3600 0    60   ~ 0
GRID
NoConn ~ 9350 3900
NoConn ~ 9350 2000
Text Label 12900 3700 0    60   ~ 0
GRID
NoConn ~ 12900 4000
Text Label 12900 5750 0    60   ~ 0
GRID
NoConn ~ 12900 6050
Text Label 9350 5750 0    60   ~ 0
GRID
NoConn ~ 9350 6050
Entry Wire Line
	1450 3800 1550 3700
Entry Wire Line
	1450 3900 1550 3800
Entry Wire Line
	1450 4000 1550 3900
Entry Wire Line
	1450 4100 1550 4000
Entry Wire Line
	1450 3800 1550 3700
Text Label 2000 3700 2    60   ~ 0
DCL
Text Label 2000 3800 2    60   ~ 0
DBL
Text Label 2000 3900 2    60   ~ 0
DDL
Text Label 2000 4000 2    60   ~ 0
DAL
NoConn ~ 5100 4800
Text Label 5200 4700 0    60   ~ 0
SWCLK
Text Label 5200 4600 0    60   ~ 0
SWDIO
Text Label 2000 5000 2    60   ~ 0
RST
$Comp
L CONN_01X05 P1
U 1 1 556B80D4
P 1250 5000
F 0 "P1" H 1250 5350 50  0000 C CNN
F 1 "ST_LINK" V 1350 5000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05" H 1250 5000 60  0001 C CNN
F 3 "" H 1250 5000 60  0000 C CNN
	1    1250 5000
	1    0    0    1   
$EndComp
Text Label 950  5200 2    60   ~ 0
RST
Text Label 950  4800 2    60   ~ 0
SWDIO
Text Label 950  4900 2    60   ~ 0
GND
Text Label 950  5000 2    60   ~ 0
SWCLK
Text Label 950  5100 2    60   ~ 0
3v3
$Comp
L CD4056 U2
U 1 1 556B95D9
P 7500 1650
F 0 "U2" H 7800 1150 60  0000 C CNN
F 1 "CD4056" V 7500 1650 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 7500 1650 60  0001 C CNN
F 3 "" H 7500 1650 60  0000 C CNN
	1    7500 1650
	1    0    0    -1  
$EndComp
Text Label 7450 1000 1    60   ~ 0
19v5
$Comp
L IV-22 V3
U 1 1 556B50EC
P 8650 5800
F 0 "V3" H 9000 5350 60  0000 C CNN
F 1 "IV-22" H 8700 6250 60  0000 C CNN
F 2 "VFD:DISP_IV-22_1PIN_SOCKET" H 8650 5800 60  0001 C CNN
F 3 "" H 8650 5800 60  0000 C CNN
	1    8650 5800
	1    0    0    -1  
$EndComp
Text Label 5200 3500 0    60   ~ 0
STROBE1L
Text Label 5200 3600 0    60   ~ 0
STROBE2L
Text Label 5200 3700 0    60   ~ 0
STROBE3L
Text Label 5200 3800 0    60   ~ 0
STROBE4L
Text Label 5200 3900 0    60   ~ 0
STROBE5L
Text Label 5200 4000 0    60   ~ 0
STROBE6L
Text Label 6950 1900 2    60   ~ 0
STROBE1H
Text Label 6950 2000 2    60   ~ 0
GND
Text Label 7500 4200 3    60   ~ 0
GND
$Comp
L CD4056 U3
U 1 1 556B9DFD
P 7500 3550
F 0 "U3" H 7800 3050 60  0000 C CNN
F 1 "CD4056" V 7500 3550 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 7500 3550 60  0001 C CNN
F 3 "" H 7500 3550 60  0000 C CNN
	1    7500 3550
	1    0    0    -1  
$EndComp
Text Label 7450 2900 1    60   ~ 0
19v5
Text Label 6950 3800 2    60   ~ 0
STROBE2H
Text Label 6950 3900 2    60   ~ 0
GND
Text Label 7550 5050 1    60   ~ 0
GND
Text Label 7500 6350 3    60   ~ 0
GND
$Comp
L CD4056 U4
U 1 1 556B9EA2
P 7500 5700
F 0 "U4" H 7800 5200 60  0000 C CNN
F 1 "CD4056" V 7500 5700 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 7500 5700 60  0001 C CNN
F 3 "" H 7500 5700 60  0000 C CNN
	1    7500 5700
	1    0    0    -1  
$EndComp
Text Label 7450 5050 1    60   ~ 0
19v5
Text Label 6950 5950 2    60   ~ 0
STROBE3H
Text Label 6950 6050 2    60   ~ 0
GND
Text Label 11100 5050 1    60   ~ 0
GND
Text Label 11050 6350 3    60   ~ 0
GND
$Comp
L CD4056 U7
U 1 1 556B9F25
P 11050 5700
F 0 "U7" H 11350 5200 60  0000 C CNN
F 1 "CD4056" V 11050 5700 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 11050 5700 60  0001 C CNN
F 3 "" H 11050 5700 60  0000 C CNN
	1    11050 5700
	1    0    0    -1  
$EndComp
Text Label 11000 5050 1    60   ~ 0
19v5
Text Label 10500 5950 2    60   ~ 0
STROBE6H
Text Label 10500 6050 2    60   ~ 0
GND
Text Label 11100 3000 1    60   ~ 0
GND
Text Label 11050 4300 3    60   ~ 0
GND
$Comp
L CD4056 U6
U 1 1 556B9FEA
P 11050 3650
F 0 "U6" H 11350 3150 60  0000 C CNN
F 1 "CD4056" V 11050 3650 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 11050 3650 60  0001 C CNN
F 3 "" H 11050 3650 60  0000 C CNN
	1    11050 3650
	1    0    0    -1  
$EndComp
Text Label 11000 3000 1    60   ~ 0
19v5
Text Label 10500 3900 2    60   ~ 0
STROBE5H
Text Label 10500 4000 2    60   ~ 0
GND
Text Label 11100 1000 1    60   ~ 0
GND
Text Label 11050 2300 3    60   ~ 0
GND
$Comp
L CD4056 U5
U 1 1 556BA12B
P 11050 1650
F 0 "U5" H 11350 1150 60  0000 C CNN
F 1 "CD4056" V 11050 1650 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 11050 1650 60  0001 C CNN
F 3 "" H 11050 1650 60  0000 C CNN
	1    11050 1650
	1    0    0    -1  
$EndComp
Text Label 11000 1000 1    60   ~ 0
19v5
Text Label 10500 1900 2    60   ~ 0
STROBE4H
Text Label 10500 2000 2    60   ~ 0
GND
NoConn ~ 2100 5100
$Comp
L PWR_FLAG #FLG01
U 1 1 556BACD7
P 9600 1400
F 0 "#FLG01" H 9600 1495 30  0001 C CNN
F 1 "PWR_FLAG" H 9600 1580 30  0000 C CNN
F 2 "" H 9600 1400 60  0000 C CNN
F 3 "" H 9600 1400 60  0000 C CNN
	1    9600 1400
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 556BACE9
P 13150 1400
F 0 "#FLG02" H 13150 1495 30  0001 C CNN
F 1 "PWR_FLAG" H 13150 1580 30  0000 C CNN
F 2 "" H 13150 1400 60  0000 C CNN
F 3 "" H 13150 1400 60  0000 C CNN
	1    13150 1400
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG03
U 1 1 556BAD17
P 9600 3300
F 0 "#FLG03" H 9600 3395 30  0001 C CNN
F 1 "PWR_FLAG" H 9600 3480 30  0000 C CNN
F 2 "" H 9600 3300 60  0000 C CNN
F 3 "" H 9600 3300 60  0000 C CNN
	1    9600 3300
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG04
U 1 1 556BAD27
P 12900 650
F 0 "#FLG04" H 12900 745 30  0001 C CNN
F 1 "PWR_FLAG" H 12900 830 30  0000 C CNN
F 2 "" H 12900 650 60  0000 C CNN
F 3 "" H 12900 650 60  0000 C CNN
	1    12900 650 
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG05
U 1 1 556BAD37
P 13150 3400
F 0 "#FLG05" H 13150 3495 30  0001 C CNN
F 1 "PWR_FLAG" H 13150 3580 30  0000 C CNN
F 2 "" H 13150 3400 60  0000 C CNN
F 3 "" H 13150 3400 60  0000 C CNN
	1    13150 3400
	0    1    1    0   
$EndComp
NoConn ~ 2100 3500
Text Label 3700 2950 1    60   ~ 0
7v2
Text Label 3800 2950 1    60   ~ 0
Vbat
$Comp
L BATTERY BT1
U 1 1 556BB290
P 950 1250
F 0 "BT1" H 950 1450 50  0000 C CNN
F 1 "COIN_BATT" H 950 1060 50  0000 C CNN
F 2 "VFD:BATT2032-1060TR" H 950 1250 60  0001 C CNN
F 3 "" H 950 1250 60  0000 C CNN
	1    950  1250
	0    -1   1    0   
$EndComp
Text Label 950  1550 3    60   ~ 0
GND
Text Label 950  950  1    60   ~ 0
Vbat
$Comp
L MC34063 U8
U 1 1 556BB66C
P 3550 7050
F 0 "U8" H 3700 7400 60  0000 L CNN
F 1 "MC34063" H 3650 6700 60  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3550 7050 60  0001 C CNN
F 3 "" H 3550 7050 60  0000 C CNN
	1    3550 7050
	1    0    0    -1  
$EndComp
Text Label 3550 7550 3    60   ~ 0
GND
$Comp
L BARREL_JACK_2 CON1
U 1 1 556B8A83
P 1400 5900
F 0 "CON1" H 1400 6150 60  0000 C CNN
F 1 "BARREL_JACK_2" H 1400 5700 60  0000 C CNN
F 2 "Connect:JACK_ALIM" H 1400 5900 60  0001 C CNN
F 3 "" H 1400 5900 60  0000 C CNN
	1    1400 5900
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK_2 CON2
U 1 1 556B8B4E
P 1400 6500
F 0 "CON2" H 1400 6750 60  0000 C CNN
F 1 "BARREL_JACK_2" H 1400 6300 60  0000 C CNN
F 2 "VFD:OCT_JACK" H 1400 6500 60  0001 C CNN
F 3 "" H 1400 6500 60  0000 C CNN
	1    1400 6500
	1    0    0    -1  
$EndComp
Text Label 1700 6000 0    60   ~ 0
GND
Text Label 1700 6600 0    60   ~ 0
GND
Text Label 1950 5800 0    60   ~ 0
19v5
$Comp
L PWR_FLAG #FLG06
U 1 1 556B8C3E
P 1800 5800
F 0 "#FLG06" H 1800 5895 30  0001 C CNN
F 1 "PWR_FLAG" H 1800 5980 30  0000 C CNN
F 2 "" H 1800 5800 60  0000 C CNN
F 3 "" H 1800 5800 60  0000 C CNN
	1    1800 5800
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 556B8E09
P 2700 7400
F 0 "C7" H 2700 7500 40  0000 L CNN
F 1 "330p" H 2706 7315 40  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2738 7250 30  0001 C CNN
F 3 "" H 2700 7400 60  0000 C CNN
	1    2700 7400
	-1   0    0    1   
$EndComp
$Comp
L R R1
U 1 1 556B8F10
P 4150 6400
F 0 "R1" V 4230 6400 40  0000 C CNN
F 1 "0.22" V 4157 6401 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4080 6400 30  0001 C CNN
F 3 "" H 4150 6400 30  0000 C CNN
	1    4150 6400
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 556B999E
P 4950 7100
F 0 "L1" V 4900 7100 40  0000 C CNN
F 1 "68u" V 5050 7100 40  0000 C CNN
F 2 "Inductors:INDUCTOR_V" H 4950 7100 60  0001 C CNN
F 3 "" H 4950 7100 60  0000 C CNN
	1    4950 7100
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D1
U 1 1 556B9B16
P 4650 7300
F 0 "D1" H 4650 7400 40  0000 C CNN
F 1 "DIODESCH" H 4650 7200 40  0000 C CNN
F 2 "Diodes_SMD:Diode-SMA_Standard" H 4650 7300 60  0001 C CNN
F 3 "" H 4650 7300 60  0000 C CNN
	1    4650 7300
	0    -1   -1   0   
$EndComp
Text Label 6050 7100 0    60   ~ 0
7v2
$Comp
L R R3
U 1 1 556B9F22
P 5350 7350
F 0 "R3" V 5430 7350 40  0000 C CNN
F 1 "54k9" V 5357 7351 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5280 7350 30  0001 C CNN
F 3 "" H 5350 7350 30  0000 C CNN
	1    5350 7350
	-1   0    0    1   
$EndComp
$Comp
L R R2
U 1 1 556BA106
P 4850 7750
F 0 "R2" V 4930 7750 40  0000 C CNN
F 1 "12.4k" V 4857 7751 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4780 7750 30  0001 C CNN
F 3 "" H 4850 7750 30  0000 C CNN
	1    4850 7750
	0    1    -1   0   
$EndComp
$Comp
L POT RV1
U 1 1 556BA143
P 5350 7750
F 0 "RV1" H 5350 7650 50  0000 C CNN
F 1 "4k7" H 5350 7750 50  0000 C CNN
F 2 "VFD:PVA2_POT" H 5350 7750 60  0001 C CNN
F 3 "" H 5350 7750 60  0000 C CNN
	1    5350 7750
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG07
U 1 1 556BADC6
P 5350 7100
F 0 "#FLG07" H 5350 7195 30  0001 C CNN
F 1 "PWR_FLAG" H 5350 7280 30  0000 C CNN
F 2 "" H 5350 7100 60  0000 C CNN
F 3 "" H 5350 7100 60  0000 C CNN
	1    5350 7100
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG08
U 1 1 556BAEE3
P 1200 950
F 0 "#FLG08" H 1200 1045 30  0001 C CNN
F 1 "PWR_FLAG" H 1200 1130 30  0000 C CNN
F 2 "" H 1200 950 60  0000 C CNN
F 3 "" H 1200 950 60  0000 C CNN
	1    1200 950 
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C5
U 1 1 556BB1C3
P 5650 7300
F 0 "C5" H 5700 7400 40  0000 L CNN
F 1 "47u" H 5700 7200 40  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2" H 5750 7150 30  0001 C CNN
F 3 "" H 5650 7300 300 0000 C CNN
	1    5650 7300
	1    0    0    -1  
$EndComp
Text Label 5650 7500 2    60   ~ 0
GND
$Comp
L CAPAPOL C3
U 1 1 556BB276
P 2050 6600
F 0 "C3" H 2100 6700 40  0000 L CNN
F 1 "47u" H 2100 6500 40  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2" H 2150 6450 30  0001 C CNN
F 3 "" H 2050 6600 300 0000 C CNN
	1    2050 6600
	-1   0    0    -1  
$EndComp
Text Label 4400 6600 0    60   ~ 0
REG_HI
Text Label 9600 2300 1    60   ~ 0
FIL1
Text Label 9600 4300 1    60   ~ 0
FIL2
Text Label 9900 4300 1    60   ~ 0
FIL3
Text Label 13150 2350 1    60   ~ 0
FIL4
Text Label 13150 4300 1    60   ~ 0
FIL5
$Comp
L SW_PUSH SW3
U 1 1 556CE543
P 1150 2700
F 0 "SW3" H 1300 2810 50  0000 C CNN
F 1 "DOWN" H 1150 2620 50  0000 C CNN
F 2 "VFD:SMD_TACT_6mm" H 1150 2700 60  0001 C CNN
F 3 "" H 1150 2700 60  0000 C CNN
	1    1150 2700
	-1   0    0    -1  
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 556CE65E
P 1150 2400
F 0 "SW2" H 1300 2510 50  0000 C CNN
F 1 "UP" H 1150 2320 50  0000 C CNN
F 2 "VFD:SMD_TACT_6mm" H 1150 2400 60  0001 C CNN
F 3 "" H 1150 2400 60  0000 C CNN
	1    1150 2400
	-1   0    0    -1  
$EndComp
$Comp
L SW_PUSH SW1
U 1 1 556CE675
P 1150 2100
F 0 "SW1" H 1300 2210 50  0000 C CNN
F 1 "SET" H 1150 2020 50  0000 C CNN
F 2 "VFD:SMD_TACT_6mm" H 1150 2100 60  0001 C CNN
F 3 "" H 1150 2100 60  0000 C CNN
	1    1150 2100
	-1   0    0    -1  
$EndComp
NoConn ~ 5100 4100
Text Label 850  3200 0    60   ~ 0
GND
Text Label 2000 4500 2    60   ~ 0
BTN_SET
Text Label 2000 4600 2    60   ~ 0
BTN_UP
Text Label 2000 4400 2    60   ~ 0
BTN_DN
Text Label 1450 2100 0    60   ~ 0
BTN_SET
Text Label 1450 2400 0    60   ~ 0
BTN_UP
Text Label 1450 2700 0    60   ~ 0
BTN_DN
$Comp
L SW_PUSH SW4
U 1 1 556CE74C
P 1150 3000
F 0 "SW4" H 1300 3110 50  0000 C CNN
F 1 "DIM" H 1150 2920 50  0000 C CNN
F 2 "VFD:SMD_TACT_6mm" H 1150 3000 60  0001 C CNN
F 3 "" H 1150 3000 60  0000 C CNN
	1    1150 3000
	-1   0    0    -1  
$EndComp
$Comp
L CRYSTAL X1
U 1 1 556D1EEC
P 5800 5100
F 0 "X1" H 5800 5250 60  0000 C CNN
F 1 "CRYSTAL" H 5800 4950 60  0000 C CNN
F 2 "Crystals:Crystal_Round_Vertical_3mm_BigPad" H 5800 5100 60  0001 C CNN
F 3 "" H 5800 5100 60  0000 C CNN
	1    5800 5100
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 556D1FE1
P 6000 4800
F 0 "C1" H 6000 4900 40  0000 L CNN
F 1 "18p" H 6006 4715 40  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6038 4650 30  0001 C CNN
F 3 "" H 6000 4800 60  0000 C CNN
	1    6000 4800
	0    -1   1    0   
$EndComp
$Comp
L C C2
U 1 1 556D2008
P 6000 5400
F 0 "C2" H 6000 5500 40  0000 L CNN
F 1 "18p" H 6006 5315 40  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6038 5250 30  0001 C CNN
F 3 "" H 6000 5400 60  0000 C CNN
	1    6000 5400
	0    -1   1    0   
$EndComp
Text Label 6200 5100 0    60   ~ 0
GND
$Comp
L CAPAPOL C4
U 1 1 556E5E99
P 2350 6600
F 0 "C4" H 2400 6700 40  0000 L CNN
F 1 "47u" H 2400 6500 40  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2" H 2450 6450 30  0001 C CNN
F 3 "" H 2350 6600 300 0000 C CNN
	1    2350 6600
	-1   0    0    -1  
$EndComp
$Comp
L CAPAPOL C6
U 1 1 556E6090
P 5900 7300
F 0 "C6" H 5950 7400 40  0000 L CNN
F 1 "47u" H 5950 7200 40  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2" H 6000 7150 30  0001 C CNN
F 3 "" H 5900 7300 300 0000 C CNN
	1    5900 7300
	1    0    0    -1  
$EndComp
Text Label 4600 7750 2    60   ~ 0
GND
NoConn ~ 5600 7750
Text Label 1450 3000 0    60   ~ 0
BTN_DIM
NoConn ~ 2100 3600
Text Label 2000 4300 2    60   ~ 0
BTN_DIM
NoConn ~ 5100 5000
NoConn ~ 5100 4400
NoConn ~ 5100 4500
Wire Wire Line
	6600 1350 6950 1350
Wire Wire Line
	6600 1450 6950 1450
Wire Wire Line
	6600 1550 6950 1550
Wire Wire Line
	6600 1650 6950 1650
Wire Bus Line
	6500 1450 6500 1850
Wire Wire Line
	5100 3500 5200 3500
Wire Wire Line
	5100 3600 5200 3600
Wire Wire Line
	5100 3700 5200 3700
Wire Wire Line
	5100 3800 5200 3800
Wire Wire Line
	5100 3900 5200 3900
Wire Wire Line
	5100 4000 5200 4000
Wire Bus Line
	1450 3800 1450 4200
Wire Wire Line
	5200 4700 5100 4700
Wire Wire Line
	5200 4600 5100 4600
Wire Wire Line
	2000 5000 2100 5000
Wire Wire Line
	1050 4800 950  4800
Wire Wire Line
	1050 4900 950  4900
Wire Wire Line
	1050 5000 950  5000
Wire Wire Line
	1050 5200 950  5200
Wire Wire Line
	1050 5100 950  5100
Connection ~ 13150 3400
Connection ~ 12900 650 
Connection ~ 9600 3300
Connection ~ 13150 1400
Connection ~ 9600 1400
Wire Wire Line
	1700 5800 1950 5800
Wire Wire Line
	1950 5800 1950 6400
Connection ~ 1950 6400
Wire Wire Line
	3100 7550 4650 7550
Wire Wire Line
	3100 7550 3100 7600
Wire Wire Line
	3100 7600 2700 7600
Connection ~ 3550 6400
Connection ~ 4400 6850
Wire Wire Line
	3550 6400 3550 6550
Wire Wire Line
	4400 6400 4400 6950
Wire Wire Line
	4400 6600 2700 6600
Wire Wire Line
	2700 6600 2700 6900
Connection ~ 4400 6600
Wire Wire Line
	4650 7100 4400 7100
Connection ~ 4650 7100
Wire Wire Line
	4650 7550 4650 7500
Connection ~ 3550 7550
Connection ~ 1800 5800
Connection ~ 5350 7100
Wire Wire Line
	950  950  1200 950 
Wire Wire Line
	1700 6800 2350 6800
Wire Wire Line
	1700 6800 1700 6600
Connection ~ 2050 6400
Wire Wire Line
	9350 1400 9600 1400
Wire Wire Line
	9600 1400 9600 3200
Wire Wire Line
	9600 3200 9350 3200
Wire Wire Line
	9350 3300 9600 3300
Wire Wire Line
	9600 3300 9600 5350
Wire Wire Line
	9600 5350 9350 5350
Wire Wire Line
	9350 5450 9900 5450
Wire Wire Line
	9900 5450 9900 650 
Wire Wire Line
	9900 650  12900 650 
Wire Wire Line
	12900 650  12900 1300
Wire Wire Line
	12900 1400 13150 1400
Wire Wire Line
	13150 1400 13150 3300
Wire Wire Line
	13150 3300 12900 3300
Wire Wire Line
	12900 3400 13150 3400
Wire Wire Line
	13150 3400 13150 5350
Wire Wire Line
	13150 5350 12900 5350
Wire Wire Line
	850  2100 850  3200
Connection ~ 850  2400
Connection ~ 850  2700
Connection ~ 850  3000
Wire Wire Line
	2100 4600 2000 4600
Wire Wire Line
	2100 4400 2000 4400
Wire Wire Line
	2100 4300 2000 4300
Wire Wire Line
	6200 5400 6200 4800
Wire Wire Line
	1700 6400 3900 6400
Wire Wire Line
	5900 7500 5650 7500
Connection ~ 2050 6800
Wire Wire Line
	5250 7100 6050 7100
Wire Wire Line
	4400 7250 5100 7250
Wire Wire Line
	5100 7250 5100 7750
Connection ~ 5650 7100
Connection ~ 5900 7100
Connection ~ 2350 6400
Wire Wire Line
	5800 4800 5550 4800
Wire Wire Line
	5550 4800 5550 5100
Wire Wire Line
	5550 5100 5100 5100
Wire Wire Line
	5100 5200 5550 5200
Wire Wire Line
	5550 5200 5550 5400
Wire Wire Line
	5550 5400 5800 5400
Wire Wire Line
	2100 4500 2000 4500
Wire Wire Line
	1550 3700 2100 3700
Wire Wire Line
	2100 3800 1550 3800
Wire Wire Line
	1550 3900 2100 3900
Wire Wire Line
	1550 4000 2100 4000
$Comp
L CD4504 U9
U 1 1 55A46552
P 2950 1450
F 0 "U9" H 3300 850 60  0000 C CNN
F 1 "CD4504" V 2950 1450 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 2950 1450 60  0001 C CNN
F 3 "" H 2950 1450 60  0000 C CNN
	1    2950 1450
	1    0    0    -1  
$EndComp
Text Label 7550 2900 1    60   ~ 0
GND
$Comp
L CD4504 U10
U 1 1 55A46C5F
P 5300 1450
F 0 "U10" H 5650 850 60  0000 C CNN
F 1 "CD4504" V 5300 1450 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 5300 1450 60  0001 C CNN
F 3 "" H 5300 1450 60  0000 C CNN
	1    5300 1450
	1    0    0    -1  
$EndComp
Text Label 2350 1900 2    60   ~ 0
GND
Text Label 4700 1900 2    60   ~ 0
GND
Wire Wire Line
	2350 1700 2250 1700
Wire Wire Line
	2350 1600 2250 1600
Wire Wire Line
	2350 1500 2250 1500
Wire Wire Line
	2350 1400 2250 1400
Wire Wire Line
	2350 1300 2250 1300
Wire Wire Line
	2350 1200 2250 1200
Text Label 2250 1700 2    60   ~ 0
STROBE1L
Text Label 2250 1600 2    60   ~ 0
STROBE2L
Text Label 2250 1500 2    60   ~ 0
STROBE3L
Text Label 2250 1200 2    60   ~ 0
STROBE6L
Text Label 2250 1300 2    60   ~ 0
STROBE5L
Text Label 2250 1400 2    60   ~ 0
STROBE4L
Wire Wire Line
	3550 1200 3650 1200
Wire Wire Line
	3550 1300 3650 1300
Wire Wire Line
	3550 1400 3650 1400
Wire Wire Line
	3550 1500 3650 1500
Wire Wire Line
	3550 1600 3650 1600
Wire Wire Line
	3550 1700 3650 1700
Text Label 3650 1200 0    60   ~ 0
STROBE6H
Text Label 3650 1300 0    60   ~ 0
STROBE5H
Text Label 3650 1400 0    60   ~ 0
STROBE4H
Text Label 3650 1700 0    60   ~ 0
STROBE1H
Text Label 3650 1600 0    60   ~ 0
STROBE2H
Text Label 3650 1500 0    60   ~ 0
STROBE3H
Text Label 2950 2200 3    60   ~ 0
GND
Text Label 5300 2200 3    60   ~ 0
GND
Text Label 2850 850  1    60   ~ 0
3v3
Text Label 3050 850  1    60   ~ 0
19v5
Text Label 5200 850  1    60   ~ 0
3v3
Text Label 5400 850  1    60   ~ 0
19v5
Wire Wire Line
	4700 1200 4600 1200
Wire Wire Line
	4700 1300 4600 1300
Wire Wire Line
	4700 1400 4600 1400
Wire Wire Line
	4700 1500 4600 1500
Text Label 4600 1200 2    60   ~ 0
DDL
Text Label 4600 1300 2    60   ~ 0
DBL
Text Label 4600 1400 2    60   ~ 0
DCL
Text Label 4600 1500 2    60   ~ 0
DAL
Wire Wire Line
	5900 1200 6000 1200
Wire Wire Line
	5900 1300 6000 1300
Wire Wire Line
	5900 1400 6000 1400
Wire Wire Line
	5900 1500 6000 1500
Text Label 6000 1200 0    60   ~ 0
DDH
Text Label 6000 1300 0    60   ~ 0
DBH
Text Label 6000 1400 0    60   ~ 0
DCH
Text Label 6000 1500 0    60   ~ 0
DAH
Text Label 10400 1350 2    60   ~ 0
DAH
Text Label 10400 1450 2    60   ~ 0
DBH
Text Label 10400 1550 2    60   ~ 0
DCH
Text Label 10400 1650 2    60   ~ 0
DDH
Entry Wire Line
	10150 1350 10050 1450
Entry Wire Line
	10150 1450 10050 1550
Entry Wire Line
	10150 1550 10050 1650
Entry Wire Line
	10150 1650 10050 1750
Wire Wire Line
	10150 1350 10500 1350
Wire Wire Line
	10150 1450 10500 1450
Wire Wire Line
	10150 1550 10500 1550
Wire Wire Line
	10150 1650 10500 1650
Wire Bus Line
	10050 1450 10050 1850
Text Label 6850 3250 2    60   ~ 0
DAH
Text Label 6850 3350 2    60   ~ 0
DBH
Text Label 6850 3450 2    60   ~ 0
DCH
Text Label 6850 3550 2    60   ~ 0
DDH
Entry Wire Line
	6600 3250 6500 3350
Entry Wire Line
	6600 3350 6500 3450
Entry Wire Line
	6600 3450 6500 3550
Entry Wire Line
	6600 3550 6500 3650
Wire Wire Line
	6600 3250 6950 3250
Wire Wire Line
	6600 3350 6950 3350
Wire Wire Line
	6600 3450 6950 3450
Wire Wire Line
	6600 3550 6950 3550
Wire Bus Line
	6500 3350 6500 3750
Text Label 10400 3350 2    60   ~ 0
DAH
Text Label 10400 3450 2    60   ~ 0
DBH
Text Label 10400 3550 2    60   ~ 0
DCH
Text Label 10400 3650 2    60   ~ 0
DDH
Entry Wire Line
	10150 3350 10050 3450
Entry Wire Line
	10150 3450 10050 3550
Entry Wire Line
	10150 3550 10050 3650
Entry Wire Line
	10150 3650 10050 3750
Wire Wire Line
	10150 3350 10500 3350
Wire Wire Line
	10150 3450 10500 3450
Wire Wire Line
	10150 3550 10500 3550
Wire Wire Line
	10150 3650 10500 3650
Wire Bus Line
	10050 3450 10050 3850
Text Label 10400 5400 2    60   ~ 0
DAH
Text Label 10400 5500 2    60   ~ 0
DBH
Text Label 10400 5600 2    60   ~ 0
DCH
Text Label 10400 5700 2    60   ~ 0
DDH
Entry Wire Line
	10150 5400 10050 5500
Entry Wire Line
	10150 5500 10050 5600
Entry Wire Line
	10150 5600 10050 5700
Entry Wire Line
	10150 5700 10050 5800
Wire Wire Line
	10150 5400 10500 5400
Wire Wire Line
	10150 5500 10500 5500
Wire Wire Line
	10150 5600 10500 5600
Wire Wire Line
	10150 5700 10500 5700
Wire Bus Line
	10050 5500 10050 5900
Text Label 6850 5400 2    60   ~ 0
DAH
Text Label 6850 5500 2    60   ~ 0
DBH
Text Label 6850 5600 2    60   ~ 0
DCH
Text Label 6850 5700 2    60   ~ 0
DDH
Entry Wire Line
	6600 5400 6500 5500
Entry Wire Line
	6600 5500 6500 5600
Entry Wire Line
	6600 5600 6500 5700
Entry Wire Line
	6600 5700 6500 5800
Wire Wire Line
	6600 5400 6950 5400
Wire Wire Line
	6600 5500 6950 5500
Wire Wire Line
	6600 5600 6950 5600
Wire Wire Line
	6600 5700 6950 5700
Wire Bus Line
	6500 5500 6500 5900
$Comp
L Maple_Mini_(BTE14-07) U1
U 1 1 556B3F72
P 3600 4050
F 0 "U1" H 4800 2700 60  0000 C CNN
F 1 "Maple_Mini_(BTE14-07)" V 3600 4050 60  0000 C CNN
F 2 "VFD:Maple_Mini_(BTE14-07)" H 3600 4050 60  0001 C CNN
F 3 "" H 3600 4050 60  0000 C CNN
	1    3600 4050
	1    0    0    -1  
$EndComp
NoConn ~ 2100 4700
NoConn ~ 2100 4800
$Comp
L PNP Q1
U 1 1 55A59784
P 6300 2800
F 0 "Q1" H 6300 2650 60  0000 R CNN
F 1 "PNP" H 6300 2950 60  0000 R CNN
F 2 "VFD:MMBT4403L" H 6300 2800 60  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MMBT4403LT1-D.PDF" H 6300 2800 60  0001 C CNN
	1    6300 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2600 6400 2600
$Comp
L SPEAKER SP1
U 1 1 55A59F64
P 4800 2700
F 0 "SP1" H 4700 2950 70  0000 C CNN
F 1 "SPEAKER" H 4700 2450 70  0000 C CNN
F 2 "Buzzers_Beepers:Buzzer_12x9.5RM7.6" H 4800 2700 60  0001 C CNN
F 3 "http://www.puiaudio.com/pdf/AT-1224-TWT-5V-2-R.pdf" H 4800 2700 60  0001 C CNN
	1    4800 2700
	1    0    0    -1  
$EndComp
$Comp
L PNP Q2
U 1 1 55A5A34B
P 4250 2400
F 0 "Q2" H 4250 2250 60  0000 R CNN
F 1 "PNP" H 4250 2550 60  0000 R CNN
F 2 "VFD:MMBT4403L" H 4250 2400 60  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MMBT4403LT1-D.PDF" H 4250 2400 60  0001 C CNN
	1    4250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2600 4350 2600
Wire Wire Line
	4350 2200 4450 2200
Text Label 4450 2200 0    60   ~ 0
3v3
Wire Wire Line
	3550 2400 3450 2400
Text Label 3450 2400 2    60   ~ 0
BUZ
Wire Wire Line
	4500 2800 4400 2800
Text Label 4400 2800 2    60   ~ 0
GND
NoConn ~ 2100 3300
Wire Wire Line
	6400 3000 6500 3000
Text Label 6500 3000 0    60   ~ 0
GRID
Text Label 6500 2600 0    60   ~ 0
19v5
Wire Wire Line
	5100 3400 5250 3400
Text Label 5250 3400 0    60   ~ 0
BUZ
NoConn ~ 5900 1700
NoConn ~ 4700 1700
Wire Wire Line
	4700 1600 4600 1600
Text Label 4600 1600 2    60   ~ 0
GRIDL
Wire Wire Line
	5900 1600 6000 1600
Text Label 6000 1600 0    60   ~ 0
GRIDH
Wire Wire Line
	5250 3300 5100 3300
Text Label 5250 3300 0    60   ~ 0
GRIDL
Wire Wire Line
	5600 2800 5500 2800
Text Label 5500 2800 2    60   ~ 0
GRIDH
Text Notes 5650 2500 0    60   ~ 0
Transistor boosts the 4504's\ncurrent sinking capacity.
$Comp
L R R4
U 1 1 55A5C5E1
P 3800 2400
F 0 "R4" V 3880 2400 40  0000 C CNN
F 1 "1k" V 3807 2401 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 3730 2400 30  0001 C CNN
F 3 "" H 3800 2400 30  0000 C CNN
	1    3800 2400
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 55A5C799
P 5850 2800
F 0 "R5" V 5930 2800 40  0000 C CNN
F 1 "1k" V 5857 2801 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5780 2800 30  0001 C CNN
F 3 "" H 5850 2800 30  0000 C CNN
	1    5850 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 4200 5200 4200
Wire Wire Line
	5100 4300 5200 4300
Text Label 5200 4200 0    60   ~ 0
GPS_RX
Text Label 5200 4300 0    60   ~ 0
GPS_TX
$Comp
L CONN_01X04 P2
U 1 1 55A5E2F9
P 1250 4400
F 0 "P2" H 1250 4650 50  0000 C CNN
F 1 "GPS" V 1350 4400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 1250 4400 60  0001 C CNN
F 3 "" H 1250 4400 60  0000 C CNN
	1    1250 4400
	1    0    0    1   
$EndComp
Wire Wire Line
	1050 4250 950  4250
Wire Wire Line
	1050 4350 950  4350
Wire Wire Line
	1050 4450 950  4450
Wire Wire Line
	1050 4550 950  4550
Text Label 950  4250 2    60   ~ 0
GND
Text Label 950  4350 2    60   ~ 0
GPS_TX
Text Label 950  4450 2    60   ~ 0
GPS_RX
Text Label 950  4550 2    60   ~ 0
3v3
$EndSCHEMATC
