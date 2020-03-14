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
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_lcd_yaz
	FNCALL	_lcd_init,_lcd_command
	FNCALL	_lcd_init,_lcd_clear
	FNCALL	_lcd_yaz,_lcd_command
	FNCALL	_lcd_yaz,_lcd_data
	FNCALL	_lcd_goto,_lcd_command
	FNCALL	_lcd_clear,_lcd_command
	FNROOT	_main
	global	_custom
	global	_len
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"../PICLCD.c"
	line	14

;initializer for _custom
	retlw	0
	retlw	0Eh
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0Eh
	retlw	04h
	retlw	0
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	113

;initializer for _len
	retlw	01h
	global	_veri
	global	_deneme
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
_deneme:
       ds      1

	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RD1
_RD1	set	65
	global	_RD6
_RD6	set	70
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
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
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	68	;'D'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_1:	
	retlw	115	;'s'
	retlw	97	;'a'
	retlw	105	;'i'
	retlw	109	;'m'
	retlw	0
psect	strings
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_veri:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"../PICLCD.c"
_len:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"../PICLCD.c"
	line	14
_custom:
       ds      8

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+8)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_yaz
?_lcd_yaz:	; 2 bytes @ 0x0
	ds	2
	global	lcd_command@c
lcd_command@c:	; 1 bytes @ 0x2
	global	lcd_data@c
lcd_data@c:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x3
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x3
	global	??_lcd_yaz
??_lcd_yaz:	; 0 bytes @ 0x3
	global	lcd_goto@p_2
lcd_goto@p_2:	; 1 bytes @ 0x3
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x4
	global	lcd_goto@p_1
lcd_goto@p_1:	; 1 bytes @ 0x4
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x5
	global	lcd_yaz@p
lcd_yaz@p:	; 1 bytes @ 0x5
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	3
;;Data sizes: Strings 12, constant 0, data 9, bss 1, persistent 1 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      13
;; BANK0           80      0       8
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_yaz@p	PTR const unsigned char  size(1) Largest target is 7
;;		 -> STR_2(CODE[7]), STR_1(CODE[5]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_init
;;   _lcd_init->_lcd_clear
;;   _lcd_yaz->_lcd_command
;;   _lcd_yaz->_lcd_data
;;   _lcd_goto->_lcd_command
;;   _lcd_clear->_lcd_command
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
;; (0) _main                                                 3     3      0     345
;;                                              7 COMMON     3     3      0
;;                           _lcd_init
;;                           _lcd_goto
;;                            _lcd_yaz
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             2     2      0      60
;;                                              5 COMMON     2     2      0
;;                        _lcd_command
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (1) _lcd_yaz                                              3     3      0     210
;;                                              3 COMMON     3     3      0
;;                        _lcd_command
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     1      1      75
;;                                              3 COMMON     2     1      1
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (2) _lcd_clear                                            2     2      0      30
;;                                              3 COMMON     2     2      0
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             3     3      0      30
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _lcd_command                                          3     3      0      30
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_command
;;     _lcd_clear
;;       _lcd_command
;;   _lcd_goto
;;     _lcd_command
;;   _lcd_yaz
;;     _lcd_command
;;     _lcd_data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      18      12        0.0%
;;ABS                  0      0      15       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      0       8       5       10.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      A       D       1       92.9%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 315 in file "../PICLCD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_lcd_goto
;;		_lcd_yaz
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PICLCD.c"
	line	315
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	318
	
l2807:	
	movlw	(0DEh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_deneme)
	line	319
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	320
	
l2809:	
	clrf	(136)^080h	;volatile
	line	321
	
l2811:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	322
	
l2813:	
	clrf	(5)	;volatile
	line	323
	
l2815:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	324
	
l2817:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	325
	
l2819:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	326
	
l2821:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	328
	
l2823:	
	fcall	_lcd_init
	line	332
	
l2825:	
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u2357:
	decfsz	((??_main+0)+0),f
	goto	u2357
	decfsz	((??_main+0)+0+1),f
	goto	u2357
	nop2
opt asmopt_on

	line	341
	
l2827:	
	clrf	(?_lcd_goto)
	bsf	status,0
	rlf	(?_lcd_goto),f
	movlw	(01h)
	fcall	_lcd_goto
	line	343
	
l2829:	
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_yaz
	line	347
	
l2831:	
	opt asmopt_off
movlw  11
movwf	((??_main+0)+0+2),f
movlw	38
movwf	((??_main+0)+0+1),f
	movlw	102
movwf	((??_main+0)+0),f
u2367:
	decfsz	((??_main+0)+0),f
	goto	u2367
	decfsz	((??_main+0)+0+1),f
	goto	u2367
	decfsz	((??_main+0)+0+2),f
	goto	u2367
	nop2
opt asmopt_on

	line	348
	
l2833:	
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_yaz
	goto	l744
	line	352
	
l743:	
	
l744:	
	goto	l744
	
l745:	
	line	357
	
l746:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 85 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;		None
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
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_command
;;		_lcd_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text128
	file	"../LCD.h"
	line	85
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	86
	
l2797:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	87
	bcf	(58/8),(58)&7
	line	88
	bcf	(60/8),(60)&7
	line	89
	
l2799:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_init+0)+0,f
u2377:
	clrwdt
