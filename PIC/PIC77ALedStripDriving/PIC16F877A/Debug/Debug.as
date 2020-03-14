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
	FNCALL	_main,___awtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,___ftdiv
	FNCALL	_main,_set_speed
	FNCALL	_set_speed,___awdiv
	FNCALL	_set_speed,_load_reg
	FNCALL	_set_speed,_choose_reg
	FNCALL	_set_speed,_pow
	FNCALL	___awtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	_pow,___wmul
	FNROOT	_main
	global	_speed
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"../LedDriveProject.c"
	line	12

;initializer for _speed
	retlw	01Eh
	retlw	0

	global	_index
	global	_sicaklik
	global	_ADRESH
_ADRESH	set	30
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
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_ADRESL
_ADRESL	set	158
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_ADCS2
_ADCS2	set	1278
	global	_ADFM
_ADFM	set	1279
	global	_PCFG0
_PCFG0	set	1272
	global	_PCFG1
_PCFG1	set	1273
	global	_PCFG2
_PCFG2	set	1274
	global	_PCFG3
_PCFG3	set	1275
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
_index:
       ds      2

_sicaklik:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"../LedDriveProject.c"
_speed:
       ds      2

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_load_reg
?_load_reg:	; 0 bytes @ 0x0
	global	??_load_reg
??_load_reg:	; 0 bytes @ 0x0
	global	?_choose_reg
?_choose_reg:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	choose_reg@number
choose_reg@number:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	1
	global	load_reg@data
load_reg@data:	; 1 bytes @ 0x1
	ds	1
	global	??_choose_reg
??_choose_reg:	; 0 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	ds	1
	global	?_pow
?_pow:	; 2 bytes @ 0x6
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	pow@val
pow@val:	; 2 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	pow@us
pow@us:	; 2 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	2
	global	??_pow
??_pow:	; 0 bytes @ 0xA
	ds	1
	global	??_set_speed
??_set_speed:	; 0 bytes @ 0xB
	ds	1
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0xC
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	global	pow@b
pow@b:	; 2 bytes @ 0x0
	ds	2
	global	pow@temp
pow@temp:	; 2 bytes @ 0x2
	ds	2
	global	?_set_speed
?_set_speed:	; 0 bytes @ 0x4
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x4
	global	set_speed@val
set_speed@val:	; 2 bytes @ 0x4
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x5
	ds	1
	global	set_speed@onluk
set_speed@onluk:	; 2 bytes @ 0x6
	ds	2
	global	set_speed@kalan
set_speed@kalan:	; 2 bytes @ 0x8
	ds	1
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x9
	ds	1
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0xA
	global	set_speed@g
set_speed@g:	; 2 bytes @ 0xA
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0xA
	ds	2
	global	set_speed@a
set_speed@a:	; 2 bytes @ 0xC
	ds	1
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0xD
	ds	1
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0xE
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0xE
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0xE
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0xE
	ds	3
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x11
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x11
	ds	3
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x14
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x14
	ds	4
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x18
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x18
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x19
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x19
	ds	3
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x1C
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x1C
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x1D
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x1D
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1E
	ds	3
	global	main@value
main@value:	; 2 bytes @ 0x21
	ds	2
	global	main@increase
main@increase:	; 1 bytes @ 0x23
	ds	1
