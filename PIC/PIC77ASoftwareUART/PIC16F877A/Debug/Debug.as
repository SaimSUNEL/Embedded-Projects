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
	FNCALL	_main,_SerialSoftware_ayarla
	FNCALL	_main,_SoftwareSerial_gonder
	FNCALL	_main,_SoftwareSerial_receive
	FNROOT	_main
	global	___ind
	global	_gelen_data
	global	_t
	global	_CARRY
psect	text100,local,class=CODE,delta=2
global __ptext100
__ptext100:
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RD5
_RD5	set	69
	global	_RD6
_RD6	set	70
	global	_RD7
_RD7	set	71
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISD5
_TRISD5	set	1093
	global	_TRISD6
_TRISD6	set	1094
	global	_TRISD7
_TRISD7	set	1095
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

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
___ind:
       ds      1

_gelen_data:
       ds      1

_t:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_SerialSoftware_ayarla
?_SerialSoftware_ayarla:	; 0 bytes @ 0x0
	global	??_SerialSoftware_ayarla
??_SerialSoftware_ayarla:	; 0 bytes @ 0x0
	global	?_SoftwareSerial_gonder
?_SoftwareSerial_gonder:	; 0 bytes @ 0x0
	global	??_SoftwareSerial_gonder
??_SoftwareSerial_gonder:	; 0 bytes @ 0x0
	global	??_SoftwareSerial_receive
??_SoftwareSerial_receive:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_SoftwareSerial_receive
?_SoftwareSerial_receive:	; 1 bytes @ 0x0
	ds	1
	global	SoftwareSerial_gonder@data
SoftwareSerial_gonder@data:	; 1 bytes @ 0x1
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 3, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       8
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_SoftwareSerial_gonder
;;   _main->_SoftwareSerial_receive
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
;; (0) _main                                                 3     3      0      15
;;                                              2 COMMON     3     3      0
;;              _SerialSoftware_ayarla
;;              _SoftwareSerial_gonder
;;             _SoftwareSerial_receive
;; ---------------------------------------------------------------------------------
;; (1) _SoftwareSerial_receive                               2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _SoftwareSerial_gonder                                2     2      0      15
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _SerialSoftware_ayarla                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _SerialSoftware_ayarla
;;   _SoftwareSerial_gonder
;;   _SoftwareSerial_receive
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       8       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       9      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 95 in file "../77aSoftwareSerialinC.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SerialSoftware_ayarla
;;		_SoftwareSerial_gonder
;;		_SoftwareSerial_receive
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../77aSoftwareSerialinC.c"
	line	95
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	97
	
l2656:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	98
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	101
	
l2658:	
	fcall	_SerialSoftware_ayarla
	line	102
	
l2660:	
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	8
movwf	((??_main+0)+0+1),f
	movlw	120
movwf	((??_main+0)+0),f
u2347:
	decfsz	((??_main+0)+0),f
	goto	u2347
	decfsz	((??_main+0)+0+1),f
	goto	u2347
	decfsz	((??_main+0)+0+2),f
	goto	u2347
opt asmopt_on

	line	103
	
l2662:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1093/8)^080h,(1093)&7
	line	104
	
l2664:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(69/8),(69)&7
	line	111
	
l709:	
	line	114
	movlw	(061h)
	fcall	_SoftwareSerial_gonder
	line	115
	
l2666:	
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	8
movwf	((??_main+0)+0+1),f
	movlw	120
movwf	((??_main+0)+0),f
u2357:
	decfsz	((??_main+0)+0),f
	goto	u2357
	decfsz	((??_main+0)+0+1),f
	goto	u2357
	decfsz	((??_main+0)+0+2),f
	goto	u2357
opt asmopt_on

	line	116
	
l2668:	
	movlw	(073h)
	fcall	_SoftwareSerial_gonder
	line	117
	opt asmopt_off
movlw	52
movwf	((??_main+0)+0+1),f
	movlw	241
movwf	((??_main+0)+0),f
u2367:
	decfsz	((??_main+0)+0),f
	goto	u2367
	decfsz	((??_main+0)+0+1),f
	goto	u2367
	nop2
opt asmopt_on

	line	118
	
