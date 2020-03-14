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
	FNCALL	_kodu_coz,_DelayMs
	FNROOT	_main
	global	__dcnt
	global	_code
	global	_a
	global	_j
	global	_kk
	global	_motor_suresi
	global	_sayi
	global	_temp
	global	_motor_aktif
	global	_motor_yon
	global	_ortala
	global	_sonuc
	global	_i
	global	_array
	global	_gelen_veri
	global	_PORTB
psect	text148,local,class=CODE,delta=2
global __ptext148
__ptext148:
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
_sonuc:
       ds      2

_i:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
__dcnt:
       ds      4

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

_sayi:
       ds      2

_temp:
       ds      2

_motor_aktif:
       ds      1

_motor_yon:
       ds      1

_ortala:
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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Fh)
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
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
	global	?_kodu_coz
?_kodu_coz:	; 0 bytes @ 0x0
	global	?_coz
?_coz:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	ds	1
	global	kodu_coz@b
kodu_coz@b:	; 2 bytes @ 0x2
	ds	2
	global	kodu_coz@a
kodu_coz@a:	; 2 bytes @ 0x4
	ds	2
	global	kodu_coz@b_1167
kodu_coz@b_1167:	; 2 bytes @ 0x6
	ds	2
	global	kodu_coz@b_1168
kodu_coz@b_1168:	; 2 bytes @ 0x8
	ds	2
	global	??_coz
??_coz:	; 0 bytes @ 0xA
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xB
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_kodu_coz
??_kodu_coz:	; 0 bytes @ 0x0
	ds	22
;;Data sizes: Strings 0, constant 0, data 0, bss 84, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     22      53
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
;;   _kodu_coz->_DelayMs
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
;; (0) _main                                                 0     0      0     228
;;                                _coz
;; ---------------------------------------------------------------------------------
;; (1) _coz                                                  1     1      0     228
;;                                             10 COMMON     1     1      0
;;                           _kodu_coz
;; ---------------------------------------------------------------------------------
;; (2) _kodu_coz                                            30    30      0     228
;;                                              2 COMMON     8     8      0
;;                                              0 BANK0     22    22      0
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (3) _DelayMs                                              2     2      0      44
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _coz
;;     _kodu_coz
;;       _DelayMs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      B       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      75       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     16      35       5       66.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      32       7       62.5%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      78      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 162 in file "../UpdateUSBKUMANDAReceiver.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_coz
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../UpdateUSBKUMANDAReceiver.c"
	line	162
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	163
	
l3017:	
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	164
	
l3019:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	166
	
l3021:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	167
	
l3023:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	goto	l3025
	line	172
	
l764:	
	line	181
	
l3025:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(48/8),(48)&7
	goto	u3371
	goto	u3370
u3371:
	goto	l3025
u3370:
	line	183
	
l3027:	
	fcall	_coz
	goto	l3025
	line	184
	
l765:	
	goto	l3025
	line	191
	
l766:	
	line	172
	goto	l3025
	
l767:	
	line	194
	
l768:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_coz
psect	text149,local,class=CODE,delta=2
global __ptext149
__ptext149:

;; *************** function _coz *****************
;; Defined at:
;;		line 91 in file "../UpdateUSBKUMANDAReceiver.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_kodu_coz
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text149
	file	"../UpdateUSBKUMANDAReceiver.c"
	line	91
	global	__size_of_coz
	__size_of_coz	equ	__end_of_coz-_coz
	
_coz:	
	opt	stack 5
; Regs used in _coz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	
l2945:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_sayi)
	clrf	(_sayi+1)
	line	93
	goto	l2949
	
l722:	
	
l2947:	
	movlw	low(01h)
	addwf	(_sayi),f
	skipnc
	incf	(_sayi+1),f
	movlw	high(01h)
	addwf	(_sayi+1),f
	goto	l2949
	
l721:	
	
l2949:	
	btfsc	(48/8),(48)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l2947
