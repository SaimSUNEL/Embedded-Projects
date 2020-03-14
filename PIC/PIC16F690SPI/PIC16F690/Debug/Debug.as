opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F690
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
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_SoftwareSPI_Initialize
	FNCALL	_main,_EEPROM_24C040_WriteByte
	FNCALL	_main,_EEPROM_24C040_ReadByte
	FNCALL	_EEPROM_24C040_ReadByte,_SoftwareSPI_WriteByte
	FNCALL	_EEPROM_24C040_WriteByte,_SoftwareSPI_WriteByte
	FNROOT	_main
	global	_read
	global	_PORTC
psect	text172,local,class=CODE,delta=2
global __ptext172
__ptext172:
_PORTC	set	7
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB4
_RB4	set	52
	global	_RB6
_RB6	set	54
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_IRCF0
_IRCF0	set	1148
	global	_IRCF1
_IRCF1	set	1149
	global	_IRCF2
_IRCF2	set	1150
	global	_SCS
_SCS	set	1144
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC5
_TRISC5	set	1085
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_ANSEL
_ANSEL	set	286
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_read:
       ds      5

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_SoftwareSPI_Initialize
?_SoftwareSPI_Initialize:	; 0 bytes @ 0x0
	global	??_SoftwareSPI_Initialize
??_SoftwareSPI_Initialize:	; 0 bytes @ 0x0
	global	??_SoftwareSPI_WriteByte
??_SoftwareSPI_WriteByte:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_SoftwareSPI_WriteByte
?_SoftwareSPI_WriteByte:	; 1 bytes @ 0x0
	ds	2
	global	SoftwareSPI_WriteByte@d
SoftwareSPI_WriteByte@d:	; 2 bytes @ 0x2
	ds	2
	global	SoftwareSPI_WriteByte@spi_data
SoftwareSPI_WriteByte@spi_data:	; 1 bytes @ 0x4
	ds	1
	global	SoftwareSPI_WriteByte@result
SoftwareSPI_WriteByte@result:	; 1 bytes @ 0x5
	ds	1
	global	SoftwareSPI_WriteByte@rt
SoftwareSPI_WriteByte@rt:	; 1 bytes @ 0x6
	ds	1
	global	?_EEPROM_24C040_WriteByte
?_EEPROM_24C040_WriteByte:	; 0 bytes @ 0x7
	global	?_EEPROM_24C040_ReadByte
?_EEPROM_24C040_ReadByte:	; 1 bytes @ 0x7
	global	EEPROM_24C040_WriteByte@address
EEPROM_24C040_WriteByte@address:	; 2 bytes @ 0x7
	global	EEPROM_24C040_ReadByte@address
EEPROM_24C040_ReadByte@address:	; 2 bytes @ 0x7
	ds	2
	global	??_EEPROM_24C040_ReadByte
??_EEPROM_24C040_ReadByte:	; 0 bytes @ 0x9
	global	EEPROM_24C040_WriteByte@value
EEPROM_24C040_WriteByte@value:	; 1 bytes @ 0x9
	ds	1
	global	??_EEPROM_24C040_WriteByte
??_EEPROM_24C040_WriteByte:	; 0 bytes @ 0xA
	global	EEPROM_24C040_ReadByte@read
EEPROM_24C040_ReadByte@read:	; 1 bytes @ 0xA
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 5, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80      3       8
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_EEPROM_24C040_WriteByte
;;   _EEPROM_24C040_ReadByte->_SoftwareSPI_WriteByte
;;   _EEPROM_24C040_WriteByte->_SoftwareSPI_WriteByte
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0     451
;;                                              0 BANK0      3     3      0
;;             _SoftwareSPI_Initialize
;;            _EEPROM_24C040_WriteByte
;;             _EEPROM_24C040_ReadByte
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_24C040_ReadByte                               4     2      2     226
;;                                              7 COMMON     4     2      2
;;              _SoftwareSPI_WriteByte
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_24C040_WriteByte                              5     2      3     225
;;                                              7 COMMON     5     2      3
;;              _SoftwareSPI_WriteByte
;; ---------------------------------------------------------------------------------
;; (2) _SoftwareSPI_WriteByte                                7     7      0     159
;;                                              0 COMMON     7     7      0
;; ---------------------------------------------------------------------------------
;; (1) _SoftwareSPI_Initialize                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _SoftwareSPI_Initialize
;;   _EEPROM_24C040_WriteByte
;;     _SoftwareSPI_WriteByte
;;   _EEPROM_24C040_ReadByte
;;     _SoftwareSPI_WriteByte
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      3       8       3       10.0%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0      14       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0      16      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 17 in file "../PIC16f690SPI.c"
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
;;      Temps:          0       3       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SoftwareSPI_Initialize
;;		_EEPROM_24C040_WriteByte
;;		_EEPROM_24C040_ReadByte
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC16f690SPI.c"
	line	17
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	19
	
