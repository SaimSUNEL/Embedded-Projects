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
	FNCALL	_main,_seri_porttan_veri_al
	FNCALL	_main,_seri_porta_veri_gonder
	FNROOT	_main
	global	_gelen
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
_gelen:
       ds      1

	global	_PORTB
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
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RC0
_RC0	set	56
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

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_seri_porttan_veri_al
??_seri_porttan_veri_al:	; 0 bytes @ 0x0
	global	?_seri_porta_veri_gonder
?_seri_porta_veri_gonder:	; 0 bytes @ 0x0
	global	??_seri_porta_veri_gonder
??_seri_porta_veri_gonder:	; 0 bytes @ 0x0
	global	?_seri_portu_ayarla
?_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	??_seri_portu_ayarla
??_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_seri_porttan_veri_al
?_seri_porttan_veri_al:	; 1 bytes @ 0x0
	global	seri_porta_veri_gonder@jk
seri_porta_veri_gonder@jk:	; 1 bytes @ 0x0
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 1 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       5
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_seri_porta_veri_gonder
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
;;                                              1 COMMON     3     3      0
;;                  _seri_portu_ayarla
;;               _seri_porttan_veri_al
;;             _seri_porta_veri_gonder
;; ---------------------------------------------------------------------------------
;; (1) _seri_portu_ayarla                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _seri_porta_veri_gonder                               1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _seri_porttan_veri_al                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _seri_portu_ayarla
;;   _seri_porttan_veri_al
;;   _seri_porta_veri_gonder
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       5       1       35.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       5       3        0.0%
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
;;DATA                 0      0       6      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 48 in file "../BluetoothUsart.c"
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
;;		_seri_portu_ayarla
;;		_seri_porttan_veri_al
;;		_seri_porta_veri_gonder
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../BluetoothUsart.c"
	line	48
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	49
	
l2642:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	50
	clrf	(6)	;volatile
	line	51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	52
	
l2644:	
	fcall	_seri_portu_ayarla
	goto	l2646
	line	55
	
l704:	
	line	57
	
l2646:	
	fcall	_seri_porttan_veri_al
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_gelen)
	line	60
	