;;Data sizes: Strings 0, constant 0, data 2, bss 4, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     36      42
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?_pow	int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___awtoft
;;   _set_speed->_pow
;;   ___awtoft->___fttol
;;   ___ftmul->___awtoft
;;   ___ftdiv->___awtoft
;;   _pow->___wmul
;;   ___fttol->___ftpack
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___ftmul
;;   _main->___ftdiv
;;   _set_speed->_pow
;;   ___awtoft->___fttol
;;   ___ftmul->___awtoft
;;   ___ftdiv->___awtoft
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
;; (0) _main                                                 6     6      0    2421
;;                                             30 BANK0      6     6      0
;;                           ___awtoft
;;                            ___ftmul
;;                            ___fttol
;;                            ___ftdiv
;;                          _set_speed
;; ---------------------------------------------------------------------------------
;; (1) _set_speed                                           11     9      2     843
;;                                             11 COMMON     1     1      0
;;                                              4 BANK0     10     8      2
;;                            ___awdiv
;;                           _load_reg
;;                         _choose_reg
;;                                _pow
;; ---------------------------------------------------------------------------------
;; (1) ___awtoft                                             6     3      3     300
;;                                             12 COMMON     2     2      0
;;                                             10 BANK0      4     1      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftmul                                             16    10      6     535
;;                                             14 BANK0     16    10      6
;;                           ___ftpack
;;                           ___awtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftdiv                                             16    10      6     489
;;                                             14 BANK0     16    10      6
;;                           ___ftpack
;;                           ___awtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _choose_reg                                           3     1      2      22
;;                                              0 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (2) _load_reg                                             2     2      0      22
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _pow                                                  9     5      4     250
;;                                              6 COMMON     5     1      4
;;                                              0 BANK0      4     4      0
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) ___fttol                                             14    10      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0     10    10      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (3) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   ___awtoft
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___ftmul
;;     ___ftpack
;;     ___awtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___fttol
;;     ___ftpack (ARG)
;;   ___ftdiv
;;     ___ftpack
;;     ___awtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   _set_speed
;;     ___awdiv
;;     _load_reg
;;     _choose_reg
;;     _pow
;;       ___wmul
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
;;DATA                 0      0      3B      12        0.0%
;;ABS                  0      0      38       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50     24      2A       5       52.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 91 in file "../LedDriveProject.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           2   33[BANK0 ] int 
;;  increase        1   35[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___awtoft
;;		___ftmul
;;		___fttol
;;		___ftdiv
;;		_set_speed
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../LedDriveProject.c"
	line	91
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	95
	
l3313:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1278/8)^080h,(1278)&7
	line	96
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(255/8),(255)&7
	line	97
	bcf	(254/8),(254)&7
	line	100
	bcf	(253/8),(253)&7
	line	101
	bcf	(252/8),(252)&7
	line	102
	bcf	(251/8),(251)&7
	line	104
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1279/8)^080h,(1279)&7
	line	106
	bcf	(1275/8)^080h,(1275)&7
	line	107
	bcf	(1274/8)^080h,(1274)&7
	line	108
	bcf	(1273/8)^080h,(1273)&7
	line	109
	bcf	(1272/8)^080h,(1272)&7
	line	111
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(248/8),(248)&7
	line	116
	
l3315:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	117
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	118
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	119
	
l3317:	
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	123
	
l3319:	
	bcf	(48/8),(48)&7
	line	125
	
l3321:	
	bsf	(50/8),(50)&7
	line	128
	
l3323:	
	clrf	(main@value)
	clrf	(main@value+1)
	line	129
	
l3325:	
	clrf	(main@increase)
	bsf	status,0
	rlf	(main@increase),f
	goto	l3327
	line	131
	
l716:	
	line	134
	
l3327:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	135
	goto	l717
	
l718:	
	
l717:	
	btfsc	(250/8),(250)&7
	goto	u3321
	goto	u3320
u3321:
	goto	l717
u3320:
	goto	l3329
	
l719:	
	line	137
	
l3329:	
	movf	(30),w	;volatile
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	(??_main+0)+0,w
	movwf	(??_main+0)+1
	clrf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	0+(??_main+0)+0,w
	movwf	(_sicaklik)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_main+0)+0,w
	movwf	1+(_sicaklik)
	line	138
	
