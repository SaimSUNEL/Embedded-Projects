opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	12F1840
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
indf1	equ	1
pc	equ	2
pcl	equ	2
status	equ	3
fsr0l	equ	4
fsr0h	equ	5
fsr1l	equ	6
fsr1h	equ	7
bsr	equ	8
wreg	equ	9
intcon	equ	11
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_I2C_Initialize
	FNCALL	_main,_UART_Initialize
	FNROOT	_main
	FNCALL	_FNC,_UART_ReadByte
	FNCALL	_FNC,_I2C_Start
	FNCALL	_FNC,_I2C_SendByte
	FNCALL	_FNC,_UART_SendByte
	FNCALL	_FNC,_I2C_Stop
	FNCALL	_FNC,_I2C_ReadByte
	FNCALL	_FNC,_I2C_NACK
	FNCALL	_FNC,_EEPROM24C64_ClearAllData
	FNCALL	_EEPROM24C64_ClearAllData,_I2C_Start
	FNCALL	_EEPROM24C64_ClearAllData,_I2C_SendByte
	FNCALL	_EEPROM24C64_ClearAllData,_I2C_Stop
	FNCALL	intlevel1,_FNC
	global	intlevel1
	FNROOT	intlevel1
	global	_command
	global	_read
	global	_PORTA
psect	text334,local,class=CODE,delta=2
global __ptext334
__ptext334:
_PORTA	set	12
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA4
_RA4	set	100
	global	_RCIF
_RCIF	set	141
	global	_SSP1IF
_SSP1IF	set	139
	global	_TXIF
_TXIF	set	140
	global	_IRCF0
_IRCF0	set	1227
	global	_IRCF1
_IRCF1	set	1228
	global	_IRCF2
_IRCF2	set	1229
	global	_IRCF3
_IRCF3	set	1230
	global	_RCIE
_RCIE	set	1165
	global	_SCS0
_SCS0	set	1224
	global	_SCS1
_SCS1	set	1225
	global	_SPLLEN
_SPLLEN	set	1231
	global	_TRISA0
_TRISA0	set	1120
	global	_TRISA1
_TRISA1	set	1121
	global	_TRISA2
_TRISA2	set	1122
	global	_TRISA4
_TRISA4	set	1124
	global	_TRISA5
_TRISA5	set	1125
	global	_RXDTSEL
_RXDTSEL	set	2287
	global	_EEADR
_EEADR	set	401
	global	_ANSELA
_ANSELA	set	396
	global	_EECON1
_EECON1	set	405
	global	_EECON2
_EECON2	set	406
	global	_EEDATA
_EEDATA	set	403
	global	_RCREG
_RCREG	set	409
	global	_SPBRG
_SPBRG	set	411
	global	_TXREG
_TXREG	set	410
	global	_BRG16
_BRG16	set	3323
	global	_BRGH
_BRGH	set	3314
	global	_CREN
_CREN	set	3308
	global	_RD
_RD	set	3240
	global	_SPEN
_SPEN	set	3311
	global	_SYNC
_SYNC	set	3316
	global	_TRMT
_TRMT	set	3313
	global	_TXEN
_TXEN	set	3317
	global	_WR
_WR	set	3241
	global	_WREN
_WREN	set	3242
	global	_SSPADD
_SSPADD	set	530
	global	_SSPBUF
_SSPBUF	set	529
	global	_ACKDT
_ACKDT	set	4277
	global	_ACKEN
_ACKEN	set	4276
	global	_PEN
_PEN	set	4274
	global	_RCEN
_RCEN	set	4275
	global	_SEN
_SEN	set	4272
	global	_SMP
_SMP	set	4263
	global	_SSPEN
_SSPEN	set	4269
	global	_SSPM0
_SSPM0	set	4264
	global	_SSPM1
_SSPM1	set	4265
	global	_SSPM2
_SSPM2	set	4266
	global	_SSPM3
