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
	FNCALL	_main,_servo_dondur
	FNCALL	_servo_dondur,___awdiv
	FNCALL	_servo_dondur,___awmod
	FNROOT	_main
	global	_app
	global	_ind
	global	_times
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_times:
       ds      2

	global	_wait
_wait:
       ds      2

	global	_PORTB
_PORTB	set	6
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_TRISB
_TRISB	set	134
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

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
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
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0xC
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	servo_dondur@angle
servo_dondur@angle:	; 1 bytes @ 0x0
	ds	1
	global	servo_dondur@c
servo_dondur@c:	; 2 bytes @ 0x1
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 4, persistent 4 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80      3      11
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     642
;;                       _servo_dondur
;; ---------------------------------------------------------------------------------
;; (1) _servo_dondur                                         6     6      0     642
;;                                              9 COMMON     3     3      0
;;                                              0 BANK0      3     3      0
;;                            ___awdiv
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
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
;;COMMON               E      C       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      17       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      3       B       5       13.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      19      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 43 in file "../ServowithPic.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  x               2    0        int 
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_servo_dondur
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../ServowithPic.c"
	line	43
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	44
	
l2776:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	45
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	48
	
l2778:	
	movlw	(014h)
	fcall	_servo_dondur
	goto	l707
	line	49
	
l706:	
	line	62
	
l707:	
	line	49
	goto	l707
	
l708:	
	line	65
	
l709:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_servo_dondur
psect	text123,local,class=CODE,delta=2
global __ptext123
__ptext123:

;; *************** function _servo_dondur *****************
;; Defined at:
;;		line 7 in file "../ServowithPic.c"
;; Parameters:    Size  Location     Type
;;  angle           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  angle           1    0[BANK0 ] unsigned char 
;;  c               2    1[BANK0 ] int 
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
;;      Locals:         0       3       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       3       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		___awmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text123
	file	"../ServowithPic.c"
	line	7
	global	__size_of_servo_dondur
	__size_of_servo_dondur	equ	__end_of_servo_dondur-_servo_dondur
	
_servo_dondur:	
	opt	stack 6
; Regs used in _servo_dondur: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	10
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(servo_dondur@angle)
	
l2752:	
	movf	(servo_dondur@angle),w
	movwf	(??_servo_dondur+0)+0
	clrf	(??_servo_dondur+0)+0+1
	movlw	03h
	movwf	btemp+1
u2465:
	clrc
	rlf	(??_servo_dondur+0)+0,f
	rlf	(??_servo_dondur+0)+1,f
	decfsz	btemp+1,f
	goto	u2465
	movf	0+(??_servo_dondur+0)+0,w
	addlw	low(021Ch)
	movwf	(_wait)
	movf	1+(??_servo_dondur+0)+0,w
	skipnc
	addlw	1
	addlw	high(021Ch)
	movwf	1+(_wait)
	line	11
	
l2754:	
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

	line	13
	
l2756:	
	clrf	(_app)
	clrf	(_app+1)
	
l2758:	
	movf	(_app+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2475
	movlw	low(06h)
	subwf	(_app),w
u2475:

	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l695
u2470:
	goto	l703
	
l2760:	
	goto	l703
	line	14
	
l695:	
	line	15
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	18
	
l2762:	
	clrf	(_ind)
	clrf	(_ind+1)
	goto	l697
	line	19
	
l698:	
	line	21
	
l2764:	
	opt asmopt_off
movlw	83
movwf	(??_servo_dondur+0)+0,f
u2517:
decfsz	(??_servo_dondur+0)+0,f
	goto	u2517
opt asmopt_on

	line	18
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_ind),f
	skipnc
	incf	(_ind+1),f
	movlw	high(01h)
	addwf	(_ind+1),f
	
l697:	
	movf	(_ind+1),w
	xorlw	80h
	movwf	(??_servo_dondur+0)+0
	movf	(_times+1),w
	xorlw	80h
	subwf	(??_servo_dondur+0)+0,w
	skipz
	goto	u2485
	movf	(_times),w
	subwf	(_ind),w
u2485:

	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l2764
u2480:
	goto	l2766
	
l699:	
	line	26
	
l2766:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(servo_dondur@c)
	clrf	(servo_dondur@c+1)
	goto	l2770
	line	27
	
l701:	
		opt asmopt_off
	clrwdt
	opt asmopt_on

	line	26
	
l2768:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(servo_dondur@c),f
	skipnc
	incf	(servo_dondur@c+1),f
	movlw	high(01h)
	addwf	(servo_dondur@c+1),f
	goto	l2770
	
l700:	
	
