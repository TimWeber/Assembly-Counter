MPASM  5.51                        SECOND.ASM   4-2-2019  16:54:54         PAGE  1


LOC  OBJECT CODE     LINE SOURCE TEXT
  VALUE

                      00001 ;second.asm.    This is a PIC assembly language source file for a time delay
                      00002 ; Author:               Tim Weber
                      00003 ;Date:                  120319
                      00004 ;**********************************SETUP***************************
Warning[205]: Found directive in column 1. (include)
                      00005 include"P16F877.INC"            ; This tells the assembler to 'include'
                      00001         LIST
                      00002 
                      00003 ;==========================================================================
                      00004 ;  MPASM PIC16F877 processor include
                      00005 ; 
                      00006 ;  (c) Copyright 1999-2013 Microchip Technology, All rights reserved
                      00007 ;==========================================================================
                      00008 
                      00540         LIST
                      00006                                                         ; another source file
  00000020            00007 INNER   EQU H'0020'             ; register at address 20h is named INNER
  00000021            00008 OUTER   EQU     H'0021'                 ; register at address 21h is named OUTER
  000000FF            00009 delval  EQU H'00FF'             ; this is the delay time value 255
                      00010                                                         ; to allow you to single step around
                      00011 ;*******************************PORT SETUP*************************
0000   1683 1303      00012                 banksel TRISD           ;change register bank (page)
0002   0188           00013                 clrf    PORTD           ; make PORTD an output port
0003   1283 1303      00014                 banksel PORTD           ; change back to original bank
                      00015 ;************************************MAIN**************************
0005   3000           00016 start   movlw 0                         ; move 'literal' value 0 into the W register
0006   0088           00017                 movwf   PORTD           ; clear LEDs on PORTD
0007   0A88           00018 loop    incf    PORTD,F         ; update the LEDs by incrementing them
0008   200C           00019                 call    delay           ; Call delay subroutine
0009   0000           00020                 nop                                     ; do nothing at all for one machine cycle
Error[113]  : Symbol not previously defined (hex)
000A   2000           00021                 call    hex
                      00022                                                         ; except increment the program counter
000B   2807           00023                 goto    loop            ; go back to the instruction labelled 'loop'
                      00024 ;******************************DELAY SUBROUTINE****************
000C   30FF           00025 delay   movlw   delval          ; load w with delay time value
000D   00A1           00026                 movwf   OUTER           ; and put it into register for OUTER
000E   30FF           00027 delay1  movlw   delval          ; load the working register with the delay value
000F   00A0           00028                 movwf   INNER           ; put it into the register for INNER
0010   0BA0           00029 delay2  decfsz  INNER, F        ; count down one and skip if the number is 0
0011   2810           00030                 goto    delay2          ; go back and count down one until 0
0012   0BA1           00031                 decfsz  OUTER, F        ; count down one and skip if at 0
0013   280E           00032                 goto    delay1          
0014   0008           00033                 return                          ; return to call point
                      00034                 end                                     ; note that end is the very last line of code
MPASM  5.51                        SECOND.ASM   4-2-2019  16:54:54         PAGE  2


SYMBOL TABLE
  LABEL                             VALUE 

ACKDT                             00000005
ACKEN                             00000004
ACKSTAT                           00000006
ADCON0                            0000001F
ADCON1                            0000009F
ADCS0                             00000006
ADCS1                             00000007
ADDEN                             00000003
ADFM                              00000007
ADIE                              00000006
ADIF                              00000006
ADON                              00000000
ADRESH                            0000001E
ADRESL                            0000009E
BCLIE                             00000003
BCLIF                             00000003
BF                                00000000
BRGH                              00000002
C                                 00000000
CCP1CON                           00000017
CCP1IE                            00000002
CCP1IF                            00000002
CCP1M0                            00000000
CCP1M1                            00000001
CCP1M2                            00000002
CCP1M3                            00000003
CCP1X                             00000005
CCP1Y                             00000004
CCP2CON                           0000001D
CCP2IE                            00000000
CCP2IF                            00000000
CCP2M0                            00000000
CCP2M1                            00000001
CCP2M2                            00000002
CCP2M3                            00000003
CCP2X                             00000005
CCP2Y                             00000004
CCPR1                             00000015
CCPR1H                            00000016
CCPR1L                            00000015
CCPR2                             0000001B
CCPR2H                            0000001C
CCPR2L                            0000001B
CHS0                              00000003
CHS1                              00000004
CHS2                              00000005
CKE                               00000006
CKP                               00000004
CREN                              00000004
CSRC                              00000007
D                                 00000005
DATA_ADDRESS                      00000005
DC                                00000001
MPASM  5.51                        SECOND.ASM   4-2-2019  16:54:54         PAGE  3