_SSPM3	set	4267
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_read:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_command:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	global __pbssCOMMON
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	clrf	((__pbssBANK0)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_I2C_NACK
?_I2C_NACK:	; 0 bytes @ 0x0
	global	??_I2C_NACK
??_I2C_NACK:	; 0 bytes @ 0x0
	global	?_I2C_SendByte
?_I2C_SendByte:	; 0 bytes @ 0x0
	global	??_I2C_SendByte
??_I2C_SendByte:	; 0 bytes @ 0x0
	global	??_I2C_ReadByte
??_I2C_ReadByte:	; 0 bytes @ 0x0
	global	?_I2C_Start
?_I2C_Start:	; 0 bytes @ 0x0
	global	??_I2C_Start
??_I2C_Start:	; 0 bytes @ 0x0
	global	?_I2C_Stop
?_I2C_Stop:	; 0 bytes @ 0x0
	global	??_I2C_Stop
??_I2C_Stop:	; 0 bytes @ 0x0
	global	?_I2C_Initialize
?_I2C_Initialize:	; 0 bytes @ 0x0
	global	??_UART_SendByte
??_UART_SendByte:	; 0 bytes @ 0x0
	global	??_UART_ReadByte
??_UART_ReadByte:	; 0 bytes @ 0x0
	global	?_UART_Initialize
?_UART_Initialize:	; 0 bytes @ 0x0
	global	?_EEPROM24C64_ClearAllData
?_EEPROM24C64_ClearAllData:	; 0 bytes @ 0x0
	global	?_FNC
?_FNC:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_I2C_ReadByte
?_I2C_ReadByte:	; 1 bytes @ 0x0
	global	?_UART_ReadByte
?_UART_ReadByte:	; 1 bytes @ 0x0
	global	?_UART_SendByte
?_UART_SendByte:	; 2 bytes @ 0x0
	global	I2C_SendByte@value
I2C_SendByte@value:	; 1 bytes @ 0x0
	global	UART_SendByte@value
UART_SendByte@value:	; 1 bytes @ 0x0
	ds	1
	global	??_EEPROM24C64_ClearAllData
??_EEPROM24C64_ClearAllData:	; 0 bytes @ 0x1
	ds	2
	global	EEPROM24C64_ClearAllData@address
EEPROM24C64_ClearAllData@address:	; 2 bytes @ 0x3
	ds	2
	global	EEPROM24C64_ClearAllData@i
EEPROM24C64_ClearAllData@i:	; 1 bytes @ 0x5
	ds	1
	global	EEPROM24C64_ClearAllData@sector
EEPROM24C64_ClearAllData@sector:	; 2 bytes @ 0x6
	ds	2
	global	??_FNC
??_FNC:	; 0 bytes @ 0x8
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	FNC@address
FNC@address:	; 2 bytes @ 0x0
	ds	2
	global	FNC@i_1948
FNC@i_1948:	; 4 bytes @ 0x2
	ds	4
	global	FNC@i
FNC@i:	; 1 bytes @ 0x6
	ds	1
	global	FNC@sector
FNC@sector:	; 2 bytes @ 0x7
	ds	2
	global	??_I2C_Initialize
??_I2C_Initialize:	; 0 bytes @ 0x9
	global	??_UART_Initialize
??_UART_Initialize:	; 0 bytes @ 0x9
	global	??_main
??_main:	; 0 bytes @ 0x9
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      12
;; BANK0           80     11      12
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _FNC in COMMON
;;
;;   _FNC->_EEPROM24C64_ClearAllData
;;   _EEPROM24C64_ClearAllData->_I2C_SendByte
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0       0
;;                                              9 BANK0      2     2      0
;;                     _I2C_Initialize
;;                    _UART_Initialize
;; ---------------------------------------------------------------------------------
;; (1) _UART_Initialize                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Initialize                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _FNC                                                 12    12      0     430
;;                                              8 COMMON     3     3      0
;;                                              0 BANK0      9     9      0
;;                      _UART_ReadByte
;;                          _I2C_Start
;;                       _I2C_SendByte
;;                      _UART_SendByte
;;                           _I2C_Stop
;;                       _I2C_ReadByte
;;                           _I2C_NACK
;;           _EEPROM24C64_ClearAllData
;; ---------------------------------------------------------------------------------
;; (3) _EEPROM24C64_ClearAllData                             7     7      0     181
;;                                              1 COMMON     7     7      0
;;                          _I2C_Start
;;                       _I2C_SendByte
;;                           _I2C_Stop
;; ---------------------------------------------------------------------------------
;; (3) _UART_ReadByte                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _UART_SendByte                                        1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _I2C_Stop                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _I2C_Start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _I2C_ReadByte                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _I2C_SendByte                                         1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _I2C_NACK                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_Initialize
;;   _UART_Initialize
;;
;; _FNC (ROOT)
;;   _UART_ReadByte
;;   _I2C_Start
;;   _I2C_SendByte
;;   _UART_SendByte
;;   _I2C_Stop
;;   _I2C_ReadByte
;;   _I2C_NACK
;;   _EEPROM24C64_ClearAllData
;;     _I2C_Start
;;     _I2C_SendByte
;;     _I2C_Stop
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BIGRAM              F0      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITCOMMON            E      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               E      B       C       2       85.7%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       7       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      18       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50      B       C       6       15.0%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50      0       0       8        0.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITBANK2            50      0       0       9        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BANK2               50      0       0      10        0.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;DATA                 0      0      1F      11        0.0%
;;BITSFR11             0      0       0      12        0.0%
;;SFR11                0      0       0      12        0.0%
;;BITSFR12             0      0       0      13        0.0%
;;SFR12                0      0       0      13        0.0%
;;BITSFR13             0      0       0      14        0.0%
;;SFR13                0      0       0      14        0.0%
;;BITSFR14             0      0       0      15        0.0%
;;SFR14                0      0       0      15        0.0%
;;BITSFR15             0      0       0      16        0.0%
;;SFR15                0      0       0      16        0.0%
;;BITSFR16             0      0       0      17        0.0%
;;SFR16                0      0       0      17        0.0%
;;BITSFR17             0      0       0      18        0.0%
;;SFR17                0      0       0      18        0.0%
;;BITSFR18             0      0       0      19        0.0%
;;SFR18                0      0       0      19        0.0%
;;BITSFR19             0      0       0      20        0.0%
;;SFR19                0      0       0      20        0.0%
;;BITSFR20             0      0       0      21        0.0%
;;SFR20                0      0       0      21        0.0%
;;BITSFR21             0      0       0      22        0.0%
;;SFR21                0      0       0      22        0.0%
;;BITSFR22             0      0       0      23        0.0%
;;SFR22                0      0       0      23        0.0%
;;BITSFR23             0      0       0      24        0.0%
;;SFR23                0      0       0      24        0.0%
;;BITSFR24             0      0       0      25        0.0%
;;SFR24                0      0       0      25        0.0%
;;BITSFR25             0      0       0      26        0.0%
;;SFR25                0      0       0      26        0.0%
;;BITSFR26             0      0       0      27        0.0%
;;SFR26                0      0       0      27        0.0%
;;BITSFR27             0      0       0      28        0.0%
;;SFR27                0      0       0      28        0.0%
;;BITSFR28             0      0       0      29        0.0%
;;SFR28                0      0       0      29        0.0%
;;BITSFR29             0      0       0      30        0.0%
;;SFR29                0      0       0      30        0.0%
;;BITSFR30             0      0       0      31        0.0%
;;SFR30                0      0       0      31        0.0%
;;BITSFR31             0      0       0      32        0.0%
;;SFR31                0      0       0      32        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 106 in file "../DataLogger.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_I2C_Initialize
;;		_UART_Initialize
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../DataLogger.c"
	line	106
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 12
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	108
	
l3861:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	109
	
l3863:	
	movlb 1	; select bank1
	bcf	(1231/8)^080h,(1231)&7
	line	111
	
l3865:	
	bsf	(1230/8)^080h,(1230)&7
	line	112
	
l3867:	
	bsf	(1229/8)^080h,(1229)&7
	line	113
	
l3869:	
	bcf	(1228/8)^080h,(1228)&7
	line	114
	
l3871:	
	bsf	(1227/8)^080h,(1227)&7
	line	116
	
l3873:	
	bsf	(1225/8)^080h,(1225)&7
	line	117
	
l3875:	
	bcf	(1224/8)^080h,(1224)&7
	line	119
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	121
	
l3877:	
	movlb 1	; select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	122
	
l3879:	
	movlb 2	; select bank2
	bsf	(2287/8)^0100h,(2287)&7
	line	123
	
l3881:	
	movlb 1	; select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	125
	
l3883:	
	fcall	_I2C_Initialize
	line	126
	
l3885:	
	opt asmopt_off
movlw	130
	movlb 0	; select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u2567:
	decfsz	((??_main+0)+0),f
	goto	u2567
	decfsz	((??_main+0)+0+1),f
	goto	u2567
	nop2
opt asmopt_on

	line	128
	
l3887:	
	movlb 1	; select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	129
	
l3889:	
	fcall	_UART_Initialize
	line	130
	
l3891:	
	opt asmopt_off
movlw	65
	movlb 0	; select bank0
movwf	((??_main+0)+0+1),f
	movlw	238
movwf	((??_main+0)+0),f
u2577:
	decfsz	((??_main+0)+0),f
	goto	u2577
	decfsz	((??_main+0)+0+1),f
	goto	u2577
	clrwdt
opt asmopt_on

	line	131
	
l3893:	
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	132
	
l3895:	
	bcf	(100/8),(100)&7
	goto	l1174
	line	135
	
l1173:	
	line	140
	
l1174:	
	line	135
	goto	l1174
	
l1175:	
	line	142
	
l1176:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_UART_Initialize
psect	text335,local,class=CODE,delta=2
global __ptext335
__ptext335:

;; *************** function _UART_Initialize *****************
;; Defined at:
;;		line 20 in file "../UART.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text335
	file	"../UART.h"
	line	20
	global	__size_of_UART_Initialize
	__size_of_UART_Initialize	equ	__end_of_UART_Initialize-_UART_Initialize
	
_UART_Initialize:	
	opt	stack 12
; Regs used in _UART_Initialize: [wreg]
	line	22
	
l3703:	
	movlb 3	; select bank3
	bsf	(3314/8)^0180h,(3314)&7
	line	23
	bcf	(3316/8)^0180h,(3316)&7
	line	24
	bcf	(3323/8)^0180h,(3323)&7
	line	25
	
l3705:	
	movlw	(019h)
	movwf	(411)^0180h	;volatile
	line	30
	
l3707:	
	bsf	(3317/8)^0180h,(3317)&7
	line	31
	
l3709:	
	bsf	(3308/8)^0180h,(3308)&7
	line	32
	
l3711:	
	movlb 0	; select bank0
	bcf	(140/8),(140)&7
	line	33
	
l3713:	
	bcf	(141/8),(141)&7
	line	34
	
l3715:	
	movlb 1	; select bank1
	bsf	(1165/8)^080h,(1165)&7
	line	35
	
l3717:	
	bsf	(94/8),(94)&7
	line	38
	
l3719:	
	movlb 3	; select bank3
	bsf	(3311/8)^0180h,(3311)&7
	line	39
	
l3721:	
	bsf	(95/8),(95)&7
	line	40
	
l1142:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Initialize
	__end_of_UART_Initialize:
;; =============== function _UART_Initialize ends ============

	signat	_UART_Initialize,88
	global	_I2C_Initialize
psect	text336,local,class=CODE,delta=2
global __ptext336
__ptext336:

;; *************** function _I2C_Initialize *****************
;; Defined at:
;;		line 55 in file "../I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text336
	file	"../I2C.h"
	line	55
	global	__size_of_I2C_Initialize
	__size_of_I2C_Initialize	equ	__end_of_I2C_Initialize-_I2C_Initialize
	
_I2C_Initialize:	
	opt	stack 12
; Regs used in _I2C_Initialize: [wreg]
	line	56
	
l3681:	
	movlb 1	; select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	57
	bsf	(1122/8)^080h,(1122)&7
	line	59
	movlb 4	; select bank4
	bsf	(4263/8)^0200h,(4263)&7
	line	62
	
l3683:	
	movlw	(09h)
	movwf	(530)^0200h	;volatile
	line	64
	
l3685:	
	bsf	(4267/8)^0200h,(4267)&7
	line	65
	
l3687:	
	bcf	(4266/8)^0200h,(4266)&7
	line	66
	
l3689:	
	bcf	(4265/8)^0200h,(4265)&7
	line	67
	
l3691:	
	bcf	(4264/8)^0200h,(4264)&7
	line	69
	
l3693:	
	bsf	(4269/8)^0200h,(4269)&7
	line	71
	
l1127:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Initialize
	__end_of_I2C_Initialize:
;; =============== function _I2C_Initialize ends ============

	signat	_I2C_Initialize,88
	global	_FNC
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:

;; *************** function _FNC *****************
;; Defined at:
;;		line 21 in file "../DataLogger.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    6[BANK0 ] unsigned char 
;;  i               4    2[BANK0 ] long 
;;  sector          2    7[BANK0 ] int 
;;  address         2    0[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       9       0       0
;;      Temps:          3       0       0       0
;;      Totals:         3       9       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_UART_ReadByte
;;		_I2C_Start
;;		_I2C_SendByte
;;		_UART_SendByte
;;		_I2C_Stop
;;		_I2C_ReadByte
;;		_I2C_NACK
;;		_EEPROM24C64_ClearAllData
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"../DataLogger.c"
	line	21
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 12
; Regs used in _FNC: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
psect	intentry
	pagesel	$
	movlb 0	; select bank0
	movf	btemp+1,w
	movwf	(??_FNC+2)
	line	24
	
i1l3785:	
	btfss	(141/8),(141)&7
	goto	u248_21
	goto	u248_20
u248_21:
	goto	i1l1170
u248_20:
	line	26
	
i1l3787:	
	fcall	_UART_ReadByte
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movlb 0	; select bank0
	movwf	(_command)
	line	29
	goto	i1l3859
	line	31
	
i1l1160:	
	line	32
	
i1l3789:	
	clrf	(FNC@sector)
	clrf	(FNC@sector+1)
	
i1l3791:	
	movf	(FNC@sector+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0800h))^80h
	subwf	btemp+1,w
	skipz
	goto	u249_25
	movlw	low(0800h)
	subwf	(FNC@sector),w
u249_25:

	skipc
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l3795
u249_20:
	goto	i1l1165
	
i1l3793:	
	goto	i1l1165
	line	33
	
i1l1161:	
	line	35
	
i1l3795:	
	movlb 0	; select bank0
	movf	(FNC@sector+1),w
	movwf	(??_FNC+0)+0+1
	movf	(FNC@sector),w
	movwf	(??_FNC+0)+0
	movlw	05h
u250_25:
	lslf	(??_FNC+0)+0,f
	rlf	(??_FNC+0)+1,f
	decfsz	wreg,f
	goto	u250_25
	movf	0+(??_FNC+0)+0,w
	movwf	(FNC@address)
	movf	1+(??_FNC+0)+0,w
	movwf	(FNC@address+1)
	line	36
	
i1l3797:	
	fcall	_I2C_Start
	line	38
	movlw	(0A0h)
	fcall	_I2C_SendByte
	line	41
	movlb 0	; select bank0
	movf	(FNC@address+1),w
	fcall	_I2C_SendByte
	line	44
	movlb 0	; select bank0
	movf	(FNC@address),w
	fcall	_I2C_SendByte
	line	47
	
i1l3799:	
	movlb 0	; select bank0
	clrf	(FNC@i)
	
i1l3801:	
	movlw	(020h)
	subwf	(FNC@i),w
	skipc
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l3805
u251_20:
	goto	i1l3815
	
i1l3803:	
	goto	i1l3815
	line	48
	
i1l1163:	
	line	49
	
i1l3805:	
	fcall	_UART_ReadByte
	fcall	_I2C_SendByte
	line	50
	
i1l3807:	
	opt asmopt_off
movlw	249
movwf	(??_FNC+0)+0,f
u258_27:
	clrwdt
decfsz	(??_FNC+0)+0,f
	goto	u258_27
	nop2	;nop
	clrwdt
opt asmopt_on

	line	51
	
i1l3809:	
	movlw	(054h)
	fcall	_UART_SendByte
	line	47
	
i1l3811:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movlb 0	; select bank0
	addwf	(FNC@i),f
	
i1l3813:	
	movlw	(020h)
	subwf	(FNC@i),w
	skipc
	goto	u252_21
	goto	u252_20
u252_21:
	goto	i1l3805
u252_20:
	goto	i1l3815
	
i1l1164:	
	line	54
	
i1l3815:	
	fcall	_I2C_Stop
	line	58
	
i1l3817:	
	opt asmopt_off
movlw	10
movwf	((??_FNC+0)+0+1),f
	movlw	21
movwf	((??_FNC+0)+0),f
u259_27:
	decfsz	((??_FNC+0)+0),f
	goto	u259_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u259_27
	nop2
opt asmopt_on

	line	32
	
i1l3819:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(FNC@sector),f
	movlw	high(01h)
	addwfc	(FNC@sector+1),f
	
i1l3821:	
	movf	(FNC@sector+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0800h))^80h
	subwf	btemp+1,w
	skipz
	goto	u253_25
	movlw	low(0800h)
	subwf	(FNC@sector),w