l2648:	
	movlw	1<<((56)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((56)/8),f
	line	61
	
l2650:	
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2287:
	decfsz	((??_main+0)+0),f
	goto	u2287
	decfsz	((??_main+0)+0+1),f
	goto	u2287
	decfsz	((??_main+0)+0+2),f
	goto	u2287
	nop2
opt asmopt_on

	line	62
	
l2652:	
	movf	(_gelen),w
	xorlw	077h
	skipz
	goto	u2241
	goto	u2240
u2241:
	goto	l705
u2240:
	line	64
	
l2654:	
	movlw	1<<((48)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((48)/8),f
	line	65
	
l705:	
	line	66
	movf	(_gelen),w
	xorlw	073h
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l706
u2250:
	line	68
	
l2656:	
	movlw	1<<((49)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((49)/8),f
	line	69
	
l706:	
	line	70
	movf	(_gelen),w
	xorlw	064h
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l707
u2260:
	line	72
	
l2658:	
	movlw	1<<((50)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((50)/8),f
	line	73
	
l707:	
	line	74
	movf	(_gelen),w
	xorlw	061h
	skipz
	goto	u2271
	goto	u2270
u2271:
	goto	l2662
u2270:
	line	76
	
l2660:	
	movlw	1<<((51)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((51)/8),f
	goto	l2662
	line	77
	
l708:	
	line	79
	
l2662:	
	movlw	(056h)
	fcall	_seri_porta_veri_gonder
	line	80
	
l2664:	
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2297:
	decfsz	((??_main+0)+0),f
	goto	u2297
	decfsz	((??_main+0)+0+1),f
	goto	u2297
	clrwdt
opt asmopt_on

	line	81
	movlw	(065h)
	fcall	_seri_porta_veri_gonder
	line	82
	
l2666:	
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2307:
	decfsz	((??_main+0)+0),f
	goto	u2307
	decfsz	((??_main+0)+0+1),f
	goto	u2307
	clrwdt
opt asmopt_on

	line	83
	
l2668:	
	movlw	(072h)
	fcall	_seri_porta_veri_gonder
	line	84
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2317:
	decfsz	((??_main+0)+0),f
	goto	u2317
	decfsz	((??_main+0)+0+1),f
	goto	u2317
	clrwdt
opt asmopt_on

	line	85
	
l2670:	
	movlw	(069h)
	fcall	_seri_porta_veri_gonder
	line	86
	
l2672:	
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2327:
	decfsz	((??_main+0)+0),f
	goto	u2327
	decfsz	((??_main+0)+0+1),f
	goto	u2327
	clrwdt
opt asmopt_on

	line	87
	movlw	(020h)
	fcall	_seri_porta_veri_gonder
	line	88
	
l2674:	
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2337:
	decfsz	((??_main+0)+0),f
	goto	u2337
	decfsz	((??_main+0)+0+1),f
	goto	u2337
	clrwdt
opt asmopt_on

	line	89
	
l2676:	
	movlw	(047h)
	fcall	_seri_porta_veri_gonder
	line	90
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2347:
	decfsz	((??_main+0)+0),f
	goto	u2347
	decfsz	((??_main+0)+0+1),f
	goto	u2347
	clrwdt
opt asmopt_on

	line	91
	
l2678:	
	movlw	(065h)
	fcall	_seri_porta_veri_gonder
	line	92
	
l2680:	
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2357:
	decfsz	((??_main+0)+0),f
	goto	u2357
	decfsz	((??_main+0)+0+1),f
	goto	u2357
	clrwdt
opt asmopt_on

	movlw	(06Ch)
	fcall	_seri_porta_veri_gonder
	line	93
	
l2682:	
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2367:
	decfsz	((??_main+0)+0),f
	goto	u2367
	decfsz	((??_main+0)+0+1),f
	goto	u2367
	clrwdt
opt asmopt_on

	
l2684:	
	movlw	(064h)
	fcall	_seri_porta_veri_gonder
	line	94
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2377:
	decfsz	((??_main+0)+0),f
	goto	u2377
	decfsz	((??_main+0)+0+1),f
	goto	u2377
	clrwdt
opt asmopt_on

	
l2686:	
	movlw	(069h)
	fcall	_seri_porta_veri_gonder
	line	95
	
l2688:	
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2387:
	decfsz	((??_main+0)+0),f
	goto	u2387
	decfsz	((??_main+0)+0+1),f
	goto	u2387
	clrwdt
opt asmopt_on

	line	96
	movlw	(02Dh)
	fcall	_seri_porta_veri_gonder
	line	97
	
l2690:	
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2397:
	decfsz	((??_main+0)+0),f
	goto	u2397
	decfsz	((??_main+0)+0+1),f
	goto	u2397
	clrwdt
opt asmopt_on

	line	98
	
l2692:	
	movf	(_gelen),w
	fcall	_seri_porta_veri_gonder
	line	99
	opt asmopt_off
movlw	104
movwf	((??_main+0)+0+1),f
	movlw	228
movwf	((??_main+0)+0),f
u2407:
	decfsz	((??_main+0)+0),f
	goto	u2407
	decfsz	((??_main+0)+0+1),f
	goto	u2407
	clrwdt
opt asmopt_on

	goto	l2646
	line	100
	
l709:	
	line	55
	goto	l2646
	
l710:	
	line	111
	
l711:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_seri_portu_ayarla
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:

;; *************** function _seri_portu_ayarla *****************
;; Defined at:
;;		line 18 in file "../BluetoothUsart.c"
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
psect	text101
	file	"../BluetoothUsart.c"
	line	18
	global	__size_of_seri_portu_ayarla
	__size_of_seri_portu_ayarla	equ	__end_of_seri_portu_ayarla-_seri_portu_ayarla
	
_seri_portu_ayarla:	
	opt	stack 7
; Regs used in _seri_portu_ayarla: [wreg]
	
l1768:	
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	19
	
l1770:	
	bsf	(1218/8)^080h,(1218)&7
	line	22
	
l1772:	
	bcf	(1220/8)^080h,(1220)&7
	line	24
	
l1774:	
	bcf	(1222/8)^080h,(1222)&7
	line	26
	
l1776:	
	bsf	(1221/8)^080h,(1221)&7
	line	28
	
l1778:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	30
	
l1780:	
	bsf	(196/8),(196)&7
	line	34
	
l1782:	
	bsf	(199/8),(199)&7
	line	39
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_seri_portu_ayarla
	__end_of_seri_portu_ayarla:
;; =============== function _seri_portu_ayarla ends ============

	signat	_seri_portu_ayarla,88
	global	_seri_porta_veri_gonder
psect	text102,local,class=CODE,delta=2
global __ptext102
__ptext102:

;; *************** function _seri_porta_veri_gonder *****************
;; Defined at:
;;		line 12 in file "../BluetoothUsart.c"
;; Parameters:    Size  Location     Type
;;  jk              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  jk              1    0[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text102
	file	"../BluetoothUsart.c"
	line	12
	global	__size_of_seri_porta_veri_gonder
	__size_of_seri_porta_veri_gonder	equ	__end_of_seri_porta_veri_gonder-_seri_porta_veri_gonder
	
_seri_porta_veri_gonder:	
	opt	stack 7
; Regs used in _seri_porta_veri_gonder: [wreg]
	movwf	(seri_porta_veri_gonder@jk)
	
l1764:	
	goto	l695
	
l696:	
	
l695:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u21
	goto	u20
u21:
	goto	l695
u20:
	goto	l1766
	
l697:	
	line	13
	
l1766:	
	movf	(seri_porta_veri_gonder@jk),w
	movwf	(25)	;volatile
	line	16
	
l698:	
	return
	opt stack 0
GLOBAL	__end_of_seri_porta_veri_gonder
	__end_of_seri_porta_veri_gonder:
;; =============== function _seri_porta_veri_gonder ends ============

	signat	_seri_porta_veri_gonder,4216
	global	_seri_porttan_veri_al
psect	text103,local,class=CODE,delta=2
global __ptext103
__ptext103:

;; *************** function _seri_porttan_veri_al *****************
;; Defined at:
;;		line 7 in file "../BluetoothUsart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
psect	text103
	file	"../BluetoothUsart.c"
	line	7
	global	__size_of_seri_porttan_veri_al
	__size_of_seri_porttan_veri_al	equ	__end_of_seri_porttan_veri_al-_seri_porttan_veri_al
	
_seri_porttan_veri_al:	
	opt	stack 7
; Regs used in _seri_porttan_veri_al: [wreg]
	line	8
	
l1758:	
	goto	l689
	
l690:	
	
l689:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u11
	goto	u10
u11:
	goto	l689
u10:
	goto	l1760
	
l691:	
	line	9
	
l1760:	
	movf	(26),w	;volatile
	goto	l692
	
l1762:	
	line	10
	
l692:	
	return
	opt stack 0
GLOBAL	__end_of_seri_porttan_veri_al
	__end_of_seri_porttan_veri_al:
;; =============== function _seri_porttan_veri_al ends ============

	signat	_seri_porttan_veri_al,89
psect	text104,local,class=CODE,delta=2
global __ptext104
__ptext104:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
