opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F877A
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
	FNCALL	_main,_I2C_initialize
	FNCALL	_main,_EEPROM_24C32A_yaz
	FNCALL	_main,_EEPROM_24C32A_oku
	FNCALL	_EEPROM_24C32A_yaz,_I2C_start
	FNCALL	_EEPROM_24C32A_yaz,_I2C_send
	FNCALL	_EEPROM_24C32A_yaz,_I2C_stop
	FNCALL	_EEPROM_24C32A_oku,_I2C_start
	FNCALL	_EEPROM_24C32A_oku,_I2C_send
	FNCALL	_EEPROM_24C32A_oku,_I2C_stop
	FNCALL	_EEPROM_24C32A_oku,_I2C_read
	FNCALL	_EEPROM_24C32A_oku,_send_NACK
	FNCALL	_I2C_read,_bekle
	FNCALL	_I2C_send,_bekle
	FNROOT	_main
	global	_data
	global	_gelen
	global	_PORTB
psect	text274,local,class=CODE,delta=2
global __ptext274
__ptext274:
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_SSPBUF
_SSPBUF	set	19
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_SSPEN
_SSPEN	set	165
	global	_SSPIF
_SSPIF	set	99
	global	_SSPM0
_SSPM0	set	160
	global	_SSPM1
_SSPM1	set	161
	global	_SSPM2
_SSPM2	set	162
	global	_SSPM3
_SSPM3	set	163
	global	_SSPADD
_SSPADD	set	147
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_BF
_BF	set	1184
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_RSEN
_RSEN	set	1161
	global	_R_W
_R_W	set	1186
	global	_SEN
_SEN	set	1160
	global	_SMP
_SMP	set	1191
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
_data:
       ds      20

_gelen:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+015h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_I2C_start
?_I2C_start:	; 0 bytes @ 0x0
	global	??_I2C_start
??_I2C_start:	; 0 bytes @ 0x0
	global	?_send_NACK
?_send_NACK:	; 0 bytes @ 0x0
	global	??_send_NACK
??_send_NACK:	; 0 bytes @ 0x0
	global	?_bekle
?_bekle:	; 0 bytes @ 0x0
	global	??_bekle
??_bekle:	; 0 bytes @ 0x0
	global	?_I2C_stop
?_I2C_stop:	; 0 bytes @ 0x0
	global	??_I2C_stop
??_I2C_stop:	; 0 bytes @ 0x0
	global	?_I2C_initialize
?_I2C_initialize:	; 0 bytes @ 0x0
	global	??_I2C_initialize
??_I2C_initialize:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_I2C_read
?_I2C_read:	; 1 bytes @ 0x0
	global	?_I2C_send
?_I2C_send:	; 2 bytes @ 0x0
	ds	1
	global	??_I2C_send
??_I2C_send:	; 0 bytes @ 0x1
	global	??_I2C_read
??_I2C_read:	; 0 bytes @ 0x1
	global	I2C_send@c
I2C_send@c:	; 1 bytes @ 0x1
	ds	1
	global	?_EEPROM_24C32A_yaz
?_EEPROM_24C32A_yaz:	; 0 bytes @ 0x2
	global	?_EEPROM_24C32A_oku
?_EEPROM_24C32A_oku:	; 1 bytes @ 0x2
	global	EEPROM_24C32A_oku@adres
EEPROM_24C32A_oku@adres:	; 2 bytes @ 0x2
	global	EEPROM_24C32A_yaz@adres
EEPROM_24C32A_yaz@adres:	; 2 bytes @ 0x2
	ds	2
	global	??_EEPROM_24C32A_oku
??_EEPROM_24C32A_oku:	; 0 bytes @ 0x4
	global	EEPROM_24C32A_yaz@deger
EEPROM_24C32A_yaz@deger:	; 1 bytes @ 0x4
	ds	1
	global	??_EEPROM_24C32A_yaz
??_EEPROM_24C32A_yaz:	; 0 bytes @ 0x5
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	3
	global	main@adres
main@adres:	; 2 bytes @ 0xA
	ds	2
	global	main@a