u253_25:

	skipc
	goto	u253_21
	goto	u253_20
u253_21:
	goto	i1l3795
u253_20:
	goto	i1l1165
	
i1l1162:	
	line	62
	goto	i1l1165
	line	63
	
i1l1166:	
	line	64
	
i1l3823:	
	fcall	_I2C_Start
	line	65
	
i1l3825:	
	movlw	(0A0h)
	fcall	_I2C_SendByte
	line	66
	
i1l3827:	
	movlw	(0)
	fcall	_I2C_SendByte
	line	67
	
i1l3829:	
	movlw	(0)
	fcall	_I2C_SendByte
	line	70
	
i1l3831:	
	fcall	_I2C_Stop
	line	72
	
i1l3833:	
	fcall	_I2C_Start
	line	74
	
i1l3835:	
	movlw	(0A1h)
	fcall	_I2C_SendByte
	line	76
	
i1l3837:	
	movlw	0
	movlb 0	; select bank0
	movwf	(FNC@i_1948+3)
	movlw	0
	movwf	(FNC@i_1948+2)
	movlw	0
	movwf	(FNC@i_1948+1)
	movlw	0
	movwf	(FNC@i_1948)

	
i1l3839:	
	movf	(FNC@i_1948+3),w
	xorlw	80h
	movwf	btemp+1
	movlw	0
	xorlw	80h
	subwf	btemp+1,w
	
	skipz
	goto	u254_23
	movlw	01h
	subwf	(FNC@i_1948+2),w
	skipz
	goto	u254_23
	movlw	0
	subwf	(FNC@i_1948+1),w
	skipz
	goto	u254_23
	movlw	0
	subwf	(FNC@i_1948),w
