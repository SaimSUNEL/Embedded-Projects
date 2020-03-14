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
	FNROOT	_main
	FNCALL	_FNC,_seri_porta_veri_gonder
	FNCALL	_FNC,_DelayMs
	FNCALL	intlevel1,_FNC
	global	intlevel1
	FNROOT	intlevel1
	global	_degerler
	global	__dcnt
	global	_freq
	global	_b
	global	_i
	global	_index
	global	_x
	global	_CCPR1
psect	text227,local,class=CODE,delta=2
global __ptext227
__ptext227:
_CCPR1	set	21
	global	_TMR1
_TMR1	set	14
	global	_PORTB
_PORTB	set	6
	global	_RCREG
_RCREG	set	26
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CCP1IF
_CCP1IF	set	98
	global	_CCP1M2
_CCP1M2	set	186
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RCIF
_RCIF	set	101
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_T1CKPS0
_T1CKPS0	set	132
	global	_T1CKPS1
_T1CKPS1	set	133
	global	_TMR1CS
_TMR1CS	set	129
	global	_TMR1ON
_TMR1ON	set	128
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_TRISB
_TRISB	set	134
	global	_BRGH
_BRGH	set	1218
	global	_CCP1IE
_CCP1IE	set	1122
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

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_b:
       ds      1

_i:
       ds      1

_index:
       ds      1

_x:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_degerler:
       ds      20

__dcnt:
       ds      4

_freq:
       ds      4

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

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Ch)
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
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
	global	?_seri_porta_veri_gonder
?_seri_porta_veri_gonder:	; 0 bytes @ 0x0
	global	??_seri_porta_veri_gonder
??_seri_porta_veri_gonder:	; 0 bytes @ 0x0
	global	?_seri_portu_ayarla
?_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	?_FNC
?_FNC:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	seri_porta_veri_gonder@jk
seri_porta_veri_gonder@jk:	; 1 bytes @ 0x0
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	??_FNC
??_FNC:	; 0 bytes @ 0x2
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_seri_portu_ayarla
??_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
;;Data sizes: Strings 0, constant 0, data 0, bss 32, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      11
;; BANK0           80      0      28
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _FNC in COMMON
;;
;;   _FNC->_DelayMs
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK2
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
;; (0) _main                                                 0     0      0       0
;;                  _seri_portu_ayarla
;; ---------------------------------------------------------------------------------
;; (1) _seri_portu_ayarla                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _FNC                                                  5     5      0      59
;;                                              2 COMMON     5     5      0
;;             _seri_porta_veri_gonder
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (3) _seri_porta_veri_gonder                               1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _DelayMs                                              2     2      0      44
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _seri_portu_ayarla
;;
;; _FNC (ROOT)
;;   _seri_porta_veri_gonder
;;   _DelayMs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       5       2        0.0%
;;ABS                  0      0      27       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0      1C       5       35.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      2C      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 66 in file "../PICFreguency.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_seri_portu_ayarla
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PICFreguency.c"
	line	66
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	67
	
l2763:	
	fcall	_seri_portu_ayarla
	line	68
	
l2765:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	69
	
l2767:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	70
	
l2769:	
	bsf	(186/8),(186)&7
	line	71
	
l2771:	
	clrf	(14)	;volatile
	clrf	(14+1)	;volatile
	line	72
	
l2773:	
	bcf	(129/8),(129)&7
	line	73
	
l2775:	
	bsf	(95/8),(95)&7
	line	74
	
l2777:	
	bsf	(94/8),(94)&7
	line	75
	
l2779:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1122/8)^080h,(1122)&7
	line	76
	
l2781:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(133/8),(133)&7
	line	77
	
l2783:	
	bcf	(132/8),(132)&7
	line	78
	
l2785:	
	bsf	(128/8),(128)&7
	goto	l734
	line	80
	
l733:	
	
l734:	
	goto	l734
	
l735:	
	line	84
	
l736:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_seri_portu_ayarla
psect	text228,local,class=CODE,delta=2
global __ptext228
__ptext228:

;; *************** function _seri_portu_ayarla *****************
;; Defined at:
;;		line 19 in file "../PICFreguency.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text228
	file	"../PICFreguency.c"
	line	19
	global	__size_of_seri_portu_ayarla
	__size_of_seri_portu_ayarla	equ	__end_of_seri_portu_ayarla-_seri_portu_ayarla
	
_seri_portu_ayarla:	
	opt	stack 5
; Regs used in _seri_portu_ayarla: [wreg]
	
l2747:	
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	20
	
l2749:	
	bsf	(1218/8)^080h,(1218)&7
	line	23
	
l2751:	
	bcf	(1220/8)^080h,(1220)&7
	line	25
	
l2753:	
	bcf	(1222/8)^080h,(1222)&7
	line	27
	
l2755:	
	bsf	(1221/8)^080h,(1221)&7
	line	29
	
l2757:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	31
	
l2759:	
	bsf	(196/8),(196)&7
	line	35
	
l2761:	
	bsf	(199/8),(199)&7
	line	40
	
l726:	
	return
	opt stack 0
GLOBAL	__end_of_seri_portu_ayarla
	__end_of_seri_portu_ayarla:
