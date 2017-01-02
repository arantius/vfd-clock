A six digit clock based on the IV-22 Vacuum Fluorescent Display tube.

A learning project for me, using vacuum fluorescent display tubes and the STM32 processor for the first time.

I personally built one of these, and ended up with lots of spare parts.
I sold a _very limited_ number of kits, made up mostly of those spares.
I have no plans to assemble nor sell any further kits.
If you are interested in building this clock yourself, check out the Bill of Materials below, and the issues tab.

# Bill of Materials

| Part | Reference(s) | Value | Example Manufacturer Part Number |
| ---- | ------------ | ----- | -------------------------------- |
| Battery Holder | BT1 | n/a | BU2032SM-BT-GTR |
| Chip Capacitor (0603) | C1, C2 | 4pF | - |
| Electrolytic Capacitor | C3, C4, C5, C6 | 47μF | 25YXF47MEFC5X11 |
| Chip Capacitor (0603) | C7 | 330pF | n/a |
| DC Jack | CON2 | - | EJ508A |
| Diode | D1 | - | STPS130A |
| Inductor | L1 | 68μH | RCH8011NP-680L |
| Transistor | Q1, Q2 | - | 2N7002-7-F |
| Resistor | R1 | 0.22Ω | LR1LJR22 |
| Chip Resistor (0603) | R2 | 12.4kΩ | - |
| Chip Resistor (0603) | R3 | 54.9kΩ | - |
| Chip Resistor (0603) | R4, R5 | 1kΩ | - |
| Variable Resistor | RV1 | 4.7kΩ | PVA2A472A01R00 [#1](https://github.com/arantius/vfd-clock/issues/1) |
| Piezo Speaker | SP1 | - | AT-1224-TWT-5V-2-R [#2](https://github.com/arantius/vfd-clock/issues/2) |
| Tactile Switch | SW1, SW2, SW3, SW4 | - | FSM6JSMA |
| Microcontroller | U1 | Maple Mini | - |
| 7-Segment Driver (16-SOIC) | U2, U3, U4, U5, U6, U7 | - | CD4056BM96 |
| Boost Regulator (8-SOIC) | U8 | - | MC34063ACD-TR |
| Volt Level Shifter (16-TSSOP) | U9, U10 | - | CD4504BPWR |
| VFD Display Tube | V1, V2, V3, V4, V5, V6 | - | IV-22 (a.k.a. IN-22, IИ-22) |
| Watch Crystal | X1 | 32.7680kHz | CFS-20632768DZBB |
| Optional GPS | - | - | NEO-6M |

Notes:
 * The official [Baite store on Aliexpress ](https://www.aliexpress.com/store/product/x/213957_1400682373.html) is a reliable source of cheap clone Maple Mini boards.
 * You'll also need 72 single-pin sockets for the tubes, these are most commonly/affordably available on eBay.  Look for "nixie pin socket".  (They're $0.20 each from DigiKey, but as low as $0.05 each in quantity from eBay.)  These sockets raise the tube off the board so that the vaccum seal "nipple" has some room.  Plus the ability to remove and replace tubes is nice!
 * The optional GPS module, if used, should have an 0.1" four pin header of: Vcc, RX, TX, GND in that order.  I used a "Ublox NEO-6M" module.