u254_23:
	skipc
	goto	u254_21
	goto	u254_20
u254_21:
	goto	i1l3843
u254_20:
	goto	i1l3851
	
i1l3841:	
	goto	i1l3851
	line	77
	
i1l1167:	
	line	78
	
i1l3843:	
	fcall	_I2C_ReadByte
	fcall	_UART_SendByte
	line	79
	
i1l3845:	
	opt asmopt_off
movlw	7
movwf	((??_FNC+0)+0+1),f
	movlw	125
movwf	((??_FNC+0)+0),f
u260_27:
	decfsz	((??_FNC+0)+0),f
	goto	u260_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u260_27
opt asmopt_on

	line	76
	
i1l3847:	
	movlw	01h
	movlb 0	; select bank0
	addwf	(FNC@i_1948),f
	movlw	0
	addwfc	(FNC@i_1948+1),f
	movlw	0
	addwfc	(FNC@i_1948+2),f
	movlw	0
	addwfc	(FNC@i_1948+3),f
	
i1l3849:	
	movf	(FNC@i_1948+3),w
	xorlw	80h
	movwf	btemp+1
	movlw	0
	xorlw	80h
	subwf	btemp+1,w
	
	skipz
	goto	u255_23
	movlw	01h
	subwf	(FNC@i_1948+2),w
	skipz
	goto	u255_23
	movlw	0
	subwf	(FNC@i_1948+1),w
	skipz
	goto	u255_23
	movlw	0
	subwf	(FNC@i_1948),w
