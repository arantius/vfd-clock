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
$Comp
L Maple_Mini_(BTE14-07) U1
U 1 1 556B3F72
P 2600 1950
F 0 "U1" H 3800 600 60  0000 C CNN
F 1 "Maple_Mini_(BTE14-07)" V 2600 1950 60  0000 C CNN
F 2 "Sockets_DIP:DIP-40__600" H 2600 1950 60  0001 C CNN
F 3 "" H 2600 1950 60  0000 C CNN
	1    2600 1950
	1    0    0    -1  
$EndComp
Text Label 2500 850  1    60   ~ 0
3v3
NoConn ~ 2400 850 
Text Label 2650 3400 3    60   ~ 0
GND
Text Label 2550 3400 3    60   ~ 0
GND
$Comp
L IV-22 V1
U 1 1 556B5084
P 8650 1750
F 0 "V1" H 9000 1300 60  0000 C CNN
F 1 "IV-22" H 8700 2200 60  0000 C CNN
F 2 "VFD:DISP_IV-22_SOCKET" H 8650 1750 60  0001 C CNN
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
F 2 "VFD:DISP_IV-22_SOCKET" H 8650 3650 60  0001 C CNN
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
F 2 "VFD:DISP_IV-22_SOCKET" H 12200 1750 60  0001 C CNN
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
F 2 "VFD:DISP_IV-22_SOCKET" H 12200 3750 60  0001 C CNN
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
F 2 "VFD:DISP_IV-22_SOCKET" H 12200 5800 60  0001 C CNN
F 3 "" H 12200 5800 60  0000 C CNN
	1    12200 5800
	1    0    0    -1  
$EndComp
Text Label 7550 1000 1    60   ~ 0
19v5
Text Label 7500 2300 3    60   ~ 0
GND
Text Label 6750 1350 2    60   ~ 0
DA
Text Label 6750 1450 2    60   ~ 0
DB
Text Label 6750 1550 2    60   ~ 0
DC
Text Label 6750 1650 2    60   ~ 0
DD
Entry Wire Line
	6600 1350 6500 1450
Entry Wire Line
	6600 1450 6500 1550
Entry Wire Line
	6600 1550 6500 1650
Entry Wire Line
	6600 1650 6500 1750
Text Label 12900 5450 0    60   ~ 0
GND
Text Label 9350 1300 0    60   ~ 0
7v2
Text Label 9350 1700 0    60   ~ 0
19v5
Text Label 12900 1700 0    60   ~ 0
19v5
NoConn ~ 12900 2000
Text Label 9350 3600 0    60   ~ 0
19v5
NoConn ~ 9350 3900
NoConn ~ 9350 2000
Text Label 12900 3700 0    60   ~ 0
19v5
NoConn ~ 12900 4000
Text Label 12900 5750 0    60   ~ 0
19v5
NoConn ~ 12900 6050
Text Label 9350 5750 0    60   ~ 0
19v5
NoConn ~ 9350 6050
Entry Wire Line
	800  1600 900  1500
Entry Wire Line
	800  1700 900  1600
Entry Wire Line
	800  1800 900  1700
Entry Wire Line
	800  1900 900  1800
Entry Wire Line
	800  1600 900  1500
Text Label 950  1500 0    60   ~ 0
DA
Text Label 950  1600 0    60   ~ 0
DB
Text Label 950  1700 0    60   ~ 0
DC
Text Label 950  1800 0    60   ~ 0
DD
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
	12900 700  12900 1300
Wire Wire Line
	12900 1400 13350 1400
Wire Wire Line
	13350 1400 13350 2600
Wire Wire Line
	9350 2600 9350 3200
Wire Wire Line
	12900 2750 12900 3300
Wire Wire Line
	9350 4600 9350 5350
Wire Wire Line
	12900 4750 12900 5350
Wire Wire Line
	9850 1400 9850 700 
Wire Wire Line
	4100 1200 4200 1200
Wire Wire Line
	4100 1300 4200 1300
Wire Wire Line
	4100 1400 4200 1400
Wire Wire Line
	4100 1500 4200 1500
Wire Wire Line
	4100 1600 4200 1600
Wire Wire Line
	4100 1700 4200 1700
