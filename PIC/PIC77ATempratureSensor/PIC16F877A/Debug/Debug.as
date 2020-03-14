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
	FNCALL	_main,_lcd_write
	FNCALL	_main,___awdiv
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_karakter_yaz
	FNCALL	_main,_rakam_yaz
	FNCALL	_karakter_yaz,_strlen
	FNCALL	_karakter_yaz,_lcd_write
	FNCALL	_karakter_yaz,_lcd_data
	FNCALL	_karakter_yaz,_lcd_command
	FNCALL	_lcd_init,_lcd_command
	FNCALL	_lcd_init,_lcd_clear
	FNCALL	_rakam_yaz,_pow
	FNCALL	_rakam_yaz,___awdiv
	FNCALL	_rakam_yaz,___awmod
	FNCALL	_rakam_yaz,_lcd_data
	FNCALL	_lcd_write,_lcd_data
	FNCALL	_lcd_clear,_lcd_command
	FNCALL	_pow,___wmul
	FNROOT	_main
	global	_rakam_digits
	global	_bolum
	global	_value
	global	_ADRESH
psect	text297,local,class=CODE,delta=2
global __ptext297
__ptext297:
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_ADCS0
_ADCS0	set	254
	global	_ADCS1
_ADCS1	set	255
	global	_ADON
_ADON	set	248
	global	_CARRY
_CARRY	set	24
	global	_CHS0
_CHS0	set	251
	global	_CHS1
_CHS1	set	252
	global	_CHS2
_CHS2	set	253
	global	_GIE
_GIE	set	95
	global	_GO_DONE
_GO_DONE	set	250
	global	_RA1
_RA1	set	41
	global	_RB0
_RB0	set	48
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC7
_RC7	set	63
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_ADCS2
_ADCS2	set	1278
	global	_ADFM
_ADFM	set	1279
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
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_1:	
	retlw	83	;'S'
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

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_rakam_digits:
       ds      5

_bolum:
       ds      2

_value:
       ds      2

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
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
	global	?_lcd_write
?_lcd_write:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_karakter_yaz
?_karakter_yaz:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_strlen
?_strlen:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	ds	2
	global	??_strlen
??_strlen:	; 0 bytes @ 0x2
	global	lcd_command@c
lcd_command@c:	; 1 bytes @ 0x2
	global	lcd_data@c
lcd_data@c:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x3
	global	??_lcd_write
??_lcd_write:	; 0 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	lcd_write@s
lcd_write@s:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x5
	ds	1
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x6
	global	?___awmod
?___awmod:	; 2 bytes @ 0x6
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x6
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x6
	ds	2
	global	strlen@s
strlen@s:	; 1 bytes @ 0x8
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x8
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x8
	ds	1
	global	strlen@cp
strlen@cp:	; 1 bytes @ 0x9
	ds	1
	global	??_karakter_yaz
??_karakter_yaz:	; 0 bytes @ 0xA
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0xA
	global	??___awmod
??___awmod:	; 0 bytes @ 0xA
	ds	1
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0xB
	ds	1
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0xC
	ds	1
	global	??_pow
??_pow:	; 0 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x0
	global	karakter_yaz@boyut
karakter_yaz@boyut:	; 2 bytes @ 0x0
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x1
	ds	1
	global	karakter_yaz@s
karakter_yaz@s:	; 1 bytes @ 0x2
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x2
	ds	1
	global	karakter_yaz@deger
karakter_yaz@deger:	; 2 bytes @ 0x3
	ds	1
	global	?_pow
?_pow:	; 2 bytes @ 0x4
	global	pow@a
pow@a:	; 2 bytes @ 0x4
	ds	2
	global	pow@b
pow@b:	; 2 bytes @ 0x6
	ds	2
	global	pow@k
pow@k:	; 2 bytes @ 0x8
	ds	2
	global	pow@c
pow@c:	; 2 bytes @ 0xA
	ds	2
	global	?_rakam_yaz
?_rakam_yaz:	; 0 bytes @ 0xC
	global	rakam_yaz@a
rakam_yaz@a:	; 2 bytes @ 0xC
	ds	2
	global	??_rakam_yaz
??_rakam_yaz:	; 0 bytes @ 0xE
	ds	1
	global	rakam_yaz@k_1260
rakam_yaz@k_1260:	; 2 bytes @ 0xF
	ds	2
	global	rakam_yaz@k
rakam_yaz@k:	; 2 bytes @ 0x11
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x13
	ds	3
	global	main@s
main@s:	; 1 bytes @ 0x16
	ds	1