decfsz	(??_lcd_init+0)+0,f
	goto	u2377
	nop2	;nop
	clrwdt
opt asmopt_on

	line	90
	
l2801:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	91
	
l2803:	
	movlw	(02h)
	fcall	_lcd_command
	line	92
	
l2805:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_init+0)+0+1),f
	movlw	151
movwf	((??_lcd_init+0)+0),f
u2387:
	decfsz	((??_lcd_init+0)+0),f
	goto	u2387
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u2387
	nop2
opt asmopt_on

	line	93
	movlw	(028h)
	fcall	_lcd_command
	line	94
	movlw	(06h)
	fcall	_lcd_command
	line	96
	movlw	(06h)
	fcall	_lcd_command
	line	98
	movlw	(0Ch)
	fcall	_lcd_command
	line	100
	fcall	_lcd_clear
	line	102
	movlw	(080h)
	fcall	_lcd_command
	line	103
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_yaz
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _lcd_yaz *****************
;; Defined at:
;;		line 117 in file "../PICLCD.c"
;; Parameters:    Size  Location     Type
;;  p               1    wreg     PTR const unsigned char 
;;		 -> STR_2(7), STR_1(5), 
;; Auto vars:     Size  Location     Type
;;  p               1    5[COMMON] PTR const unsigned char 
;;		 -> STR_2(7), STR_1(5), 
;; Return value:  Size  Location     Type
;;                  2  720[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text129
	file	"../PICLCD.c"
	line	117
	global	__size_of_lcd_yaz
	__size_of_lcd_yaz	equ	__end_of_lcd_yaz-_lcd_yaz
	
_lcd_yaz:	
	opt	stack 6
; Regs used in _lcd_yaz: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	movwf	(lcd_yaz@p)
	line	121
	
l2711:	
	goto	l2795
	
l722:	
	line	123
	
l2713:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0C7h
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l2759
u2260:
	line	125
	
l2715:	
	movlw	(040h)
	fcall	_lcd_command
	
l2717:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2397:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2397
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2397
	nop2
opt asmopt_on

	
l2719:	
	movlw	(0)
	fcall	_lcd_data
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2407:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2407
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2407
	nop2
opt asmopt_on

	line	126
	
l2721:	
	movlw	(041h)
	fcall	_lcd_command
	
l2723:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2417:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2417
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2417
	nop2
opt asmopt_on

	movlw	(0Eh)
	fcall	_lcd_data
	
l2725:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2427:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2427
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2427
	nop2
opt asmopt_on

	line	127
	
l2727:	
	movlw	(042h)
	fcall	_lcd_command
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2437:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2437
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2437
	nop2
opt asmopt_on

	
l2729:	
	movlw	(011h)
	fcall	_lcd_data
	
l2731:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2447:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2447
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2447
	nop2
opt asmopt_on

	line	129
	movlw	(043h)
	fcall	_lcd_command
	
l2733:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2457:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2457
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2457
	nop2
opt asmopt_on

	
l2735:	
	movlw	(010h)
	fcall	_lcd_data
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2467:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2467
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2467
	nop2
opt asmopt_on

	line	130
	
l2737:	
	movlw	(044h)
	fcall	_lcd_command
	
l2739:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2477:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2477
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2477
	nop2
opt asmopt_on

	movlw	(010h)
	fcall	_lcd_data
	
l2741:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2487:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2487
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2487
	nop2
opt asmopt_on

	line	131
	
l2743:	
	movlw	(045h)
	fcall	_lcd_command
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2497:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2497
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2497
	nop2
opt asmopt_on

	
l2745:	
	movlw	(015h)
	fcall	_lcd_data
	line	132
	
l2747:	
	movlw	(046h)
	fcall	_lcd_command
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2507:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2507
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2507
	nop2
opt asmopt_on

	
l2749:	
	movlw	(0Eh)
	fcall	_lcd_data
	line	133
	
l2751:	
	movlw	(047h)
	fcall	_lcd_command
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2517:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2517
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2517
	nop2
opt asmopt_on

	
l2753:	
	movlw	(0)
	fcall	_lcd_data
	
l2755:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_yaz+0)+0+1),f
	movlw	151