l3331:	
	movf	(_sicaklik+1),w
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movf	(_sicaklik),w
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___awtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___awtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x40
	movwf	(?___ftmul)
	movlw	0x9c
	movwf	(?___ftmul+1)
	movlw	0x40
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_sicaklik+1)
	addwf	(_sicaklik+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(_sicaklik)
	addwf	(_sicaklik)

	line	139
	
l3333:	
	movf	(_sicaklik+1),w
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movf	(_sicaklik),w
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___awtoft)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___awtoft)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(?___fttol)
	movf	(1+(?___ftdiv)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_sicaklik+1)
	addwf	(_sicaklik+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(_sicaklik)
	addwf	(_sicaklik)

	line	141
	
l3335:	
	movf	(_sicaklik+1),w
	clrf	(?_set_speed+1)
	addwf	(?_set_speed+1)
	movf	(_sicaklik),w
	clrf	(?_set_speed)
	addwf	(?_set_speed)

	fcall	_set_speed
	line	157
	
l3337:	
	opt asmopt_off
movlw  2
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u3337:
	decfsz	((??_main+0)+0),f
	goto	u3337
	decfsz	((??_main+0)+0+1),f
	goto	u3337
	decfsz	((??_main+0)+0+2),f
	goto	u3337
	nop2
opt asmopt_on

	goto	l3327
	line	158
	
l720:	
	line	131
	goto	l3327
	
l721:	
	line	162
	
l722:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_set_speed
psect	text295,local,class=CODE,delta=2
global __ptext295
__ptext295:

;; *************** function _set_speed *****************
;; Defined at:
;;		line 63 in file "../LedDriveProject.c"
;; Parameters:    Size  Location     Type
;;  val             2    4[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  g               2   10[BANK0 ] int 
;;  a               2   12[BANK0 ] int 
;;  kalan           2    8[BANK0 ] int 
;;  onluk           2    6[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1      10       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___awdiv
;;		_load_reg
;;		_choose_reg
;;		_pow
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text295
	file	"../LedDriveProject.c"
	line	63
	global	__size_of_set_speed
	__size_of_set_speed	equ	__end_of_set_speed-_set_speed
	
_set_speed:	
	opt	stack 5
; Regs used in _set_speed: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	65
	
l3283:	
	movlw	low(08h)
	movwf	(?___awdiv)
	movlw	high(08h)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(set_speed@val+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(set_speed@val),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(set_speed@onluk+1)
	addwf	(set_speed@onluk+1)
	movf	(0+(?___awdiv)),w
	clrf	(set_speed@onluk)
	addwf	(set_speed@onluk)

	line	66
	
l3285:	
	movlw	low(07h)
	andwf	(set_speed@val),w
	movwf	(set_speed@kalan)
	movlw	high(07h)
	andwf	(set_speed@val+1),w
	movwf	1+(set_speed@kalan)
	line	68
	
l3287:	
	movlw	(0FFh)
	fcall	_load_reg
	line	69
	
l3289:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(set_speed@a)
	clrf	(set_speed@a+1)
	line	70
	
l3291:	
	clrf	(set_speed@a)
	clrf	(set_speed@a+1)
	goto	l3297
	line	71
	
l709:	
	line	72
	
l3293:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(set_speed@a+1),w
	clrf	(?_choose_reg+1)
	addwf	(?_choose_reg+1)
	movf	(set_speed@a),w
	clrf	(?_choose_reg)
	addwf	(?_choose_reg)

	fcall	_choose_reg
	line	70
	
l3295:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(set_speed@a),f
	skipnc
	incf	(set_speed@a+1),f
	movlw	high(01h)
	addwf	(set_speed@a+1),f
	goto	l3297
	
l708:	
	
l3297:	
	movf	(set_speed@a+1),w
	xorlw	80h
	movwf	(??_set_speed+0)+0
	movf	(set_speed@onluk+1),w
	xorlw	80h
	subwf	(??_set_speed+0)+0,w
	skipz
	goto	u3295
	movf	(set_speed@onluk),w
	subwf	(set_speed@a),w
u3295:

	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l3293
u3290:
	goto	l3299
	
l710:	
	line	75
	
l3299:	
	movlw	low(02h)
	movwf	(?_pow)
	movlw	high(02h)
	movwf	((?_pow))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(set_speed@kalan+1),w
	clrf	1+(?_pow)+02h
	addwf	1+(?_pow)+02h
	movf	(set_speed@kalan),w
	clrf	0+(?_pow)+02h
	addwf	0+(?_pow)+02h

	fcall	_pow
	movf	(0+(?_pow)),w
	addlw	0FFh
	fcall	_load_reg
	line	77
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(set_speed@a+1),w
	clrf	(?_choose_reg+1)
	addwf	(?_choose_reg+1)
	movf	(set_speed@a),w
	clrf	(?_choose_reg)
	addwf	(?_choose_reg)

	fcall	_choose_reg
	line	78
	movlw	(0)
	fcall	_load_reg
	line	79
	
l3301:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(set_speed@a),w
	addlw	low(01h)
	movwf	(set_speed@g)
	movf	(set_speed@a+1),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(set_speed@g)
	
l3303:	
	movf	(set_speed@g+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u3305
	movlw	low(0Ah)
	subwf	(set_speed@g),w
u3305:

	skipc
	goto	u3301
	goto	u3300
u3301:
	goto	l3307
u3300:
	goto	l713
	
l3305:	
	goto	l713
	line	80
	
l711:	
	
l3307:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(set_speed@g+1),w
	clrf	(?_choose_reg+1)
	addwf	(?_choose_reg+1)
	movf	(set_speed@g),w
	clrf	(?_choose_reg)
	addwf	(?_choose_reg)

	fcall	_choose_reg
	line	79
	
l3309:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(set_speed@g),f
	skipnc
	incf	(set_speed@g+1),f
	movlw	high(01h)
	addwf	(set_speed@g+1),f
	
l3311:	
	movf	(set_speed@g+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u3315
	movlw	low(0Ah)
	subwf	(set_speed@g),w
u3315:

	skipc
	goto	u3311
	goto	u3310
u3311:
	goto	l3307
u3310:
	goto	l713
	
l712:	
	line	87
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_set_speed
	__end_of_set_speed:
;; =============== function _set_speed ends ============

	signat	_set_speed,4216
	global	___awtoft
psect	text296,local,class=CODE,delta=2
global __ptext296
__ptext296:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   10[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   10[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       4       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text296
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 6
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l3275:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awtoft@sign)
	line	37
	btfss	(___awtoft@c+1),7
	goto	u3281
	goto	u3280
u3281:
	goto	l3279
u3280:
	line	38
	
l3277:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	clrf	(___awtoft@sign)
	bsf	status,0
	rlf	(___awtoft@sign),f
	goto	l3279
	line	40
	
l1541:	
	line	41
	
l3279:	
	movf	(___awtoft@c),w
	movwf	(?___ftpack)
	movf	(___awtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___awtoft+0)+0
	movf	(??___awtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___awtoft@sign),w
	movwf	(??___awtoft+1)+0
	movf	(??___awtoft+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	goto	l1542
	
l3281:	
	line	42
	
l1542:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___ftmul
psect	text297,local,class=CODE,delta=2
global __ptext297
__ptext297:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   14[BANK0 ] float 
;;  f2              3   17[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   25[BANK0 ] unsigned um
;;  sign            1   29[BANK0 ] unsigned char 
;;  cntr            1   28[BANK0 ] unsigned char 
;;  exp             1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   14[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text297
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l3225:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u3141
	goto	u3140
u3141:
	goto	l3231
u3140:
	line	57
	
l3227:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l1504
	
l3229:	
	goto	l1504
	
l1503:	
	line	58
	
l3231:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u3151
	goto	u3150
u3151:
	goto	l3237
u3150:
	line	59
	
l3233:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l1504
	
l3235:	
	goto	l1504
	
l1505:	
	line	60
	
l3237:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3165:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3160:
	addlw	-1
	skipz
	goto	u3165
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3175:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3170:
	addlw	-1
	skipz
	goto	u3175
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l3239:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l3241:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l3243:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l3245:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l3247:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l3249
	line	70
	
l1506:	
	line	71
	
l3249:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3181
	goto	u3180
u3181:
	goto	l3253
u3180:
	line	72
	
l3251:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3191
	addwf	(___ftmul@f3_as_product+1),f
u3191:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3192
	addwf	(___ftmul@f3_as_product+2),f
u3192:

	goto	l3253
	
l1507:	
	line	73
	
l3253:	
	movlw	01h
u3205:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3205

	line	74
	
l3255:	
	movlw	01h
u3215:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3215
	line	75
	
l3257:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3221
	goto	u3220
u3221:
	goto	l3249
u3220:
	goto	l3259
	
l1508:	
	line	76
	
l3259:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l3261
	line	77
	
l1509:	
	line	78
	
l3261:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3231
	goto	u3230
u3231:
	goto	l3265
u3230:
	line	79
	
l3263:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3241
	addwf	(___ftmul@f3_as_product+1),f
u3241:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3242
	addwf	(___ftmul@f3_as_product+2),f
u3242:

	goto	l3265
	
l1510:	
	line	80
	
l3265:	
	movlw	01h
u3255:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3255

	line	81
	
l3267:	
	movlw	01h
u3265:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3265

	line	82
	
l3269:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3271
	goto	u3270
u3271:
	goto	l3261
u3270:
	goto	l3271
	
l1511:	
	line	83
	
l3271:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	l1504
	
l3273:	
	line	84
	
l1504:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text298,local,class=CODE,delta=2
global __ptext298
__ptext298:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   14[BANK0 ] float 
;;  f1              3   17[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   25[BANK0 ] float 
;;  sign            1   29[BANK0 ] unsigned char 
;;  exp             1   28[BANK0 ] unsigned char 
;;  cntr            1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   14[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text298
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 6
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l3183:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@exp)
	movf	((___ftdiv@exp)),f
	skipz
	goto	u3061
	goto	u3060
u3061:
	goto	l3189
u3060:
	line	56
	
l3185:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l1494
	
l3187:	
	goto	l1494
	
l1493:	
	line	57
	
l3189:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	movf	((___ftdiv@sign)),f
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l3195
u3070:
	line	58
	
l3191:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l1494
	
l3193:	
	goto	l1494
	
l1495:	
	line	59
	
l3195:	
	movlw	0
	movwf	(___ftdiv@f3)
	movlw	0
	movwf	(___ftdiv@f3+1)
	movlw	0
	movwf	(___ftdiv@f3+2)
	line	60
	
l3197:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l3199:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u3085:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u3080:
	addlw	-1
	skipz
	goto	u3085
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	line	62
	
l3201:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u3095:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u3090:
	addlw	-1
	skipz
	goto	u3095
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	xorwf	(___ftdiv@sign),f
	line	63
	
l3203:	
	movlw	(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	64
	
l3205:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l3207:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	movlw	(018h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftdiv@cntr)
	goto	l3209
	line	69
	
l1496:	
	line	70
	
l3209:	
	movlw	01h
u3105:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u3105
	line	71
	
l3211:	
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u3115
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u3115
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u3115:
	skipc
	goto	u3111
	goto	u3110
u3111:
	goto	l3217
u3110:
	line	72
	
l3213:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	73
	
l3215:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	goto	l3217
	line	74
	
l1497:	
	line	75
	
l3217:	
	movlw	01h
u3125:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u3125
	line	76
	
l3219:	
	movlw	low(01h)
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u3131
	goto	u3130
u3131:
	goto	l3209
u3130:
	goto	l3221
	
l1498:	
	line	77
	
l3221:	
	movf	(___ftdiv@f3),w
	movwf	(?___ftpack)
	movf	(___ftdiv@f3+1),w
	movwf	(?___ftpack+1)
	movf	(___ftdiv@f3+2),w
	movwf	(?___ftpack+2)
	movf	(___ftdiv@exp),w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftdiv@sign),w
	movwf	(??___ftdiv+1)+0
	movf	(??___ftdiv+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	goto	l1494
	
l3223:	
	line	78
	
l1494:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	_choose_reg
psect	text299,local,class=CODE,delta=2
global __ptext299
__ptext299:

;; *************** function _choose_reg *****************
;; Defined at:
;;		line 54 in file "../LedDriveProject.c"
;; Parameters:    Size  Location     Type
;;  number          2    0[COMMON] int 
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
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_set_speed
;; This function uses a non-reentrant model
;;
psect	text299
	file	"../LedDriveProject.c"
	line	54
	global	__size_of_choose_reg
	__size_of_choose_reg	equ	__end_of_choose_reg-_choose_reg
	
_choose_reg:	
	opt	stack 6
; Regs used in _choose_reg: [wreg]
	line	55
	
l3181:	
	movf	(choose_reg@number),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	56
	opt asmopt_off
movlw	3
movwf	(??_choose_reg+0)+0,f
u3347:
decfsz	(??_choose_reg+0)+0,f
	goto	u3347
opt asmopt_on

	line	57
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	61
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_choose_reg
	__end_of_choose_reg:
;; =============== function _choose_reg ends ============

	signat	_choose_reg,4216
	global	_load_reg
psect	text300,local,class=CODE,delta=2
global __ptext300
__ptext300:

;; *************** function _load_reg *****************
;; Defined at:
;;		line 35 in file "../LedDriveProject.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    1[COMMON] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_set_speed
;; This function uses a non-reentrant model
;;
psect	text300
	file	"../LedDriveProject.c"
	line	35
	global	__size_of_load_reg
	__size_of_load_reg	equ	__end_of_load_reg-_load_reg
	
_load_reg:	
	opt	stack 6
; Regs used in _load_reg: [wreg+status,2+status,0]
	line	37
	movwf	(load_reg@data)
	
l3159:	
	movlw	low(07h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_index)
	movlw	high(07h)
	movwf	((_index))+1
	
l3161:	
	btfss	(_index+1),7
	goto	u3011
	goto	u3010
u3011:
	goto	l3165
u3010:
	goto	l701
	
l3163:	
	goto	l701
	line	38
	
l700:	
	line	40
	
l3165:	
	movf	(load_reg@data),w
	movwf	(??_load_reg+0)+0
	incf	(_index),w
	goto	u3024
u3025:
	clrc
	rrf	(??_load_reg+0)+0,f
u3024:
	addlw	-1
	skipz
	goto	u3025
	btfsc	0+(??_load_reg+0)+0,0
	goto	u3031
	goto	u3030
	
u3031:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	goto	u3044
u3030:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
u3044:
	line	41
	
l3167:	
	bsf	(51/8),(51)&7
	line	42
	
l3169:	
	opt asmopt_off
movlw	3
movwf	(??_load_reg+0)+0,f
u3357:
decfsz	(??_load_reg+0)+0,f
	goto	u3357
opt asmopt_on

	line	43
	
l3171:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7
	line	37
	
l3173:	
	movlw	low(-1)
	addwf	(_index),f
	skipnc
	incf	(_index+1),f
	movlw	high(-1)
	addwf	(_index+1),f
	
l3175:	
	btfss	(_index+1),7
	goto	u3051
	goto	u3050
u3051:
	goto	l3165
u3050:
	
l701:	
	line	47
	bsf	(52/8),(52)&7
	line	48
	
l3177:	
	opt asmopt_off
movlw	3
movwf	(??_load_reg+0)+0,f
u3367:
decfsz	(??_load_reg+0)+0,f
	goto	u3367
opt asmopt_on

	line	49
	
l3179:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	50
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_load_reg
	__end_of_load_reg:
;; =============== function _load_reg ends ============

	signat	_load_reg,4216
	global	_pow
psect	text301,local,class=CODE,delta=2
global __ptext301
__ptext301:

;; *************** function _pow *****************
;; Defined at:
;;		line 16 in file "../LedDriveProject.c"
;; Parameters:    Size  Location     Type
;;  val             2    6[COMMON] int 
;;  us              2    8[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  b               2    0[BANK0 ] int 
;;  temp            2    2[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_set_speed
;; This function uses a non-reentrant model
;;
psect	text301
	file	"../LedDriveProject.c"
	line	16
	global	__size_of_pow
	__size_of_pow	equ	__end_of_pow-_pow
	
_pow:	
	opt	stack 5
; Regs used in _pow: [wreg+status,2+status,0+pclath+cstack]
	line	17
	
l3139:	
	movf	((pow@val+1)),w
	iorwf	((pow@val)),w
	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l3145
u2990:
	
l3141:	
	movlw	low(01h)
	movwf	(?_pow)
	movlw	high(01h)
	movwf	((?_pow))+1
	goto	l694
	
l3143:	
	goto	l694
	
l693:	
	line	19
	
l3145:	
	movf	(pow@val+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(pow@temp+1)
	addwf	(pow@temp+1)
	movf	(pow@val),w
	clrf	(pow@temp)
	addwf	(pow@temp)

	line	21
	
l3147:	
	clrf	(pow@b)
	clrf	(pow@b+1)
	goto	l3153
	line	22
	
l696:	
	line	23
	
l3149:	
	movf	(pow@val+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(pow@val),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(pow@temp+1),w
	clrf	1+(?___wmul)+02h
	addwf	1+(?___wmul)+02h
	movf	(pow@temp),w
	clrf	0+(?___wmul)+02h
	addwf	0+(?___wmul)+02h

	fcall	___wmul
	movf	(1+(?___wmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(pow@temp+1)
	addwf	(pow@temp+1)
	movf	(0+(?___wmul)),w
	clrf	(pow@temp)
	addwf	(pow@temp)

	line	21
	
l3151:	
	movlw	low(01h)
	addwf	(pow@b),f
	skipnc
	incf	(pow@b+1),f
	movlw	high(01h)
	addwf	(pow@b+1),f
	goto	l3153
	
l695:	
	
l3153:	
	movf	(pow@b+1),w
	xorlw	80h
	movwf	(??_pow+0)+0
	movf	(pow@us+1),w
	xorlw	80h
	subwf	(??_pow+0)+0,w
	skipz
	goto	u3005
	movf	(pow@us),w
	subwf	(pow@b),w
u3005:

	skipc
	goto	u3001
	goto	u3000
u3001:
	goto	l3149
u3000:
	goto	l3155
	
l697:	
	line	26
	
l3155:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(pow@temp+1),w
	clrf	(?_pow+1)
	addwf	(?_pow+1)
	movf	(pow@temp),w
	clrf	(?_pow)
	addwf	(?_pow)

	goto	l694
	
l3157:	
	line	27
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_pow
	__end_of_pow:
;; =============== function _pow ends ============

	signat	_pow,8314
	global	___awdiv
psect	text302,local,class=CODE,delta=2
global __ptext302
__ptext302:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_set_speed
;; This function uses a non-reentrant model
;;
psect	text302
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l3053:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2831
	goto	u2830
u2831:
	goto	l3057
u2830:
	line	11
	
l3055:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l3057
	line	13
	
l1545:	
	line	14
	
l3057:	
	btfss	(___awdiv@dividend+1),7
	goto	u2841
	goto	u2840
u2841:
	goto	l3063
u2840:
	line	15
	
l3059:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l3061:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l3063
	line	17
	
l1546:	
	line	18
	
l3063:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l3065:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2851
	goto	u2850
u2851:
	goto	l3085
u2850:
	line	20
	
l3067:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l3073
	
l1549:	
	line	22
	
l3069:	
	movlw	01h
	
u2865:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2865
	line	23
	
l3071:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l3073
	line	24
	
l1548:	
	line	21
	
l3073:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l3069
u2870:
	goto	l3075
	
l1550:	
	goto	l3075
	line	25
	
l1551:	
	line	26
	
l3075:	
	movlw	01h
	
u2885:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2885
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2895
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2895:
	skipc
	goto	u2891
	goto	u2890
u2891:
	goto	l3081
u2890:
	line	28
	
l3077:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l3079:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l3081
	line	30
	
l1552:	
	line	31
	
l3081:	
	movlw	01h
	
u2905:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2905
	line	32
	
l3083:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2911
	goto	u2910
u2911:
	goto	l3075
u2910:
	goto	l3085
	
l1553:	
	goto	l3085
	line	33
	
l1547:	
	line	34
	
l3085:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2920
	goto	l3089
u2920:
	line	35
	
l3087:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l3089
	
l1554:	
	line	36
	
l3089:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1555
	
l3091:	
	line	37
	
l1555:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___fttol
psect	text303,local,class=CODE,delta=2
global __ptext303
__ptext303:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    5[BANK0 ] unsigned long 
;;  exp1            1    9[BANK0 ] unsigned char 
;;  sign1           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         4      10       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text303
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 7
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l2997:	
	movf	(___fttol@f1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u2721
	goto	u2720
u2721:
	goto	l3003
u2720:
	line	50
	
l2999:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1515
	
l3001:	
	goto	l1515
	
l1514:	
	line	51
	
l3003:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u2735:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u2730:
	addlw	-1
	skipz
	goto	u2735
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l3005:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l3007:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l3009:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l3011:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l3013:	
	btfss	(___fttol@exp1),7
	goto	u2741
	goto	u2740
u2741:
	goto	l3023
u2740:
	line	57
	
l3015:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u2751
	goto	u2750
u2751:
	goto	l3021
u2750:
	line	58
	
l3017:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1515
	
l3019:	
	goto	l1515
	
l1517:	
	goto	l3021
	line	59
	
l1518:	
	line	60
	
l3021:	
	movlw	01h
u2765:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u2765

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u2771
	goto	u2770
u2771:
	goto	l3021
u2770:
	goto	l3033
	
l1519:	
	line	62
	goto	l3033
	
l1516:	
	line	63
	
l3023:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u2781
	goto	u2780
u2781:
	goto	l3031
u2780:
	line	64
	
l3025:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1515
	
l3027:	
	goto	l1515
	
l1521:	
	line	65
	goto	l3031
	
l1523:	
	line	66
	
l3029:	
	movlw	01h
	movwf	(??___fttol+0)+0
u2795:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u2795
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l3031
	line	68
	
l1522:	
	line	65
	
l3031:	
	movf	(___fttol@exp1),f
	skipz
	goto	u2801
	goto	u2800
u2801:
	goto	l3029
u2800:
	goto	l3033
	
l1524:	
	goto	l3033
	line	69
	
l1520:	
	line	70
	
l3033:	
	movf	(___fttol@sign1),w
	skipz
	goto	u2810
	goto	l3037
u2810:
	line	71
	
l3035:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	goto	l3037
	
l1525:	
	line	72
	
l3037:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l1515
	
l3039:	
	line	73
	
l1515:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text304,local,class=CODE,delta=2
global __ptext304
__ptext304:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftdiv
;;		___ftmul
;;		___awtoft
;;		___ftadd
;;		___lbtoft
;;		___abtoft
;;		___lwtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text304
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 6
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l2961:	
	movf	(___ftpack@exp),w
	skipz
	goto	u2610
	goto	l2965
u2610:
	
l2963:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2621
	goto	u2620
u2621:
	goto	l2971
u2620:
	goto	l2965
	
l1739:	
	line	65
	
l2965:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l1740
	
l2967:	
	goto	l1740
	
l1737:	
	line	66
	goto	l2971
	
l1742:	
	line	67
	
l2969:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u2635:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2635

	goto	l2971
	line	69
	
l1741:	
	line	66
	
l2971:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2641
	goto	u2640
u2641:
	goto	l2969
u2640:
	goto	l1744
	
l1743:	
	line	70
	goto	l1744
	
l1745:	
	line	71
	
l2973:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l2975:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l2977:	
	movlw	01h
u2655:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2655

	line	74
	
l1744:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2661
	goto	u2660
u2661:
	goto	l2973
u2660:
	goto	l2981
	
l1746:	
	line	75
	goto	l2981
	
l1748:	
	line	76
	
l2979:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u2675:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2675
	goto	l2981
	line	78
	
l1747:	
	line	75
	
l2981:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2681
	goto	u2680
u2681:
	goto	l2979
u2680:
	
l1749:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u2691
	goto	u2690
u2691:
	goto	l1750
u2690:
	line	80
	
l2983:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l1750:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l2985:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2705:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2700:
	addlw	-1
	skipz
	goto	u2705
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l2987:	
	movf	(___ftpack@sign),w
	skipz
	goto	u2710
	goto	l1751
u2710:
	line	84
	
l2989:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1751:	
	line	85
	line	86
	
l1740:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___wmul
psect	text305,local,class=CODE,delta=2
global __ptext305
__ptext305:

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
psect	text305
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l2879:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l2881
	line	6
	
l1405:	
	line	7
	
l2881:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l1406
u2330:
	line	8
	
l2883:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l1406:	
	line	9
	movlw	01h
	
u2345:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2345
	line	10
	
l2885:	
	movlw	01h
	
u2355:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2355
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2361
	goto	u2360
u2361:
	goto	l2881
u2360:
	goto	l2887
	
l1407:	
	line	12
	
l2887:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l1408
	
l2889:	
	line	13
	
l1408:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
psect	text306,local,class=CODE,delta=2
global __ptext306
__ptext306:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