u255_23:
	skipc
	goto	u255_21
	goto	u255_20
u255_21:
	goto	i1l3843
u255_20:
	goto	i1l3851
	
i1l1168:	
	line	82
	
i1l3851:	
	fcall	_I2C_NACK
	line	84
	fcall	_I2C_Stop
	line	85
	goto	i1l1165
	line	88
	
i1l1169:	
	line	89
	
i1l3853:	
	fcall	_EEPROM24C64_ClearAllData
	line	90
	
i1l3855:	
	movlw	(054h)
	fcall	_UART_SendByte
	line	91
	goto	i1l1165
	line	93
	
i1l3857:	
	goto	i1l1165
	line	29
	
i1l1159:	
	
i1l3859:	
	movlb 0	; select bank0
	movf	(_command),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 49 to 51
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           15     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	49^0	; case 49
	skipnz
	goto	i1l3789
	xorlw	50^49	; case 50
	skipnz
	goto	i1l3823
	xorlw	51^50	; case 51
	skipnz
	goto	i1l3853
	goto	i1l1165
	opt asmopt_on

	line	93
	
i1l1165:	
	line	95
	movlb 0	; select bank0
	bcf	(141/8),(141)&7
	goto	i1l1170
	line	96
	
i1l1158:	
	line	100
	