Wire Wire Line
	1100 1500 900  1500
Wire Wire Line
	1100 1600 900  1600
Wire Wire Line
	1100 1700 900  1700
Wire Wire Line
	1100 1800 900  1800
Wire Bus Line
	800  1600 800  2000
NoConn ~ 4100 1800
NoConn ~ 4100 1900
NoConn ~ 4100 2000
NoConn ~ 4100 2100
NoConn ~ 4100 2200
NoConn ~ 4100 2300
NoConn ~ 4100 2400
NoConn ~ 4100 2700
NoConn ~ 4100 2900
NoConn ~ 4100 3000
Text Label 4200 2600 0    60   ~ 0
SWCLK
Wire Wire Line
	4200 2600 4100 2600
Wire Wire Line
	4200 2500 4100 2500
Text Label 4200 2500 0    60   ~ 0
SWDIO
Wire Wire Line
	1000 2900 1100 2900
Text Label 1000 2900 2    60   ~ 0
RST
$Comp
L CONN_01X06 P1
U 1 1 556B80D4
P 4750 2500
F 0 "P1" H 4750 2850 50  0000 C CNN
F 1 "ST_LINK" V 4850 2500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 4750 2500 60  0001 C CNN
F 3 "" H 4750 2500 60  0000 C CNN
	1    4750 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 2250 5050 2250
Wire Wire Line
	4950 2350 5050 2350
Wire Wire Line
	4950 2450 5050 2450
Wire Wire Line
	4950 2550 5050 2550
Wire Wire Line
	4950 2650 5050 2650
Wire Wire Line
	4950 2750 5050 2750
NoConn ~ 5050 2250
Text Label 5050 2350 0    60   ~ 0
RST
Text Label 5050 2450 0    60   ~ 0
SWDIO
Text Label 5050 2550 0    60   ~ 0
GND
Text Label 5050 2650 0    60   ~ 0
SWCLK
Text Label 5050 2750 0    60   ~ 0
3v3
NoConn ~ 4100 3100
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
3v3
$Comp
L IV-22 V3
U 1 1 556B50EC
P 8650 5800
F 0 "V3" H 9000 5350 60  0000 C CNN
F 1 "IV-22" H 8700 6250 60  0000 C CNN
F 2 "VFD:DISP_IV-22_SOCKET" H 8650 5800 60  0001 C CNN
F 3 "" H 8650 5800 60  0000 C CNN
	1    8650 5800
	1    0    0    -1  
$EndComp
Text Label 4200 1200 0    60   ~ 0
STROBE1
Text Label 4200 1300 0    60   ~ 0
STROBE2
Text Label 4200 1400 0    60   ~ 0
STROBE3
Text Label 4200 1500 0    60   ~ 0
STROBE4
Text Label 4200 1600 0    60   ~ 0
STROBE5
Text Label 4200 1700 0    60   ~ 0
STROBE6
Text Label 6950 1900 2    60   ~ 0
STROBE1
Text Label 6950 2000 2    60   ~ 0
GND
Text Label 7550 2900 1    60   ~ 0
19v5
Text Label 7500 4200 3    60   ~ 0
GND
Text Label 6750 3250 2    60   ~ 0
DA
Text Label 6750 3350 2    60   ~ 0
DB
Text Label 6750 3450 2    60   ~ 0
DC
Text Label 6750 3550 2    60   ~ 0
DD
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
3v3
Text Label 6950 3800 2    60   ~ 0
STROBE2
Text Label 6950 3900 2    60   ~ 0
GND
Text Label 7550 5050 1    60   ~ 0
19v5
Text Label 7500 6350 3    60   ~ 0
GND
Text Label 6750 5400 2    60   ~ 0
DA
Text Label 6750 5500 2    60   ~ 0
DB
Text Label 6750 5600 2    60   ~ 0
DC
Text Label 6750 5700 2    60   ~ 0
DD
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
3v3
Text Label 6950 5950 2    60   ~ 0
STROBE3
Text Label 6950 6050 2    60   ~ 0
GND
Text Label 11100 5050 1    60   ~ 0
19v5
Text Label 11050 6350 3    60   ~ 0
GND
Text Label 10300 5400 2    60   ~ 0
DA
Text Label 10300 5500 2    60   ~ 0
DB
Text Label 10300 5600 2    60   ~ 0
DC
Text Label 10300 5700 2    60   ~ 0
DD
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
3v3
Text Label 10500 5950 2    60   ~ 0
STROBE6
Text Label 10500 6050 2    60   ~ 0
GND
Text Label 11100 3000 1    60   ~ 0
19v5
Text Label 11050 4300 3    60   ~ 0
GND
Text Label 10300 3350 2    60   ~ 0
DA
Text Label 10300 3450 2    60   ~ 0
DB
Text Label 10300 3550 2    60   ~ 0
DC
Text Label 10300 3650 2    60   ~ 0
DD
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
3v3
Text Label 10500 3900 2    60   ~ 0
STROBE5
Text Label 10500 4000 2    60   ~ 0
GND
Text Label 11100 1000 1    60   ~ 0
19v5
Text Label 11050 2300 3    60   ~ 0
GND
Text Label 10300 1350 2    60   ~ 0
DA
Text Label 10300 1450 2    60   ~ 0
DB
Text Label 10300 1550 2    60   ~ 0
DC
Text Label 10300 1650 2    60   ~ 0
DD
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
3v3
Text Label 10500 1900 2    60   ~ 0
STROBE4
Text Label 10500 2000 2    60   ~ 0
GND
Wire Wire Line
	9850 2750 9850 3300
