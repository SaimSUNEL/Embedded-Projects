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
	FNCALL	_servo_dondur,___aldiv
	FNCALL	_servo_dondur,_DelayMs
	FNROOT	_main
	global	__dcnt
	global	_app
	global	_ind
	global	_i
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
__dcnt:
       ds      4

_app:
       ds      2

_ind:
       ds      2

_i:
       ds      1

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
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
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
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
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
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x8
	ds	1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x9
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0xA
	ds	4
	global	??_main
??_main:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	4
	global	??_servo_dondur
??_servo_dondur:	; 0 bytes @ 0x8
	ds	2
	global	servo_dondur@angle
servo_dondur@angle:	; 1 bytes @ 0xA
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 9, persistent 4 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     11      24
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___aldiv	long  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _servo_dondur->___aldiv
;;   ___aldiv->___awmod
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_servo_dondur
;;   _servo_dondur->___aldiv
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
;; (0) _main                                                 2     2      0     962
;;                       _servo_dondur
;; ---------------------------------------------------------------------------------
;; (1) _servo_dondur                                         3     3      0     962
;;                                              8 BANK0      3     3      0
;;                            ___awdiv
;;                            ___awmod
;;                            ___aldiv
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___aldiv                                             15     7      8     300
;;                                              7 COMMON     7     7      0
;;                                              0 BANK0      8     0      8
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (2) _DelayMs                                              2     2      0      44
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _servo_dondur
;;     ___awdiv
;;     ___awmod
;;     ___aldiv
;;       ___awmod (ARG)
;;     _DelayMs
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
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      26       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      B      18       5       30.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      28      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 41 in file "../ServowithPic.c"
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
	line	41
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	42
	
l2894:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	43
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	46
	
l2896:	
	movlw	(014h)
	fcall	_servo_dondur
	goto	l727
	line	47
	
l726:	
	line	60
	
l727:	
	line	47
	goto	l727
	
l728:	
	line	63
	
l729:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_servo_dondur
psect	text176,local,class=CODE,delta=2
global __ptext176
__ptext176:

;; *************** function _servo_dondur *****************
;; Defined at:
;;		line 6 in file "../ServowithPic.c"
;; Parameters:    Size  Location     Type
;;  angle           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  angle           1   10[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		___awmod
;;		___aldiv
;;		_DelayMs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text176
	file	"../ServowithPic.c"
	line	6
	global	__size_of_servo_dondur
	__size_of_servo_dondur	equ	__end_of_servo_dondur-_servo_dondur
	
_servo_dondur:	
	opt	stack 6
; Regs used in _servo_dondur: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	9
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(servo_dondur@angle)
	
l2866:	
	movf	(servo_dondur@angle),w
	movwf	(??_servo_dondur+0)+0
	clrf	(??_servo_dondur+0)+0+1
	movlw	03h
	movwf	btemp+1
u2675:
	clrc
	rlf	(??_servo_dondur+0)+0,f
	rlf	(??_servo_dondur+0)+1,f
	decfsz	btemp+1,f
	goto	u2675
	movf	0+(??_servo_dondur+0)+0,w
	addlw	low(021Ch)
	movwf	(_wait)
	movf	1+(??_servo_dondur+0)+0,w
	skipnc
	addlw	1
	addlw	high(021Ch)
	movwf	1+(_wait)
	line	10
	
l2868:	
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

	line	12
	
l2870:	
	clrf	(_app)
	clrf	(_app+1)
	
l2872:	
	movf	(_app+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2685
	movlw	low(06h)
	subwf	(_app),w
u2685:

	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l712
u2680:
	goto	l723
	
l2874:	
	goto	l723
	line	13
	
l712:	
	line	14
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	17
	
l2876:	
	clrf	(_ind)
	clrf	(_ind+1)
	goto	l714
	line	18
	
l715:	
	line	20
	
l2878:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	053h
	movwf	(__dcnt)

	goto	l2880
	
l717:	
	goto	l2880
	
l716:	
	
l2880:	
	movlw	0FFh
	addwf	(__dcnt),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+1),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+2),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+3),f
	movf	((__dcnt+3)),w
	iorwf	((__dcnt+2)),w
	iorwf	((__dcnt+1)),w
	iorwf	((__dcnt)),w
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l2880
u2690:
	goto	l2882
	