movwf	((??_lcd_yaz+0)+0),f
u2527:
	decfsz	((??_lcd_yaz+0)+0),f
	goto	u2527
	decfsz	((??_lcd_yaz+0)+0+1),f
	goto	u2527
	nop2
opt asmopt_on

	line	137
	movlw	(0)
	fcall	_lcd_data
	line	139
	
l2757:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(65/8),(65)&7
	line	141
	goto	l2791
	line	142
	
l723:	
	
l2759:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0DEh
	skipz
	goto	u2271
	goto	u2270
u2271:
	goto	l2763
u2270:
	line	145
	
l2761:	
	movlw	(048h)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	146
	movlw	(049h)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	147
	movlw	(04Ah)
	fcall	_lcd_command
	movlw	(010h)
	fcall	_lcd_data
	line	148
	movlw	(04Bh)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	149
	movlw	(04Ch)
	fcall	_lcd_command
	movlw	(01h)
	fcall	_lcd_data
	line	150
	movlw	(04Dh)
	fcall	_lcd_command
	movlw	(015h)
	fcall	_lcd_data
	line	151
	movlw	(04Eh)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	152
	movlw	(04Fh)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	156
	movlw	(01h)
	fcall	_lcd_data
	line	158
	goto	l2791
	line	160
	
l725:	
	
l2763:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0FEh
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l2769
u2280:
	line	163
	
l2765:	
	movlw	(078h)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	164
	movlw	(079h)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	165
	movlw	(07Ah)
	fcall	_lcd_command
	movlw	(08h)
	fcall	_lcd_data
	line	166
	movlw	(07Bh)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	167
	movlw	(07Ch)
	fcall	_lcd_command
	movlw	(02h)
	fcall	_lcd_data
	line	168
	movlw	(07Dh)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	169
	movlw	(07Eh)
	fcall	_lcd_command
	movlw	(0Ch)
	fcall	_lcd_data
	line	170
	movlw	(07Fh)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	174
	movlw	(07h)
	fcall	_lcd_data
	line	175
	
l2767:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(70/8),(70)&7
	line	178
	goto	l2791
	line	200
	
l727:	
	
l2769:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0DDh
	skipz
	goto	u2291
	goto	u2290
u2291:
	goto	l2773
u2290:
	line	204
	
