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
# 9 "../PICCandAssemblyCombine.c"
org 0x000 ;#
# 10 "../PICCandAssemblyCombine.c"
goto 0x60 ;#
	FNCALL	_main,_FNC
	FNCALL	_main,_seri_portu_ayarla
	FNCALL	_main,_DelayMs
	FNCALL	_main,_seri_porta_veri_gonder
	FNCALL	_main,_seri_porttan_veri_al
	FNROOT	_main
	global	__dcnt
	global	_i
	global	_PORTB
psect	_FNC_text,class=CODE,delta=2
global __p_FNC_text
__p_FNC_text:
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
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
	global	_PEIE
_PEIE	set	94
	global	_RC5
_RC5	set	61
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
	global	_TRISC
_TRISC	set	135
	global	_BRGH
_BRGH	set	1218
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
	global	_TXIE
_TXIE	set	1124
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
__dcnt:
       ds      4

_i:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
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
	global	?_FNC
?_FNC:	; 0 bytes @ 0x0
	global	??_FNC
??_FNC:	; 0 bytes @ 0x0
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
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	1
	global	main@gelen
main@gelen:	; 1 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 5, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       9
;; BANK0h          16      0       0
;; BANK0l          64      0       0
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
;; Critical Paths under _main in BANK0h
;;
;;   None.
;;
;; Critical Paths under _main in BANK0l
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0      45
;;                                              2 COMMON     2     2      0
;;                                _FNC
;;                  _seri_portu_ayarla
;;                            _DelayMs
;;             _seri_porta_veri_gonder
;;               _seri_porttan_veri_al
;; ---------------------------------------------------------------------------------
;; (1) _seri_portu_ayarla                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _seri_porta_veri_gonder                               1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _seri_porttan_veri_al                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _FNC                                                  1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _FNC
;;   _seri_portu_ayarla
;;   _DelayMs
;;   _seri_porta_veri_gonder
;;   _seri_porttan_veri_al
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       9       1       64.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       9       3        0.0%
;;BITBANK0h           10      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITBANK0l           40      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK0h              10      0       0       6        0.0%
;;BANK0l              40      0       0       7        0.0%
;;BITBANK1            50      0       0       8        0.0%
;;BANK1               50      0       0       9        0.0%
;;BITBANK3            60      0       0      10        0.0%
;;BANK3               60      0       0      11        0.0%
;;BITBANK2            60      0       0      12        0.0%
;;BANK2               60      0       0      13        0.0%
;;DATA                 0      0       A      14        0.0%

	global	_main
psect	_main_text,class=CODE,delta=2
global __p_main_text
__p_main_text:

;; *************** function _main *****************
;; Defined at:
;;		line 91 in file "../PICCandAssemblyCombine.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  gelen           1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON  BANK0h  BANK0l   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_FNC
;;		_seri_portu_ayarla
;;		_DelayMs
;;		_seri_porta_veri_gonder
;;		_seri_porttan_veri_al
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	_main_text
	file	"../PICCandAssemblyCombine.c"
	line	91
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
	global _main_absaddr
	_main_absaddr equ 0x500
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	97
	
l2687:	
	fcall	_FNC
	line	98
	
l2689:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	99
	
l2691:	
	movlw	(080h)
	movwf	(135)^080h	;volatile
	line	100
	
l2693:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	101
	
l2695:	
	clrf	(7)	;volatile
	line	102
	
l2697:	
	fcall	_seri_portu_ayarla
	line	105
	
l2699:	
	movlw	(0F4h)
	fcall	_DelayMs
	line	106
	
l2701:	
	movlw	(053h)
	fcall	_seri_porta_veri_gonder
	line	107
	
l2703:	
	movlw	(061h)
	fcall	_seri_porta_veri_gonder
	line	108
	
l2705:	
	movlw	(069h)
	fcall	_seri_porta_veri_gonder
	line	109
	
