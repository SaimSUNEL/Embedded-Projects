opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F877
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
	FNCALL	_main,_coz
	FNCALL	_coz,_kodu_coz
	FNROOT	_main
	global	_code
	global	_a
	global	_j
	global	_kk
	global	_motor_suresi
	global	_temp
	global	_motor_aktif
	global	_motor_yon
	global	_sayi
	global	_sonuc
	global	_ortala
	global	_array
	global	_gelen_veri
	global	_PORTB
psect	text124,local,class=CODE,delta=2
global __ptext124
__ptext124:
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB7
_RB7	set	55
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC5
_RC5	set	61
	global	_RC7
_RC7	set	63
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
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
_sayi:
       ds      2

_sonuc:
       ds      2

_ortala:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_code:
       ds      4

_a:
       ds      2

_j:
       ds      2

_kk:
       ds      2

_motor_suresi:
       ds      2

_temp:
       ds      2

_motor_aktif:
       ds      1

_motor_yon:
       ds      1

_gelen_veri:
       ds      8

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_array:
       ds      50

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
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+018h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+032h)
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
	global	?_kodu_coz
?_kodu_coz:	; 0 bytes @ 0x0
	global	?_coz
?_coz:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	kodu_coz@b
kodu_coz@b:	; 2 bytes @ 0x0
	ds	2
	global	kodu_coz@a
kodu_coz@a:	; 2 bytes @ 0x2
	ds	2
	global	kodu_coz@b_1168
kodu_coz@b_1168:	; 2 bytes @ 0x4
	ds	2
	global	kodu_coz@b_1169
kodu_coz@b_1169:	; 2 bytes @ 0x6
	ds	2
	global	??_coz
??_coz:	; 0 bytes @ 0x8
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x9
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_kodu_coz
??_kodu_coz:	; 0 bytes @ 0x0
	ds	22
;;Data sizes: Strings 0, constant 0, data 0, bss 79, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      14
;; BANK0           80     22      46
;; BANK1           80      0      50
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_coz
;;   _coz->_kodu_coz
;;
;; Critical Paths under _main in BANK0
;;
;;   _coz->_kodu_coz
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
;; (0) _main                                                 0     0      0     184
;;                                _coz
;; ---------------------------------------------------------------------------------
;; (1) _coz                                                  1     1      0     184
;;                                              8 COMMON     1     1      0
;;                           _kodu_coz
;; ---------------------------------------------------------------------------------
;; (2) _kodu_coz                                            30    30      0     184
;;                                              0 COMMON     8     8      0
;;                                              0 BANK0     22    22      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _coz
;;     _kodu_coz
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      6E       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     16      2E       5       57.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      32       7       62.5%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      70      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 163 in file "../UpdateUSBKUMANDAReceiver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_coz
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../UpdateUSBKUMANDAReceiver.c"
	line	163
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	164
	
l2855:	
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	165
	
l2857:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	167
	
l2859:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	168
	
l2861:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	goto	l2863
	line	173
	
l702:	
	line	182
	
l2863:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(48/8),(48)&7
	goto	u2971
	goto	u2970
u2971:
	goto	l2863
u2970:
	line	184
	
l2865:	
	fcall	_coz
	goto	l2863
	line	185
	
l703:	
	goto	l2863
	line	192
	
l704:	
	line	173
	goto	l2863
	
l705:	
	line	195
	
l706:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_coz
psect	text125,local,class=CODE,delta=2
global __ptext125
__ptext125:

;; *************** function _coz *****************
;; Defined at:
;;		line 92 in file "../UpdateUSBKUMANDAReceiver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_kodu_coz
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text125
	file	"../UpdateUSBKUMANDAReceiver.c"
	line	92
	global	__size_of_coz
	__size_of_coz	equ	__end_of_coz-_coz
	
_coz:	
	opt	stack 6
; Regs used in _coz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	
l2803:	
	clrf	(_sayi)
	clrf	(_sayi+1)
	line	94
	goto	l2807
	
l693:	
	
l2805:	
	movlw	low(01h)
	addwf	(_sayi),f
	skipnc
	incf	(_sayi+1),f
	movlw	high(01h)
	addwf	(_sayi+1),f
	goto	l2807
	