u3140:
	goto	l2951
	
l723:	
	line	94
	
l2951:	
	movf	(_sayi+1),w
	clrf	(_temp+1)	;volatile
	addwf	(_temp+1)	;volatile
	movf	(_sayi),w
	clrf	(_temp)	;volatile
	addwf	(_temp)	;volatile

	line	99
	
l2953:	
	movf	(_sayi+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(097h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3155
	movlw	low(097h)
	subwf	(_sayi),w
u3155:

	skipc
	goto	u3151
	goto	u3150
u3151:
	goto	l761
u3150:
	
l2955:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_sayi+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0A2h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3165
	movlw	low(0A2h)
	subwf	(_sayi),w
u3165:

	skipnc
	goto	u3161
	goto	u3160
u3161:
	goto	l761
u3160:
	line	102
	
l2957:	
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

	goto	l2959
	
l726:	
	goto	l2959
	
l725:	
	
l2959:	
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
	goto	u3171
	goto	u3170
u3171:
	goto	l2959
u3170:
	goto	l2961
	
l727:	
	line	103
	
l2961:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	053h
	movwf	(__dcnt)

	goto	l2963
	
l729:	
	goto	l2963
	
l728:	
	
l2963:	
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
	goto	u3181
	goto	u3180
u3181:
	goto	l2963
u3180:
	
l730:	
	line	105
	btfsc	(48/8),(48)&7
	goto	u3191
	goto	u3190
u3191:
	goto	l761
u3190:
	line	107
	
l2965:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	04Fh
	movwf	(__dcnt)

	goto	l2967
	
l733:	
	goto	l2967
	
l732:	
	
l2967:	
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
	goto	u3201
	goto	u3200
u3201:
	goto	l2967
u3200:
	goto	l2969
	
l734:	
	line	108
	
l2969:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	04Dh
	movwf	(__dcnt)

	goto	l2971
	
l736:	
	goto	l2971
	
l735:	
	
l2971:	
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
	goto	u3211
	goto	u3210
u3211:
	goto	l2971
u3210:
	
l737:	
	line	109
	btfsc	(48/8),(48)&7
	goto	u3221
	goto	u3220
	
u3221:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u3234
u3220:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u3234:
	line	110
	bsf	(55/8),(55)&7
	line	113
	
l2973:	
	clrf	(_kk)
	clrf	(_kk+1)
	
l2975:	
	movf	(_kk+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3245
	movlw	low(08h)
	subwf	(_kk),w
u3245:

	skipc
	goto	u3241
	goto	u3240
u3241:
	goto	l2979
u3240:
	goto	l3015
	
l2977:	
	goto	l3015
	line	114
	
l738:	
	line	115
	
l2979:	
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

	goto	l2981
	
l741:	
	goto	l2981
	
l740:	
	
l2981:	
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
	goto	u3251
	goto	u3250
u3251:
	goto	l2981
u3250:
	goto	l2983
	
l742:	
	line	116
	
l2983:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	029h
	movwf	(__dcnt)

	goto	l2985
	
l744:	
	goto	l2985
	
l743:	
	
l2985:	
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
	goto	u3261
	goto	u3260
u3261:
	goto	l2985
u3260:
	goto	l2987
	
l745:	
	line	119
	
l2987:	
	movlw	0
	btfsc	(48/8),(48)&7
	movlw	1
	movwf	(??_coz+0)+0
	movf	(_kk),w
	addlw	_gelen_veri&0ffh
	movwf	fsr0
	movf	(??_coz+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	120
	
l2989:	
	btfsc	(48/8),(48)&7
	goto	u3271
	goto	u3270
	
u3271:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u3284
u3270:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u3284:
	line	121
	
l2991:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	053h
	movwf	(__dcnt)

	goto	l2993
	
l747:	
	goto	l2993
	
l746:	
	
l2993:	
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
	goto	u3291
	goto	u3290
u3291:
	goto	l2993
u3290:
	goto	l2995
	
l748:	
	line	122
	
l2995:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	029h
	movwf	(__dcnt)

	goto	l2997
	
l750:	
	goto	l2997
	
l749:	
	
l2997:	
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
	goto	u3301
	goto	u3300
u3301:
	goto	l2997
u3300:
	
l751:	
	line	124
	btfsc	(48/8),(48)&7
	goto	u3311
	goto	u3310
	
u3311:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u3324
u3310:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u3324:
	line	125
	
l2999:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	053h
	movwf	(__dcnt)

	goto	l3001
	
l753:	
	goto	l3001
	
l752:	
	
l3001:	
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
	goto	u3331
	goto	u3330
u3331:
	goto	l3001
u3330:
	goto	l3003
	
l754:	
	line	126
	
l3003:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	04Dh
	movwf	(__dcnt)

	goto	l3005
	
l756:	
	goto	l3005
	
l755:	
	
l3005:	
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
	goto	u3341
	goto	u3340
u3341:
	goto	l3005
u3340:
	goto	l3007
	
l757:	
	line	127
	
l3007:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	049h
	movwf	(__dcnt)

	goto	l3009
	
l759:	
	goto	l3009
	
l758:	
	
l3009:	
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
	goto	u3351
	goto	u3350
u3351:
	goto	l3009
u3350:
	goto	l3011
	
l760:	
	line	113
	
l3011:	
	movlw	low(01h)
	addwf	(_kk),f
	skipnc
	incf	(_kk+1),f
	movlw	high(01h)
	addwf	(_kk+1),f
	
l3013:	
	movf	(_kk+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3365
	movlw	low(08h)
	subwf	(_kk),w
u3365:

	skipc
	goto	u3361
	goto	u3360
u3361:
	goto	l2979
u3360:
	goto	l3015
	
l739:	
	line	134
	
l3015:	
	fcall	_kodu_coz
	goto	l761
	line	140
	
l731:	
	goto	l761
	line	149
	
l724:	
	line	160
	
l761:	
	return
	opt stack 0
GLOBAL	__end_of_coz
	__end_of_coz:
;; =============== function _coz ends ============

	signat	_coz,88
	global	_kodu_coz
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:

;; *************** function _kodu_coz *****************
;; Defined at:
;;		line 29 in file "../UpdateUSBKUMANDAReceiver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  b               2    8[COMMON] int 
;;  b               2    6[COMMON] int 
;;  a               2    4[COMMON] int 
;;  b               2    2[COMMON] int 
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
;;      Locals:         8       0       0       0       0
;;      Temps:          0      22       0       0       0
;;      Totals:         8      22       0       0       0
;;Total ram usage:       30 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		_coz
;; This function uses a non-reentrant model
;;
psect	text150
	file	"../UpdateUSBKUMANDAReceiver.c"
	line	29
	global	__size_of_kodu_coz
	__size_of_kodu_coz	equ	__end_of_kodu_coz-_kodu_coz
	
_kodu_coz:	
	opt	stack 5
; Regs used in _kodu_coz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	30
	
l2845:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_gelen_veri)+06h,w
	movwf	(??_kodu_coz+0)+0
	clrf	(??_kodu_coz+0)+0+1
	movlw	01h
	movwf	btemp+1
u2855:
	clrc
	rlf	(??_kodu_coz+0)+0,f
	rlf	(??_kodu_coz+0)+1,f
	decfsz	btemp+1,f
	goto	u2855
	movf	0+(_gelen_veri)+05h,w
	movwf	(??_kodu_coz+2)+0
	clrf	(??_kodu_coz+2)+0+1
	movlw	02h
	movwf	btemp+1
u2865:
	clrc
	rlf	(??_kodu_coz+2)+0,f
	rlf	(??_kodu_coz+2)+1,f
	decfsz	btemp+1,f
	goto	u2865
	movf	0+(_gelen_veri)+04h,w
	movwf	(??_kodu_coz+4)+0
	clrf	(??_kodu_coz+4)+0+1
	movlw	03h
	movwf	btemp+1
u2875:
	clrc
	rlf	(??_kodu_coz+4)+0,f
	rlf	(??_kodu_coz+4)+1,f
	decfsz	btemp+1,f
	goto	u2875
	movf	0+(_gelen_veri)+03h,w
	movwf	(??_kodu_coz+6)+0
	clrf	(??_kodu_coz+6)+0+1
	movlw	04h
	movwf	btemp+1
u2885:
	clrc
	rlf	(??_kodu_coz+6)+0,f
	rlf	(??_kodu_coz+6)+1,f
	decfsz	btemp+1,f
	goto	u2885
	movf	0+(_gelen_veri)+02h,w
	movwf	(??_kodu_coz+8)+0
	clrf	(??_kodu_coz+8)+0+1
	movlw	05h
	movwf	btemp+1
u2895:
	clrc
	rlf	(??_kodu_coz+8)+0,f
	rlf	(??_kodu_coz+8)+1,f
	decfsz	btemp+1,f
	goto	u2895
	movf	0+(_gelen_veri)+01h,w
	movwf	(??_kodu_coz+10)+0
	clrf	(??_kodu_coz+10)+0+1
	movlw	06h
	movwf	btemp+1
u2905:
	clrc
	rlf	(??_kodu_coz+10)+0,f
	rlf	(??_kodu_coz+10)+1,f
	decfsz	btemp+1,f
	goto	u2905
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
	line	31
	
l2847:	
	movf	(_sonuc),w
	movwf	(??_kodu_coz+0)+0
	movf	(_a),w
	addlw	_array&0ffh
	movwf	fsr0
	movf	(??_kodu_coz+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l2849:	
	movlw	low(01h)
	addwf	(_a),f
	skipnc
	incf	(_a+1),f
	movlw	high(01h)
	addwf	(_a+1),f
	line	32
	
l2851:	
	movlw	032h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2911
	goto	u2910
u2911:
	goto	l2855
u2910:
	
l2853:	
	bsf	(49/8),(49)&7
	bsf	(56/8),(56)&7
	bsf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(59/8),(59)&7
	goto	l2855
	
l686:	
	line	33
	
l2855:	
	movlw	016h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2921
	goto	u2920
u2921:
	goto	l687
u2920:
	
l2857:	
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	
l687:	
	line	34
	movlw	021h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2931
	goto	u2930
u2931:
	goto	l688
u2930:
	
l2859:	
	movlw	1<<((50)&7)
	xorwf	((50)/8),f
	
l688:	
	line	35
	movlw	034h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l2877
u2940:
	line	36
	
l2861:	
	clrf	(kodu_coz@b)
	clrf	(kodu_coz@b+1)
	
l2863:	
	movf	(kodu_coz@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2955
	movlw	low(03h)
	subwf	(kodu_coz@b),w
u2955:

	skipc
	goto	u2951
	goto	u2950
u2951:
	goto	l690
u2950:
	goto	l2877
	
l2865:	
	goto	l2877
	line	37
	
l690:	
	line	38
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	39
	
l2867:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	01h
	movwf	(__dcnt+1)
	movlw	0F3h
	movwf	(__dcnt)

	goto	l2869
	
l693:	
	goto	l2869
	
l692:	
	
l2869:	
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
	goto	u2961
	goto	u2960
u2961:
	goto	l2869
u2960:
	
l694:	
	line	40
	bcf	(63/8),(63)&7
	line	41
	
l2871:	
	movlw	(013h)
	fcall	_DelayMs
	line	42
	movlw	(01h)
	fcall	_DelayMs
	line	36
	
l2873:	
	movlw	low(01h)
	addwf	(kodu_coz@b),f
	skipnc
	incf	(kodu_coz@b+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b+1),f
	
l2875:	
	movf	(kodu_coz@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2975
	movlw	low(03h)
	subwf	(kodu_coz@b),w
u2975:

	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l690
u2970:
	goto	l2877
	
l691:	
	goto	l2877
	line	46
	
l689:	
	line	47
	
l2877:	
	movlw	035h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l2895
u2980:
	line	48
	
l2879:	
	clrf	(kodu_coz@a)
	clrf	(kodu_coz@a+1)
	
l2881:	
	movf	(kodu_coz@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2995
	movlw	low(03h)
	subwf	(kodu_coz@a),w
u2995:

	skipc
	goto	u2991
	goto	u2990
u2991:
	goto	l696
u2990:
	goto	l2895
	
l2883:	
	goto	l2895
	line	49
	
l696:	
	line	50
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	51
	
l2885:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	01h
	movwf	(__dcnt+1)
	movlw	04Dh
	movwf	(__dcnt)

	goto	l2887
	
l699:	
	goto	l2887
	
l698:	
	
l2887:	
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
	goto	u3001
	goto	u3000
u3001:
	goto	l2887
u3000:
	
l700:	
	line	52
	bcf	(63/8),(63)&7
	line	53
	
l2889:	
	movlw	(013h)
	fcall	_DelayMs
	line	54
	movlw	(02h)
	fcall	_DelayMs
	line	48
	
l2891:	
	movlw	low(01h)
	addwf	(kodu_coz@a),f
	skipnc
	incf	(kodu_coz@a+1),f
	movlw	high(01h)
	addwf	(kodu_coz@a+1),f
	
l2893:	
	movf	(kodu_coz@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3015
	movlw	low(03h)
	subwf	(kodu_coz@a),w
u3015:

	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l696
u3010:
	goto	l2895
	
l697:	
	goto	l2895
	line	58
	
l695:	
	line	59
	
l2895:	
	movlw	037h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l2899
u3020:
	
l2897:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	bsf	(57/8),(57)&7
	bsf	(59/8),(59)&7
	goto	l2899
	
l701:	
	line	61
	
l2899:	
	movlw	062h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u3031
	goto	u3030
u3031:
	goto	l2903
u3030:
	
l2901:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	goto	l2903
	
l702:	
	line	62
	
l2903:	
	movlw	064h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipnz
	goto	u3041
	goto	u3040
u3041:
	goto	l2907
u3040:
	
l2905:	
	movlw	065h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u3051
	goto	u3050
u3051:
	goto	l2923
u3050:
	goto	l2907
	
l705:	
	line	63
	
l2907:	
	clrf	(kodu_coz@b_1167)
	clrf	(kodu_coz@b_1167+1)
	
l2909:	
	movf	(kodu_coz@b_1167+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3065
	movlw	low(04h)
	subwf	(kodu_coz@b_1167),w
u3065:

	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l706
u3060:
	goto	l2923
	
l2911:	
	goto	l2923
	line	64
	
l706:	
	line	65
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	66
	
l2913:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	02h
	movwf	(__dcnt+1)
	movlw	09Bh
	movwf	(__dcnt)

	goto	l2915
	
l709:	
	goto	l2915
	
l708:	
	
l2915:	
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
	goto	u3071
	goto	u3070
u3071:
	goto	l2915
u3070:
	
l710:	
	line	67
	bcf	(63/8),(63)&7
	line	68
	
l2917:	
	movlw	(013h)
	fcall	_DelayMs
	line	69
	movlw	(01h)
	fcall	_DelayMs
	line	63
	
l2919:	
	movlw	low(01h)
	addwf	(kodu_coz@b_1167),f
	skipnc
	incf	(kodu_coz@b_1167+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b_1167+1),f
	
l2921:	
	movf	(kodu_coz@b_1167+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3085
	movlw	low(04h)
	subwf	(kodu_coz@b_1167),w
u3085:

	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l706
u3080:
	goto	l2923
	
l707:	
	goto	l2923
	line	71
	
l703:	
	line	74
	
l2923:	
	movlw	065h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u3091
	goto	u3090
u3091:
	goto	l2941
u3090:
	line	75
	
l2925:	
	clrf	(kodu_coz@b_1168)
	clrf	(kodu_coz@b_1168+1)
	
l2927:	
	movf	(kodu_coz@b_1168+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3105
	movlw	low(04h)
	subwf	(kodu_coz@b_1168),w
u3105:

	skipc
	goto	u3101
	goto	u3100
u3101:
	goto	l712
u3100:
	goto	l2941
	
l2929:	
	goto	l2941
	line	76
	
l712:	
	line	77
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	78
	
l2931:	
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	02h
	movwf	(__dcnt+1)
	movlw	09Bh
	movwf	(__dcnt)

	goto	l2933
	
l715:	
	goto	l2933
	
l714:	
	
l2933:	
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
	goto	u3111
	goto	u3110
u3111:
	goto	l2933
u3110:
	
l716:	
	line	79
	bcf	(63/8),(63)&7
	line	80
	
l2935:	
	movlw	(013h)
	fcall	_DelayMs
	line	81
	movlw	(01h)
	fcall	_DelayMs
	line	75
	
l2937:	
	movlw	low(01h)
	addwf	(kodu_coz@b_1168),f
	skipnc
	incf	(kodu_coz@b_1168+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b_1168+1),f
	
l2939:	
	movf	(kodu_coz@b_1168+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3125
	movlw	low(04h)
	subwf	(kodu_coz@b_1168),w
u3125:

	skipc
	goto	u3121
	goto	u3120
u3121:
	goto	l712
u3120:
	goto	l2941
	
l713:	
	goto	l2941
	line	83
	
l711:	
	line	86
	
l2941:	
	movlw	067h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u3131
	goto	u3130
u3131:
	goto	l718
u3130:
	
l2943:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(59/8),(59)&7
	goto	l718
	
l717:	
	line	87
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_kodu_coz
	__end_of_kodu_coz:
;; =============== function _kodu_coz ends ============

	signat	_kodu_coz,88
	global	_DelayMs
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 5 in file "c:/tc/delay.c"
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
;;		_kodu_coz
;; This function uses a non-reentrant model
;;
psect	text151
	file	"c:/tc/delay.c"
	line	5
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 5
; Regs used in _DelayMs: [wreg+status,2+status,0]
	movwf	(DelayMs@cnt)
	line	7
	
l671:	
	line	8
	
l2831:	
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

	goto	l2833
	
l673:	
	goto	l2833
	
l672:	
	
l2833:	
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
	goto	u2801
	goto	u2800
u2801:
	goto	l2833
u2800:
	goto	l2835
	
l674:	
	line	9
	
l2835:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2811
	goto	u2810
u2811:
	goto	l671
u2810:
	goto	l2837
	
l675:	
	goto	l2837
	line	14
	
l676:	
	line	15
	
l2837:	
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(_i)
	line	16
	
l677:	
	line	17
	movlw	0
	movwf	(__dcnt+3)
	movlw	0
	movwf	(__dcnt+2)
	movlw	0
	movwf	(__dcnt+1)
	movlw	053h
	movwf	(__dcnt)

	goto	l2839
	
l679:	
	goto	l2839
	
l678:	
	
l2839:	
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
	goto	u2821
	goto	u2820
u2821:
	goto	l2839
u2820:
	goto	l2841
	
l680:	
	line	18
	
l2841:	
	movlw	low(01h)
	subwf	(_i),f
	btfss	status,2
	goto	u2831
	goto	u2830
u2831:
	goto	l677
u2830:
	goto	l2843
	
l681:	
	line	19
	
l2843:	
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2841
	goto	u2840
u2841:
	goto	l2837
u2840:
	goto	l683
	
l682:	
	line	21
	
l683:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