l2770:	
	movlw	low(0FAh)
	movwf	(?___awmod)
	movlw	high(0FAh)
	movwf	((?___awmod))+1
	movf	(_wait+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(_wait),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(-10)
	movwf	(??_servo_dondur+0)+0
	movf	(1+(?___awmod)),w
	skipnc
	addlw	1
	addlw	high(-10)
	movwf	1+(??_servo_dondur+0)+0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(servo_dondur@c+1),w
	xorlw	80h
	movwf	(??_servo_dondur+2)+0
	movf	1+(??_servo_dondur+0)+0,w
	xorlw	80h
	subwf	(??_servo_dondur+2)+0,w
	skipz
	goto	u2495
	movf	0+(??_servo_dondur+0)+0,w
	subwf	(servo_dondur@c),w
u2495:

	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l701
u2490:
	
l702:	
	line	32
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	33
	
l2772:	
	opt asmopt_off
movlw	25
movwf	((??_servo_dondur+0)+0+1),f
	movlw	171
movwf	((??_servo_dondur+0)+0),f
u2527:
	decfsz	((??_servo_dondur+0)+0),f
	goto	u2527
	decfsz	((??_servo_dondur+0)+0+1),f
	goto	u2527
	nop2
opt asmopt_on

	line	13
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_app),f
	skipnc
	incf	(_app+1),f
	movlw	high(01h)
	addwf	(_app+1),f
	
l2774:	
	movf	(_app+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2505
	movlw	low(06h)
	subwf	(_app),w
u2505:

	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l695
u2500:
	goto	l703
	
l696:	
	line	37
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_servo_dondur
	__end_of_servo_dondur:
;; =============== function _servo_dondur ends ============

	signat	_servo_dondur,4216
	global	___awmod
psect	text124,local,class=CODE,delta=2
global __ptext124
__ptext124:

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
psect	text124
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2718:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2371
	goto	u2370
u2371:
	goto	l2722
u2370:
	line	10
	
l2720:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l2722
	line	12
	
l1600:	
	line	13
	
l2722:	
	btfss	(___awmod@divisor+1),7
	goto	u2381
	goto	u2380
u2381:
	goto	l2726
u2380:
	line	14
	
l2724:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l2726
	
l1601:	
	line	15
	
l2726:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2391
	goto	u2390
u2391:
	goto	l2744
u2390:
	line	16
	
l2728:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2734
	
l1604:	
	line	18
	
l2730:	
	movlw	01h
	
u2405:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2405
	line	19
	
l2732:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l2734
	line	20
	
l1603:	
	line	17
	
l2734:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l2730
u2410:
	goto	l2736
	
l1605:	
	goto	l2736
	line	21
	
l1606:	
	line	22
	
l2736:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2425
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2425:
	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l2740
u2420:
	line	23
	
l2738:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l2740
	
l1607:	
	line	24
	
l2740:	
	movlw	01h
	
u2435:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2435
	line	25
	
l2742:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2441
	goto	u2440
u2441:
	goto	l2736
u2440:
	goto	l2744
	
l1608:	
	goto	l2744
	line	26
	
l1602:	
	line	27
	
l2744:	
	movf	(___awmod@sign),w
	skipz
	goto	u2450
	goto	l2748
u2450:
	line	28
	
l2746:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l2748
	
l1609:	
	line	29
	
l2748:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l1610
	
l2750:	
	line	30
	
l1610:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text125,local,class=CODE,delta=2
global __ptext125
__ptext125:

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
psect	text125
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2678:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2271
	goto	u2270
u2271:
	goto	l2682
u2270:
	line	11
	
l2680:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2682
	line	13
	
l1532:	
	line	14
	
l2682:	
	btfss	(___awdiv@dividend+1),7
	goto	u2281
	goto	u2280
u2281:
	goto	l2688
u2280:
	line	15
	
l2684:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2686:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l2688
	line	17
	
l1533:	
	line	18
	
l2688:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2690:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2291
	goto	u2290
u2291:
	goto	l2710
u2290:
	line	20
	
l2692:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2698
	
l1536:	
	line	22
	
l2694:	
	movlw	01h
	
u2305:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2305
	line	23
	
l2696:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2698
	line	24
	
l1535:	
	line	21
	
l2698:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l2694
u2310:
	goto	l2700
	
l1537:	
	goto	l2700
	line	25
	
l1538:	
	line	26
	
l2700:	
	movlw	01h
	
u2325:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2325
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2335
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2335:
	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l2706
u2330:
	line	28
	
l2702:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2704:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2706
	line	30
	
l1539:	
	line	31
	
l2706:	
	movlw	01h
	
u2345:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2345
	line	32
	
l2708:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2351
	goto	u2350
u2351:
	goto	l2700
u2350:
	goto	l2710
	
l1540:	
	goto	l2710
	line	33
	
l1534:	
	line	34
	
l2710:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2360
	goto	l2714
u2360:
	line	35
	
l2712:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2714
	
l1541:	
	line	36
	
l2714:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1542
	
l2716:	
	line	37
	
l1542:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
psect	text126,local,class=CODE,delta=2
global __ptext126
__ptext126:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