Wire Wire Line
	12900 3400 13350 3400
Wire Wire Line
	13350 3400 13350 4600
Wire Wire Line
	9850 4750 9850 5450
NoConn ~ 1100 3000
NoConn ~ 1100 2700
NoConn ~ 1100 2600
NoConn ~ 1100 2500
NoConn ~ 1100 2400
NoConn ~ 1100 2300
NoConn ~ 1100 2200
NoConn ~ 1100 1900
$Comp
L PWR_FLAG #FLG01
U 1 1 556BACD7
P 9700 1400
F 0 "#FLG01" H 9700 1495 30  0001 C CNN
F 1 "PWR_FLAG" H 9700 1580 30  0000 C CNN
F 2 "" H 9700 1400 60  0000 C CNN
F 3 "" H 9700 1400 60  0000 C CNN
	1    9700 1400
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 556BACE9
P 9700 2600
F 0 "#FLG02" H 9700 2695 30  0001 C CNN
F 1 "PWR_FLAG" H 9700 2780 30  0000 C CNN
F 2 "" H 9700 2600 60  0000 C CNN
F 3 "" H 9700 2600 60  0000 C CNN
	1    9700 2600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG03
U 1 1 556BAD17
P 9700 3300
F 0 "#FLG03" H 9700 3395 30  0001 C CNN
F 1 "PWR_FLAG" H 9700 3480 30  0000 C CNN
F 2 "" H 9700 3300 60  0000 C CNN
F 3 "" H 9700 3300 60  0000 C CNN
	1    9700 3300
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG04
U 1 1 556BAD27
P 9700 4600
F 0 "#FLG04" H 9700 4695 30  0001 C CNN
F 1 "PWR_FLAG" H 9700 4780 30  0000 C CNN
F 2 "" H 9700 4600 60  0000 C CNN
F 3 "" H 9700 4600 60  0000 C CNN
	1    9700 4600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG05
U 1 1 556BAD37
P 9700 5450
F 0 "#FLG05" H 9700 5545 30  0001 C CNN
F 1 "PWR_FLAG" H 9700 5630 30  0000 C CNN
F 2 "" H 9700 5450 60  0000 C CNN
F 3 "" H 9700 5450 60  0000 C CNN
	1    9700 5450
	1    0    0    -1  
$EndComp
Connection ~ 9700 5450
Connection ~ 9700 4600
Connection ~ 9700 3300
Connection ~ 9700 2600
Connection ~ 9700 1400
NoConn ~ 1100 1400
NoConn ~ 1100 1200
Text Label 2700 850  1    60   ~ 0
7v2
Text Label 2800 850  1    60   ~ 0
Vbat
$Comp
L BATTERY BT1
U 1 1 556BB290
P 5250 1100
F 0 "BT1" H 5250 1300 50  0000 C CNN
F 1 "COIN_BATT" H 5250 910 50  0000 C CNN
F 2 "VFD:BATT2032-1060TR" H 5250 1100 60  0001 C CNN
F 3 "" H 5250 1100 60  0000 C CNN
	1    5250 1100
	0    -1   1    0   