i1l1170:	
	movf	(??_FNC+2),w
	movwf	btemp+1
	retfie
	opt stack 0
GLOBAL	__end_of_FNC
	__end_of_FNC:
;; =============== function _FNC ends ============

	signat	_FNC,88
	global	_EEPROM24C64_ClearAllData
psect	text338,local,class=CODE,delta=2
global __ptext338
__ptext338:

;; *************** function _EEPROM24C64_ClearAllData *****************
;; Defined at:
;;		line 57 in file "../EEPROM24C64.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    5[COMMON] unsigned char 
;;  sector          2    6[COMMON] int 
;;  address         2    3[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         5       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_SendByte
;;		_I2C_Stop
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text338
	file	"../EEPROM24C64.h"
	line	57
	global	__size_of_EEPROM24C64_ClearAllData
	__size_of_EEPROM24C64_ClearAllData	equ	__end_of_EEPROM24C64_ClearAllData-_EEPROM24C64_ClearAllData
	
_EEPROM24C64_ClearAllData:	
	opt	stack 12
; Regs used in _EEPROM24C64_ClearAllData: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	59
	
i1l3755:	
	clrf	(EEPROM24C64_ClearAllData@sector)
	clrf	(EEPROM24C64_ClearAllData@sector+1)
	
i1l3757:	
	movf	(EEPROM24C64_ClearAllData@sector+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0800h))^80h
	subwf	btemp+1,w
	skipz
	goto	u243_25
	movlw	low(0800h)
	subwf	(EEPROM24C64_ClearAllData@sector),w
u243_25:

	skipc
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l3761
u243_20:
	goto	i1l1155
	
i1l3759:	
	goto	i1l1155
	line	60
	
i1l1151:	
	line	62
	
i1l3761:	
	movf	(EEPROM24C64_ClearAllData@sector+1),w
	movwf	(??_EEPROM24C64_ClearAllData+0)+0+1
	movf	(EEPROM24C64_ClearAllData@sector),w
	movwf	(??_EEPROM24C64_ClearAllData+0)+0
	movlw	05h
u244_25:
	lslf	(??_EEPROM24C64_ClearAllData+0)+0,f
	rlf	(??_EEPROM24C64_ClearAllData+0)+1,f
	decfsz	wreg,f
	goto	u244_25
	movf	0+(??_EEPROM24C64_ClearAllData+0)+0,w
	movwf	(EEPROM24C64_ClearAllData@address)
	movf	1+(??_EEPROM24C64_ClearAllData+0)+0,w
	movwf	(EEPROM24C64_ClearAllData@address+1)
	line	63
	
i1l3763:	
	fcall	_I2C_Start
	line	65
	movlw	(0A0h)
	fcall	_I2C_SendByte
	line	68
	movf	(EEPROM24C64_ClearAllData@address+1),w
	fcall	_I2C_SendByte
	line	71
	movf	(EEPROM24C64_ClearAllData@address),w
	fcall	_I2C_SendByte
	line	74
	
i1l3765:	
	clrf	(EEPROM24C64_ClearAllData@i)
	
i1l3767:	
	movlw	(020h)
	subwf	(EEPROM24C64_ClearAllData@i),w
	skipc
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l3771
u245_20:
	goto	i1l3777
	
i1l3769:	
	goto	i1l3777
	line	75
	
i1l1153:	
	
i1l3771:	
	movlw	(0)
	fcall	_I2C_SendByte
	line	74
	
i1l3773:	
	movlw	(01h)
	movwf	(??_EEPROM24C64_ClearAllData+0)+0
	movf	(??_EEPROM24C64_ClearAllData+0)+0,w
	addwf	(EEPROM24C64_ClearAllData@i),f
	
i1l3775:	
	movlw	(020h)
	subwf	(EEPROM24C64_ClearAllData@i),w
	skipc
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l3771
u246_20:
	goto	i1l3777
	
i1l1154:	
	line	77
	
i1l3777:	
	fcall	_I2C_Stop
	line	81
	
i1l3779:	
	opt asmopt_off
movlw	11
movwf	((??_EEPROM24C64_ClearAllData+0)+0+1),f
	movlw	98