;; =============== function _seri_portu_ayarla ends ============

	signat	_seri_portu_ayarla,88
	global	_FNC
psect	text229,local,class=CODE,delta=2
global __ptext229
__ptext229:

;; *************** function _FNC *****************
;; Defined at:
;;		line 44 in file "../PICFreguency.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_seri_porta_veri_gonder
;;		_DelayMs
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text229
	file	"../PICFreguency.c"
	line	44
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 5
; Regs used in _FNC: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_FNC+1)
	movf	fsr0,w
	movwf	(??_FNC+2)
	movf	pclath,w
	movwf	(??_FNC+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_FNC+4)
	ljmp	_FNC
psect	text229
	line	46
	
i1l2733:	
	movf	(_index),w
	movwf	(??_FNC+0)+0
	addwf	(??_FNC+0)+0,w
	addlw	_degerler&0ffh
	movwf	fsr0
	movf	(21),w	;volatile
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(21+1),w	;volatile
	movwf	indf
	
i1l2735:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_index),f
	line	47
	
i1l2737:	
	bcf	(98/8),(98)&7
	line	48
	
i1l2739:	
	movf	(_index),w
	xorlw	0Ah
	skipz
	goto	u235_21
	goto	u235_20
u235_21:
	goto	i1l730
u235_20:
	
i1l2741:	
	clrf	(_index)
	line	51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1122/8)^080h,(1122)&7
	line	53
	
i1l2743:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	0+(_degerler)+08h,w
	xorlw	0ffh
	addwf	0+(_degerler)+0Ah,w
	fcall	_seri_porta_veri_gonder
	line	55
	movlw	(0F4h)
	fcall	_DelayMs
	line	58
	
i1l2745:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1122/8)^080h,(1122)&7
	goto	i1l730
	line	62
	
i1l729:	
	line	63
	
i1l730:	
	movf	(??_FNC+4),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	movf	(??_FNC+3),w
	movwf	pclath
	movf	(??_FNC+2),w
	movwf	fsr0
	swapf	(??_FNC+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_FNC
	__end_of_FNC:
;; =============== function _FNC ends ============

	signat	_FNC,88
	global	_seri_porta_veri_gonder
psect	text230,local,class=CODE,delta=2
global __ptext230
__ptext230:

;; *************** function _seri_porta_veri_gonder *****************
;; Defined at:
;;		line 13 in file "../PICFreguency.c"
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
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text230
	file	"../PICFreguency.c"
	line	13
	global	__size_of_seri_porta_veri_gonder
	__size_of_seri_porta_veri_gonder	equ	__end_of_seri_porta_veri_gonder-_seri_porta_veri_gonder
	
_seri_porta_veri_gonder:	
	opt	stack 5
; Regs used in _seri_porta_veri_gonder: [wreg]
	movwf	(seri_porta_veri_gonder@jk)
	
i1l1803:	
	goto	i1l720
	
i1l721:	
	
i1l720:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l720
u7_20:
	goto	i1l1805
	
i1l722:	
	line	14
	
i1l1805:	
	movf	(seri_porta_veri_gonder@jk),w
	movwf	(25)	;volatile
	line	17
	
i1l723:	
	return
	opt stack 0
GLOBAL	__end_of_seri_porta_veri_gonder
	__end_of_seri_porta_veri_gonder:
;; =============== function _seri_porta_veri_gonder ends ============

	signat	_seri_porta_veri_gonder,4216
	global	_DelayMs
psect	text231,local,class=CODE,delta=2
global __ptext231
__ptext231:

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
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text231
	file	"c:\\tc\\delay.c"
	line	5
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 5
; Regs used in _DelayMs: [wreg+status,2+status,0]
	movwf	(DelayMs@cnt)
	line	7
	
i1l699:	
	line	8
	
i1l2719:	
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

	goto	i1l2721
	
i1l701:	
	goto	i1l2721
	
i1l700:	
	
i1l2721:	
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
	goto	u230_21
	goto	u230_20
u230_21:
	goto	i1l2721
u230_20:
	goto	i1l2723
	
i1l702:	
	line	9
	
i1l2723:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u231_21
	goto	u231_20
u231_21:
	goto	i1l699
u231_20:
	goto	i1l2725
	
i1l703:	
	goto	i1l2725
	line	14
	
i1l704:	
	line	15
	
i1l2725:	
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(_i)
	line	16
	
i1l705:	
	line	17
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	053h
	movwf	(__dcnt)

	goto	i1l2727
	
i1l707:	
	goto	i1l2727
	
i1l706:	
	
i1l2727:	
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
	goto	u232_21
	goto	u232_20
u232_21:
	goto	i1l2727
u232_20:
	goto	i1l2729
	
i1l708:	
	line	18
	
i1l2729:	
	movlw	low(01h)
	subwf	(_i),f
	btfss	status,2
	goto	u233_21
	goto	u233_20
u233_21:
	goto	i1l705
u233_20:
	goto	i1l2731
	
i1l709:	
	line	19
	
i1l2731:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u234_21
	goto	u234_20
u234_21:
	goto	i1l2725
u234_20:
	goto	i1l711
	
i1l710:	
	line	21
	
i1l711:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
psect	text232,local,class=CODE,delta=2
global __ptext232
__ptext232:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