$EndComp
Text Label 5250 1400 3    60   ~ 0
GND
Text Label 5250 800  1    60   ~ 0
Vbat
$Comp
L MC34063 U9
U 1 1 556BB66C
P 3350 6200
F 0 "U9" H 3500 6550 60  0000 L CNN
F 1 "MC34063" H 3450 5850 60  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3350 6200 60  0001 C CNN
F 3 "" H 3350 6200 60  0000 C CNN
	1    3350 6200
	1    0    0    -1  
$EndComp
Text Label 3350 6700 3    60   ~ 0
GND
Wire Wire Line
	9850 1400 9350 1400
Wire Wire Line
	9850 3300 9350 3300
Wire Wire Line
	9850 5450 9350 5450
Wire Wire Line
	9850 700  12900 700 
Wire Wire Line
	13350 2600 9350 2600
Wire Wire Line
	9850 2750 12900 2750
Wire Wire Line
	13350 4600 9350 4600
Wire Wire Line
	9850 4750 12900 4750
$Comp
L BARREL_JACK_2 CON1
U 1 1 556B8A83
P 1700 5050
F 0 "CON1" H 1700 5300 60  0000 C CNN
F 1 "BARREL_JACK_2" H 1700 4850 60  0000 C CNN
F 2 "Connect:JACK_ALIM" H 1700 5050 60  0001 C CNN
F 3 "" H 1700 5050 60  0000 C CNN
	1    1700 5050
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK_2 CON2
U 1 1 556B8B4E
P 1700 5650
F 0 "CON2" H 1700 5900 60  0000 C CNN
F 1 "BARREL_JACK_2" H 1700 5450 60  0000 C CNN
F 2 "" H 1700 5650 60  0000 C CNN
F 3 "" H 1700 5650 60  0000 C CNN
	1    1700 5650
	1    0    0    -1  
$EndComp
Text Label 2000 5150 0    60   ~ 0
GND
Text Label 2000 5750 0    60   ~ 0
GND
Wire Wire Line
	2000 4950 2250 4950
Wire Wire Line
	2250 4950 2250 5550
Text Label 2250 4950 0    60   ~ 0
19v5
$Comp
L PWR_FLAG #FLG06
U 1 1 556B8C3E
P 2100 4950
F 0 "#FLG06" H 2100 5045 30  0001 C CNN
F 1 "PWR_FLAG" H 2100 5130 30  0000 C CNN
F 2 "" H 2100 4950 60  0000 C CNN
F 3 "" H 2100 4950 60  0000 C CNN
	1    2100 4950
	1    0    0    -1  
$EndComp
Connection ~ 2250 5550
$Comp
L C C1
U 1 1 556B8E09
P 2500 6550
F 0 "C1" H 2500 6650 40  0000 L CNN
F 1 "330p" H 2506 6465 40  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2_P5" H 2538 6400 30  0001 C CNN
F 3 "" H 2500 6550 60  0000 C CNN
	1    2500 6550
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 6700 4450 6700
Wire Wire Line
	2900 6700 2900 6750
Wire Wire Line
	2900 6750 2500 6750
Connection ~ 3350 5550
Connection ~ 4200 6000
Wire Wire Line
	3350 5700 3350 5550
$Comp
L R R1
U 1 1 556B8F10
P 3950 5550
F 0 "R1" V 4030 5550 40  0000 C CNN
F 1 "0.22" V 3957 5551 40  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering" V 3880 5550 30  0001 C CNN
F 3 "" H 3950 5550 30  0000 C CNN
	1    3950 5550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 6100 4200 5550
Wire Wire Line
	2000 5550 3700 5550
Wire Wire Line
	4200 5750 2500 5750
Wire Wire Line
	2500 5750 2500 6050