l3194:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	22
	
l3196:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1150/8)^080h,(1150)&7
	line	23
	
l3198:	
	bsf	(1149/8)^080h,(1149)&7
	line	24
	
l3200:	
	bcf	(1148/8)^080h,(1148)&7
	line	25
	
l3202:	
	bsf	(1144/8)^080h,(1144)&7
	line	26
	
l3204:	
	bcf	(1085/8)^080h,(1085)&7
	line	27
	
l3206:	
	bcf	(1086/8)^080h,(1086)&7
	line	28
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	30
	
l3208:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1080/8)^080h,(1080)&7
	line	31
	
l3210:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	33
	
l3212:	
	bsf	(62/8),(62)&7
	line	34
	
l3214:	
	fcall	_SoftwareSPI_Initialize
	line	36
	
l3216:	
	opt asmopt_off
movlw	195
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	205
movwf	((??_main+0)+0),f
u2407:
	decfsz	((??_main+0)+0),f
	goto	u2407
	decfsz	((??_main+0)+0+1),f
	goto	u2407
opt asmopt_on

	line	38
	
l3218:	
	movlw	low(01h)
	movwf	(?_EEPROM_24C040_WriteByte)
	movlw	high(01h)
	movwf	((?_EEPROM_24C040_WriteByte))+1
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C040_WriteByte)+02h
	fcall	_EEPROM_24C040_WriteByte
	line	39
	
l3220:	
	movlw	low(02h)
	movwf	(?_EEPROM_24C040_WriteByte)
	movlw	high(02h)
	movwf	((?_EEPROM_24C040_WriteByte))+1
	movlw	(049h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C040_WriteByte)+02h
	fcall	_EEPROM_24C040_WriteByte
	line	40
	
l3222:	
	movlw	low(03h)
	movwf	(?_EEPROM_24C040_WriteByte)
	movlw	high(03h)
	movwf	((?_EEPROM_24C040_WriteByte))+1
	movlw	(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C040_WriteByte)+02h
	fcall	_EEPROM_24C040_WriteByte
	line	41
	
l3224:	
	movlw	low(01FFh)
	movwf	(?_EEPROM_24C040_WriteByte)
	movlw	high(01FFh)
	movwf	((?_EEPROM_24C040_WriteByte))+1
	movlw	(047h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C040_WriteByte)+02h
	fcall	_EEPROM_24C040_WriteByte
	line	44
	
l3226:	
	movlw	low(0)
	movwf	(?_EEPROM_24C040_ReadByte)
	movlw	high(0)
	movwf	((?_EEPROM_24C040_ReadByte))+1
	fcall	_EEPROM_24C040_ReadByte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_read)
	line	45
	
l3228:	
	movlw	low(01h)
	movwf	(?_EEPROM_24C040_ReadByte)
	movlw	high(01h)
	movwf	((?_EEPROM_24C040_ReadByte))+1
	fcall	_EEPROM_24C040_ReadByte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_read)+01h
	line	46
	
l3230:	
	movlw	low(02h)
	movwf	(?_EEPROM_24C040_ReadByte)
	movlw	high(02h)
	movwf	((?_EEPROM_24C040_ReadByte))+1
	fcall	_EEPROM_24C040_ReadByte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_read)+02h
	line	47
	
l3232:	
	movlw	low(03h)
	movwf	(?_EEPROM_24C040_ReadByte)
	movlw	high(03h)
	movwf	((?_EEPROM_24C040_ReadByte))+1
	fcall	_EEPROM_24C040_ReadByte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_read)+03h
	line	48
	
l3234:	
	movlw	low(01FFh)
	movwf	(?_EEPROM_24C040_ReadByte)
	movlw	high(01FFh)
	movwf	((?_EEPROM_24C040_ReadByte))+1
	fcall	_EEPROM_24C040_ReadByte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_read)+04h
	goto	l3236
	line	51
	
l910:	
	line	53
	