l718:	
	line	17
	
l2882:	
	movlw	low(01h)
	addwf	(_ind),f
	skipnc
	incf	(_ind+1),f
	movlw	high(01h)
	addwf	(_ind+1),f
	
l714:	
	movf	(_ind+1),w
	xorlw	80h
	movwf	(??_servo_dondur+0)+0
	movf	(_times+1),w
	xorlw	80h
	subwf	(??_servo_dondur+0)+0,w
	skipz
	goto	u2705
	movf	(_times),w
	subwf	(_ind),w
u2705:

	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l2878
u2700:
	goto	l2884
	
l719:	
	line	25
	
l2884:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___aldiv+3)
	movlw	0
	movwf	(?___aldiv+2)
	movlw	0
	movwf	(?___aldiv+1)
	movlw	03h
	movwf	(?___aldiv)

	movf	(_wait+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(_wait),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	movlw	low(0FAh)
	movwf	(?___awmod)
	movlw	high(0FAh)
	movwf	((?___awmod))+1
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(-10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_servo_dondur+0)+0
	movf	(1+(?___awmod)),w
	skipnc
	addlw	1
	addlw	high(-10)
	movwf	1+(??_servo_dondur+0)+0
	movf	0+(??_servo_dondur+0)+0,w
	movwf	0+(?___aldiv)+04h
	movf	1+(??_servo_dondur+0)+0,w
	movwf	1+(?___aldiv)+04h
	movlw	0
	btfsc	1+(?___aldiv)+04h,7
	movlw	255
	movwf	2+(?___aldiv)+04h
	movwf	3+(?___aldiv)+04h
	fcall	___aldiv
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(0+(?___aldiv)),w
	movwf	(__dcnt)
	movlw	0
	iorwf	(1+(?___aldiv)),w
	movwf	1+(__dcnt)
	movlw	0
	iorwf	(2+(?___aldiv)),w
	movwf	2+(__dcnt)
	movlw	0
	iorwf	(3+(?___aldiv)),w
	movwf	3+(__dcnt)
	goto	l2886
	
l721:	
	goto	l2886
	
l720:	
	
l2886:	
	movlw	0FFh
	addwf	(__dcnt),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+1),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+2),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+3),f
	movf	((__dcnt+3)),w
	iorwf	((__dcnt+2)),w
	iorwf	((__dcnt+1)),w
	iorwf	((__dcnt)),w
	skipz
	goto	u2711
	goto	u2710
u2711:
	goto	l2886
u2710:
	
l722:	
	line	30
	bcf	(48/8),(48)&7
	line	31
	
l2888:	
	movlw	(013h)
	fcall	_DelayMs
	line	12
	
l2890:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_app),f
	skipnc
	incf	(_app+1),f
	movlw	high(01h)
	addwf	(_app+1),f
	