SYMBOL TABLE
  LABEL                             VALUE 

D_A                               00000005
D_NOT_A                           00000005
EEADR                             0000010D
EEADRH                            0000010F
EECON1                            0000018C
EECON2                            0000018D
EEDATA                            0000010C
EEDATH                            0000010E
EEIE                              00000004
EEIF                              00000004
EEPGD                             00000007
F                                 00000001
FERR                              00000002
FSR                               00000004
GCEN                              00000007
GIE                               00000007
GO                                00000002
GO_DONE                           00000002
GO_NOT_DONE                       00000002
I2C_DATA                          00000005
I2C_READ                          00000002
I2C_START                         00000003
I2C_STOP                          00000004
IBF                               00000007
IBOV                              00000005
INDF                              00000000
INNER                             00000020
INTCON                            0000000B
INTE                              00000004
INTEDG                            00000006
INTF                              00000001
IRP                               00000007
NOT_A                             00000005
NOT_ADDRESS                       00000005
NOT_BO                            00000000
NOT_BOR                           00000000
NOT_DONE                          00000002
NOT_PD                            00000003
NOT_POR                           00000001
NOT_RBPU                          00000007
NOT_RC8                           00000006
NOT_T1SYNC                        00000002
NOT_TO                            00000004
NOT_TX8                           00000006
NOT_W                             00000002
NOT_WRITE                         00000002
OBF                               00000006
OERR                              00000001
OPTION_REG                        00000081
OUTER                             00000021
P                                 00000004
PCFG0                             00000000
PCFG1                             00000001
MPASM  5.51                        SECOND.ASM   4-2-2019  16:54:54         PAGE  4


SYMBOL TABLE
  LABEL                             VALUE 

PCFG2                             00000002
PCFG3                             00000003
PCL                               00000002
PCLATH                            0000000A
PCON                              0000008E
PEIE                              00000006
PEN                               00000002
PIE1                              0000008C
PIE2                              0000008D
PIR1                              0000000C
PIR2                              0000000D
PORTA                             00000005
PORTB                             00000006
PORTC                             00000007
PORTD                             00000008
PORTE                             00000009
PR2                               00000092
PS0                               00000000
PS1                               00000001
PS2                               00000002
PSA                               00000003
PSPIE                             00000007
PSPIF                             00000007
PSPMODE                           00000004
R                                 00000002
RA0                               00000000
RA1                               00000001
RA2                               00000002
RA3                               00000003
RA4                               00000004
RA5                               00000005
RB0                               00000000
RB1                               00000001
RB2                               00000002
RB3                               00000003
RB4                               00000004
RB5                               00000005
RB6                               00000006
RB7                               00000007
RBIE                              00000003
RBIF                              00000000
RC0                               00000000
RC1                               00000001
RC2                               00000002
RC3                               00000003
RC4                               00000004
RC5                               00000005
RC6                               00000006
RC7                               00000007
RC8_9                             00000006
RC9                               00000006
RCD8                              00000000
RCEN                              00000003
MPASM  5.51                        SECOND.ASM   4-2-2019  16:54:54         PAGE  5


SYMBOL TABLE
  LABEL                             VALUE 

RCIE                              00000005
RCIF                              00000005
RCREG                             0000001A
RCSTA                             00000018
RD                                00000000
RD0                               00000000
RD1                               00000001
RD2                               00000002
RD3                               00000003
RD4                               00000004
RD5                               00000005
RD6                               00000006
RD7                               00000007
RE0                               00000000
RE1                               00000001
RE2                               00000002
READ_WRITE                        00000002
RP0                               00000005
RP1                               00000006
RSEN                              00000001
RX9                               00000006
RX9D                              00000000
R_NOT_W                           00000002
R_W                               00000002
S                                 00000003
SEN                               00000000
SMP                               00000007
SPBRG                             00000099
SPEN                              00000007
SREN                              00000005
SSPADD                            00000093
SSPBUF                            00000013
SSPCON                            00000014
SSPCON2                           00000091
SSPEN                             00000005
SSPIE                             00000003
SSPIF                             00000003
SSPM0                             00000000
SSPM1                             00000001
SSPM2                             00000002
SSPM3                             00000003
SSPOV                             00000006
SSPSTAT                           00000094
STATUS                            00000003
SYNC                              00000004
T0CS                              00000005
T0IE                              00000005
T0IF                              00000002
T0SE                              00000004
T1CKPS0                           00000004
T1CKPS1                           00000005
T1CON                             00000010
T1INSYNC                          00000002
MPASM  5.51                        SECOND.ASM   4-2-2019  16:54:54         PAGE  6


