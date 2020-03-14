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
	FNCALL	_main,_seri_portu_ayarla
	FNCALL	_main,_servo_dondur
	FNCALL	_servo_dondur,___awdiv
	FNCALL	_servo_dondur,___awmod
	FNROOT	_main
	global	_app
	global	_ind
	global	_times
	global	_wait
	global	_PORTB
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_RCREG
_RCREG	set	26
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RCIF
_RCIF	set	101
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_TRISB
_TRISB	set	134
	global	_BRGH
_BRGH	set	1218
	global	_SYNC
_SYNC	set	1220
	global	_TRISC7
_TRISC7	set	1087
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
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
_app:
       ds      2

_ind:
       ds      2

_times:
       ds      2

_wait:
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
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_seri_portu_ayarla
?_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	??_seri_portu_ayarla
??_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	?_servo_dondur
?_servo_dondur:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	??_servo_dondur
??_servo_dondur:	; 0 bytes @ 0x9
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0xB
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	servo_dondur@c
servo_dondur@c:	; 2 bytes @ 0x0
	ds	2
	global	servo_dondur@angle
servo_dondur@angle:	; 1 bytes @ 0x2
	ds	1
	global	servo_dondur@b
servo_dondur@b:	; 2 bytes @ 0x3
	ds	2
	global	main@c
main@c:	; 2 bytes @ 0x5
	ds	2
	global	main@b
main@b:	; 2 bytes @ 0x7
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 8, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      13
;; BANK0           80      9      17
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_servo_dondur
;;   _servo_dondur->___awdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_servo_dondur
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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 7     7      0     803
;;                                             11 COMMON     2     2      0
;;                                              5 BANK0      4     4      0
;;                  _seri_portu_ayarla
;;                       _servo_dondur
;; ---------------------------------------------------------------------------------
;; (1) _servo_dondur                                         7     7      0     665
;;                                              9 COMMON     2     2      0
;;                                              0 BANK0      5     5      0
;;                            ___awdiv
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) _seri_portu_ayarla                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _seri_portu_ayarla
;;   _servo_dondur
;;     ___awdiv
;;     ___awmod
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      D       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      1E       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      9      11       5       21.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      20      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 92 in file "../BluetoothServoPic.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  b               2    7[BANK0 ] int 
;;  c               2    5[BANK0 ] int 
;;  gelen           1    0        unsigned char 
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
;;      Locals:         0       4       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       4       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_seri_portu_ayarla
;;		_servo_dondur
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../BluetoothServoPic.c"
	line	92
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	94
	
l2873:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1087/8)^080h,(1087)&7
	line	95
	
l2875:	
	clrf	(134)^080h	;volatile
	line	96
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	97
	clrf	(7)	;volatile
	line	99
	
l2877:	
	fcall	_seri_portu_ayarla
	line	100
	
l2879:	
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u2617:
	decfsz	((??_main+0)+0),f
	goto	u2617
	decfsz	((??_main+0)+0+1),f
	goto	u2617
	nop2
opt asmopt_on

	line	108
	
l2881:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@b)
	clrf	(main@b+1)
	line	109
	
l2883:	
	clrf	(main@c)
	clrf	(main@c+1)
	goto	l2885
	line	110
	
l721:	
	line	113
	
l2885:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@b)
	clrf	(main@b+1)
	
l2887:	
	movf	(main@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0B4h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2575
	movlw	low(0B4h)
	subwf	(main@b),w
u2575:

	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l2891
u2570:
	goto	l2899
	
l2889:	
	goto	l2899
	line	114
	
l722:	
	line	115
	
l2891:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@b),w
	fcall	_servo_dondur
	line	116
	
l2893:	
	opt asmopt_off
movlw	65
movwf	((??_main+0)+0+1),f
	movlw	238
movwf	((??_main+0)+0),f
u2627:
	decfsz	((??_main+0)+0),f
	goto	u2627
	decfsz	((??_main+0)+0+1),f
	goto	u2627
	clrwdt