l2892:	
	movf	(_app+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2725
	movlw	low(06h)
	subwf	(_app),w
u2725:

	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l712
u2720:
	goto	l723
	
l713:	
	line	35
	
l723:	
	return
	opt stack 0
GLOBAL	__end_of_servo_dondur
	__end_of_servo_dondur:
;; =============== function _servo_dondur ends ============

	signat	_servo_dondur,4216
	global	___awmod
psect	text177,local,class=CODE,delta=2
global __ptext177
__ptext177:

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
psect	text177
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2832:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2581
	goto	u2580
u2581:
	goto	l2836
u2580:
	line	10
	
l2834:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l2836
	line	12
	
l1620:	
	line	13
	
l2836:	
	btfss	(___awmod@divisor+1),7
	goto	u2591
	goto	u2590
u2591:
	goto	l2840
u2590:
	line	14
	
l2838:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l2840
	
l1621:	
	line	15
	
l2840:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2601
	goto	u2600
u2601:
	goto	l2858
u2600:
	line	16
	
l2842:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2848
	
l1624:	
	line	18
	
l2844:	
	movlw	01h
	
u2615:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2615
	line	19
	
l2846:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l2848
	line	20
	
l1623:	
	line	17
	
l2848:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l2844
u2620:
	goto	l2850
	
l1625:	
	goto	l2850
	line	21
	
l1626:	
	line	22
	
l2850:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2635
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2635:
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l2854
u2630:
	line	23
	
l2852:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l2854
	
l1627:	
	line	24
	
l2854:	
	movlw	01h
	
u2645:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2645
	line	25
	
l2856:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2651
	goto	u2650
u2651:
	goto	l2850
u2650:
	goto	l2858
	
l1628:	
	goto	l2858
	line	26
	
l1622:	
	line	27
	
l2858:	
	movf	(___awmod@sign),w
	skipz
	goto	u2660
	goto	l2862
u2660:
	line	28
	
l2860:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l2862
	
l1629:	
	line	29
	
l2862:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l1630
	
l2864:	
	line	30
	
l1630:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___aldiv
psect	text178,local,class=CODE,delta=2
global __ptext178
__ptext178:

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] long 
;;  dividend        4    4[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   10[COMMON] long 
;;  sign            1    9[COMMON] unsigned char 
;;  counter         1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         6       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       8       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_servo_dondur
;; This function uses a non-reentrant model
;;
psect	text178
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 6
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l2790:	
	clrf	(___aldiv@sign)
	line	10
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___aldiv@divisor+3),7
	goto	u2481
	goto	u2480
u2481:
	goto	l2796
u2480:
	line	11
	
l2792:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	12
	
l2794:	
	clrf	(___aldiv@sign)
	bsf	status,0
	rlf	(___aldiv@sign),f
	goto	l2796
	line	13
	
l1607:	
	line	14
	
l2796:	
	btfss	(___aldiv@dividend+3),7
	goto	u2491
	goto	u2490
u2491:
	goto	l2802
u2490:
	line	15
	
l2798:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	16
	
l2800:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l2802
	line	17
	
l1608:	
	line	18
	
l2802:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	19
	
l2804:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u2501
	goto	u2500
u2501:
	goto	l2824
u2500:
	line	20
	
l2806:	
	clrf	(___aldiv@counter)
	bsf	status,0
	rlf	(___aldiv@counter),f
	line	21
	goto	l2810
	
l1611:	
	line	22
	
l2808:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2515:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2515
	line	23
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l2810
	line	24
	
l1610:	
	line	21
	
l2810:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u2521
	goto	u2520
u2521:
	goto	l2808
u2520:
	goto	l2812
	
l1612:	
	goto	l2812
	line	25
	
l1613:	
	line	26
	
l2812:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2535:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2535
	line	27
	
l2814:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u2545
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u2545
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u2545
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u2545:
	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l2820
u2540:
	line	28
	
l2816:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	skipc
	incfsz	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	skipc
	incfsz	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	skipc
	incfsz	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),f
	line	29
	
l2818:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l2820
	line	30
	
l1614:	
	line	31
	
l2820:	
	movlw	01h
u2555:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u2555

	line	32
	
l2822:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u2561
	goto	u2560
u2561:
	goto	l2812
u2560:
	goto	l2824
	
l1615:	
	goto	l2824
	line	33
	
l1609:	
	line	34
	
l2824:	
	movf	(___aldiv@sign),w
	skipz
	goto	u2570
	goto	l2828
u2570:
	line	35
	
l2826:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	goto	l2828
	
l1616:	
	line	36
	
l2828:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l1617
	
l2830:	
	line	37
	
l1617:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	___awdiv
psect	text179,local,class=CODE,delta=2
global __ptext179
__ptext179:

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
psect	text179
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2750:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2381
	goto	u2380