l2707:	
	movlw	(06Dh)
	fcall	_seri_porta_veri_gonder
	line	114
	
l2709:	
	bsf	(94/8),(94)&7
	line	115
	
l2711:	
	bsf	(95/8),(95)&7
	line	116
	
l2713:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	117
	
l2715:	
	bcf	(1124/8)^080h,(1124)&7
	goto	l2717
	line	118
	
l723:	
	line	120
	
l2717:	
	fcall	_seri_porttan_veri_al
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@gelen)
	goto	l2717
	line	122
	
l724:	
	line	118
	goto	l2717
	
l725:	
	line	126
	
l726:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_seri_portu_ayarla
psect	_seri_portu_ayarla_text,class=CODE,delta=2
global __p_seri_portu_ayarla_text
__p_seri_portu_ayarla_text:

;; *************** function _seri_portu_ayarla *****************
;; Defined at:
;;		line 67 in file "../PICCandAssemblyCombine.c"
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
;; Data sizes:     COMMON  BANK0h  BANK0l   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	_seri_portu_ayarla_text
	file	"../PICCandAssemblyCombine.c"
	line	67
	global	__size_of_seri_portu_ayarla
	__size_of_seri_portu_ayarla	equ	__end_of_seri_portu_ayarla-_seri_portu_ayarla
	
_seri_portu_ayarla:	
	opt	stack 7
	global _seri_portu_ayarla_absaddr
	_seri_portu_ayarla_absaddr equ 0x300
; Regs used in _seri_portu_ayarla: [wreg]
	
l1813:	
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	68
	
l1815:	
	bsf	(1218/8)^080h,(1218)&7
	line	71
	
l1817:	
	bcf	(1220/8)^080h,(1220)&7
	line	73
	
l1819:	
	bcf	(1222/8)^080h,(1222)&7
	line	75
	
l1821:	
	bsf	(1221/8)^080h,(1221)&7
	line	77
	
l1823:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	79
	
l1825:	
	bsf	(196/8),(196)&7
	line	83
	
l1827:	
	bsf	(199/8),(199)&7
	line	88
	
l720:	
	return
	opt stack 0
GLOBAL	__end_of_seri_portu_ayarla
	__end_of_seri_portu_ayarla:
;; =============== function _seri_portu_ayarla ends ============

	signat	_seri_portu_ayarla,88
	global	_seri_porta_veri_gonder
psect	_seri_porta_veri_gonder_text,class=CODE,delta=2
global __p_seri_porta_veri_gonder_text
__p_seri_porta_veri_gonder_text:

;; *************** function _seri_porta_veri_gonder *****************
;; Defined at:
;;		line 50 in file "../PICCandAssemblyCombine.c"
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
;; Data sizes:     COMMON  BANK0h  BANK0l   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	_seri_porta_veri_gonder_text
	file	"../PICCandAssemblyCombine.c"
	line	50
	global	__size_of_seri_porta_veri_gonder
	__size_of_seri_porta_veri_gonder	equ	__end_of_seri_porta_veri_gonder-_seri_porta_veri_gonder
	
_seri_porta_veri_gonder:	
	opt	stack 7
	global _seri_porta_veri_gonder_absaddr
	_seri_porta_veri_gonder_absaddr equ 0x250
; Regs used in _seri_porta_veri_gonder: [wreg]
	movwf	(seri_porta_veri_gonder@jk)
	
l1809:	
	goto	l714
	
l715:	
	
l714:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u81
	goto	u80
u81:
	goto	l714
u80:
	goto	l1811
	
l716:	
	line	51
	
l1811:	
	movf	(seri_porta_veri_gonder@jk),w
	movwf	(25)	;volatile
	line	54
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_seri_porta_veri_gonder
	__end_of_seri_porta_veri_gonder:
;; =============== function _seri_porta_veri_gonder ends ============

	signat	_seri_porta_veri_gonder,4216
	global	_seri_porttan_veri_al