opt asmopt_on

	line	113
	
l2895:	
	movlw	low(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@b),f
	skipnc
	incf	(main@b+1),f
	movlw	high(014h)
	addwf	(main@b+1),f
	
l2897:	
	movf	(main@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0B4h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2585
	movlw	low(0B4h)
	subwf	(main@b),w
u2585:

	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l2891
u2580:
	goto	l2899
	
l723:	
	line	120
	
l2899:	
	movlw	low(0B4h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@b)
	movlw	high(0B4h)
	movwf	((main@b))+1
	
l2901:	
	movf	(main@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2595
	movlw	low(01h)
	subwf	(main@b),w
u2595:

	skipnc
	goto	u2591
	goto	u2590
u2591:
	goto	l2905
u2590:
	goto	l2885
	
l2903:	
	goto	l2885
	line	121
	
l724:	
	line	122
	
l2905:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@b),w
	fcall	_servo_dondur
	line	123
	
l2907:	
	opt asmopt_off
movlw	65
movwf	((??_main+0)+0+1),f
	movlw	238
movwf	((??_main+0)+0),f
u2637:
	decfsz	((??_main+0)+0),f
	goto	u2637
	decfsz	((??_main+0)+0+1),f
	goto	u2637
	clrwdt
opt asmopt_on

	line	120
	
l2909:	
	movlw	low(-20)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@b),f
	skipnc
	incf	(main@b+1),f
	movlw	high(-20)
	addwf	(main@b+1),f
	