l2771:	
	movlw	(050h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	205
	movlw	(051h)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	206
	movlw	(052h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	207
	movlw	(053h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	208
	movlw	(054h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	209
	movlw	(055h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	210
	movlw	(056h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	211
	movlw	(057h)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	218
	movlw	(02h)
	fcall	_lcd_data
	line	220
	goto	l2791
	line	227
	
l729:	
	
l2773:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0D0h
	skipz
	goto	u2301
	goto	u2300
u2301:
	goto	l2777
u2300:
	line	230
	
l2775:	
	movlw	(058h)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	231
	movlw	(059h)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	232
	movlw	(05Ah)
	fcall	_lcd_command
	movlw	(0Fh)
	fcall	_lcd_data
	line	233
	movlw	(05Bh)
	fcall	_lcd_command
	movlw	(010h)
	fcall	_lcd_data
	line	234
	movlw	(05Ch)
	fcall	_lcd_command
	movlw	(013h)
	fcall	_lcd_data
	line	235
	movlw	(05Dh)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	236
	movlw	(05Eh)
	fcall	_lcd_command
	movlw	(0Fh)
	fcall	_lcd_data
	line	237
	movlw	(05Fh)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	241
	movlw	(03h)
	fcall	_lcd_data
	line	243
	goto	l2791
	line	244
	
l731:	
	
l2777:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0DCh
	skipz
	goto	u2311
	goto	u2310
u2311:
	goto	l2781
u2310:
	line	247
	
l2779:	
	movlw	(060h)
	fcall	_lcd_command
	movlw	(0Ah)
	fcall	_lcd_data
	line	248
	movlw	(061h)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	249
	movlw	(062h)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	250
	movlw	(063h)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	251
	movlw	(064h)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	252
	movlw	(065h)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	253
	movlw	(066h)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	254
	movlw	(067h)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	258
	movlw	(04h)
	fcall	_lcd_data
	line	260
	goto	l2791
	line	261
	
l733:	
	
l2781:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0D6h
	skipz
	goto	u2321
	goto	u2320
u2321:
	goto	l2785
u2320:
	line	264
	
l2783:	
	movlw	(068h)
	fcall	_lcd_command
	movlw	(0Ah)
	fcall	_lcd_data
	line	265
	movlw	(069h)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	266
	movlw	(06Ah)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	267
	movlw	(06Bh)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	268
	movlw	(06Ch)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	269
	movlw	(06Dh)
	fcall	_lcd_command
	movlw	(011h)
	fcall	_lcd_data
	line	270
	movlw	(06Eh)
	fcall	_lcd_command
	movlw	(0Eh)
	fcall	_lcd_data
	line	271
	movlw	(06Fh)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	275
	movlw	(05h)
	fcall	_lcd_data
	line	277
	goto	l2791
	line	278
	
l735:	
	
l2785:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	xorlw	049h
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l2789
u2330:
	line	281
	
l2787:	
	movlw	(070h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	282
	movlw	(071h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	283
	movlw	(072h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	284
	movlw	(073h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	285
	movlw	(074h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	286
	movlw	(075h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	287
	movlw	(076h)
	fcall	_lcd_command
	movlw	(04h)
	fcall	_lcd_data
	line	288
	movlw	(077h)
	fcall	_lcd_command
	movlw	(0)
	fcall	_lcd_data
	line	292
	movlw	(06h)
	fcall	_lcd_data
	line	294
	goto	l2791
	line	297
	
l737:	
	line	298
	
l2789:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	goto	l2791
	
l738:	
	goto	l2791
	
l736:	
	goto	l2791
	
l734:	
	goto	l2791
	
l732:	
	goto	l2791
	
l730:	
	goto	l2791
	
l728:	
	goto	l2791
	
l726:	
	goto	l2791
	
l724:	
	line	300
	
l2791:	
	movlw	(01h)
	movwf	(??_lcd_yaz+0)+0
	movf	(??_lcd_yaz+0)+0,w
	addwf	(lcd_yaz@p),f
	line	302
	
l2793:	
	movlw	(01h)
	movwf	(??_lcd_yaz+0)+0
	movf	(??_lcd_yaz+0)+0,w
	addwf	(_len),f
	goto	l2795
	line	304
	
l721:	
	line	121
	
l2795:	
	movf	(lcd_yaz@p),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l2713
u2340:
	goto	l740
	
l739:	
	line	309
	
l740:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_yaz
	__end_of_lcd_yaz:
;; =============== function _lcd_yaz ends ============

	signat	_lcd_yaz,4218
	global	_lcd_goto
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 73 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  p_1             1    wreg     unsigned char 
;;  p_2             1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  p_1             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text130
	file	"../LCD.h"
	line	73
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 6
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
	line	75
	movwf	(lcd_goto@p_1)
	
l2705:	
	movf	(lcd_goto@p_1),w
	xorlw	01h
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l2709
u2250:
	line	76
	
l2707:	
	movf	(lcd_goto@p_2),w
	addlw	0FFh
	andlw	0Fh
	addlw	080h
	fcall	_lcd_command
	line	77
	goto	l712
	
l710:	
	line	78
	
l2709:	
	movf	(lcd_goto@p_2),w
	addlw	0FFh
	andlw	0Fh
	addlw	0C0h
	fcall	_lcd_command
	goto	l712
	line	79
	
l711:	
	line	81
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,8312
	global	_lcd_clear
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 60 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;		None
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
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;; This function is called by:
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text131
	file	"../LCD.h"
	line	60
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 5
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
l2701:	
	movlw	(01h)
	fcall	_lcd_command
	line	64
	
l2703:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_clear+0)+0+1),f
	movlw	151
movwf	((??_lcd_clear+0)+0),f
u2537:
	decfsz	((??_lcd_clear+0)+0),f
	goto	u2537
	decfsz	((??_lcd_clear+0)+0+1),f
	goto	u2537
	nop2
opt asmopt_on

	line	65
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_data
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 47 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_yaz
;;		_lcd_write
;;		_ozel_karakterler
;; This function uses a non-reentrant model
;;
psect	text132
	file	"../LCD.h"
	line	47
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg+status,2+status,0]
	movwf	(lcd_data@c)
	line	48
	
l2681:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	49
	bsf	(59/8),(59)&7
	line	50
	bsf	(58/8),(58)&7
	line	51
	
l2683:	
	movf	(lcd_data@c),w
	andlw	0F0h
	movwf	(6)	;volatile
	
l2685:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_data+0)+0+1),f
	movlw	151
movwf	((??_lcd_data+0)+0),f
u2547:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2547
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2547
	nop2
opt asmopt_on

	line	52
	
l2687:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	53
	
l2689:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_data+0)+0,f
u2557:
	clrwdt
decfsz	(??_lcd_data+0)+0,f
	goto	u2557
	nop2	;nop
	clrwdt
opt asmopt_on

	line	54
	
l2691:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	55
	
l2693:	
	movf	(lcd_data@c),w
	andlw	0Fh
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2245:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2245
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(6)	;volatile
	
l2695:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_data+0)+0+1),f
	movlw	151
movwf	((??_lcd_data+0)+0),f
u2567:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2567
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2567
	nop2
opt asmopt_on

	line	56
	
l2697:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	57
	
l2699:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_data+0)+0,f
u2577:
	clrwdt
decfsz	(??_lcd_data+0)+0,f
	goto	u2577
	nop2	;nop
	clrwdt
opt asmopt_on

	line	58
	
l698:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 32 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_clear
;;		_lcd_goto
;;		_lcd_init
;;		_lcd_yaz
;;		_ozel_karakterler
;; This function uses a non-reentrant model
;;
psect	text133
	file	"../LCD.h"
	line	32
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 6
; Regs used in _lcd_command: [wreg+status,2+status,0]
	movwf	(lcd_command@c)
	line	33
	
l2661:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	34
	bcf	(59/8),(59)&7
	line	35
	bsf	(58/8),(58)&7
	line	36
	
l2663:	
	movf	(lcd_command@c),w
	andlw	0F0h
	movwf	(6)	;volatile
	line	37
	
l2665:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_command+0)+0+1),f
	movlw	151
movwf	((??_lcd_command+0)+0),f
u2587:
	decfsz	((??_lcd_command+0)+0),f
	goto	u2587
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u2587
	nop2
opt asmopt_on

	line	38
	
l2667:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	39
	
l2669:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_command+0)+0,f
u2597:
	clrwdt
decfsz	(??_lcd_command+0)+0,f
	goto	u2597
	nop2	;nop
	clrwdt
opt asmopt_on

	line	40
	
l2671:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	41
	
l2673:	
	movf	(lcd_command@c),w
	andlw	0Fh
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2235:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2235
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(6)	;volatile
	
l2675:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_command+0)+0+1),f
	movlw	151
movwf	((??_lcd_command+0)+0),f
u2607:
	decfsz	((??_lcd_command+0)+0),f
	goto	u2607
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u2607
	nop2
opt asmopt_on

	line	42
	
l2677:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	43
	
l2679:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_command+0)+0,f
u2617:
	clrwdt
decfsz	(??_lcd_command+0)+0,f
	goto	u2617
	nop2	;nop
	clrwdt
opt asmopt_on

	line	44
	
l695:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
