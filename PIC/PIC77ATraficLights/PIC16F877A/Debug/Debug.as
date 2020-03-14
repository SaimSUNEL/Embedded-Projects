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
	FNCALL	_main,_DelayMs
	FNROOT	_main
	global	_i
	global	__dcnt
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
__dcnt:
       ds      4

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
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_i:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
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
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2
;;Data sizes: Strings 0, constant 0, data 0, bss 1, persistent 4 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      2       7
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DelayMs
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      30
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DelayMs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      2       7       1       50.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       7       3        0.0%
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
;;DATA                 0      0       8      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 16 in file "../PetriNet.c"
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
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PetriNet.c"
	line	16
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	18
	
l2626:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	19
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	20
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	21
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	22
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	23
	clrf	(133)^080h	;volatile
	line	24
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	25
	clrf	(8)	;volatile
	goto	l2628
	line	29
	
l704:	
	line	37
	
l2628:	
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	39
	
l2630:	
	movlw	(0Ch)
	movwf	(8)	;volatile
	line	44
	
l2632:	
	movlw	(01h)
	movwf	(7)	;volatile
	line	45
	
l2634:	
	movlw	(01h)
	movwf	(5)	;volatile
	line	47
	
l2636:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	48
	
l2638:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	49
	
l2640:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	50
	
l2642:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	51
	
l2644:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	52
	
l2646:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	55
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	56
	clrf	(8)	;volatile
	line	59
	
l2648:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	61
	
l2650:	
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	63
	
l2652:	
	movlw	(0Ch)
	movwf	(8)	;volatile
	line	64
	
l2654:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	68
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	69
	clrf	(8)	;volatile
	line	72
	
l2656:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	76
	
l2658:	
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	78
	
l2660:	
	movlw	(0Ch)
	movwf	(8)	;volatile
	line	82
	
l2662:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	85
	
l2664:	
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	86
	
l2666:	
	movlw	(02h)
	movwf	(8)	;volatile
	line	87
	
l2668:	
	movlw	(02h)
	movwf	(7)	;volatile
	line	88
	
l2670:	
	movlw	(02h)
	movwf	(5)	;volatile
	line	91
	
l2672:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	92
	
l2674:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	93
	
l2676:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	94
	
l2678:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	95
	
l2680:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	96
	
l2682:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	97
	
l2684:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	98
	
l2686:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	100
	
l2688:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	101
	
l2690:	
	movlw	(01h)
	movwf	(8)	;volatile
	line	102
	
l2692:	
	movlw	(0Ch)
	movwf	(7)	;volatile
	line	103
	
l2694:	
	movlw	(0Ch)
	movwf	(5)	;volatile
	line	104
	
l2696:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	105
	
l2698:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	106
	
l2700:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	107
	
l2702:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	108
	
l2704:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	109
	
l2706:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	110
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	111
	clrf	(5)	;volatile
	line	114
	
l2708:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	116
	
l2710:	
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	117
	
l2712:	
	movlw	(0Ch)
	movwf	(5)	;volatile
	line	119
	
l2714:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	120
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	121
	clrf	(5)	;volatile
	line	123
	
l2716:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	125
	
l2718:	
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	126
	
l2720:	
	movlw	(0Ch)
	movwf	(5)	;volatile
	line	127
	
l2722:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	128
	
l2724:	
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	129
	
l2726:	
	movlw	(02h)
	movwf	(8)	;volatile
	line	130
	
l2728:	
	movlw	(02h)
	movwf	(7)	;volatile
	line	131
	
l2730:	
	movlw	(02h)
	movwf	(5)	;volatile
	line	132
	
l2732:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	133
	
l2734:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	134
	
l2736:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	135
	
l2738:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	136
	
l2740:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	137
	
l2742:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	138
	
l2744:	
	movlw	(0FAh)
	fcall	_DelayMs
	line	139
	
l2746:	
	movlw	(0FAh)
	fcall	_DelayMs
	goto	l2628
	line	144
	
l705:	
	line	29
	goto	l2628
	
l706:	
	line	152
	
l707:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DelayMs
psect	text71,local,class=CODE,delta=2
global __ptext71
__ptext71:

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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text71
	file	"c:\\tc\\delay.c"
	line	5
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 7
; Regs used in _DelayMs: [wreg+status,2+status,0]
	movwf	(DelayMs@cnt)
	line	7
	
l689:	
	line	8
	
l1754:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	01h
	movwf	(__dcnt+1)
	movlw	04Dh
	movwf	(__dcnt)

	goto	l1756
	
l691:	
	goto	l1756
	
l690:	
	
l1756:	
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
	goto	u11
	goto	u10
u11:
	goto	l1756
u10:
	goto	l1758
	
l692:	
	line	9
	
l1758:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l689
u20:
	goto	l1760
	
l693:	
	goto	l1760
	line	14
	
l694:	
	line	15
	
l1760:	
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(_i)
	line	16
	
l695:	
	line	17
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	053h
	movwf	(__dcnt)

	goto	l1762
	
l697:	
	goto	l1762
	
l696:	
	
l1762:	
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
	goto	u31
	goto	u30
u31:
	goto	l1762
u30:
	goto	l1764
	
l698:	
	line	18
	
l1764:	
	movlw	low(01h)
	subwf	(_i),f
	btfss	status,2
	goto	u41
	goto	u40
u41:
	goto	l695
u40:
	goto	l1766
	
l699:	
	line	19
	
l1766:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u51
	goto	u50
u51:
	goto	l1760
u50:
	goto	l701
	
l700:	
	line	21
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
psect	text72,local,class=CODE,delta=2
global __ptext72
__ptext72:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