l3236:	
	movlw	1<<((56)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((56)/8),f
	line	54
	
l3238:	
	movlw	1<<((57)&7)
	xorwf	((57)/8),f
	line	55
	
l3240:	
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2417:
	decfsz	((??_main+0)+0),f
	goto	u2417
	decfsz	((??_main+0)+0+1),f
	goto	u2417
	decfsz	((??_main+0)+0+2),f
	goto	u2417
	nop2
opt asmopt_on

	goto	l3236
	line	58
	
l911:	
	line	51
	goto	l3236
	
l912:	
	line	60
	
l913:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_EEPROM_24C040_ReadByte
psect	text173,local,class=CODE,delta=2
global __ptext173
__ptext173:

;; *************** function _EEPROM_24C040_ReadByte *****************
;; Defined at:
;;		line 28 in file "../EEPROM_24C040.h"
;; Parameters:    Size  Location     Type
;;  address         2    7[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  read            1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SoftwareSPI_WriteByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text173
	file	"../EEPROM_24C040.h"
	line	28
	global	__size_of_EEPROM_24C040_ReadByte
	__size_of_EEPROM_24C040_ReadByte	equ	__end_of_EEPROM_24C040_ReadByte-_EEPROM_24C040_ReadByte
	
_EEPROM_24C040_ReadByte:	
	opt	stack 6
; Regs used in _EEPROM_24C040_ReadByte: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l3176:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	31
	
l3178:	
	opt asmopt_off
movlw	6
movwf	(??_EEPROM_24C040_ReadByte+0)+0,f
u2427:
decfsz	(??_EEPROM_24C040_ReadByte+0)+0,f
	goto	u2427
	clrwdt
opt asmopt_on

	line	33
	
l3180:	
	movf	(EEPROM_24C040_ReadByte@address+1),w
	andlw	01h
	movwf	(??_EEPROM_24C040_ReadByte+0)+0
	movlw	(03h)-1
u2395:
	clrc
	rlf	(??_EEPROM_24C040_ReadByte+0)+0,f
	addlw	-1
	skipz
	goto	u2395
	clrc
	rlf	(??_EEPROM_24C040_ReadByte+0)+0,w
	iorlw	03h
	fcall	_SoftwareSPI_WriteByte
	line	34
	
l3182:	
	movf	(EEPROM_24C040_ReadByte@address),w
	fcall	_SoftwareSPI_WriteByte
	line	35
	
l3184:	
	movlw	(0)
	fcall	_SoftwareSPI_WriteByte
	movwf	(??_EEPROM_24C040_ReadByte+0)+0
	movf	(??_EEPROM_24C040_ReadByte+0)+0,w
	movwf	(EEPROM_24C040_ReadByte@read)
	line	36
	
l3186:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	37
	
l3188:	
	opt asmopt_off
movlw	6
movwf	(??_EEPROM_24C040_ReadByte+0)+0,f
u2437:
decfsz	(??_EEPROM_24C040_ReadByte+0)+0,f
	goto	u2437
	clrwdt
opt asmopt_on

	line	39
	
l3190:	
	movf	(EEPROM_24C040_ReadByte@read),w
	goto	l907
	
l3192:	
	line	41
	
l907:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_24C040_ReadByte
	__end_of_EEPROM_24C040_ReadByte:
;; =============== function _EEPROM_24C040_ReadByte ends ============

	signat	_EEPROM_24C040_ReadByte,4217
	global	_EEPROM_24C040_WriteByte
psect	text174,local,class=CODE,delta=2
global __ptext174
__ptext174:

;; *************** function _EEPROM_24C040_WriteByte *****************
;; Defined at:
;;		line 4 in file "../EEPROM_24C040.h"
;; Parameters:    Size  Location     Type
;;  address         2    7[COMMON] int 
;;  value           1    9[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         3       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SoftwareSPI_WriteByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text174
	file	"../EEPROM_24C040.h"
	line	4
	global	__size_of_EEPROM_24C040_WriteByte
	__size_of_EEPROM_24C040_WriteByte	equ	__end_of_EEPROM_24C040_WriteByte-_EEPROM_24C040_WriteByte
	
_EEPROM_24C040_WriteByte:	
	opt	stack 6
; Regs used in _EEPROM_24C040_WriteByte: [wreg+status,2+status,0+pclath+cstack]
	line	6
	
l3154:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	7
	
l3156:	
	opt asmopt_off
movlw	6
movwf	(??_EEPROM_24C040_WriteByte+0)+0,f
u2447:
decfsz	(??_EEPROM_24C040_WriteByte+0)+0,f
	goto	u2447
	clrwdt
opt asmopt_on

	line	8
	
l3158:	
	movlw	(06h)
	fcall	_SoftwareSPI_WriteByte
	line	9
	
l3160:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	10
	
l3162:	
	opt asmopt_off
movlw	13
movwf	((??_EEPROM_24C040_WriteByte+0)+0+1),f
	movlw	251
movwf	((??_EEPROM_24C040_WriteByte+0)+0),f
u2457:
	decfsz	((??_EEPROM_24C040_WriteByte+0)+0),f
	goto	u2457
	decfsz	((??_EEPROM_24C040_WriteByte+0)+0+1),f
	goto	u2457
	nop2
opt asmopt_on

	line	12
	
l3164:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	13
	
l3166:	
	opt asmopt_off
movlw	6
movwf	(??_EEPROM_24C040_WriteByte+0)+0,f
u2467:
decfsz	(??_EEPROM_24C040_WriteByte+0)+0,f
	goto	u2467
	clrwdt
opt asmopt_on

	line	14
	
l3168:	
	movf	(EEPROM_24C040_WriteByte@address+1),w
	andlw	01h
	movwf	(??_EEPROM_24C040_WriteByte+0)+0
	movlw	(03h)-1
u2385:
	clrc
	rlf	(??_EEPROM_24C040_WriteByte+0)+0,f
	addlw	-1
	skipz
	goto	u2385
	clrc
	rlf	(??_EEPROM_24C040_WriteByte+0)+0,w
	iorlw	02h
	fcall	_SoftwareSPI_WriteByte
	line	15
	
l3170:	
	movf	(EEPROM_24C040_WriteByte@address),w
	fcall	_SoftwareSPI_WriteByte
	line	16
	
l3172:	
	movf	(EEPROM_24C040_WriteByte@value),w
	fcall	_SoftwareSPI_WriteByte
	line	18
	
l3174:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	21
	opt asmopt_off
movlw	65
movwf	((??_EEPROM_24C040_WriteByte+0)+0+1),f
	movlw	238
movwf	((??_EEPROM_24C040_WriteByte+0)+0),f
u2477:
	decfsz	((??_EEPROM_24C040_WriteByte+0)+0),f
	goto	u2477
	decfsz	((??_EEPROM_24C040_WriteByte+0)+0+1),f
	goto	u2477
	clrwdt
opt asmopt_on

	line	25
	
l904:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_24C040_WriteByte
	__end_of_EEPROM_24C040_WriteByte:
;; =============== function _EEPROM_24C040_WriteByte ends ============

	signat	_EEPROM_24C040_WriteByte,8312
	global	_SoftwareSPI_WriteByte
psect	text175,local,class=CODE,delta=2
global __ptext175
__ptext175:

;; *************** function _SoftwareSPI_WriteByte *****************
;; Defined at:
;;		line 21 in file "../SoftwareSPI.h"
;; Parameters:    Size  Location     Type
;;  spi_data        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  spi_data        1    4[COMMON] unsigned char 
;;  d               2    2[COMMON] int 
;;  rt              1    6[COMMON] unsigned char 
;;  result          1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM_24C040_WriteByte
;;		_EEPROM_24C040_ReadByte
;; This function uses a non-reentrant model
;;
psect	text175
	file	"../SoftwareSPI.h"
	line	21
	global	__size_of_SoftwareSPI_WriteByte
	__size_of_SoftwareSPI_WriteByte	equ	__end_of_SoftwareSPI_WriteByte-_SoftwareSPI_WriteByte
	
_SoftwareSPI_WriteByte:	
	opt	stack 6
; Regs used in _SoftwareSPI_WriteByte: [wreg+status,2+status,0]
	line	28
	movwf	(SoftwareSPI_WriteByte@spi_data)
	
l3120:	
	clrf	(SoftwareSPI_WriteByte@result)
	line	29
	
l3122:	
	clrf	(SoftwareSPI_WriteByte@d)
	clrf	(SoftwareSPI_WriteByte@d+1)
	line	31
	
l3124:	
	opt asmopt_off
movlw	16
movwf	(??_SoftwareSPI_WriteByte+0)+0,f
u2487:
decfsz	(??_SoftwareSPI_WriteByte+0)+0,f
	goto	u2487
	clrwdt
opt asmopt_on

	line	32
	
l3126:	
	clrf	(SoftwareSPI_WriteByte@rt)
	
l3128:	
	movlw	(08h)
	subwf	(SoftwareSPI_WriteByte@rt),w
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l3132
u2310:
	goto	l895
	
l3130:	
	goto	l895
	line	33
	
l894:	
	line	36
	
l3132:	
	movlw	(01h)
	movwf	(??_SoftwareSPI_WriteByte+0)+0
	decf	(SoftwareSPI_WriteByte@rt),w
	xorlw	0ffh
	addlw	07h
	addlw	1
	goto	u2324
u2325:
	clrc
	rlf	(??_SoftwareSPI_WriteByte+0)+0,f
u2324:
	addlw	-1
	skipz
	goto	u2325
	movf	0+(??_SoftwareSPI_WriteByte+0)+0,w
	andwf	(SoftwareSPI_WriteByte@spi_data),w
	btfsc	status,2
	goto	u2331
	goto	u2330
u2331:
	goto	l896
u2330:
	line	39
	
l3134:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	40
	goto	l3136
	line	41
	
l896:	
	line	43
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
	goto	l3136
	line	44
	
l897:	
	line	45
	
l3136:	
	opt asmopt_off
movlw	3
movwf	(??_SoftwareSPI_WriteByte+0)+0,f
u2497:
decfsz	(??_SoftwareSPI_WriteByte+0)+0,f
	goto	u2497
opt asmopt_on

	line	47
	
l3138:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	48
	opt asmopt_off
movlw	19
movwf	(??_SoftwareSPI_WriteByte+0)+0,f
u2507:
decfsz	(??_SoftwareSPI_WriteByte+0)+0,f
	goto	u2507
	nop2	;nop
opt asmopt_on

	line	49
	
l3140:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(54/8),(54)&7
	line	50
	opt asmopt_off
movlw	3
movwf	(??_SoftwareSPI_WriteByte+0)+0,f
u2517:
decfsz	(??_SoftwareSPI_WriteByte+0)+0,f
	goto	u2517
opt asmopt_on

	line	52
	movlw	(07h)
	subwf	(SoftwareSPI_WriteByte@rt),w
	skipnc
	goto	u2341
	goto	u2340
u2341:
	goto	l3146
u2340:
	line	54
	
l3142:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(52/8),(52)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l3146
u2350:
	line	56
	
l3144:	
	movlw	(01h)
	movwf	(??_SoftwareSPI_WriteByte+0)+0
	decf	(SoftwareSPI_WriteByte@rt),w
	xorlw	0ffh
	addlw	06h
	addlw	1
	goto	u2364
u2365:
	clrc
	rlf	(??_SoftwareSPI_WriteByte+0)+0,f
u2364:
	addlw	-1
	skipz
	goto	u2365
	movf	0+(??_SoftwareSPI_WriteByte+0)+0,w
	movwf	(??_SoftwareSPI_WriteByte+1)+0
	movf	(??_SoftwareSPI_WriteByte+1)+0,w
	iorwf	(SoftwareSPI_WriteByte@result),f
	line	57
	goto	l3146
	line	58
	
l899:	
	goto	l3146
	line	61
	
l900:	
	goto	l3146
	
l898:	
	line	32
	
l3146:	
	movlw	(01h)
	movwf	(??_SoftwareSPI_WriteByte+0)+0
	movf	(??_SoftwareSPI_WriteByte+0)+0,w
	addwf	(SoftwareSPI_WriteByte@rt),f
	
l3148:	
	movlw	(08h)
	subwf	(SoftwareSPI_WriteByte@rt),w
	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l3132
u2370:
	
l895:	
	line	64
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
	line	65
	
l3150:	
	movf	(SoftwareSPI_WriteByte@result),w
	goto	l901
	
l3152:	
	line	67
	
l901:	
	return
	opt stack 0
GLOBAL	__end_of_SoftwareSPI_WriteByte
	__end_of_SoftwareSPI_WriteByte:
;; =============== function _SoftwareSPI_WriteByte ends ============

	signat	_SoftwareSPI_WriteByte,4217
	global	_SoftwareSPI_Initialize
psect	text176,local,class=CODE,delta=2
global __ptext176
__ptext176:

;; *************** function _SoftwareSPI_Initialize *****************
;; Defined at:
;;		line 6 in file "../SoftwareSPI.h"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text176
	file	"../SoftwareSPI.h"
	line	6
	global	__size_of_SoftwareSPI_Initialize
	__size_of_SoftwareSPI_Initialize	equ	__end_of_SoftwareSPI_Initialize-_SoftwareSPI_Initialize
	
_SoftwareSPI_Initialize:	
	opt	stack 7
; Regs used in _SoftwareSPI_Initialize: []
	line	8
	
l3118:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	9
	bcf	(1087/8)^080h,(1087)&7
	line	10
	bsf	(1076/8)^080h,(1076)&7
	line	12
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(54/8),(54)&7
	line	13
	bcf	(63/8),(63)&7
	line	15
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	18
	
l891:	
	return
	opt stack 0
GLOBAL	__end_of_SoftwareSPI_Initialize
	__end_of_SoftwareSPI_Initialize:
;; =============== function _SoftwareSPI_Initialize ends ============

	signat	_SoftwareSPI_Initialize,88
psect	text177,local,class=CODE,delta=2
global __ptext177
__ptext177:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