psect	_seri_porttan_veri_al_text,class=CODE,delta=2
global __p_seri_porttan_veri_al_text
__p_seri_porttan_veri_al_text:

;; *************** function _seri_porttan_veri_al *****************
;; Defined at:
;;		line 45 in file "../PICCandAssemblyCombine.c"
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
;; Data sizes:     COMMON  BANK0h  BANK0l   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	_seri_porttan_veri_al_text
	file	"../PICCandAssemblyCombine.c"
	line	45
	global	__size_of_seri_porttan_veri_al
	__size_of_seri_porttan_veri_al	equ	__end_of_seri_porttan_veri_al-_seri_porttan_veri_al
	
_seri_porttan_veri_al:	
	opt	stack 7
	global _seri_porttan_veri_al_absaddr
	_seri_porttan_veri_al_absaddr equ 0x200
; Regs used in _seri_porttan_veri_al: [wreg]
	line	46
	
l1803:	
	goto	l708
	
l709:	
	
l708:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u71
	goto	u70
u71:
	goto	l708
u70:
	goto	l1805
	
l710:	
	line	47
	
l1805:	
	movf	(26),w	;volatile
	goto	l711
	
l1807:	
	line	48
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_seri_porttan_veri_al
	__end_of_seri_porttan_veri_al:
;; =============== function _seri_porttan_veri_al ends ============

	signat	_seri_porttan_veri_al,89
	global	_FNC
psect	_FNC_text

;; *************** function _FNC *****************
;; Defined at:
;;		line 21 in file "../PICCandAssemblyCombine.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON  BANK0h  BANK0l   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	_FNC_text
	file	"../PICCandAssemblyCombine.c"
	line	21
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 7
	global _FNC_absaddr
	_FNC_absaddr equ 0x60
; Regs used in _FNC: [wreg+status,2+status,0]
	line	22
	
l1787:	
	movlw	1<<((61)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((61)/8),f
	line	23
	
l1789:	
	bcf	(95/8),(95)&7
	line	25
	
l1791:	
	btfss	(101/8),(101)&7
	goto	u61
	goto	u60
u61:
	goto	l1799
u60:
	line	27
	
l1793:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(6),f	;volatile
	line	28
	
l1795:	
	bcf	(101/8),(101)&7
	line	30
	
l1797:	
	movf	(26),w	;volatile
	movwf	(8)	;volatile
	goto	l1799
	line	31
	
l704:	
	line	33
	
l1799:	
	bsf	(95/8),(95)&7
	line	35
	
l1801:	
# 35 "../PICCandAssemblyCombine.c"
retfie ;#
psect	_FNC_text
	line	37
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_FNC
	__end_of_FNC:
;; =============== function _FNC ends ============

	signat	_FNC,88
	global	_DelayMs
psect	text123,local,class=CODE,delta=2
global __ptext123
__ptext123:

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
;; Data sizes:     COMMON  BANK0h  BANK0l   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text123
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
	
l1773:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	01h
	movwf	(__dcnt+1)
	movlw	04Dh
	movwf	(__dcnt)

	goto	l1775
	
l691:	
	goto	l1775
	
l690:	
	
l1775:	
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
	goto	l1775
u10:
	goto	l1777
	
l692:	
	line	9
	
l1777:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l689
u20:
	goto	l1779
	
l693:	
	goto	l1779
	line	14
	
l694:	
	line	15
	
l1779:	
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

	goto	l1781
	
l697:	
	goto	l1781
	
l696:	
	
l1781:	
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
	goto	l1781
u30:
	goto	l1783
	
l698:	
	line	18
	
l1783:	
	movlw	low(01h)
	subwf	(_i),f
	btfss	status,2
	goto	u41
	goto	u40
u41:
	goto	l695
u40:
	goto	l1785
	
l699:	
	line	19
	
l1785:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u51
	goto	u50
u51:
	goto	l1779
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
psect	text124,local,class=CODE,delta=2
global __ptext124
__ptext124:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