Connection ~ 4200 5750
$Comp
L INDUCTOR L1
U 1 1 556B999E
P 4750 6250
F 0 "L1" V 4700 6250 40  0000 C CNN
F 1 "68u" V 4850 6250 40  0000 C CNN
F 2 "Inductors:INDUCTOR_V" H 4750 6250 60  0001 C CNN
F 3 "" H 4750 6250 60  0000 C CNN
	1    4750 6250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4450 6250 4200 6250
$Comp
L DIODESCH D1
U 1 1 556B9B16
P 4450 6450
F 0 "D1" H 4450 6550 40  0000 C CNN
F 1 "DIODESCH" H 4450 6350 40  0000 C CNN
F 2 "Diodes_SMD:Diode-SMA_Standard" H 4450 6450 60  0001 C CNN
F 3 "" H 4450 6450 60  0000 C CNN
	1    4450 6450
	0    -1   -1   0   
$EndComp
Connection ~ 4450 6250
Wire Wire Line
	4450 6700 4450 6650
Connection ~ 3350 6700
Wire Wire Line
	5050 6250 5400 6250
Text Label 5400 6250 0    60   ~ 0
7v2
$Comp
L R R3
U 1 1 556B9F22
P 5000 6850
F 0 "R3" V 5080 6850 40  0000 C CNN
F 1 "59.5k" V 5007 6851 40  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering" V 4930 6850 30  0001 C CNN
F 3 "" H 5000 6850 30  0000 C CNN
	1    5000 6850
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 6850 5250 6250
Connection ~ 5250 6250
$Comp
L R R2
U 1 1 556BA106
P 3950 7200
F 0 "R2" V 4030 7200 40  0000 C CNN
F 1 "12k" V 3957 7201 40  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering" V 3880 7200 30  0001 C CNN
F 3 "" H 3950 7200 30  0000 C CNN
	1    3950 7200
	0    -1   1    0   
$EndComp
$Comp
L POT RV1
U 1 1 556BA143
P 3450 7200
F 0 "RV1" H 3450 7100 50  0000 C CNN
F 1 "1k" H 3450 7200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 3450 7200 60  0001 C CNN
F 3 "" H 3450 7200 60  0000 C CNN
	1    3450 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6400 4200 7200
Wire Wire Line
	4200 6850 4750 6850
Connection ~ 4200 6850
Wire Wire Line
	3450 7050 3450 6700
Connection ~ 3450 6700
NoConn ~ 3200 7200
Connection ~ 2100 4950
$Comp
L PWR_FLAG #FLG07
U 1 1 556BADC6
P 5150 6250
F 0 "#FLG07" H 5150 6345 30  0001 C CNN
F 1 "PWR_FLAG" H 5150 6430 30  0000 C CNN
F 2 "" H 5150 6250 60  0000 C CNN
F 3 "" H 5150 6250 60  0000 C CNN
	1    5150 6250
	1    0    0    -1  
$EndComp
Connection ~ 5150 6250
Wire Wire Line
	5250 800  5500 800 
$Comp
L PWR_FLAG #FLG08
U 1 1 556BAEE3
P 5500 800
F 0 "#FLG08" H 5500 895 30  0001 C CNN
F 1 "PWR_FLAG" H 5500 980 30  0000 C CNN
F 2 "" H 5500 800 60  0000 C CNN
F 3 "" H 5500 800 60  0000 C CNN
	1    5500 800 
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C?
U 1 1 556BB1C3
P 5250 7050
F 0 "C?" H 5300 7150 40  0000 L CNN
F 1 "100u" H 5300 6950 40  0000 L CNN
F 2 "" H 5350 6900 30  0000 C CNN
F 3 "" H 5250 7050 300 0000 C CNN
	1    5250 7050
	1    0    0    -1  
$EndComp
Text Label 5250 7250 3    60   ~ 0
GND
$Comp
L CAPAPOL C?
U 1 1 556BB276
P 2350 5750
F 0 "C?" H 2400 5850 40  0000 L CNN
F 1 "100u" H 2400 5650 40  0000 L CNN
F 2 "~" H 2450 5600 30  0000 C CNN
F 3 "" H 2350 5750 300 0000 C CNN
	1    2350 5750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2350 5950 2000 5950
Wire Wire Line
	2000 5950 2000 5750
$EndSCHEMATC