;;Data sizes: Strings 13, constant 0, data 0, bss 9, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     23      32
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?_strlen	int  size(1) Largest target is 8
;;		 -> STR_2(CODE[8]), 
;;
;; ?_pow	int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; main@s	PTR unsigned char  size(1) Largest target is 2
;;		 -> value(BANK0[2]), 
;;
;; karakter_yaz@s	PTR unsigned char  size(1) Largest target is 8
;;		 -> STR_2(CODE[8]), 
;;
;; strlen@s	PTR unsigned char  size(1) Largest target is 8
;;		 -> STR_2(CODE[8]), 
;;
;; strlen@cp	PTR unsigned char  size(1) Largest target is 8
;;		 -> STR_2(CODE[8]), 
;;
;; lcd_write@s	PTR const unsigned char  size(1) Largest target is 8
;;		 -> STR_2(CODE[8]), STR_1(CODE[5]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _karakter_yaz->_strlen
;;   _lcd_init->_lcd_clear
;;   _rakam_yaz->_pow
;;   _lcd_write->_lcd_data
;;   _lcd_clear->_lcd_command
;;   _pow->___awmod
;;   ___awmod->___wmul
;;   ___awdiv->___wmul
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_rakam_yaz
;;   _rakam_yaz->_pow
;;   _pow->___awdiv
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
;; (0) _main                                                 4     4      0    2240
;;                                             19 BANK0      4     4      0
;;                           _lcd_init
;;                          _lcd_write
;;                            ___awdiv
;;                          _lcd_clear
;;                       _karakter_yaz
;;                          _rakam_yaz
;; ---------------------------------------------------------------------------------
;; (1) _karakter_yaz                                         5     5      0     535
;;                                              0 BANK0      5     5      0
;;                             _strlen
;;                          _lcd_write
;;                           _lcd_data
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             2     2      0      88
;;                                              5 COMMON     2     2      0
;;                        _lcd_command
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (1) _rakam_yaz                                            7     5      2    1094
;;                                             12 BANK0      7     5      2
;;                                _pow
;;                            ___awdiv
;;                            ___awmod
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_write                                            2     2      0      89
;;                                              3 COMMON     2     2      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clear                                            2     2      0      44
;;                                              3 COMMON     2     2      0
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (2) _pow                                                  9     5      4     206
;;                                             13 COMMON     1     1      0
;;                                              4 BANK0      8     4      4
;;                             ___wmul
;;                            ___awdiv (ARG)
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             3     3      0      44
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _lcd_command                                          3     3      0      44
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              6 COMMON     7     3      4
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              6 COMMON     5     1      4
;;                                              0 BANK0      4     4      0
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (3) _strlen                                              10     8      2      89
;;                                              0 COMMON    10     8      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_command
;;     _lcd_clear
;;       _lcd_command
;;   _lcd_write
;;     _lcd_data
;;   ___awdiv
;;     ___wmul (ARG)
;;   _lcd_clear
;;     _lcd_command
;;   _karakter_yaz
;;     _strlen
;;     _lcd_write
;;       _lcd_data
;;     _lcd_data
;;     _lcd_command
;;   _rakam_yaz
;;     _pow
;;       ___wmul
;;       ___awdiv (ARG)
;;         ___wmul (ARG)
;;       ___awmod (ARG)
;;         ___wmul (ARG)
;;     ___awdiv
;;       ___wmul (ARG)
;;     ___awmod
;;       ___wmul (ARG)
;;     _lcd_data
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
;;ABS                  0      0      2E       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     17      20       5       40.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      31      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 90 in file "../CoProject.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  s               1   22[BANK0 ] PTR unsigned char 
;;		 -> value(2), 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_lcd_write
;;		___awdiv
;;		_lcd_clear
;;		_karakter_yaz
;;		_rakam_yaz
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../CoProject.c"
	line	90
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	91
	
l3211:	
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	92
	
l3213:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	93
	
l3215:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	94
	
l3217:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	95
	
l3219:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	96
	
l3221:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	98
	
l3223:	
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2797:
	decfsz	((??_main+0)+0),f
	goto	u2797
	decfsz	((??_main+0)+0+1),f
	goto	u2797
	decfsz	((??_main+0)+0+2),f
	goto	u2797
	clrwdt
opt asmopt_on

	line	99
	
l3225:	
	fcall	_lcd_init
	line	100
	
l3227:	
	opt asmopt_off
movlw  2
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2807:
	decfsz	((??_main+0)+0),f
	goto	u2807
	decfsz	((??_main+0)+0+1),f
	goto	u2807
	decfsz	((??_main+0)+0+2),f
	goto	u2807
	clrwdt
opt asmopt_on

	line	102
	
l3229:	
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_write
	line	103
	
l3231:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	106
	
l3233:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1278/8)^080h,(1278)&7
	line	107
	
l3235:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(255/8),(255)&7
	line	108
	
l3237:	
	bsf	(254/8),(254)&7
	line	109
	
l3239:	
	bcf	(253/8),(253)&7
	line	110
	
l3241:	
	bcf	(252/8),(252)&7
	line	111
	
l3243:	
	bcf	(251/8),(251)&7
	line	112
	
l3245:	
	bsf	(248/8),(248)&7
	line	113
	
l3247:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1279/8)^080h,(1279)&7
	line	114
	
l3249:	
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2817:
	decfsz	((??_main+0)+0),f
	goto	u2817
	decfsz	((??_main+0)+0+1),f
	goto	u2817
	decfsz	((??_main+0)+0+2),f
	goto	u2817
	nop2