l2911:	
	movf	(main@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2605
	movlw	low(01h)
	subwf	(main@b),w
u2605:

	skipnc
	goto	u2601
	goto	u2600
u2601:
	goto	l2905
u2600:
	goto	l2885
	
l725:	
	goto	l2885
	line	134
	
l726:	
	line	110
	goto	l2885
	
l727:	
	line	139
	
l728:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_servo_dondur
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _servo_dondur *****************
;; Defined at:
;;		line 51 in file "../BluetoothServoPic.c"
;; Parameters:    Size  Location     Type
;;  angle           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  angle           1    2[BANK0 ] unsigned char 
;;  b               2    3[BANK0 ] int 
;;  c               2    0[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       5       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		___awmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text151
	file	"../BluetoothServoPic.c"
	line	51
	global	__size_of_servo_dondur
	__size_of_servo_dondur	equ	__end_of_servo_dondur-_servo_dondur
	
_servo_dondur:	
	opt	stack 6
; Regs used in _servo_dondur: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	54
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(servo_dondur@angle)
	
l2849:	
	movf	(servo_dondur@angle),w
	movwf	(??_servo_dondur+0)+0
	clrf	(??_servo_dondur+0)+0+1
	movlw	03h
	movwf	btemp+1
u2525:
	clrc
	rlf	(??_servo_dondur+0)+0,f
	rlf	(??_servo_dondur+0)+1,f
	decfsz	btemp+1,f
	goto	u2525
	movf	0+(??_servo_dondur+0)+0,w
	addlw	low(03E8h)
	movwf	(_wait)
	movf	1+(??_servo_dondur+0)+0,w
	skipnc
	addlw	1
	addlw	high(03E8h)
	movwf	1+(_wait)
	line	55
	
l2851:	
	movlw	low(0FAh)
	movwf	(?___awdiv)
	movlw	high(0FAh)
	movwf	((?___awdiv))+1
	movf	(_wait+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(_wait),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_times+1)
	addwf	(_times+1)
	movf	(0+(?___awdiv)),w
	clrf	(_times)
	addwf	(_times)

	line	57
	
l2853:	
	clrf	(_app)
	clrf	(_app+1)
	
l2855:	
	movf	(_app+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2535
	movlw	low(06h)
	subwf	(_app),w
u2535:

	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l710
u2530:
	goto	l718
	
l2857:	
	goto	l718
	line	58
	
l710:	
	line	59
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	62
	
l2859:	
	clrf	(_ind)
	clrf	(_ind+1)
	goto	l712
	line	63
	
l713:	
	line	64
	
l2861:	
	opt asmopt_off
movlw	83
movwf	(??_servo_dondur+0)+0,f
u2647:
decfsz	(??_servo_dondur+0)+0,f
	goto	u2647
opt asmopt_on

	line	62
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_ind),f
	skipnc
	incf	(_ind+1),f
	movlw	high(01h)
	addwf	(_ind+1),f
	
l712:	
	movf	(_ind+1),w
	xorlw	80h
	movwf	(??_servo_dondur+0)+0
	movf	(_times+1),w
	xorlw	80h
	subwf	(??_servo_dondur+0)+0,w
	skipz
	goto	u2545
	movf	(_times),w
	subwf	(_ind),w
u2545:

	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l2861
u2540:
	goto	l2863
	
l714:	
	line	70
	
l2863:	
	movlw	low(0FAh)
	movwf	(?___awmod)
	movlw	high(0FAh)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_wait+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(_wait),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(-10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(servo_dondur@c)
	movf	(1+(?___awmod)),w
	skipnc
	addlw	1
	addlw	high(-10)
	movwf	1+(servo_dondur@c)
	line	71
	
l2865:	
	clrf	(servo_dondur@b)
	clrf	(servo_dondur@b+1)
	goto	l715
	line	72
	
l716:	
		opt asmopt_off
	clrwdt
	opt asmopt_on

	line	71
	
l2867:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(servo_dondur@b),f
	skipnc
	incf	(servo_dondur@b+1),f
	movlw	high(01h)
	addwf	(servo_dondur@b+1),f
	
l715:	
	movf	(servo_dondur@b+1),w
	xorlw	80h
	movwf	(??_servo_dondur+0)+0
	movf	(servo_dondur@c+1),w
	xorlw	80h
	subwf	(??_servo_dondur+0)+0,w
	skipz
	goto	u2555
	movf	(servo_dondur@c),w
	subwf	(servo_dondur@b),w
u2555:

	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l716
u2550:
	
l717:	
	line	77
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	78
	
l2869:	
	opt asmopt_off
movlw	24
movwf	((??_servo_dondur+0)+0+1),f
	movlw	95
movwf	((??_servo_dondur+0)+0),f
u2657:
	decfsz	((??_servo_dondur+0)+0),f
	goto	u2657
	decfsz	((??_servo_dondur+0)+0+1),f
	goto	u2657
opt asmopt_on

	line	57
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_app),f
	skipnc
	incf	(_app+1),f
	movlw	high(01h)
	addwf	(_app+1),f
	
l2871:	
	movf	(_app+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2565
	movlw	low(06h)
	subwf	(_app),w
u2565:

	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l710
u2560:
	goto	l718
	
l711:	
	line	82
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_servo_dondur
	__end_of_servo_dondur:
;; =============== function _servo_dondur ends ============

	signat	_servo_dondur,4216
	global	___awmod
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
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
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_servo_dondur
;; This function uses a non-reentrant model
;;
psect	text152
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2815:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2431
	goto	u2430
u2431:
	goto	l2819
u2430:
	line	10
	
l2817:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l2819
	line	12
	
l1619:	
	line	13
	
l2819:	
	btfss	(___awmod@divisor+1),7
	goto	u2441
	goto	u2440
u2441:
	goto	l2823
u2440:
	line	14
	
l2821:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l2823
	
l1620:	
	line	15
	
l2823:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2451
	goto	u2450
u2451:
	goto	l2841
u2450:
	line	16
	
l2825:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2831
	
l1623:	
	line	18
	
l2827:	
	movlw	01h
	
u2465:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2465
	line	19
	
l2829:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l2831
	line	20
	
l1622:	
	line	17
	
l2831:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l2827
u2470:
	goto	l2833
	
l1624:	
	goto	l2833
	line	21
	
l1625:	
	line	22
	
l2833:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2485
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2485:
	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l2837
u2480:
	line	23
	
l2835:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l2837
	
l1626:	
	line	24
	
l2837:	
	movlw	01h
	
u2495:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2495
	line	25
	
l2839:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2501
	goto	u2500
u2501:
	goto	l2833
u2500:
	goto	l2841
	
l1627:	
	goto	l2841
	line	26
	
l1621:	
	line	27
	
l2841:	
	movf	(___awmod@sign),w
	skipz
	goto	u2510
	goto	l2845
u2510:
	line	28
	
l2843:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l2845
	
l1628:	
	line	29
	
l2845:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l1629
	
l2847:	
	line	30
	
l1629:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text153,local,class=CODE,delta=2
global __ptext153
__ptext153:

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
;;		_servo_dondur
;; This function uses a non-reentrant model
;;
psect	text153
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2775:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2331
	goto	u2330
u2331:
	goto	l2779
u2330:
	line	11
	
l2777:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2779
	line	13
	
l1551:	
	line	14
	
l2779:	
	btfss	(___awdiv@dividend+1),7
	goto	u2341
	goto	u2340
u2341:
	goto	l2785
u2340:
	line	15
	
l2781:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2783:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l2785
	line	17
	
l1552:	
	line	18
	
l2785:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2787:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2351
	goto	u2350
u2351:
	goto	l2807
u2350:
	line	20
	
l2789:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2795
	
l1555:	
	line	22
	
l2791:	
	movlw	01h
	
u2365:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2365
	line	23
	
l2793:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2795
	line	24
	
l1554:	
	line	21
	
l2795:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l2791
u2370:
	goto	l2797
	
l1556:	
	goto	l2797
	line	25
	
l1557:	
	line	26
	
l2797:	
	movlw	01h
	
u2385:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2385
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2395
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2395:
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l2803
u2390:
	line	28
	
l2799:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2801:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2803
	line	30
	
l1558:	
	line	31
	
l2803:	
	movlw	01h
	
u2405:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2405
	line	32
	
l2805:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2411
	goto	u2410
u2411:
	goto	l2797
u2410:
	goto	l2807
	
l1559:	
	goto	l2807
	line	33
	
l1553:	
	line	34
	
l2807:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2420
	goto	l2811
u2420:
	line	35
	
l2809:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2811
	
l1560:	
	line	36
	
l2811:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1561
	
l2813:	
	line	37
	
l1561:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_seri_portu_ayarla
psect	text154,local,class=CODE,delta=2
global __ptext154
__ptext154:

;; *************** function _seri_portu_ayarla *****************
;; Defined at:
;;		line 24 in file "../BluetoothServoPic.c"
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
psect	text154
	file	"../BluetoothServoPic.c"
	line	24
	global	__size_of_seri_portu_ayarla
	__size_of_seri_portu_ayarla	equ	__end_of_seri_portu_ayarla-_seri_portu_ayarla
	
_seri_portu_ayarla:	
	opt	stack 7
; Regs used in _seri_portu_ayarla: [wreg]
	
l2759:	
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	25
	
l2761:	
	bsf	(1218/8)^080h,(1218)&7
	line	27
	
l2763:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	29
	
l2765:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	31
	
l2767:	
	bcf	(1222/8)^080h,(1222)&7
	line	33
	
l2769:	
	bsf	(1221/8)^080h,(1221)&7
	line	35
	
l2771:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	37
	
l2773:	
	bsf	(196/8),(196)&7
	line	45
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_seri_portu_ayarla
	__end_of_seri_portu_ayarla:
;; =============== function _seri_portu_ayarla ends ============

	signat	_seri_portu_ayarla,88
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