movwf	((??_EEPROM24C64_ClearAllData+0)+0),f
u261_27:
	decfsz	((??_EEPROM24C64_ClearAllData+0)+0),f
	goto	u261_27
	decfsz	((??_EEPROM24C64_ClearAllData+0)+0+1),f
	goto	u261_27
	clrwdt
opt asmopt_on

	line	59
	
i1l3781:	
	movlw	low(01h)
	addwf	(EEPROM24C64_ClearAllData@sector),f
	movlw	high(01h)
	addwfc	(EEPROM24C64_ClearAllData@sector+1),f
	
i1l3783:	
	movf	(EEPROM24C64_ClearAllData@sector+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0800h))^80h
	subwf	btemp+1,w
	skipz
	goto	u247_25
	movlw	low(0800h)
	subwf	(EEPROM24C64_ClearAllData@sector),w
u247_25:

	skipc
	goto	u247_21
	goto	u247_20
u247_21:
	goto	i1l3761
u247_20:
	goto	i1l1155
	
i1l1152:	
	line	86
	
i1l1155:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM24C64_ClearAllData
	__end_of_EEPROM24C64_ClearAllData:
;; =============== function _EEPROM24C64_ClearAllData ends ============

	signat	_EEPROM24C64_ClearAllData,88
	global	_UART_ReadByte
psect	text339,local,class=CODE,delta=2
global __ptext339
__ptext339:

;; *************** function _UART_ReadByte *****************
;; Defined at:
;;		line 12 in file "../UART.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text339
	file	"../UART.h"
	line	12
	global	__size_of_UART_ReadByte
	__size_of_UART_ReadByte	equ	__end_of_UART_ReadByte-_UART_ReadByte
	
_UART_ReadByte:	
	opt	stack 13
; Regs used in _UART_ReadByte: [wreg]
	line	13
	
i1l3697:	
	goto	i1l1136
	
i1l1137:	
	
i1l1136:	
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l1136
u242_20:
	goto	i1l3699
	
i1l1138:	
	line	15
	
i1l3699:	
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	goto	i1l1139
	
i1l3701:	
	line	16
	
i1l1139:	
	return
	opt stack 0
GLOBAL	__end_of_UART_ReadByte
	__end_of_UART_ReadByte:
;; =============== function _UART_ReadByte ends ============

	signat	_UART_ReadByte,89
	global	_UART_SendByte
psect	text340,local,class=CODE,delta=2
global __ptext340
__ptext340:

;; *************** function _UART_SendByte *****************
;; Defined at:
;;		line 3 in file "../UART.h"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  1129[COMMON] int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text340
	file	"../UART.h"
	line	3
	global	__size_of_UART_SendByte
	__size_of_UART_SendByte	equ	__end_of_UART_SendByte-_UART_SendByte
	
_UART_SendByte:	
	opt	stack 13
; Regs used in _UART_SendByte: [wreg]
	movwf	(UART_SendByte@value)
	line	4
	
i1l3695:	
	movf	(UART_SendByte@value),w
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	6
	goto	i1l1130
	
i1l1131:	
	
i1l1130:	
	btfss	(3313/8)^0180h,(3313)&7
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l1130
u241_20:
	goto	i1l1133
	
i1l1132:	
	line	9
	
i1l1133:	
	return
	opt stack 0
GLOBAL	__end_of_UART_SendByte
	__end_of_UART_SendByte:
;; =============== function _UART_SendByte ends ============

	signat	_UART_SendByte,4218
	global	_I2C_Stop
psect	text341,local,class=CODE,delta=2
global __ptext341
__ptext341:

;; *************** function _I2C_Stop *****************
;; Defined at:
;;		line 47 in file "../I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM24C64_ClearAllData
;;		_FNC
;;		_EEPROM24C64_WriteByte
;;		_EEPROM24C64_ReadByte
;; This function uses a non-reentrant model
;;
psect	text341
	file	"../I2C.h"
	line	47
	global	__size_of_I2C_Stop
	__size_of_I2C_Stop	equ	__end_of_I2C_Stop-_I2C_Stop
	
_I2C_Stop:	
	opt	stack 12
; Regs used in _I2C_Stop: []
	line	48
	
i1l3679:	
	movlb 4	; select bank4
	bsf	(4274/8)^0200h,(4274)&7
	line	49
	goto	i1l1121
	
i1l1122:	
	
i1l1121:	
	btfsc	(4274/8)^0200h,(4274)&7
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l1121
u240_20:
	
i1l1123:	
	line	50
	movlb 0	; select bank0
	bcf	(139/8),(139)&7
	line	52
	
i1l1124:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Stop
	__end_of_I2C_Stop:
;; =============== function _I2C_Stop ends ============

	signat	_I2C_Stop,88
	global	_I2C_Start
psect	text342,local,class=CODE,delta=2
global __ptext342
__ptext342:

;; *************** function _I2C_Start *****************
;; Defined at:
;;		line 40 in file "../I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM24C64_ClearAllData
;;		_FNC
;;		_EEPROM24C64_WriteByte
;;		_EEPROM24C64_ReadByte
;; This function uses a non-reentrant model
;;
psect	text342
	file	"../I2C.h"
	line	40
	global	__size_of_I2C_Start
	__size_of_I2C_Start	equ	__end_of_I2C_Start-_I2C_Start
	