opt asmopt_on

	line	116
	
l3251:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	117
	goto	l749
	
l750:	
	
l749:	
	btfsc	(250/8),(250)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l749
u2770:
	goto	l3253
	
l751:	
	line	118
	
l3253:	
	movlw	(_value)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@s)
	line	119
	
l3255:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(main@s),w
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	120
	
l3257:	
	movf	(30),w	;volatile
	movwf	(??_main+0)+0
	movf	(main@s),w
	addlw	01h
	movwf	fsr0
	movf	(??_main+0)+0,w
	movwf	indf
	line	121
	
l3259:	
	movlw	low(02h)
	movwf	(?___awdiv)
	movlw	high(02h)
	movwf	((?___awdiv))+1
	movf	(_value+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(_value),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_value+1)
	addwf	(_value+1)
	movf	(0+(?___awdiv)),w
	clrf	(_value)
	addwf	(_value)

	goto	l3261
	line	123
	
l752:	
	line	126
	
l3261:	
# 126 "../CoProject.c"
nop ;#
psect	maintext
	line	127
	
l3263:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	129
	
l3265:	
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2827:
	decfsz	((??_main+0)+0),f
	goto	u2827
	decfsz	((??_main+0)+0+1),f
	goto	u2827
	decfsz	((??_main+0)+0+2),f
	goto	u2827
	nop2
opt asmopt_on

	line	130
	
l3267:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
	line	131
	
l3269:	
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2837:
	decfsz	((??_main+0)+0),f
	goto	u2837
	decfsz	((??_main+0)+0+1),f
	goto	u2837
	decfsz	((??_main+0)+0+2),f
	goto	u2837
	nop2
opt asmopt_on

	line	133
	
l3271:	
	fcall	_lcd_clear
	line	134
	
l3273:	
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_karakter_yaz
	line	135
	
l3275:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_value+1),w
	clrf	(?_rakam_yaz+1)
	addwf	(?_rakam_yaz+1)
	movf	(_value),w
	clrf	(?_rakam_yaz)
	addwf	(?_rakam_yaz)

	fcall	_rakam_yaz
	line	136
	opt asmopt_off
movlw  11
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	38
movwf	((??_main+0)+0+1),f
	movlw	102
movwf	((??_main+0)+0),f
u2847:
	decfsz	((??_main+0)+0),f
	goto	u2847
	decfsz	((??_main+0)+0+1),f
	goto	u2847
	decfsz	((??_main+0)+0+2),f
	goto	u2847
	nop2
opt asmopt_on

	line	138
	
l3277:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	line	139
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	line	140
	
l3279:	
	bsf	(250/8),(250)&7
	line	141
	goto	l753
	
l754:	
	
l753:	
	btfss	(250/8),(250)&7
	goto	u2781
	goto	u2780
u2781:
	goto	l753
u2780:
	goto	l3281
	
l755:	
	line	142
	
l3281:	
	movlw	(_value)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@s)
	line	143
	
l3283:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(main@s),w
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	144
	
l3285:	
	movf	(30),w	;volatile
	movwf	(??_main+0)+0
	movf	(main@s),w
	addlw	01h
	movwf	fsr0
	movf	(??_main+0)+0,w
	movwf	indf
	line	145
	
l3287:	
	movlw	low(02h)
	movwf	(?___awdiv)
	movlw	high(02h)
	movwf	((?___awdiv))+1
	movf	(_value+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(_value),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_value+1)
	addwf	(_value+1)
	movf	(0+(?___awdiv)),w
	clrf	(_value)
	addwf	(_value)

	line	147
	
l3289:	
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2857:
	decfsz	((??_main+0)+0),f
	goto	u2857
	decfsz	((??_main+0)+0+1),f
	goto	u2857
	decfsz	((??_main+0)+0+2),f
	goto	u2857
	nop2
opt asmopt_on

	line	148
	
l3291:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(41/8),(41)&7
	goto	l3261
	line	150
	
l756:	
	line	123
	goto	l3261
	
l757:	
	line	151
	
l758:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_karakter_yaz
psect	text298,local,class=CODE,delta=2
global __ptext298
__ptext298:

;; *************** function _karakter_yaz *****************
;; Defined at:
;;		line 32 in file "../CoProject.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> STR_2(8), 
;; Auto vars:     Size  Location     Type
;;  s               1    2[BANK0 ] PTR unsigned char 
;;		 -> STR_2(8), 
;;  deger           2    3[BANK0 ] int 
;;  boyut           2    0[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_strlen
;;		_lcd_write
;;		_lcd_data
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text298
	file	"../CoProject.c"
	line	32
	global	__size_of_karakter_yaz
	__size_of_karakter_yaz	equ	__end_of_karakter_yaz-_karakter_yaz
	
_karakter_yaz:	
	opt	stack 5
; Regs used in _karakter_yaz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(karakter_yaz@s)
	line	33
	
l3183:	
	movf	(karakter_yaz@s),w
	fcall	_strlen
	movf	(1+(?_strlen)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(karakter_yaz@boyut+1)
	addwf	(karakter_yaz@boyut+1)
	movf	(0+(?_strlen)),w
	clrf	(karakter_yaz@boyut)
	addwf	(karakter_yaz@boyut)

	
l3185:	
	clrf	(karakter_yaz@deger)
	clrf	(karakter_yaz@deger+1)
	line	35
	
l3187:	
	movf	(karakter_yaz@boyut+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(011h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2735
	movlw	low(011h)
	subwf	(karakter_yaz@boyut),w
u2735:

	skipnc
	goto	u2731
	goto	u2730
u2731:
	goto	l3191
u2730:
	line	38
	
l3189:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(karakter_yaz@s),w
	fcall	_lcd_write
	goto	l3191
	line	40
	
l728:	
	line	42
	
l3191:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(karakter_yaz@boyut+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(011h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2745
	movlw	low(011h)
	subwf	(karakter_yaz@boyut),w
u2745:

	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l736
u2740:
	goto	l3199
	line	43
	
l3193:	
	goto	l3199
	
l731:	
	
l3195:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(karakter_yaz@deger),w
	addwf	(karakter_yaz@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	
l3197:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(karakter_yaz@deger),f
	skipnc
	incf	(karakter_yaz@deger+1),f
	movlw	high(01h)
	addwf	(karakter_yaz@deger+1),f
	goto	l3199
	
l730:	
	
l3199:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(karakter_yaz@deger+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(011h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2755
	movlw	low(011h)
	subwf	(karakter_yaz@deger),w
u2755:

	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l3195
u2750:
	goto	l3201
	
l732:	
	line	44
	
l3201:	
	movlw	(0C0h)
	fcall	_lcd_command
	line	45
	
l3203:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(karakter_yaz@deger),w
	addlw	low(-1)
	movwf	(karakter_yaz@deger)
	movf	(karakter_yaz@deger+1),w
	skipnc
	addlw	1
	addlw	high(-1)
	movwf	1+(karakter_yaz@deger)
	line	46
	goto	l3209
	
l734:	
	line	47
	
l3205:	
	movf	(karakter_yaz@deger),w
	addwf	(karakter_yaz@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	
l3207:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(karakter_yaz@deger),f
	skipnc
	incf	(karakter_yaz@deger+1),f
	movlw	high(01h)
	addwf	(karakter_yaz@deger+1),f
	goto	l3209
	
l733:	
	line	46
	
l3209:	
	movf	(karakter_yaz@boyut+1),w
	xorwf	(karakter_yaz@deger+1),w
	skipz
	goto	u2765
	movf	(karakter_yaz@boyut),w
	xorwf	(karakter_yaz@deger),w
u2765:

	skipz
	goto	u2761
	goto	u2760
u2761:
	goto	l3205
u2760:
	goto	l736
	
l735:	
	goto	l736
	line	54
	
l729:	
	line	64
	
l736:	
	return
	opt stack 0
GLOBAL	__end_of_karakter_yaz
	__end_of_karakter_yaz:
;; =============== function _karakter_yaz ends ============

	signat	_karakter_yaz,4216
	global	_lcd_init
psect	text299,local,class=CODE,delta=2
global __ptext299
__ptext299:

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
psect	text299
	file	"../LCD.h"
	line	85
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	86
	
l3173:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	87
	bcf	(58/8),(58)&7
	line	88
	bcf	(60/8),(60)&7
	line	89
	
l3175:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_init+0)+0,f
u2867:
	clrwdt
decfsz	(??_lcd_init+0)+0,f
	goto	u2867
	nop2	;nop
	clrwdt
opt asmopt_on

	line	90
	
l3177:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	91
	
l3179:	
	movlw	(02h)
	fcall	_lcd_command
	line	92
	
l3181:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_init+0)+0+1),f
	movlw	151
movwf	((??_lcd_init+0)+0),f
u2877:
	decfsz	((??_lcd_init+0)+0),f
	goto	u2877
	decfsz	((??_lcd_init+0)+0+1),f
	goto	u2877
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
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_rakam_yaz
psect	text300,local,class=CODE,delta=2
global __ptext300
__ptext300:

;; *************** function _rakam_yaz *****************
;; Defined at:
;;		line 71 in file "../CoProject.c"
;; Parameters:    Size  Location     Type
;;  a               2   12[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  k               2   17[BANK0 ] int 
;;  k               2   15[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_pow
;;		___awdiv
;;		___awmod
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text300
	file	"../CoProject.c"
	line	71
	global	__size_of_rakam_yaz
	__size_of_rakam_yaz	equ	__end_of_rakam_yaz-_rakam_yaz
	
_rakam_yaz:	
	opt	stack 5
; Regs used in _rakam_yaz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	73
	
l3143:	
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(rakam_yaz@k)
	movlw	high(04h)
	movwf	((rakam_yaz@k))+1
	
l3145:	
	btfss	(rakam_yaz@k+1),7
	goto	u2681
	goto	u2680
u2681:
	goto	l3149
u2680:
	goto	l3157
	
l3147:	
	goto	l3157
	line	74
	
l739:	
	line	75
	
l3149:	
	movf	(rakam_yaz@k+1),w
	clrf	1+(?_pow)+02h
	addwf	1+(?_pow)+02h
	movf	(rakam_yaz@k),w
	clrf	0+(?_pow)+02h
	addwf	0+(?_pow)+02h

	movlw	low(0Ah)
	movwf	(?_pow)
	movlw	high(0Ah)
	movwf	((?_pow))+1
	fcall	_pow
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_pow)),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(0+(?_pow)),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	movf	(rakam_yaz@a+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(rakam_yaz@a),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_bolum+1)
	addwf	(_bolum+1)
	movf	(0+(?___awdiv)),w
	clrf	(_bolum)
	addwf	(_bolum)

	line	76
	movf	(rakam_yaz@k+1),w
	clrf	1+(?_pow)+02h
	addwf	1+(?_pow)+02h
	movf	(rakam_yaz@k),w
	clrf	0+(?_pow)+02h
	addwf	0+(?_pow)+02h

	movlw	low(0Ah)
	movwf	(?_pow)
	movlw	high(0Ah)
	movwf	((?_pow))+1
	fcall	_pow
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_pow)),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(0+(?_pow)),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	movf	(rakam_yaz@a+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(rakam_yaz@a),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(rakam_yaz@a+1)
	addwf	(rakam_yaz@a+1)
	movf	(0+(?___awmod)),w
	clrf	(rakam_yaz@a)
	addwf	(rakam_yaz@a)

	line	77
	
l3151:	
	movf	(_bolum),w
	addlw	030h
	movwf	(??_rakam_yaz+0)+0
	decf	(rakam_yaz@k),w
	xorlw	0ffh
	addlw	04h
	addlw	_rakam_digits&0ffh
	movwf	fsr0
	movf	(??_rakam_yaz+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	73
	
l3153:	
	movlw	low(-1)
	addwf	(rakam_yaz@k),f
	skipnc
	incf	(rakam_yaz@k+1),f
	movlw	high(-1)
	addwf	(rakam_yaz@k+1),f
	
l3155:	
	btfss	(rakam_yaz@k+1),7
	goto	u2691
	goto	u2690
u2691:
	goto	l3149
u2690:
	goto	l3157
	
l740:	
	line	80
	
l3157:	
	clrf	(rakam_yaz@k_1260)
	clrf	(rakam_yaz@k_1260+1)
	line	81
	goto	l3161
	
l742:	
	
l3159:	
	movlw	low(01h)
	addwf	(rakam_yaz@k_1260),f
	skipnc
	incf	(rakam_yaz@k_1260+1),f
	movlw	high(01h)
	addwf	(rakam_yaz@k_1260+1),f
	goto	l3161
	
l741:	
	
l3161:	
	movf	(rakam_yaz@k_1260),w
	addlw	_rakam_digits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorlw	030h
	skipnz
	goto	u2701
	goto	u2700
u2701:
	goto	l3159
u2700:
	goto	l3163
	
l743:	
	line	82
	
l3163:	
	movf	(rakam_yaz@k_1260+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2715
	movlw	low(05h)
	subwf	(rakam_yaz@k_1260),w
u2715:

	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l3167
u2710:
	goto	l746
	
l3165:	
	goto	l746
	line	83
	
l744:	
	line	84
	
l3167:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(rakam_yaz@k_1260),w
	addlw	_rakam_digits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_data
	line	82
	
l3169:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(rakam_yaz@k_1260),f
	skipnc
	incf	(rakam_yaz@k_1260+1),f
	movlw	high(01h)
	addwf	(rakam_yaz@k_1260+1),f
	
l3171:	
	movf	(rakam_yaz@k_1260+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2725
	movlw	low(05h)
	subwf	(rakam_yaz@k_1260),w
u2725:

	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l3167
u2720:
	goto	l746
	
l745:	
	line	86
	
l746:	
	return
	opt stack 0
GLOBAL	__end_of_rakam_yaz
	__end_of_rakam_yaz:
;; =============== function _rakam_yaz ends ============

	signat	_rakam_yaz,4216
	global	_lcd_write
psect	text301,local,class=CODE,delta=2
global __ptext301
__ptext301:

;; *************** function _lcd_write *****************
;; Defined at:
;;		line 68 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> STR_2(8), STR_1(5), 
;; Auto vars:     Size  Location     Type
;;  s               1    4[COMMON] PTR const unsigned char 
;;		 -> STR_2(8), STR_1(5), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_karakter_yaz
;;		_main
;; This function uses a non-reentrant model
;;
psect	text301
	file	"../LCD.h"
	line	68
	global	__size_of_lcd_write
	__size_of_lcd_write	equ	__end_of_lcd_write-_lcd_write
	
_lcd_write:	
	opt	stack 5
; Regs used in _lcd_write: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	movwf	(lcd_write@s)
	line	69
	
l3135:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_write+0)+0,f
u2887:
	clrwdt
decfsz	(??_lcd_write+0)+0,f
	goto	u2887
	nop2	;nop
	clrwdt
opt asmopt_on

	line	70
	goto	l3141
	
l703:	
	
l3137:	
	movf	(lcd_write@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	
l3139:	
	movlw	(01h)
	movwf	(??_lcd_write+0)+0
	movf	(??_lcd_write+0)+0,w
	addwf	(lcd_write@s),f
	goto	l3141
	
l702:	
	
l3141:	
	movf	(lcd_write@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2671
	goto	u2670
u2671:
	goto	l3137
u2670:
	goto	l705
	
l704:	
	line	71
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write
	__end_of_lcd_write:
;; =============== function _lcd_write ends ============

	signat	_lcd_write,4216
	global	_lcd_clear
psect	text302,local,class=CODE,delta=2
global __ptext302
__ptext302:

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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text302
	file	"../LCD.h"
	line	60
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 6
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
l3131:	
	movlw	(01h)
	fcall	_lcd_command
	line	64
	
l3133:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_clear+0)+0+1),f
	movlw	151
movwf	((??_lcd_clear+0)+0),f
u2897:
	decfsz	((??_lcd_clear+0)+0),f
	goto	u2897
	decfsz	((??_lcd_clear+0)+0+1),f
	goto	u2897
	nop2
opt asmopt_on

	line	65
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_pow
psect	text303,local,class=CODE,delta=2
global __ptext303
__ptext303:

;; *************** function _pow *****************
;; Defined at:
;;		line 10 in file "../CoProject.c"
;; Parameters:    Size  Location     Type
;;  a               2    4[BANK0 ] int 
;;  b               2    6[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  k               2    8[BANK0 ] int 
;;  c               2   10[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2    4[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       8       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_rakam_yaz
;; This function uses a non-reentrant model
;;
psect	text303
	file	"../CoProject.c"
	line	10
	global	__size_of_pow
	__size_of_pow	equ	__end_of_pow-_pow
	
_pow:	
	opt	stack 5
; Regs used in _pow: [wreg+status,2+status,0+pclath+cstack]
	
l3119:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(pow@c)
	movlw	high(01h)
	movwf	((pow@c))+1
	line	11
	movlw	low(01h)
	movwf	(pow@k)
	movlw	high(01h)
	movwf	((pow@k))+1
	goto	l3125
	line	12
	
l717:	
	line	13
	
l3121:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(pow@c+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(pow@c),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movf	(pow@a+1),w
	clrf	1+(?___wmul)+02h
	addwf	1+(?___wmul)+02h
	movf	(pow@a),w
	clrf	0+(?___wmul)+02h
	addwf	0+(?___wmul)+02h

	fcall	___wmul
	movf	(1+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(pow@c+1)
	addwf	(pow@c+1)
	movf	(0+(?___wmul)),w
	clrf	(pow@c)
	addwf	(pow@c)

	line	11
	
l3123:	
	movlw	low(01h)
	addwf	(pow@k),f
	skipnc
	incf	(pow@k+1),f
	movlw	high(01h)
	addwf	(pow@k+1),f
	goto	l3125
	
l716:	
	
l3125:	
	movf	(pow@b+1),w
	xorlw	80h
	movwf	(??_pow+0)+0
	movf	(pow@k+1),w
	xorlw	80h
	subwf	(??_pow+0)+0,w
	skipz
	goto	u2665
	movf	(pow@k),w
	subwf	(pow@b),w
u2665:

	skipnc
	goto	u2661
	goto	u2660
u2661:
	goto	l3121
u2660:
	goto	l3127
	
l718:	
	line	15
	
l3127:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(pow@c+1),w
	clrf	(?_pow+1)
	addwf	(?_pow+1)
	movf	(pow@c),w
	clrf	(?_pow)
	addwf	(?_pow)

	goto	l719
	
l3129:	
	line	17
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_pow
	__end_of_pow:
;; =============== function _pow ends ============

	signat	_pow,8314
	global	_lcd_data
psect	text304,local,class=CODE,delta=2
global __ptext304
__ptext304:

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
;;		_lcd_write
;;		_karakter_yaz
;;		_rakam_yaz
;; This function uses a non-reentrant model
;;
psect	text304
	file	"../LCD.h"
	line	47
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg+status,2+status,0]
	movwf	(lcd_data@c)
	line	48
	
l3099:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	49
	bsf	(59/8),(59)&7
	line	50
	bsf	(58/8),(58)&7
	line	51
	
l3101:	
	movf	(lcd_data@c),w
	andlw	0F0h
	movwf	(6)	;volatile
	
l3103:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_data+0)+0+1),f
	movlw	151
movwf	((??_lcd_data+0)+0),f
u2907:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2907
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2907
	nop2
opt asmopt_on

	line	52
	
l3105:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	53
	
l3107:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_data+0)+0,f
u2917:
	clrwdt
decfsz	(??_lcd_data+0)+0,f
	goto	u2917
	nop2	;nop
	clrwdt
opt asmopt_on

	line	54
	
l3109:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	55
	
l3111:	
	movf	(lcd_data@c),w
	andlw	0Fh
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2655:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2655
	clrc
	rlf	(??_lcd_data+0)+0,w
	movwf	(6)	;volatile
	
l3113:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_data+0)+0+1),f
	movlw	151
movwf	((??_lcd_data+0)+0),f
u2927:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2927
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2927
	nop2
opt asmopt_on

	line	56
	
l3115:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	57
	
l3117:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_data+0)+0,f
u2937:
	clrwdt
decfsz	(??_lcd_data+0)+0,f
	goto	u2937
	nop2	;nop
	clrwdt
opt asmopt_on

	line	58
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text305,local,class=CODE,delta=2
global __ptext305
__ptext305:

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
;;		_lcd_init
;;		_karakter_yaz
;;		_lcd_goto
;; This function uses a non-reentrant model
;;
psect	text305
	file	"../LCD.h"
	line	32
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 6
; Regs used in _lcd_command: [wreg+status,2+status,0]
	movwf	(lcd_command@c)
	line	33
	
l3079:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	34
	bcf	(59/8),(59)&7
	line	35
	bsf	(58/8),(58)&7
	line	36
	
l3081:	
	movf	(lcd_command@c),w
	andlw	0F0h
	movwf	(6)	;volatile
	line	37
	
l3083:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_command+0)+0+1),f
	movlw	151
movwf	((??_lcd_command+0)+0),f
u2947:
	decfsz	((??_lcd_command+0)+0),f
	goto	u2947
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u2947
	nop2
opt asmopt_on

	line	38
	
l3085:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	39
	
l3087:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_command+0)+0,f
u2957:
	clrwdt
decfsz	(??_lcd_command+0)+0,f
	goto	u2957
	nop2	;nop
	clrwdt
opt asmopt_on

	line	40
	
l3089:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	41
	
l3091:	
	movf	(lcd_command@c),w
	andlw	0Fh
	movwf	(??_lcd_command+0)+0
	movlw	(04h)-1
u2645:
	clrc
	rlf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2645
	clrc
	rlf	(??_lcd_command+0)+0,w
	movwf	(6)	;volatile
	
l3093:	
	opt asmopt_off
movlw	3
movwf	((??_lcd_command+0)+0+1),f
	movlw	151
movwf	((??_lcd_command+0)+0),f
u2967:
	decfsz	((??_lcd_command+0)+0),f
	goto	u2967
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u2967
	nop2
opt asmopt_on

	line	42
	
l3095:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	43
	
l3097:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_command+0)+0,f
u2977:
	clrwdt
decfsz	(??_lcd_command+0)+0,f
	goto	u2977
	nop2	;nop
	clrwdt
opt asmopt_on

	line	44
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	___awmod
psect	text306,local,class=CODE,delta=2
global __ptext306
__ptext306:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[COMMON] int 
;;  dividend        2    8[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   12[COMMON] unsigned char 
;;  counter         1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rakam_yaz
;; This function uses a non-reentrant model
;;
psect	text306
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l3045:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2551
	goto	u2550
u2551:
	goto	l3049
u2550:
	line	10
	
l3047:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l3049
	line	12
	
l1649:	
	line	13
	
l3049:	
	btfss	(___awmod@divisor+1),7
	goto	u2561
	goto	u2560
u2561:
	goto	l3053
u2560:
	line	14
	
l3051:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l3053
	
l1650:	
	line	15
	
l3053:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2571
	goto	u2570
u2571:
	goto	l3071
u2570:
	line	16
	
l3055:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l3061
	
l1653:	
	line	18
	
l3057:	
	movlw	01h
	
u2585:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2585
	line	19
	
l3059:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l3061
	line	20
	
l1652:	
	line	17
	
l3061:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l3057
u2590:
	goto	l3063
	
l1654:	
	goto	l3063
	line	21
	
l1655:	
	line	22
	
l3063:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2605
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2605:
	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l3067
u2600:
	line	23
	
l3065:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l3067
	
l1656:	
	line	24
	
l3067:	
	movlw	01h
	
u2615:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2615
	line	25
	
l3069:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2621
	goto	u2620
u2621:
	goto	l3063
u2620:
	goto	l3071
	
l1657:	
	goto	l3071
	line	26
	
l1651:	
	line	27
	
l3071:	
	movf	(___awmod@sign),w
	skipz
	goto	u2630
	goto	l3075
u2630:
	line	28
	
l3073:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l3075
	
l1658:	
	line	29
	
l3075:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l1659
	
l3077:	
	line	30
	
l1659:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text307,local,class=CODE,delta=2
global __ptext307
__ptext307:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[COMMON] int 
;;  dividend        2    8[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    2[BANK0 ] int 
;;  sign            1    1[BANK0 ] unsigned char 
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       4       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rakam_yaz
;;		_main
;; This function uses a non-reentrant model
;;
psect	text307
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l3005:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2451
	goto	u2450
u2451:
	goto	l3009
u2450:
	line	11
	
l3007:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l3009
	line	13
	
l1581:	
	line	14
	
l3009:	
	btfss	(___awdiv@dividend+1),7
	goto	u2461
	goto	u2460
u2461:
	goto	l3015
u2460:
	line	15
	
l3011:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l3013:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l3015
	line	17
	
l1582:	
	line	18
	
l3015:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l3017:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2471
	goto	u2470
u2471:
	goto	l3037
u2470:
	line	20
	
l3019:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l3025
	
l1585:	
	line	22
	
l3021:	
	movlw	01h
	
u2485:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2485
	line	23
	
l3023:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l3025
	line	24
	
l1584:	
	line	21
	
l3025:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l3021
u2490:
	goto	l3027
	
l1586:	
	goto	l3027
	line	25
	
l1587:	
	line	26
	
l3027:	
	movlw	01h
	
u2505:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2505
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2515
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2515:
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l3033
u2510:
	line	28
	
l3029:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l3031:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l3033
	line	30
	
l1588:	
	line	31
	
l3033:	
	movlw	01h
	
u2525:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2525
	line	32
	
l3035:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2531
	goto	u2530
u2531:
	goto	l3027
u2530:
	goto	l3037
	
l1589:	
	goto	l3037
	line	33
	
l1583:	
	line	34
	
l3037:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2540
	goto	l3041
u2540:
	line	35
	
l3039:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l3041
	
l1590:	
	line	36
	
l3041:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1591
	
l3043:	
	line	37
	
l1591:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___wmul
psect	text308,local,class=CODE,delta=2
global __ptext308
__ptext308:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_pow
;; This function uses a non-reentrant model
;;
psect	text308
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l2993:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l2995
	line	6
	
l1441:	
	line	7
	
l2995:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l1442
u2410:
	line	8
	
l2997:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l1442:	
	line	9
	movlw	01h
	
u2425:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2425
	line	10
	
l2999:	
	movlw	01h
	
u2435:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2435
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2441
	goto	u2440
u2441:
	goto	l2995
u2440:
	goto	l3001
	
l1443:	
	line	12
	
l3001:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l1444
	
l3003:	
	line	13
	
l1444:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_strlen
psect	text309,local,class=CODE,delta=2
global __ptext309
__ptext309:

;; *************** function _strlen *****************
;; Defined at:
;;		line 22 in file "../CoProject.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> STR_2(8), 
;; Auto vars:     Size  Location     Type
;;  s               1    8[COMMON] PTR unsigned char 
;;		 -> STR_2(8), 
;;  cp              1    9[COMMON] PTR unsigned char 
;;		 -> STR_2(8), 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:        10       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_karakter_yaz
;; This function uses a non-reentrant model
;;
psect	text309
	file	"../CoProject.c"
	line	22
	global	__size_of_strlen
	__size_of_strlen	equ	__end_of_strlen-_strlen
	
_strlen:	
	opt	stack 5
; Regs used in _strlen: [wreg-fsr0h+status,2+status,0+pclath]
	line	25
	movwf	(strlen@s)
	
l2985:	
	movf	(strlen@s),w
	movwf	(??_strlen+0)+0
	movf	(??_strlen+0)+0,w
	movwf	(strlen@cp)
	line	26
	goto	l2987
	
l723:	
	line	27
	goto	l2987
	
l722:	
	line	26
	
l2987:	
	movlw	01h
	addwf	(strlen@cp),f
	movlw	-01h
	addwf	(strlen@cp),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2401
	goto	u2400
u2401:
	goto	l2987
u2400:
	goto	l2989
	
l724:	
	line	28
	
l2989:	
	movf	(strlen@s),w
	movwf	(??_strlen+0)+0
	movlw	80h
	movwf	(??_strlen+0)+0+1
	comf	(??_strlen+0)+0,f
	comf	(??_strlen+0)+1,f
	incf	(??_strlen+0)+0,f
	skipnz
	incf	(??_strlen+0)+1,f
	movf	(strlen@cp),w
	movwf	(??_strlen+2)+0
	movlw	80h
	movwf	(??_strlen+2)+0+1
	movf	0+(??_strlen+0)+0,w
	addwf	0+(??_strlen+2)+0,w
	movwf	(??_strlen+4)+0
	movf	1+(??_strlen+0)+0,w
	skipnc
	incf	1+(??_strlen+0)+0,w
	addwf	1+(??_strlen+2)+0,w
	movwf	1+(??_strlen+4)+0
	movf	0+(??_strlen+4)+0,w
	addlw	low(-1)
	movwf	(?_strlen)
	movf	1+(??_strlen+4)+0,w
	skipnc
	addlw	1
	addlw	high(-1)
	movwf	1+(?_strlen)
	goto	l725
	
l2991:	
	line	29
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_strlen
	__end_of_strlen:
;; =============== function _strlen ends ============

	signat	_strlen,4218
psect	text310,local,class=CODE,delta=2
global __ptext310
__ptext310:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