l2670:	
	movlw	(061h)
	fcall	_SoftwareSerial_gonder
	line	119
	
l2672:	
	fcall	_SoftwareSerial_receive
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_t)
	line	120
	movf	(_t),w
	xorlw	061h
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l710
u2330:
	line	122
	
l2674:	
	movlw	1<<((48)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((48)/8),f
	line	124
	
l710:	
	line	125
	opt asmopt_off
movlw  41
movwf	((??_main+0)+0+2),f
movlw	150
movwf	((??_main+0)+0+1),f
	movlw	166
movwf	((??_main+0)+0),f
u2377:
	decfsz	((??_main+0)+0),f
	goto	u2377
	decfsz	((??_main+0)+0+1),f
	goto	u2377
	decfsz	((??_main+0)+0+2),f
	goto	u2377
opt asmopt_on

	goto	l709
	line	128
	
l711:	
	line	111
	goto	l709
	
l712:	
	line	131
	
l713:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_SoftwareSerial_receive
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:

;; *************** function _SoftwareSerial_receive *****************
;; Defined at:
;;		line 63 in file "../77aSoftwareSerialinC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text101
	file	"../77aSoftwareSerialinC.c"
	line	63
	global	__size_of_SoftwareSerial_receive
	__size_of_SoftwareSerial_receive	equ	__end_of_SoftwareSerial_receive-_SoftwareSerial_receive
	
_SoftwareSerial_receive:	
	opt	stack 7
; Regs used in _SoftwareSerial_receive: [wreg+status,2+status,0]
	line	64
	
l2636:	
	clrf	(_gelen_data)
	line	65
	goto	l701
	
l702:	
	
l701:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(71/8),(71)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l701
u2270:
	goto	l2638
	
l703:	
	line	68
	
l2638:	
	opt asmopt_off
movlw	146
movwf	(??_SoftwareSerial_receive+0)+0,f
u2387:
decfsz	(??_SoftwareSerial_receive+0)+0,f
	goto	u2387
	clrwdt
opt asmopt_on

	line	70
	
l2640:	
	clrf	(___ind)
	movlw	(08h)
	subwf	(___ind),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l2644
u2280:
	goto	l2652
	
l2642:	
	goto	l2652
	line	71
	
l704:	
	line	72
	
l2644:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(71/8),(71)&7
	movlw	1
	movwf	(??_SoftwareSerial_receive+0)+0
	incf	(___ind),w
	goto	u2294
u2295:
	clrc
	rlf	(??_SoftwareSerial_receive+0)+0,f
u2294:
	addlw	-1
	skipz
	goto	u2295
	movf	0+(??_SoftwareSerial_receive+0)+0,w
	movwf	(??_SoftwareSerial_receive+1)+0
	movf	(??_SoftwareSerial_receive+1)+0,w
	iorwf	(_gelen_data),f
	line	73
	
l2646:	
	btfsc	(71/8),(71)&7
	goto	u2301
	goto	u2300
	
u2301:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(69/8),(69)&7
	goto	u2314
u2300:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(69/8),(69)&7
u2314:
	line	74
	
l2648:	
	opt asmopt_off
movlw	133
movwf	(??_SoftwareSerial_receive+0)+0,f
u2397:
decfsz	(??_SoftwareSerial_receive+0)+0,f
	goto	u2397
opt asmopt_on

	line	70
	
l2650:	
	movlw	(01h)
	movwf	(??_SoftwareSerial_receive+0)+0
	movf	(??_SoftwareSerial_receive+0)+0,w
	addwf	(___ind),f
	movlw	(08h)
	subwf	(___ind),w
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l2644
u2320:
	goto	l2652
	
l705:	
	line	81
	
l2652:	
	movf	(_gelen_data),w
	movwf	(??_SoftwareSerial_receive+0)+0
	movf	(??_SoftwareSerial_receive+0)+0,w
	movwf	(_t)
	line	82
	movf	(_gelen_data),w
	goto	l706
	
l2654:	
	line	85
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_SoftwareSerial_receive
	__end_of_SoftwareSerial_receive:
;; =============== function _SoftwareSerial_receive ends ============

	signat	_SoftwareSerial_receive,89
	global	_SoftwareSerial_gonder
psect	text102,local,class=CODE,delta=2
global __ptext102
__ptext102:

;; *************** function _SoftwareSerial_gonder *****************
;; Defined at:
;;		line 28 in file "../77aSoftwareSerialinC.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text102
	file	"../77aSoftwareSerialinC.c"
	line	28
	global	__size_of_SoftwareSerial_gonder
	__size_of_SoftwareSerial_gonder	equ	__end_of_SoftwareSerial_gonder-_SoftwareSerial_gonder
	
_SoftwareSerial_gonder:	
	opt	stack 7
; Regs used in _SoftwareSerial_gonder: [wreg+status,2+status,0]
	movwf	(SoftwareSerial_gonder@data)
	line	29
	
l2620:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(70/8),(70)&7
	line	30
	
l2622:	
	opt asmopt_off
movlw	133
movwf	(??_SoftwareSerial_gonder+0)+0,f
u2407:
decfsz	(??_SoftwareSerial_gonder+0)+0,f
	goto	u2407
opt asmopt_on

	line	32
	
l2624:	
	clrf	(___ind)
	movlw	(08h)
	subwf	(___ind),w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l2628
u2220:
	goto	l697
	
l2626:	
	goto	l697
	line	33
	
l696:	
	line	35
	
l2628:	
	movf	(SoftwareSerial_gonder@data),w
	movwf	(??_SoftwareSerial_gonder+0)+0
	incf	(___ind),w
	goto	u2234
u2235:
	clrc
	rrf	(??_SoftwareSerial_gonder+0)+0,f
u2234:
	addlw	-1
	skipz
	goto	u2235
	btfsc	0+(??_SoftwareSerial_gonder+0)+0,0
	goto	u2241
	goto	u2240
	
u2241:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(70/8),(70)&7
	goto	u2254
u2240:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(70/8),(70)&7
u2254:
	line	36
	
l2630:	
	opt asmopt_off
movlw	126
movwf	(??_SoftwareSerial_gonder+0)+0,f
u2417:
decfsz	(??_SoftwareSerial_gonder+0)+0,f
	goto	u2417
	clrwdt
opt asmopt_on

	line	32
	
l2632:	
	movlw	(01h)
	movwf	(??_SoftwareSerial_gonder+0)+0
	movf	(??_SoftwareSerial_gonder+0)+0,w
	addwf	(___ind),f
	movlw	(08h)
	subwf	(___ind),w
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l2628
u2260:
	
l697:	
	line	44
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(70/8),(70)&7
	line	45
	
l2634:	
	opt asmopt_off
movlw	138
movwf	(??_SoftwareSerial_gonder+0)+0,f
u2427:
decfsz	(??_SoftwareSerial_gonder+0)+0,f
	goto	u2427
	clrwdt
opt asmopt_on

	line	57
	
l698:	
	return
	opt stack 0
GLOBAL	__end_of_SoftwareSerial_gonder
	__end_of_SoftwareSerial_gonder:
;; =============== function _SoftwareSerial_gonder ends ============

	signat	_SoftwareSerial_gonder,4216
	global	_SerialSoftware_ayarla
psect	text103,local,class=CODE,delta=2
global __ptext103
__ptext103:

;; *************** function _SerialSoftware_ayarla *****************
;; Defined at:
;;		line 17 in file "../77aSoftwareSerialinC.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text103
	file	"../77aSoftwareSerialinC.c"
	line	17
	global	__size_of_SerialSoftware_ayarla
	__size_of_SerialSoftware_ayarla	equ	__end_of_SerialSoftware_ayarla-_SerialSoftware_ayarla
	
_SerialSoftware_ayarla:	
	opt	stack 7
; Regs used in _SerialSoftware_ayarla: []
	line	19
	
l1760:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1095/8)^080h,(1095)&7
	line	20
	bcf	(1094/8)^080h,(1094)&7
	line	21
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(71/8),(71)&7
	line	22
	bsf	(70/8),(70)&7
	line	25
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_SerialSoftware_ayarla
	__end_of_SerialSoftware_ayarla:
;; =============== function _SerialSoftware_ayarla ends ============

	signat	_SerialSoftware_ayarla,88
psect	text104,local,class=CODE,delta=2
global __ptext104
__ptext104:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