main@a:	; 2 bytes @ 0xC
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 21, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      0      21
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_EEPROM_24C32A_yaz
;;   _EEPROM_24C32A_yaz->_I2C_send
;;   _EEPROM_24C32A_oku->_I2C_send
;;   _I2C_read->_bekle
;;   _I2C_send->_bekle
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
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
;; (0) _main                                                 7     7      0     245
;;                                              7 COMMON     7     7      0
;;                     _I2C_initialize
;;                  _EEPROM_24C32A_yaz
;;                  _EEPROM_24C32A_oku
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_24C32A_yaz                                    5     2      3      88
;;                                              2 COMMON     5     2      3
;;                          _I2C_start
;;                           _I2C_send
;;                           _I2C_stop
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_24C32A_oku                                    3     1      2      66
;;                                              2 COMMON     3     1      2
;;                          _I2C_start
;;                           _I2C_send
;;                           _I2C_stop
;;                           _I2C_read
;;                          _send_NACK
;; ---------------------------------------------------------------------------------
;; (2) _I2C_read                                             0     0      0       0
;;                              _bekle
;; ---------------------------------------------------------------------------------
;; (2) _I2C_send                                             1     1      0      22
;;                                              1 COMMON     1     1      0
;;                              _bekle
;; ---------------------------------------------------------------------------------
;; (3) _bekle                                                1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_initialize                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _I2C_stop                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _send_NACK                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _I2C_start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_initialize
;;   _EEPROM_24C32A_yaz
;;     _I2C_start
;;     _I2C_send
;;       _bekle
;;     _I2C_stop
;;   _EEPROM_24C32A_oku
;;     _I2C_start
;;     _I2C_send
;;       _bekle
;;     _I2C_stop
;;     _I2C_read
;;       _bekle
;;     _send_NACK
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      23       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0      15       5       26.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      26      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 380 in file "../I2CMaster.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               2   12[COMMON] int 
;;  adres           2   10[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_I2C_initialize
;;		_EEPROM_24C32A_yaz
;;		_EEPROM_24C32A_oku
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../I2CMaster.c"
	line	380
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	383
	
l2879:	
	movlw	(018h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	384
	
l2881:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	385
	
l2883:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	386
	
l2885:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	387
	
l2887:	
	fcall	_I2C_initialize
	line	389
	
l2889:	
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2517:
	decfsz	((??_main+0)+0),f
	goto	u2517
	decfsz	((??_main+0)+0+1),f
	goto	u2517
	decfsz	((??_main+0)+0+2),f
	goto	u2517
	nop2
opt asmopt_on

	line	392
	
l2891:	
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u2527:
	decfsz	((??_main+0)+0),f
	goto	u2527
	decfsz	((??_main+0)+0+1),f
	goto	u2527
	clrwdt
opt asmopt_on

	line	393
	
l2893:	
	movlw	low(0)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(0)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(020h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	394
	
l2895:	
	movlw	low(01h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(01h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(053h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	395
	
l2897:	
	movlw	low(02h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(02h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(041h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	396
	
l2899:	
	movlw	low(03h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(03h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(049h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	397
	
l2901:	
	movlw	low(04h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(04h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(04Dh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	398
	
l2903:	
	movlw	low(05h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(05h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(020h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	399
	
l2905:	
	movlw	low(06h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(06h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(053h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	400
	
l2907:	
	movlw	low(07h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(07h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(055h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	401
	
l2909:	
	movlw	low(08h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(08h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(04Eh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	402
	
l2911:	
	movlw	low(09h)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(09h)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(045h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	403
	
l2913:	
	movlw	low(0Ah)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(0Ah)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(04Ch)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	404
	
l2915:	
	movlw	low(0Bh)
	movwf	(?_EEPROM_24C32A_yaz)
	movlw	high(0Bh)
	movwf	((?_EEPROM_24C32A_yaz))+1
	movlw	(020h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_EEPROM_24C32A_yaz)+02h
	fcall	_EEPROM_24C32A_yaz
	line	408
	
l2917:	
	clrf	(main@a)
	clrf	(main@a+1)
	
l2919:	
	movf	(main@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2495
	movlw	low(014h)
	subwf	(main@a),w
u2495:

	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l2923
u2490:
	goto	l2929
	
l2921:	
	goto	l2929
	line	409
	
l745:	
	line	410
	
l2923:	
	movf	(main@a+1),w
	clrf	(?_EEPROM_24C32A_oku+1)
	addwf	(?_EEPROM_24C32A_oku+1)
	movf	(main@a),w
	clrf	(?_EEPROM_24C32A_oku)
	addwf	(?_EEPROM_24C32A_oku)

	fcall	_EEPROM_24C32A_oku
	movwf	(??_main+0)+0
	movf	(main@a),w
	addlw	_data&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	408
	
l2925:	
	movlw	low(01h)
	addwf	(main@a),f
	skipnc
	incf	(main@a+1),f
	movlw	high(01h)
	addwf	(main@a+1),f
	
l2927:	
	movf	(main@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2505
	movlw	low(014h)
	subwf	(main@a),w
u2505:

	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l2923
u2500:
	goto	l2929
	
l746:	
	line	417
	
l2929:	
	clrf	(main@adres)
	clrf	(main@adres+1)
	goto	l2931
	line	418
	
l747:	
	line	428
	
l2931:	
	opt asmopt_off
movlw	163
movwf	((??_main+0)+0+1),f
	movlw	85
movwf	((??_main+0)+0),f
u2537:
	decfsz	((??_main+0)+0),f
	goto	u2537
	decfsz	((??_main+0)+0+1),f
	goto	u2537
opt asmopt_on

	goto	l2931
	line	430
	
l748:	
	line	418
	goto	l2931
	
l749:	
	line	431
	
l750:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_EEPROM_24C32A_yaz
psect	text275,local,class=CODE,delta=2
global __ptext275
__ptext275:

;; *************** function _EEPROM_24C32A_yaz *****************
;; Defined at:
;;		line 355 in file "../I2CMaster.c"
;; Parameters:    Size  Location     Type
;;  adres           2    2[COMMON] int 
;;  deger           1    4[COMMON] unsigned char 
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_start
;;		_I2C_send
;;		_I2C_stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text275
	file	"../I2CMaster.c"
	line	355
	global	__size_of_EEPROM_24C32A_yaz
	__size_of_EEPROM_24C32A_yaz	equ	__end_of_EEPROM_24C32A_yaz-_EEPROM_24C32A_yaz
	
_EEPROM_24C32A_yaz:	
	opt	stack 5
; Regs used in _EEPROM_24C32A_yaz: [wreg+status,2+status,0+pclath+cstack]
	line	357
	
l2863:	
	fcall	_I2C_start
	line	359
	
l2865:	
	movlw	(0A0h)
	fcall	_I2C_send
	line	360
	opt asmopt_off
movlw	4
movwf	((??_EEPROM_24C32A_yaz+0)+0+1),f
	movlw	61
movwf	((??_EEPROM_24C32A_yaz+0)+0),f
u2547:
	decfsz	((??_EEPROM_24C32A_yaz+0)+0),f
	goto	u2547
	decfsz	((??_EEPROM_24C32A_yaz+0)+0+1),f
	goto	u2547
	nop2
opt asmopt_on

	line	365
	
l2867:	
	movf	(EEPROM_24C32A_yaz@adres+1),w
	fcall	_I2C_send
	line	366
	
l2869:	
	opt asmopt_off
movlw	83
movwf	(??_EEPROM_24C32A_yaz+0)+0,f
u2557:
decfsz	(??_EEPROM_24C32A_yaz+0)+0,f
	goto	u2557
opt asmopt_on

	line	367
	movf	(EEPROM_24C32A_yaz@adres),w
	fcall	_I2C_send
	line	368
	
l2871:	
	opt asmopt_off
movlw	4
movwf	((??_EEPROM_24C32A_yaz+0)+0+1),f
	movlw	61
movwf	((??_EEPROM_24C32A_yaz+0)+0),f
u2567:
	decfsz	((??_EEPROM_24C32A_yaz+0)+0),f
	goto	u2567
	decfsz	((??_EEPROM_24C32A_yaz+0)+0+1),f
	goto	u2567
	nop2
opt asmopt_on

	line	369
	
l2873:	
	movf	(EEPROM_24C32A_yaz@deger),w
	fcall	_I2C_send
	line	371
	
l2875:	
	fcall	_I2C_stop
	line	372
	
l2877:	
	opt asmopt_off
movlw	7
movwf	((??_EEPROM_24C32A_yaz+0)+0+1),f
	movlw	125
movwf	((??_EEPROM_24C32A_yaz+0)+0),f
u2577:
	decfsz	((??_EEPROM_24C32A_yaz+0)+0),f
	goto	u2577
	decfsz	((??_EEPROM_24C32A_yaz+0)+0+1),f
	goto	u2577
opt asmopt_on

	line	375
	
l742:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_24C32A_yaz
	__end_of_EEPROM_24C32A_yaz:
;; =============== function _EEPROM_24C32A_yaz ends ============

	signat	_EEPROM_24C32A_yaz,8312
	global	_EEPROM_24C32A_oku
psect	text276,local,class=CODE,delta=2
global __ptext276
__ptext276:

;; *************** function _EEPROM_24C32A_oku *****************
;; Defined at:
;;		line 337 in file "../I2CMaster.c"
;; Parameters:    Size  Location     Type
;;  adres           2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_start
;;		_I2C_send
;;		_I2C_stop
;;		_I2C_read
;;		_send_NACK
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text276
	file	"../I2CMaster.c"
	line	337
	global	__size_of_EEPROM_24C32A_oku
	__size_of_EEPROM_24C32A_oku	equ	__end_of_EEPROM_24C32A_oku-_EEPROM_24C32A_oku
	
_EEPROM_24C32A_oku:	
	opt	stack 5
; Regs used in _EEPROM_24C32A_oku: [wreg+status,2+status,0+pclath+cstack]
	line	339
	
l2841:	
	fcall	_I2C_start
	line	340
	
l2843:	
	movlw	(0A0h)
	fcall	_I2C_send
	line	341
	
l2845:	
	movf	(EEPROM_24C32A_oku@adres+1),w
	fcall	_I2C_send
	line	342
	
l2847:	
	movf	(EEPROM_24C32A_oku@adres),w
	fcall	_I2C_send
	line	343
	
l2849:	
	fcall	_I2C_stop
	line	344
	
l2851:	
	fcall	_I2C_start
	line	345
	
l2853:	
	movlw	(0A1h)
	fcall	_I2C_send
	line	346
	
l2855:	
	fcall	_I2C_read
	movwf	(??_EEPROM_24C32A_oku+0)+0
	movf	(??_EEPROM_24C32A_oku+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_gelen)
	line	347
	
l2857:	
	fcall	_send_NACK
	line	348
	
l2859:	
	fcall	_I2C_stop
	line	349
	opt asmopt_off
movlw	249
movwf	(??_EEPROM_24C32A_oku+0)+0,f
u2587:
	nop2
decfsz	(??_EEPROM_24C32A_oku+0)+0,f
	goto	u2587
	nop2	;nop
	nop2	;nop
opt asmopt_on

	line	350
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_gelen),w
	goto	l739
	
l2861:	
	line	352
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_24C32A_oku
	__end_of_EEPROM_24C32A_oku:
;; =============== function _EEPROM_24C32A_oku ends ============

	signat	_EEPROM_24C32A_oku,4217
	global	_I2C_read
psect	text277,local,class=CODE,delta=2
global __ptext277
__ptext277:

;; *************** function _I2C_read *****************
;; Defined at:
;;		line 274 in file "../I2CMaster.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_bekle
;; This function is called by:
;;		_EEPROM_24C32A_oku
;; This function uses a non-reentrant model
;;
psect	text277
	file	"../I2CMaster.c"
	line	274
	global	__size_of_I2C_read
	__size_of_I2C_read	equ	__end_of_I2C_read-_I2C_read
	
_I2C_read:	
	opt	stack 5
; Regs used in _I2C_read: [wreg+status,2+status,0+pclath+cstack]
	line	276
	
l2833:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1163/8)^080h,(1163)&7
	line	277
	
l2835:	
	fcall	_bekle
	line	278
	goto	l727
	
l728:	
	
l727:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1163/8)^080h,(1163)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l727
u2470:
	goto	l730
	
l729:	
	line	281
	goto	l730
	
l731:	
	
l730:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l730
u2480:
	
l732:	
	line	282
	bcf	(99/8),(99)&7
	line	283
	
l2837:	
	movf	(19),w	;volatile
	goto	l733
	
l2839:	
	line	286
	
l733:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_read
	__end_of_I2C_read:
;; =============== function _I2C_read ends ============

	signat	_I2C_read,89
	global	_I2C_send
psect	text278,local,class=CODE,delta=2
global __ptext278
__ptext278:

;; *************** function _I2C_send *****************
;; Defined at:
;;		line 260 in file "../I2CMaster.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  720[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_bekle
;; This function is called by:
;;		_EEPROM_24C32A_oku
;;		_EEPROM_24C32A_yaz
;; This function uses a non-reentrant model
;;
psect	text278
	file	"../I2CMaster.c"
	line	260
	global	__size_of_I2C_send
	__size_of_I2C_send	equ	__end_of_I2C_send-_I2C_send
	
_I2C_send:	
	opt	stack 5
; Regs used in _I2C_send: [wreg+status,2+status,0+pclath+cstack]
	movwf	(I2C_send@c)
	line	261
	
l2823:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1186/8)^080h,(1186)&7
	line	262
	bcf	(1184/8)^080h,(1184)&7
	line	263
	
l2825:	
	fcall	_bekle
	line	264
	
l2827:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	265
	
l2829:	
	movf	(I2C_send@c),w
	movwf	(19)	;volatile
	line	266
	goto	l721
	
l722:	
	
l721:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1184/8)^080h,(1184)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l721
u2460:
	goto	l2831
	
l723:	
	line	268
	
l2831:	
	movlw	1<<((48)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((48)/8),f
	line	269
	
l724:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_send
	__end_of_I2C_send:
;; =============== function _I2C_send ends ============

	signat	_I2C_send,4218
	global	_bekle
psect	text279,local,class=CODE,delta=2
global __ptext279
__ptext279:

;; *************** function _bekle *****************
;; Defined at:
;;		line 245 in file "../I2CMaster.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_send
;;		_I2C_read
;; This function uses a non-reentrant model
;;
psect	text279
	file	"../I2CMaster.c"
	line	245
	global	__size_of_bekle
	__size_of_bekle	equ	__end_of_bekle-_bekle
	
_bekle:	
	opt	stack 5
; Regs used in _bekle: [wreg]
	line	247
	
l2807:	
	goto	l2811
	
l710:	
	line	248
	
l2809:	
	opt asmopt_off
movlw	83
movwf	(??_bekle+0)+0,f
u2597:
decfsz	(??_bekle+0)+0,f
	goto	u2597
opt asmopt_on

	goto	l2811
	line	249
	
l709:	
	line	247
	
l2811:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1186/8)^080h,(1186)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l2809
u2400:
	
l2813:	
	btfsc	(1160/8)^080h,(1160)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l2809
u2410:
	
l2815:	
	btfsc	(1161/8)^080h,(1161)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l2809
u2420:
	
l2817:	
	btfsc	(1162/8)^080h,(1162)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l2809
u2430:
	
l2819:	
	btfsc	(1163/8)^080h,(1163)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l2809
u2440:
	
l2821:	
	btfsc	(1164/8)^080h,(1164)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l2809
u2450:
	goto	l712
	
l711:	
	line	251
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_bekle
	__end_of_bekle:
;; =============== function _bekle ends ============

	signat	_bekle,88
	global	_I2C_initialize
psect	text280,local,class=CODE,delta=2
global __ptext280
__ptext280:

;; *************** function _I2C_initialize *****************
;; Defined at:
;;		line 290 in file "../I2CMaster.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text280
	file	"../I2CMaster.c"
	line	290
	global	__size_of_I2C_initialize
	__size_of_I2C_initialize	equ	__end_of_I2C_initialize-_I2C_initialize
	
_I2C_initialize:	
	opt	stack 7
; Regs used in _I2C_initialize: [wreg]
	line	300
	
l1805:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(165/8),(165)&7
	line	311
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1191/8)^080h,(1191)&7
	line	324
	
l1807:	
	movlw	(09h)
	movwf	(147)^080h	;volatile
	line	325
	
l1809:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(163/8),(163)&7
	line	326
	
l1811:	
	bcf	(162/8),(162)&7
	line	327
	
l1813:	
	bcf	(161/8),(161)&7
	line	328
	
l1815:	
	bcf	(160/8),(160)&7
	line	334
	
l736:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_initialize
	__end_of_I2C_initialize:
;; =============== function _I2C_initialize ends ============

	signat	_I2C_initialize,88
	global	_I2C_stop
psect	text281,local,class=CODE,delta=2
global __ptext281
__ptext281:

;; *************** function _I2C_stop *****************
;; Defined at:
;;		line 253 in file "../I2CMaster.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM_24C32A_oku
;;		_EEPROM_24C32A_yaz
;; This function uses a non-reentrant model
;;
psect	text281
	file	"../I2CMaster.c"
	line	253
	global	__size_of_I2C_stop
	__size_of_I2C_stop	equ	__end_of_I2C_stop-_I2C_stop
	
_I2C_stop:	
	opt	stack 6
; Regs used in _I2C_stop: []
	line	255
	
l2805:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	256
	goto	l715
	
l716:	
	
l715:	
	btfsc	(1162/8)^080h,(1162)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l715
u2390:
	
l717:	
	line	257
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	258
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_stop
	__end_of_I2C_stop:
;; =============== function _I2C_stop ends ============

	signat	_I2C_stop,88
	global	_send_NACK
psect	text282,local,class=CODE,delta=2
global __ptext282
__ptext282:

;; *************** function _send_NACK *****************
;; Defined at:
;;		line 225 in file "../I2CMaster.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM_24C32A_oku
;; This function uses a non-reentrant model
;;
psect	text282
	file	"../I2CMaster.c"
	line	225
	global	__size_of_send_NACK
	__size_of_send_NACK	equ	__end_of_send_NACK-_send_NACK
	
_send_NACK:	
	opt	stack 6
; Regs used in _send_NACK: []
	line	226
	
l2803:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1165/8)^080h,(1165)&7
	line	227
	bsf	(1164/8)^080h,(1164)&7
	line	228
	goto	l697
	
l698:	
	
l697:	
	btfsc	(1164/8)^080h,(1164)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l697
u2380:
	goto	l700
	
l699:	
	line	232
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_send_NACK
	__end_of_send_NACK:
;; =============== function _send_NACK ends ============

	signat	_send_NACK,88
	global	_I2C_start
psect	text283,local,class=CODE,delta=2
global __ptext283
__ptext283:

;; *************** function _I2C_start *****************
;; Defined at:
;;		line 216 in file "../I2CMaster.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM_24C32A_oku
;;		_EEPROM_24C32A_yaz
;; This function uses a non-reentrant model
;;
psect	text283
	file	"../I2CMaster.c"
	line	216
	global	__size_of_I2C_start
	__size_of_I2C_start	equ	__end_of_I2C_start-_I2C_start
	
_I2C_start:	
	opt	stack 6
; Regs used in _I2C_start: []
	line	219
	
l2801:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	220
	goto	l691
	
l692:	
	
l691:	
	btfsc	(1160/8)^080h,(1160)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l691
u2370:
	goto	l694
	
l693:	
	line	223
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_start
	__end_of_I2C_start:
;; =============== function _I2C_start ends ============

	signat	_I2C_start,88
psect	text284,local,class=CODE,delta=2
global __ptext284
__ptext284:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