u2381:
	goto	l2754
u2380:
	line	11
	
l2752:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2754
	line	13
	
l1552:	
	line	14
	
l2754:	
	btfss	(___awdiv@dividend+1),7
	goto	u2391
	goto	u2390
u2391:
	goto	l2760
u2390:
	line	15
	
l2756:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2758:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l2760
	line	17
	
l1553:	
	line	18
	
l2760:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2762:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2401
	goto	u2400
u2401:
	goto	l2782
u2400:
	line	20
	
l2764:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2770
	
l1556:	
	line	22
	
l2766:	
	movlw	01h
	
u2415:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2415
	line	23
	
l2768:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2770
	line	24
	
l1555:	
	line	21
	
l2770:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l2766
u2420:
	goto	l2772
	
l1557:	
	goto	l2772
	line	25
	
l1558:	
	line	26
	
l2772:	
	movlw	01h
	
u2435:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2435
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2445
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2445:
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l2778
u2440:
	line	28
	
l2774:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2776:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2778
	line	30
	
l1559:	
	line	31
	
l2778:	
	movlw	01h
	
u2455:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2455
	line	32
	
l2780:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2461
	goto	u2460
u2461:
	goto	l2772
u2460:
	goto	l2782
	
l1560:	
	goto	l2782
	line	33
	
l1554:	
	line	34
	
l2782:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2470
	goto	l2786
u2470:
	line	35
	
l2784:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2786
	
l1561:	
	line	36
	
l2786:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1562
	
l2788:	
	line	37
	
l1562:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_DelayMs
psect	text180,local,class=CODE,delta=2
global __ptext180
__ptext180:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 5 in file "c:\\tc\\delay.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    1[COMMON] unsigned char 
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
;;		_servo_dondur
;; This function uses a non-reentrant model
;;
psect	text180
	file	"c:\\tc\\delay.c"
	line	5
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 6
; Regs used in _DelayMs: [wreg+status,2+status,0]
	movwf	(DelayMs@cnt)
	line	7
	
l697:	
	line	8
	
l2736:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	01h
	movwf	(__dcnt+1)
	movlw	04Dh
	movwf	(__dcnt)

	goto	l2738
	
l699:	
	goto	l2738
	
l698:	
	
l2738:	
	movlw	0FFh
	addwf	(__dcnt),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+1),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+2),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+3),f
	movf	((__dcnt+3)),w
	iorwf	((__dcnt+2)),w
	iorwf	((__dcnt+1)),w
	iorwf	((__dcnt)),w
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l2738
u2330:
	goto	l2740
	
l700:	
	line	9
	
l2740:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2341
	goto	u2340
u2341:
	goto	l697
u2340:
	goto	l2742
	
l701:	
	goto	l2742
	line	14
	
l702:	
	line	15
	
l2742:	
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(_i)
	line	16
	
l703:	
	line	17
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	053h
	movwf	(__dcnt)

	goto	l2744
	
l705:	
	goto	l2744
	
l704:	
	
l2744:	
	movlw	0FFh
	addwf	(__dcnt),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+1),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+2),f
	movlw	0FFh
	skipc
	addwf	(__dcnt+3),f
	movf	((__dcnt+3)),w
	iorwf	((__dcnt+2)),w
	iorwf	((__dcnt+1)),w
	iorwf	((__dcnt)),w
	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l2744
u2350:
	goto	l2746
	
l706:	
	line	18
	
l2746:	
	movlw	low(01h)
	subwf	(_i),f
	btfss	status,2
	goto	u2361
	goto	u2360
u2361:
	goto	l703
u2360:
	goto	l2748
	
l707:	
	line	19
	
l2748:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2371
	goto	u2370
u2371:
	goto	l2742
u2370:
	goto	l709
	
l708:	
	line	21
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
psect	text181,local,class=CODE,delta=2
global __ptext181
__ptext181:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