_I2C_Start:	
	opt	stack 12
; Regs used in _I2C_Start: []
	line	41
	
i1l3677:	
	movlb 4	; select bank4
	bsf	(4272/8)^0200h,(4272)&7
	line	42
	goto	i1l1115
	
i1l1116:	
	
i1l1115:	
	btfsc	(4272/8)^0200h,(4272)&7
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l1115
u239_20:
	
i1l1117:	
	line	43
	movlb 0	; select bank0
	bcf	(139/8),(139)&7
	line	44
	
i1l1118:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Start
	__end_of_I2C_Start:
;; =============== function _I2C_Start ends ============

	signat	_I2C_Start,88
	global	_I2C_ReadByte
psect	text343,local,class=CODE,delta=2
global __ptext343
__ptext343:

;; *************** function _I2C_ReadByte *****************
;; Defined at:
;;		line 31 in file "../I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;;		_EEPROM24C64_ReadByte
;; This function uses a non-reentrant model
;;
psect	text343
	file	"../I2C.h"
	line	31
	global	__size_of_I2C_ReadByte
	__size_of_I2C_ReadByte	equ	__end_of_I2C_ReadByte-_I2C_ReadByte
	
_I2C_ReadByte:	
	opt	stack 13
; Regs used in _I2C_ReadByte: [wreg]
	line	32
	
i1l3671:	
	movlb 4	; select bank4
	bsf	(4275/8)^0200h,(4275)&7
	line	33
	goto	i1l1109
	
i1l1110:	
	
i1l1109:	
	btfsc	(4275/8)^0200h,(4275)&7
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l1109
u238_20:
	
i1l1111:	
	line	34
	movlb 0	; select bank0
	bcf	(139/8),(139)&7
	line	35
	
i1l3673:	
	movlb 4	; select bank4
	movf	(529)^0200h,w	;volatile
	goto	i1l1112
	
i1l3675:	
	line	37
	
i1l1112:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_ReadByte
	__end_of_I2C_ReadByte:
;; =============== function _I2C_ReadByte ends ============

	signat	_I2C_ReadByte,89
	global	_I2C_SendByte
psect	text344,local,class=CODE,delta=2
global __ptext344
__ptext344:

;; *************** function _I2C_SendByte *****************
;; Defined at:
;;		line 23 in file "../I2C.h"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM24C64_ClearAllData
;;		_FNC
;;		_EEPROM24C64_WriteByte
;;		_EEPROM24C64_ReadByte
;; This function uses a non-reentrant model
;;
psect	text344
	file	"../I2C.h"
	line	23
	global	__size_of_I2C_SendByte
	__size_of_I2C_SendByte	equ	__end_of_I2C_SendByte-_I2C_SendByte
	
_I2C_SendByte:	
	opt	stack 12
; Regs used in _I2C_SendByte: [wreg]
	movwf	(I2C_SendByte@value)
	line	24
	
i1l3669:	
	movf	(I2C_SendByte@value),w
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	25
	goto	i1l1103
	
i1l1104:	
	
i1l1103:	
	movlb 0	; select bank0
	btfss	(139/8),(139)&7
	goto	u237_21
	goto	u237_20
u237_21:
	goto	i1l1103
u237_20:
	
i1l1105:	
	line	26
	bcf	(139/8),(139)&7
	line	28
	
i1l1106:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_SendByte
	__end_of_I2C_SendByte:
;; =============== function _I2C_SendByte ends ============

	signat	_I2C_SendByte,4216
	global	_I2C_NACK
psect	text345,local,class=CODE,delta=2
global __ptext345
__ptext345:

;; *************** function _I2C_NACK *****************
;; Defined at:
;;		line 7 in file "../I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;;		_EEPROM24C64_ReadByte
;; This function uses a non-reentrant model
;;
psect	text345
	file	"../I2C.h"
	line	7
	global	__size_of_I2C_NACK
	__size_of_I2C_NACK	equ	__end_of_I2C_NACK-_I2C_NACK
	
_I2C_NACK:	
	opt	stack 13
; Regs used in _I2C_NACK: []
	line	8
	
i1l3667:	
	movlb 4	; select bank4
	bsf	(4277/8)^0200h,(4277)&7
	line	9
	bsf	(4276/8)^0200h,(4276)&7
	line	10
	goto	i1l1091
	
i1l1092:	
	
i1l1091:	
	btfsc	(4276/8)^0200h,(4276)&7
	goto	u236_21
	goto	u236_20
u236_21:
	goto	i1l1091
u236_20:
	
i1l1093:	
	line	11
	movlb 0	; select bank0
	bcf	(139/8),(139)&7
	line	13
	
i1l1094:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_NACK
	__end_of_I2C_NACK:
;; =============== function _I2C_NACK ends ============

	signat	_I2C_NACK,88
psect	text346,local,class=CODE,delta=2
global __ptext346
__ptext346:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