SYMBOL TABLE
  LABEL                             VALUE 

T1OSCEN                           00000003
T1SYNC                            00000002
T2CKPS0                           00000000
T2CKPS1                           00000001
T2CON                             00000012
TMR0                              00000001
TMR0IE                            00000005
TMR0IF                            00000002
TMR1                              0000000E
TMR1CS                            00000001
TMR1H                             0000000F
TMR1IE                            00000000
TMR1IF                            00000000
TMR1L                             0000000E
TMR1ON                            00000000
TMR2                              00000011
TMR2IE                            00000001
TMR2IF                            00000001
TMR2ON                            00000002
TOUTPS0                           00000003
TOUTPS1                           00000004
TOUTPS2                           00000005
TOUTPS3                           00000006
TRISA                             00000085
TRISA0                            00000000
TRISA1                            00000001
TRISA2                            00000002
TRISA3                            00000003
TRISA4                            00000004
TRISA5                            00000005
TRISB                             00000086
TRISB0                            00000000
TRISB1                            00000001
TRISB2                            00000002
TRISB3                            00000003
TRISB4                            00000004
TRISB5                            00000005
TRISB6                            00000006
TRISB7                            00000007
TRISC                             00000087
TRISC0                            00000000
TRISC1                            00000001
TRISC2                            00000002
TRISC3                            00000003
TRISC4                            00000004
TRISC5                            00000005
TRISC6                            00000006
TRISC7                            00000007
TRISD                             00000088
TRISD0                            00000000
TRISD1                            00000001
TRISD2                            00000002
TRISD3                            00000003
MPASM  5.51                        SECOND.ASM   4-2-2019  16:54:54         PAGE  7


SYMBOL TABLE
  LABEL                             VALUE 

TRISD4                            00000004
TRISD5                            00000005
TRISD6                            00000006
TRISD7                            00000007
TRISE                             00000089
TRISE0                            00000000
TRISE1                            00000001
TRISE2                            00000002
TRMT                              00000001
TX8_9                             00000006
TX9                               00000006
TX9D                              00000000
TXD8                              00000000
TXEN                              00000005
TXIE                              00000004
TXIF                              00000004
TXREG                             00000019
TXSTA                             00000098
UA                                00000001
W                                 00000000
WCOL                              00000007
WR                                00000001
WREN                              00000002
WRERR                             00000003
Z                                 00000002
_BODEN_OFF                        00003FBF
_BODEN_ON                         00003FFF
_BOREN_OFF                        00003FBF
_BOREN_ON                         00003FFF
_CONFIG                           00002007
_CPD_OFF                          00003FFF
_CPD_ON                           00003EFF
_CP_ALL                           00000FCF
_CP_HALF                          00001FDF
_CP_OFF                           00003FFF
_CP_UPPER_256                     00002FEF
_DEBUG_OFF                        00003FFF
_DEBUG_ON                         000037FF
_DEVID1                           00002006
_FOSC_EXTRC                       00003FFF
_FOSC_HS                          00003FFE
_FOSC_LP                          00003FFC
_FOSC_XT                          00003FFD
_HS_OSC                           00003FFE
_IDLOC0                           00002000
_IDLOC1                           00002001
_IDLOC2                           00002002
_IDLOC3                           00002003
_LP_OSC                           00003FFC
_LVP_OFF                          00003F7F
_LVP_ON                           00003FFF
_PWRTE_OFF                        00003FFF
_PWRTE_ON                         00003FF7
MPASM  5.51                        SECOND.ASM   4-2-2019  16:54:54         PAGE  8


SYMBOL TABLE
  LABEL                             VALUE 

_RC_OSC                           00003FFF
_WDTE_OFF                         00003FFB
_WDTE_ON                          00003FFF
_WDT_OFF                          00003FFB
_WDT_ON                           00003FFF
_WRT_ENABLE_OFF                   00003DFF
_WRT_ENABLE_ON                    00003FFF
_WRT_OFF                          00003DFF
_WRT_ON                           00003FFF
_XT_OSC                           00003FFD
__16F877                          00000001
__DEBUG                           1
delay                             0000000C
delay1                            0000000E
delay2                            00000010
delval                            000000FF
loop                              00000007
start                             00000005


MEMORY USAGE MAP ('X' = Used,  '-' = Unused)

0000 : XXXXXXXXXXXXXXXX XXXXX----------- ---------------- ----------------

All other memory blocks unused.

Program Memory Words Used:    21
Program Memory Words Free:  8171


Errors   :     1
Warnings :     1 reported,     0 suppressed
Messages :     0 reported,     0 suppressed