l692:	
	
l2807:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l2805
u2850:
	goto	l2809
	
l694:	
	line	95
	
l2809:	
	movf	(_sayi+1),w
	clrf	(_temp+1)	;volatile
	addwf	(_temp+1)	;volatile
	movf	(_sayi),w
	clrf	(_temp)	;volatile
	addwf	(_temp)	;volatile

	line	100
	
l2811:	
	movf	(_sayi+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(097h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2865
	movlw	low(097h)
	subwf	(_sayi),w
u2865:

	skipc
	goto	u2861
	goto	u2860
u2861:
	goto	l699
u2860:
	
l2813:	
	movf	(_sayi+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0A2h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2875
	movlw	low(0A2h)
	subwf	(_sayi),w
u2875:

	skipnc
	goto	u2871
	goto	u2870
u2871:
	goto	l699
u2870:
	line	103
	
l2815:	
	opt asmopt_off
movlw	20
movwf	(??_coz+0)+0,f
u2987:
decfsz	(??_coz+0)+0,f
	goto	u2987
	clrwdt
opt asmopt_on

	line	104
	opt asmopt_off
movlw	20
movwf	(??_coz+0)+0,f
u2997:
decfsz	(??_coz+0)+0,f
	goto	u2997
	clrwdt
opt asmopt_on

	line	106
	
l2817:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2881
	goto	u2880
u2881:
	goto	l699
u2880:
	line	108
	
l2819:	
	opt asmopt_off
movlw	19
movwf	(??_coz+0)+0,f
u3007:
decfsz	(??_coz+0)+0,f
	goto	u3007
	clrwdt
opt asmopt_on

	line	109
	opt asmopt_off
movlw	18
movwf	(??_coz+0)+0,f
u3017:
decfsz	(??_coz+0)+0,f
	goto	u3017
	nop2	;nop
opt asmopt_on

	line	110
	
l2821:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2891
	goto	u2890
	
u2891:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u2904
u2890:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u2904:
	line	111
	
l2823:	
	bsf	(55/8),(55)&7
	line	114
	
l2825:	
	clrf	(_kk)
	clrf	(_kk+1)
	
l2827:	
	movf	(_kk+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2915
	movlw	low(08h)
	subwf	(_kk),w
u2915:

	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l2831
u2910:
	goto	l2853
	
l2829:	
	goto	l2853
	line	115
	
l697:	
	line	116
	
l2831:	
	opt asmopt_off
movlw	20
movwf	(??_coz+0)+0,f
u3027:
decfsz	(??_coz+0)+0,f
	goto	u3027
	clrwdt
opt asmopt_on

	line	117
	opt asmopt_off
movlw	9
movwf	(??_coz+0)+0,f
u3037:
decfsz	(??_coz+0)+0,f
	goto	u3037
	nop2	;nop
opt asmopt_on

	line	120
	
l2833:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	movlw	1
	movwf	(??_coz+0)+0
	movf	(_kk),w
	addlw	_gelen_veri&0ffh
	movwf	fsr0
	movf	(??_coz+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	121
	
l2835:	
	btfsc	(48/8),(48)&7
	goto	u2921
	goto	u2920
	
u2921:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u2934
u2920:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u2934:
	line	122
	
l2837:	
	opt asmopt_off
movlw	20
movwf	(??_coz+0)+0,f
u3047:
decfsz	(??_coz+0)+0,f
	goto	u3047
	clrwdt
opt asmopt_on

	line	123
	
l2839:	
	opt asmopt_off
movlw	9
movwf	(??_coz+0)+0,f
u3057:
decfsz	(??_coz+0)+0,f
	goto	u3057
	nop2	;nop
opt asmopt_on

	line	125
	
l2841:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2941
	goto	u2940
	
u2941:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u2954
u2940:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u2954:
	line	126
	
l2843:	
	opt asmopt_off
movlw	20
movwf	(??_coz+0)+0,f
u3067:
decfsz	(??_coz+0)+0,f
	goto	u3067
	clrwdt
opt asmopt_on

	line	127
	
l2845:	
	opt asmopt_off
movlw	18
movwf	(??_coz+0)+0,f
u3077:
decfsz	(??_coz+0)+0,f
	goto	u3077
	nop2	;nop
opt asmopt_on

	line	128
	
l2847:	
	opt asmopt_off
movlw	17
movwf	(??_coz+0)+0,f
u3087:
decfsz	(??_coz+0)+0,f
	goto	u3087
	nop2	;nop
opt asmopt_on

	line	114
	
l2849:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_kk),f
	skipnc
	incf	(_kk+1),f
	movlw	high(01h)
	addwf	(_kk+1),f
	
l2851:	
	movf	(_kk+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2965
	movlw	low(08h)
	subwf	(_kk),w
u2965:

	skipc
	goto	u2961
	goto	u2960
u2961:
	goto	l2831
u2960:
	goto	l2853
	
l698:	
	line	135
	
l2853:	
	fcall	_kodu_coz
	goto	l699
	line	141
	
l696:	
	goto	l699
	line	150
	
l695:	
	line	161
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_coz
	__end_of_coz:
;; =============== function _coz ends ============

	signat	_coz,88
	global	_kodu_coz
psect	text126,local,class=CODE,delta=2
global __ptext126
__ptext126:

;; *************** function _kodu_coz *****************
;; Defined at:
;;		line 30 in file "../UpdateUSBKUMANDAReceiver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  b               2    6[COMMON] int 
;;  b               2    4[COMMON] int 
;;  a               2    2[COMMON] int 
;;  b               2    0[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         8       0       0       0       0
;;      Temps:          0      22       0       0       0
;;      Totals:         8      22       0       0       0
;;Total ram usage:       30 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_coz
;; This function uses a non-reentrant model
;;
psect	text126
	file	"../UpdateUSBKUMANDAReceiver.c"
	line	30
	global	__size_of_kodu_coz
	__size_of_kodu_coz	equ	__end_of_kodu_coz-_kodu_coz
	
_kodu_coz:	
	opt	stack 6
; Regs used in _kodu_coz: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	31
	
l2719:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_gelen_veri)+06h,w
	movwf	(??_kodu_coz+0)+0
	clrf	(??_kodu_coz+0)+0+1
	movlw	01h
	movwf	btemp+1
u2605:
	clrc
	rlf	(??_kodu_coz+0)+0,f
	rlf	(??_kodu_coz+0)+1,f
	decfsz	btemp+1,f
	goto	u2605
	movf	0+(_gelen_veri)+05h,w
	movwf	(??_kodu_coz+2)+0
	clrf	(??_kodu_coz+2)+0+1
	movlw	02h
	movwf	btemp+1
u2615:
	clrc
	rlf	(??_kodu_coz+2)+0,f
	rlf	(??_kodu_coz+2)+1,f
	decfsz	btemp+1,f
	goto	u2615
	movf	0+(_gelen_veri)+04h,w
	movwf	(??_kodu_coz+4)+0
	clrf	(??_kodu_coz+4)+0+1
	movlw	03h
	movwf	btemp+1
u2625:
	clrc
	rlf	(??_kodu_coz+4)+0,f
	rlf	(??_kodu_coz+4)+1,f
	decfsz	btemp+1,f
	goto	u2625
	movf	0+(_gelen_veri)+03h,w
	movwf	(??_kodu_coz+6)+0
	clrf	(??_kodu_coz+6)+0+1
	movlw	04h
	movwf	btemp+1
u2635:
	clrc
	rlf	(??_kodu_coz+6)+0,f
	rlf	(??_kodu_coz+6)+1,f
	decfsz	btemp+1,f
	goto	u2635
	movf	0+(_gelen_veri)+02h,w
	movwf	(??_kodu_coz+8)+0
	clrf	(??_kodu_coz+8)+0+1
	movlw	05h
	movwf	btemp+1
u2645:
	clrc
	rlf	(??_kodu_coz+8)+0,f
	rlf	(??_kodu_coz+8)+1,f
	decfsz	btemp+1,f
	goto	u2645
	movf	0+(_gelen_veri)+01h,w
	movwf	(??_kodu_coz+10)+0
	clrf	(??_kodu_coz+10)+0+1
	movlw	06h
	movwf	btemp+1
u2655:
	clrc
	rlf	(??_kodu_coz+10)+0,f
	rlf	(??_kodu_coz+10)+1,f
	decfsz	btemp+1,f
	goto	u2655
	movf	0+(??_kodu_coz+8)+0,w
	addwf	0+(??_kodu_coz+10)+0,w
	movwf	(??_kodu_coz+12)+0
	movf	1+(??_kodu_coz+8)+0,w
	skipnc
	incf	1+(??_kodu_coz+8)+0,w
	addwf	1+(??_kodu_coz+10)+0,w
	movwf	1+(??_kodu_coz+12)+0
	movf	0+(??_kodu_coz+6)+0,w
	addwf	0+(??_kodu_coz+12)+0,w
	movwf	(??_kodu_coz+14)+0
	movf	1+(??_kodu_coz+6)+0,w
	skipnc
	incf	1+(??_kodu_coz+6)+0,w
	addwf	1+(??_kodu_coz+12)+0,w
	movwf	1+(??_kodu_coz+14)+0
	movf	0+(??_kodu_coz+4)+0,w
	addwf	0+(??_kodu_coz+14)+0,w
	movwf	(??_kodu_coz+16)+0
	movf	1+(??_kodu_coz+4)+0,w
	skipnc
	incf	1+(??_kodu_coz+4)+0,w
	addwf	1+(??_kodu_coz+14)+0,w
	movwf	1+(??_kodu_coz+16)+0
	movf	0+(??_kodu_coz+2)+0,w
	addwf	0+(??_kodu_coz+16)+0,w
	movwf	(??_kodu_coz+18)+0
	movf	1+(??_kodu_coz+2)+0,w
	skipnc
	incf	1+(??_kodu_coz+2)+0,w
	addwf	1+(??_kodu_coz+16)+0,w
	movwf	1+(??_kodu_coz+18)+0
	movf	0+(??_kodu_coz+0)+0,w
	addwf	0+(??_kodu_coz+18)+0,w
	movwf	(??_kodu_coz+20)+0
	movf	1+(??_kodu_coz+0)+0,w
	skipnc
	incf	1+(??_kodu_coz+0)+0,w
	addwf	1+(??_kodu_coz+18)+0,w
	movwf	1+(??_kodu_coz+20)+0
	movf	0+(_gelen_veri)+07h,w
	addwf	0+(??_kodu_coz+20)+0,w
	movwf	(_sonuc)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_kodu_coz+20)+0,w
	movwf	1+(_sonuc)
	line	32
	
l2721:	
	movf	(_sonuc),w
	movwf	(??_kodu_coz+0)+0
	movf	(_a),w
	addlw	_array&0ffh
	movwf	fsr0
	movf	(??_kodu_coz+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l2723:	
	movlw	low(01h)
	addwf	(_a),f
	skipnc
	incf	(_a+1),f
	movlw	high(01h)
	addwf	(_a+1),f
	line	33
	
l2725:	
	movlw	032h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2661
	goto	u2660
u2661:
	goto	l2729
u2660:
	
l2727:	
	bsf	(49/8),(49)&7
	bsf	(56/8),(56)&7
	bsf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(59/8),(59)&7
	goto	l2729
	
l669:	
	line	34
	
l2729:	
	movlw	016h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2671
	goto	u2670
u2671:
	goto	l670
u2670:
	
l2731:	
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	
l670:	
	line	35
	movlw	021h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2681
	goto	u2680
u2681:
	goto	l671
u2680:
	
l2733:	
	movlw	1<<((50)&7)
	xorwf	((50)/8),f
	
l671:	
	line	36
	movlw	034h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l2747
u2690:
	line	37
	
l2735:	
	clrf	(kodu_coz@b)
	clrf	(kodu_coz@b+1)
	
l2737:	
	movf	(kodu_coz@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2705
	movlw	low(03h)
	subwf	(kodu_coz@b),w
u2705:

	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l673
u2700:
	goto	l2747
	
l2739:	
	goto	l2747
	line	38
	
l673:	
	line	39
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	40
	
l2741:	
	opt asmopt_off
movlw	124
movwf	(??_kodu_coz+0)+0,f
u3097:
decfsz	(??_kodu_coz+0)+0,f
	goto	u3097
	clrwdt
opt asmopt_on

	line	41
	
l2743:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
	line	42
	opt asmopt_off
movlw	7
movwf	((??_kodu_coz+0)+0+1),f
	movlw	41
movwf	((??_kodu_coz+0)+0),f
u3107:
	decfsz	((??_kodu_coz+0)+0),f
	goto	u3107
	decfsz	((??_kodu_coz+0)+0+1),f
	goto	u3107
	nop2
opt asmopt_on

	line	43
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_kodu_coz+0)+0,f
u3117:
decfsz	(??_kodu_coz+0)+0,f
	goto	u3117
opt asmopt_on

	line	37
	movlw	low(01h)
	addwf	(kodu_coz@b),f
	skipnc
	incf	(kodu_coz@b+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b+1),f
	
l2745:	
	movf	(kodu_coz@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2715
	movlw	low(03h)
	subwf	(kodu_coz@b),w
u2715:

	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l673
u2710:
	goto	l2747
	
l674:	
	goto	l2747
	line	47
	
l672:	
	line	48
	
l2747:	
	movlw	035h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2721
	goto	u2720
u2721:
	goto	l2761
u2720:
	line	49
	
l2749:	
	clrf	(kodu_coz@a)
	clrf	(kodu_coz@a+1)
	
l2751:	
	movf	(kodu_coz@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2735
	movlw	low(03h)
	subwf	(kodu_coz@a),w
u2735:

	skipc
	goto	u2731
	goto	u2730
u2731:
	goto	l676
u2730:
	goto	l2761
	
l2753:	
	goto	l2761
	line	50
	
l676:	
	line	51
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	52
	
l2755:	
	opt asmopt_off
movlw	82
movwf	(??_kodu_coz+0)+0,f
u3127:
decfsz	(??_kodu_coz+0)+0,f
	goto	u3127
	nop2	;nop
opt asmopt_on

	line	53
	
l2757:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
	line	54
	opt asmopt_off
movlw	7
movwf	((??_kodu_coz+0)+0+1),f
	movlw	41
movwf	((??_kodu_coz+0)+0),f
u3137:
	decfsz	((??_kodu_coz+0)+0),f
	goto	u3137
	decfsz	((??_kodu_coz+0)+0+1),f
	goto	u3137
	nop2
opt asmopt_on

	line	55
	opt asmopt_off
movlw	166
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_kodu_coz+0)+0,f
u3147:
decfsz	(??_kodu_coz+0)+0,f
	goto	u3147
	clrwdt
opt asmopt_on

	line	49
	movlw	low(01h)
	addwf	(kodu_coz@a),f
	skipnc
	incf	(kodu_coz@a+1),f
	movlw	high(01h)
	addwf	(kodu_coz@a+1),f
	
l2759:	
	movf	(kodu_coz@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2745
	movlw	low(03h)
	subwf	(kodu_coz@a),w
u2745:

	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l676
u2740:
	goto	l2761
	
l677:	
	goto	l2761
	line	59
	
l675:	
	line	60
	
l2761:	
	movlw	037h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2751
	goto	u2750
u2751:
	goto	l2765
u2750:
	
l2763:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	bsf	(57/8),(57)&7
	bsf	(59/8),(59)&7
	goto	l2765
	
l678:	
	line	62
	
l2765:	
	movlw	062h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2761
	goto	u2760
u2761:
	goto	l2769
u2760:
	
l2767:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	goto	l2769
	
l679:	
	line	63
	
l2769:	
	movlw	064h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipnz
	goto	u2771
	goto	u2770
u2771:
	goto	l2773
u2770:
	
l2771:	
	movlw	065h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2781
	goto	u2780
u2781:
	goto	l2785
u2780:
	goto	l2773
	
l682:	
	line	64
	
l2773:	
	clrf	(kodu_coz@b_1168)
	clrf	(kodu_coz@b_1168+1)
	
l2775:	
	movf	(kodu_coz@b_1168+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2795
	movlw	low(04h)
	subwf	(kodu_coz@b_1168),w
u2795:

	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l683
u2790:
	goto	l2785
	
l2777:	
	goto	l2785
	line	65
	
l683:	
	line	66
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	67
	
l2779:	
	opt asmopt_off
movlw	166
movwf	(??_kodu_coz+0)+0,f
u3157:
decfsz	(??_kodu_coz+0)+0,f
	goto	u3157
opt asmopt_on

	line	68
	
l2781:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
	line	69
	opt asmopt_off
movlw	7
movwf	((??_kodu_coz+0)+0+1),f
	movlw	41
movwf	((??_kodu_coz+0)+0),f
u3167:
	decfsz	((??_kodu_coz+0)+0),f
	goto	u3167
	decfsz	((??_kodu_coz+0)+0+1),f
	goto	u3167
	nop2
opt asmopt_on

	line	70
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_kodu_coz+0)+0,f
u3177:
decfsz	(??_kodu_coz+0)+0,f
	goto	u3177
opt asmopt_on

	line	64
	movlw	low(01h)
	addwf	(kodu_coz@b_1168),f
	skipnc
	incf	(kodu_coz@b_1168+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b_1168+1),f
	
l2783:	
	movf	(kodu_coz@b_1168+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2805
	movlw	low(04h)
	subwf	(kodu_coz@b_1168),w
u2805:

	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l683
u2800:
	goto	l2785
	
l684:	
	goto	l2785
	line	72
	
l680:	
	line	75
	
l2785:	
	movlw	065h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2811
	goto	u2810
u2811:
	goto	l2799
u2810:
	line	76
	
l2787:	
	clrf	(kodu_coz@b_1169)
	clrf	(kodu_coz@b_1169+1)
	
l2789:	
	movf	(kodu_coz@b_1169+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2825
	movlw	low(04h)
	subwf	(kodu_coz@b_1169),w
u2825:

	skipc
	goto	u2821
	goto	u2820
u2821:
	goto	l686
u2820:
	goto	l2799
	
l2791:	
	goto	l2799
	line	77
	
l686:	
	line	78
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	79
	
l2793:	
	opt asmopt_off
movlw	166
movwf	(??_kodu_coz+0)+0,f
u3187:
decfsz	(??_kodu_coz+0)+0,f
	goto	u3187
opt asmopt_on

	line	80
	
l2795:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
	line	81
	opt asmopt_off
movlw	7
movwf	((??_kodu_coz+0)+0+1),f
	movlw	41
movwf	((??_kodu_coz+0)+0),f
u3197:
	decfsz	((??_kodu_coz+0)+0),f
	goto	u3197
	decfsz	((??_kodu_coz+0)+0+1),f
	goto	u3197
	nop2
opt asmopt_on

	line	82
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_kodu_coz+0)+0,f
u3207:
decfsz	(??_kodu_coz+0)+0,f
	goto	u3207
opt asmopt_on

	line	76
	movlw	low(01h)
	addwf	(kodu_coz@b_1169),f
	skipnc
	incf	(kodu_coz@b_1169+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b_1169+1),f
	
l2797:	
	movf	(kodu_coz@b_1169+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2835
	movlw	low(04h)
	subwf	(kodu_coz@b_1169),w
u2835:

	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l686
u2830:
	goto	l2799
	
l687:	
	goto	l2799
	line	84
	
l685:	
	line	87
	
l2799:	
	movlw	067h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2841
	goto	u2840
u2841:
	goto	l689
u2840:
	
l2801:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(59/8),(59)&7
	goto	l689
	
l688:	
	line	88
	
l689:	
	return
	opt stack 0
GLOBAL	__end_of_kodu_coz
	__end_of_kodu_coz:
;; =============== function _kodu_coz ends ============

	signat	_kodu_coz,88
psect	text127,local,class=CODE,delta=2
global __ptext127
__ptext127:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
