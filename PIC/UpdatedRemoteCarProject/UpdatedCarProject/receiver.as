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
	FNCALL	_main,_coz
	FNCALL	_coz,_kodu_coz
	FNCALL	_kodu_coz,_DelayMs
	FNROOT	_main
	global	_code
	global	_a
	global	_kk
	global	_sayi
	global	_sonuc
	global	_temp
	global	_i
	global	_j
	global	_motor_suresi
	global	_motor_aktif
	global	_motor_yon
	global	_ortala
	global	_array
	global	_gelen_veri
	global	_PORTB
psect	text136,local,class=CODE,delta=2
global __ptext136
__ptext136:
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
	file	"receiver.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_i:
       ds      2

_j:
       ds      2

_motor_suresi:
       ds      2

_motor_aktif:
       ds      1

_motor_yon:
       ds      1

_ortala:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_code:
       ds      4

_a:
       ds      2

_kk:
       ds      2

_sayi:
       ds      2

_sonuc:
       ds      2

_temp:
       ds      2

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
	movlw	low(__pbssCOMMON)
	movwf	fsr
	movlw	low((__pbssCOMMON)+09h)
	fcall	clear_ram
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+016h)
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
	global	DelayMs@i
DelayMs@i:	; 1 bytes @ 0x2
	ds	1
	global	DelayMs@_dcnt
DelayMs@_dcnt:	; 1 bytes @ 0x3
	ds	1
	global	??_coz
??_coz:	; 0 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_kodu_coz
??_kodu_coz:	; 0 bytes @ 0x0
	ds	22
	global	kodu_coz@_dcnt
kodu_coz@_dcnt:	; 1 bytes @ 0x16
	ds	1
	global	kodu_coz@_dcnt_1248
kodu_coz@_dcnt_1248:	; 1 bytes @ 0x17
	ds	1
	global	kodu_coz@_dcnt_1250
kodu_coz@_dcnt_1250:	; 1 bytes @ 0x18
	ds	1
	global	kodu_coz@_dcnt_1252
kodu_coz@_dcnt_1252:	; 1 bytes @ 0x19
	ds	1
	global	kodu_coz@b
kodu_coz@b:	; 2 bytes @ 0x1A
	ds	2
	global	kodu_coz@a
kodu_coz@a:	; 2 bytes @ 0x1C
	ds	2
	global	kodu_coz@b_1249
kodu_coz@b_1249:	; 2 bytes @ 0x1E
	ds	2
	global	kodu_coz@b_1251
kodu_coz@b_1251:	; 2 bytes @ 0x20
	ds	2
	global	coz@_dcnt
coz@_dcnt:	; 1 bytes @ 0x22
	ds	1
	global	coz@_dcnt_1255
coz@_dcnt_1255:	; 1 bytes @ 0x23
	ds	1
	global	coz@_dcnt_1256
coz@_dcnt_1256:	; 1 bytes @ 0x24
	ds	1
	global	coz@_dcnt_1257
coz@_dcnt_1257:	; 1 bytes @ 0x25
	ds	1
	global	coz@_dcnt_1258
coz@_dcnt_1258:	; 1 bytes @ 0x26
	ds	1
	global	coz@_dcnt_1259
coz@_dcnt_1259:	; 1 bytes @ 0x27
	ds	1
	global	coz@_dcnt_1260
coz@_dcnt_1260:	; 1 bytes @ 0x28
	ds	1
	global	coz@_dcnt_1261
coz@_dcnt_1261:	; 1 bytes @ 0x29
	ds	1
	global	coz@_dcnt_1262
coz@_dcnt_1262:	; 1 bytes @ 0x2A
	ds	1
	global	coz@_dcnt_1263
coz@_dcnt_1263:	; 1 bytes @ 0x2B
	ds	1
	global	coz@_dcnt_1264
coz@_dcnt_1264:	; 1 bytes @ 0x2C
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 81, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      14
;; BANK0           80     45      67
;; BANK1           80      0      50
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_coz
;;   _kodu_coz->_DelayMs
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_coz
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
;; (0) _main                                                 0     0      0     597
;;                                _coz
;; ---------------------------------------------------------------------------------
;; (1) _coz                                                 12    12      0     597
;;                                              4 COMMON     1     1      0
;;                                             34 BANK0     11    11      0
;;                           _kodu_coz
;; ---------------------------------------------------------------------------------
;; (2) _kodu_coz                                            34    34      0     344
;;                                              0 BANK0     34    34      0
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (3) _DelayMs                                              4     4      0      68
;;                                              0 COMMON     4     4      0
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
;;COMMON               E      5       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      83       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     2D      43       5       83.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      32       7       62.5%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      86      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 162 in file "C:\Users\Saim\Pic Projeler\UpdatedCarProject\receiver.c"
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
	file	"C:\Users\Saim\Pic Projeler\UpdatedCarProject\receiver.c"
	line	162
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	163
	
l3082:	
;receiver.c: 163: TRISB=0b00000001;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	164
	
l3084:	
;receiver.c: 164: PORTB=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	166
	
l3086:	
;receiver.c: 166: TRISC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	167
	
l3088:	
;receiver.c: 167: PORTC=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	goto	l3090
	line	172
;receiver.c: 172: while (1)
	
l801:	
	line	181
	
l3090:	
;receiver.c: 173: {
;receiver.c: 181: if(RB0==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(48/8),(48)&7
	goto	u3331
	goto	u3330
u3331:
	goto	l3090
u3330:
	line	183
	
l3092:	
;receiver.c: 182: {
;receiver.c: 183: coz();
	fcall	_coz
	goto	l3090
	line	184
	
l802:	
	goto	l3090
	line	191
	
l803:	
	line	172
	goto	l3090
	
l804:	
	line	194
	
l805:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_coz
psect	text137,local,class=CODE,delta=2
global __ptext137
__ptext137:

;; *************** function _coz *****************
;; Defined at:
;;		line 91 in file "C:\Users\Saim\Pic Projeler\UpdatedCarProject\receiver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1   44[BANK0 ] unsigned char 
;;  _dcnt           1   43[BANK0 ] unsigned char 
;;  _dcnt           1   42[BANK0 ] unsigned char 
;;  _dcnt           1   41[BANK0 ] unsigned char 
;;  _dcnt           1   40[BANK0 ] unsigned char 
;;  _dcnt           1   39[BANK0 ] unsigned char 
;;  _dcnt           1   38[BANK0 ] unsigned char 
;;  _dcnt           1   37[BANK0 ] unsigned char 
;;  _dcnt           1   36[BANK0 ] unsigned char 
;;  _dcnt           1   35[BANK0 ] unsigned char 
;;  _dcnt           1   34[BANK0 ] unsigned char 
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
;;      Locals:         0      11       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1      11       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_kodu_coz
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text137
	file	"C:\Users\Saim\Pic Projeler\UpdatedCarProject\receiver.c"
	line	91
	global	__size_of_coz
	__size_of_coz	equ	__end_of_coz-_coz
	
_coz:	
	opt	stack 5
; Regs used in _coz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	
l3010:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_sayi)
	clrf	(_sayi+1)
	line	93
;receiver.c: 93: while( RB0 == 1 ) sayi++;
	goto	l3014
	
l759:	
	
l3012:	
	movlw	low(01h)
	addwf	(_sayi),f
	skipnc
	incf	(_sayi+1),f
	movlw	high(01h)
	addwf	(_sayi+1),f
	goto	l3014
	
l758:	
	
l3014:	
	btfsc	(48/8),(48)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l3012
u3100:
	goto	l3016
	
l760:	
	line	94
	
l3016:	
;receiver.c: 94: temp = sayi;
	movf	(_sayi+1),w
	clrf	(_temp+1)	;volatile
	addwf	(_temp+1)	;volatile
	movf	(_sayi),w
	clrf	(_temp)	;volatile
	addwf	(_temp)	;volatile

	line	99
	
l3018:	
;receiver.c: 99: if( sayi > 150 && sayi < 162 )
	movf	(_sayi+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(097h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3115
	movlw	low(097h)
	subwf	(_sayi),w
u3115:

	skipc
	goto	u3111
	goto	u3110
u3111:
	goto	l798
u3110:
	
l3020:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_sayi+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0A2h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3125
	movlw	low(0A2h)
	subwf	(_sayi),w
u3125:

	skipnc
	goto	u3121
	goto	u3120
u3121:
	goto	l798
u3120:
	line	102
	
l3022:	
;receiver.c: 100: {
;receiver.c: 102: { unsigned char _dcnt; _dcnt = (250 -1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(coz@_dcnt)
	goto	l3024
	
l763:	
	goto	l3024
	
l762:	
	
l3024:	
	movlw	low(01h)
	subwf	(coz@_dcnt),f
	btfss	status,2
	goto	u3131
	goto	u3130
u3131:
	goto	l3024
u3130:
	goto	l3026
	
l764:	
	line	103
	
l3026:	
;receiver.c: 103: { unsigned char _dcnt; _dcnt = (250 -1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1255)
	goto	l3028
	
l766:	
	goto	l3028
	
l765:	
	
l3028:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1255),f
	btfss	status,2
	goto	u3141
	goto	u3140
u3141:
	goto	l3028
u3140:
	
l767:	
	line	105
;receiver.c: 105: if( RB0 == 0 )
	btfsc	(48/8),(48)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l798
u3150:
	line	107
	
l3030:	
;receiver.c: 106: {
;receiver.c: 107: { unsigned char _dcnt; _dcnt = (240 -1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(04Fh)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1256)
	goto	l3032
	
l770:	
	goto	l3032
	
l769:	
	
l3032:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1256),f
	btfss	status,2
	goto	u3161
	goto	u3160
u3161:
	goto	l3032
u3160:
	goto	l3034
	
l771:	
	line	108
	
l3034:	
;receiver.c: 108: { unsigned char _dcnt; _dcnt = (230 -1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(04Dh)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1257)
	goto	l3036
	
l773:	
	goto	l3036
	
l772:	
	
l3036:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1257),f
	btfss	status,2
	goto	u3171
	goto	u3170
u3171:
	goto	l3036
u3170:
	
l774:	
	line	109
;receiver.c: 109: RC5 = RB0;
	btfsc	(48/8),(48)&7
	goto	u3181
	goto	u3180
	
u3181:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u3194
u3180:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u3194:
	line	110
;receiver.c: 110: RB7=1;
	bsf	(55/8),(55)&7
	line	113
	
l3038:	
;receiver.c: 113: for( kk = 0 ; kk < 8 ; kk ++ )
	clrf	(_kk)
	clrf	(_kk+1)
	
l3040:	
	movf	(_kk+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3205
	movlw	low(08h)
	subwf	(_kk),w
u3205:

	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l3044
u3200:
	goto	l3080
	
l3042:	
	goto	l3080
	line	114
	
l775:	
	line	115
	
l3044:	
;receiver.c: 114: {
;receiver.c: 115: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(coz@_dcnt_1258)
	goto	l3046
	
l778:	
	goto	l3046
	
l777:	
	
l3046:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1258),f
	btfss	status,2
	goto	u3211
	goto	u3210
u3211:
	goto	l3046
u3210:
	goto	l3048
	
l779:	
	line	116
	
l3048:	
;receiver.c: 116: { unsigned char _dcnt; _dcnt = (120)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(029h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1259)
	goto	l3050
	
l781:	
	goto	l3050
	
l780:	
	
l3050:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1259),f
	btfss	status,2
	goto	u3221
	goto	u3220
u3221:
	goto	l3050
u3220:
	goto	l3052
	
l782:	
	line	119
	
l3052:	
;receiver.c: 119: gelen_veri[ kk ] = RB0;
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
	
l3054:	
;receiver.c: 120: RC5 = RB0 ;
	btfsc	(48/8),(48)&7
	goto	u3231
	goto	u3230
	
u3231:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u3244
u3230:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u3244:
	line	121
	
l3056:	
;receiver.c: 121: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1260)
	goto	l3058
	
l784:	
	goto	l3058
	
l783:	
	
l3058:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1260),f
	btfss	status,2
	goto	u3251
	goto	u3250
u3251:
	goto	l3058
u3250:
	goto	l3060
	
l785:	
	line	122
	
l3060:	
;receiver.c: 122: { unsigned char _dcnt; _dcnt = (120)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(029h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1261)
	goto	l3062
	
l787:	
	goto	l3062
	
l786:	
	
l3062:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1261),f
	btfss	status,2
	goto	u3261
	goto	u3260
u3261:
	goto	l3062
u3260:
	
l788:	
	line	124
;receiver.c: 124: RC5 = RB0;
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
	line	125
	
l3064:	
;receiver.c: 125: { unsigned char _dcnt; _dcnt = (250 - 1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1262)
	goto	l3066
	
l790:	
	goto	l3066
	
l789:	
	
l3066:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1262),f
	btfss	status,2
	goto	u3291
	goto	u3290
u3291:
	goto	l3066
u3290:
	goto	l3068
	
l791:	
	line	126
	
l3068:	
;receiver.c: 126: { unsigned char _dcnt; _dcnt = (230 - 1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(04Dh)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1263)
	goto	l3070
	
l793:	
	goto	l3070
	
l792:	
	
l3070:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1263),f
	btfss	status,2
	goto	u3301
	goto	u3300
u3301:
	goto	l3070
u3300:
	goto	l3072
	
l794:	
	line	127
	
l3072:	
;receiver.c: 127: { unsigned char _dcnt; _dcnt = (220 - 1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(049h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1264)
	goto	l3074
	
l796:	
	goto	l3074
	
l795:	
	
l3074:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1264),f
	btfss	status,2
	goto	u3311
	goto	u3310
u3311:
	goto	l3074
u3310:
	goto	l3076
	
l797:	
	line	113
	
l3076:	
	movlw	low(01h)
	addwf	(_kk),f
	skipnc
	incf	(_kk+1),f
	movlw	high(01h)
	addwf	(_kk+1),f
	
l3078:	
	movf	(_kk+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3325
	movlw	low(08h)
	subwf	(_kk),w
u3325:

	skipc
	goto	u3321
	goto	u3320
u3321:
	goto	l3044
u3320:
	goto	l3080
	
l776:	
	line	134
	
l3080:	
;receiver.c: 129: }
;receiver.c: 134: kodu_coz();
	fcall	_kodu_coz
	goto	l798
	line	140
	
l768:	
	goto	l798
	line	149
	
l761:	
	line	160
	
l798:	
	return
	opt stack 0
GLOBAL	__end_of_coz
	__end_of_coz:
;; =============== function _coz ends ============

	signat	_coz,88
	global	_kodu_coz
psect	text138,local,class=CODE,delta=2
global __ptext138
__ptext138:

;; *************** function _kodu_coz *****************
;; Defined at:
;;		line 29 in file "C:\Users\Saim\Pic Projeler\UpdatedCarProject\receiver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1   25[BANK0 ] unsigned char 
;;  _dcnt           1   24[BANK0 ] unsigned char 
;;  _dcnt           1   23[BANK0 ] unsigned char 
;;  _dcnt           1   22[BANK0 ] unsigned char 
;;  b               2   32[BANK0 ] int 
;;  b               2   30[BANK0 ] int 
;;  a               2   28[BANK0 ] int 
;;  b               2   26[BANK0 ] int 
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
;;      Locals:         0      12       0       0       0
;;      Temps:          0      22       0       0       0
;;      Totals:         0      34       0       0       0
;;Total ram usage:       34 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		_coz
;; This function uses a non-reentrant model
;;
psect	text138
	file	"C:\Users\Saim\Pic Projeler\UpdatedCarProject\receiver.c"
	line	29
	global	__size_of_kodu_coz
	__size_of_kodu_coz	equ	__end_of_kodu_coz-_kodu_coz
	
_kodu_coz:	
	opt	stack 5
; Regs used in _kodu_coz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	30
	
l2910:	
;receiver.c: 30: sonuc=64*gelen_veri[1]+32*gelen_veri[2]+16*gelen_veri[3]+8*gelen_veri[4]+4*gelen_veri[5]+2*gelen_veri[6]+gelen_veri[7];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_gelen_veri)+06h,w
	movwf	(??_kodu_coz+0)+0
	clrf	(??_kodu_coz+0)+0+1
	movlw	01h
	movwf	btemp+1
u2815:
	clrc
	rlf	(??_kodu_coz+0)+0,f
	rlf	(??_kodu_coz+0)+1,f
	decfsz	btemp+1,f
	goto	u2815
	movf	0+(_gelen_veri)+05h,w
	movwf	(??_kodu_coz+2)+0
	clrf	(??_kodu_coz+2)+0+1
	movlw	02h
	movwf	btemp+1
u2825:
	clrc
	rlf	(??_kodu_coz+2)+0,f
	rlf	(??_kodu_coz+2)+1,f
	decfsz	btemp+1,f
	goto	u2825
	movf	0+(_gelen_veri)+04h,w
	movwf	(??_kodu_coz+4)+0
	clrf	(??_kodu_coz+4)+0+1
	movlw	03h
	movwf	btemp+1
u2835:
	clrc
	rlf	(??_kodu_coz+4)+0,f
	rlf	(??_kodu_coz+4)+1,f
	decfsz	btemp+1,f
	goto	u2835
	movf	0+(_gelen_veri)+03h,w
	movwf	(??_kodu_coz+6)+0
	clrf	(??_kodu_coz+6)+0+1
	movlw	04h
	movwf	btemp+1
u2845:
	clrc
	rlf	(??_kodu_coz+6)+0,f
	rlf	(??_kodu_coz+6)+1,f
	decfsz	btemp+1,f
	goto	u2845
	movf	0+(_gelen_veri)+02h,w
	movwf	(??_kodu_coz+8)+0
	clrf	(??_kodu_coz+8)+0+1
	movlw	05h
	movwf	btemp+1
u2855:
	clrc
	rlf	(??_kodu_coz+8)+0,f
	rlf	(??_kodu_coz+8)+1,f
	decfsz	btemp+1,f
	goto	u2855
	movf	0+(_gelen_veri)+01h,w
	movwf	(??_kodu_coz+10)+0
	clrf	(??_kodu_coz+10)+0+1
	movlw	06h
	movwf	btemp+1
u2865:
	clrc
	rlf	(??_kodu_coz+10)+0,f
	rlf	(??_kodu_coz+10)+1,f
	decfsz	btemp+1,f
	goto	u2865
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
	
l2912:	
;receiver.c: 31: array[a++]=sonuc;
	movf	(_sonuc),w
	movwf	(??_kodu_coz+0)+0
	movf	(_a),w
	addlw	_array&0ffh
	movwf	fsr0
	movf	(??_kodu_coz+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l2914:	
	movlw	low(01h)
	addwf	(_a),f
	skipnc
	incf	(_a+1),f
	movlw	high(01h)
	addwf	(_a+1),f
	line	32
	
l2916:	
;receiver.c: 32: if(sonuc=='2'){RB1=1; RC0 = 1; RC2 = 1; RC1 = 0; RC3 = 0; }
	movlw	032h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2871
	goto	u2870
u2871:
	goto	l2920
u2870:
	
l2918:	
	bsf	(49/8),(49)&7
	bsf	(56/8),(56)&7
	bsf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(59/8),(59)&7
	goto	l2920
	
l723:	
	line	33
	
l2920:	
;receiver.c: 33: if(sonuc==22)RB1=~RB1;
	movlw	016h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2881
	goto	u2880
u2881:
	goto	l724
u2880:
	
l2922:	
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	
l724:	
	line	34
;receiver.c: 34: if(sonuc==33)RB2=~RB2;
	movlw	021h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l725
u2890:
	
l2924:	
	movlw	1<<((50)&7)
	xorwf	((50)/8),f
	
l725:	
	line	35
;receiver.c: 35: if(sonuc=='4'){
	movlw	034h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l2942
u2900:
	line	36
	
l2926:	
;receiver.c: 36: for(int b=0;b<3;b++)
	clrf	(kodu_coz@b)
	clrf	(kodu_coz@b+1)
	
l2928:	
	movf	(kodu_coz@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2915
	movlw	low(03h)
	subwf	(kodu_coz@b),w
u2915:

	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l727
u2910:
	goto	l2942
	
l2930:	
	goto	l2942
	line	37
	
l727:	
	line	38
;receiver.c: 37: {
;receiver.c: 38: RC7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	39
	
l2932:	
;receiver.c: 39: { unsigned char _dcnt; _dcnt = (1498)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F3h)
	movwf	(??_kodu_coz+0)+0
	movf	(??_kodu_coz+0)+0,w
	movwf	(kodu_coz@_dcnt)
	goto	l2934
	
l730:	
	goto	l2934
	
l729:	
	
l2934:	
	movlw	low(01h)
	subwf	(kodu_coz@_dcnt),f
	btfss	status,2
	goto	u2921
	goto	u2920
u2921:
	goto	l2934
u2920:
	
l731:	
	line	40
;receiver.c: 40: RC7 = 0;
	bcf	(63/8),(63)&7
	line	41
	
l2936:	
;receiver.c: 41: DelayMs(19);
	movlw	(013h)
	fcall	_DelayMs
	line	42
;receiver.c: 42: DelayMs( 1 ); }
	movlw	(01h)
	fcall	_DelayMs
	line	36
	
l2938:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(kodu_coz@b),f
	skipnc
	incf	(kodu_coz@b+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b+1),f
	
l2940:	
	movf	(kodu_coz@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2935
	movlw	low(03h)
	subwf	(kodu_coz@b),w
u2935:

	skipc
	goto	u2931
	goto	u2930
u2931:
	goto	l727
u2930:
	goto	l2942
	
l728:	
	goto	l2942
	line	46
	
l726:	
	line	47
	
l2942:	
;receiver.c: 46: }
;receiver.c: 47: if(sonuc=='5'){
	movlw	035h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l2960
u2940:
	line	48
	
l2944:	
;receiver.c: 48: for(int a=0;a<3;a++)
	clrf	(kodu_coz@a)
	clrf	(kodu_coz@a+1)
	
l2946:	
	movf	(kodu_coz@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2955
	movlw	low(03h)
	subwf	(kodu_coz@a),w
u2955:

	skipc
	goto	u2951
	goto	u2950
u2951:
	goto	l733
u2950:
	goto	l2960
	
l2948:	
	goto	l2960
	line	49
	
l733:	
	line	50
;receiver.c: 49: {
;receiver.c: 50: RC7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	51
	
l2950:	
;receiver.c: 51: { unsigned char _dcnt; _dcnt = (998)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(04Dh)
	movwf	(??_kodu_coz+0)+0
	movf	(??_kodu_coz+0)+0,w
	movwf	(kodu_coz@_dcnt_1248)
	goto	l2952
	
l736:	
	goto	l2952
	
l735:	
	
l2952:	
	movlw	low(01h)
	subwf	(kodu_coz@_dcnt_1248),f
	btfss	status,2
	goto	u2961
	goto	u2960
u2961:
	goto	l2952
u2960:
	
l737:	
	line	52
;receiver.c: 52: RC7=0;
	bcf	(63/8),(63)&7
	line	53
	
l2954:	
;receiver.c: 53: DelayMs(19);
	movlw	(013h)
	fcall	_DelayMs
	line	54
;receiver.c: 54: DelayMs( 2 );
	movlw	(02h)
	fcall	_DelayMs
	line	48
	
l2956:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(kodu_coz@a),f
	skipnc
	incf	(kodu_coz@a+1),f
	movlw	high(01h)
	addwf	(kodu_coz@a+1),f
	
l2958:	
	movf	(kodu_coz@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2975
	movlw	low(03h)
	subwf	(kodu_coz@a),w
u2975:

	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l733
u2970:
	goto	l2960
	
l734:	
	goto	l2960
	line	58
	
l732:	
	line	59
	
l2960:	
;receiver.c: 55: }
;receiver.c: 58: }
;receiver.c: 59: if(sonuc=='7'){ RC0 = 0; RC2 = 0; RC1 = 1; RC3 = 1; };
	movlw	037h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l2964
u2980:
	
l2962:	
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	bsf	(57/8),(57)&7
	bsf	(59/8),(59)&7
	goto	l2964
	
l738:	
	line	61
	
l2964:	
;receiver.c: 61: if(sonuc=='b'){ RB1 = 0; RC0 = 0; RC2 = 0; }
	movlw	062h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l2968
u2990:
	
l2966:	
	bcf	(49/8),(49)&7
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	goto	l2968
	
l739:	
	line	62
	
l2968:	
;receiver.c: 62: if(sonuc =='d' || sonuc == 'e' ){
	movlw	064h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipnz
	goto	u3001
	goto	u3000
u3001:
	goto	l2972
u3000:
	
l2970:	
	movlw	065h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u3011
	goto	u3010
u3011:
	goto	l2988
u3010:
	goto	l2972
	
l742:	
	line	63
	
l2972:	
;receiver.c: 63: for(int b=0;b<4;b++)
	clrf	(kodu_coz@b_1249)
	clrf	(kodu_coz@b_1249+1)
	
l2974:	
	movf	(kodu_coz@b_1249+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3025
	movlw	low(04h)
	subwf	(kodu_coz@b_1249),w
u3025:

	skipc
	goto	u3021
	goto	u3020
u3021:
	goto	l743
u3020:
	goto	l2988
	
l2976:	
	goto	l2988
	line	64
	
l743:	
	line	65
;receiver.c: 64: {
;receiver.c: 65: RC7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	66
	
l2978:	
;receiver.c: 66: { unsigned char _dcnt; _dcnt = (1998)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(09Bh)
	movwf	(??_kodu_coz+0)+0
	movf	(??_kodu_coz+0)+0,w
	movwf	(kodu_coz@_dcnt_1250)
	goto	l2980
	
l746:	
	goto	l2980
	
l745:	
	
l2980:	
	movlw	low(01h)
	subwf	(kodu_coz@_dcnt_1250),f
	btfss	status,2
	goto	u3031
	goto	u3030
u3031:
	goto	l2980
u3030:
	
l747:	
	line	67
;receiver.c: 67: RC7 = 0;
	bcf	(63/8),(63)&7
	line	68
	
l2982:	
;receiver.c: 68: DelayMs(19);
	movlw	(013h)
	fcall	_DelayMs
	line	69
;receiver.c: 69: DelayMs( 1 ); }
	movlw	(01h)
	fcall	_DelayMs
	line	63
	
l2984:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(kodu_coz@b_1249),f
	skipnc
	incf	(kodu_coz@b_1249+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b_1249+1),f
	
l2986:	
	movf	(kodu_coz@b_1249+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3045
	movlw	low(04h)
	subwf	(kodu_coz@b_1249),w
u3045:

	skipc
	goto	u3041
	goto	u3040
u3041:
	goto	l743
u3040:
	goto	l2988
	
l744:	
	goto	l2988
	line	71
	
l740:	
	line	74
	
l2988:	
;receiver.c: 71: }
;receiver.c: 74: if(sonuc == 'e' ){
	movlw	065h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u3051
	goto	u3050
u3051:
	goto	l3006
u3050:
	line	75
	
l2990:	
;receiver.c: 75: for(int b=0;b<4;b++)
	clrf	(kodu_coz@b_1251)
	clrf	(kodu_coz@b_1251+1)
	
l2992:	
	movf	(kodu_coz@b_1251+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3065
	movlw	low(04h)
	subwf	(kodu_coz@b_1251),w
u3065:

	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l749
u3060:
	goto	l3006
	
l2994:	
	goto	l3006
	line	76
	
l749:	
	line	77
;receiver.c: 76: {
;receiver.c: 77: RC7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	78
	
l2996:	
;receiver.c: 78: { unsigned char _dcnt; _dcnt = (1998)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(09Bh)
	movwf	(??_kodu_coz+0)+0
	movf	(??_kodu_coz+0)+0,w
	movwf	(kodu_coz@_dcnt_1252)
	goto	l2998
	
l752:	
	goto	l2998
	
l751:	
	
l2998:	
	movlw	low(01h)
	subwf	(kodu_coz@_dcnt_1252),f
	btfss	status,2
	goto	u3071
	goto	u3070
u3071:
	goto	l2998
u3070:
	
l753:	
	line	79
;receiver.c: 79: RC7 = 0;
	bcf	(63/8),(63)&7
	line	80
	
l3000:	
;receiver.c: 80: DelayMs(19);
	movlw	(013h)
	fcall	_DelayMs
	line	81
;receiver.c: 81: DelayMs( 1 ); }
	movlw	(01h)
	fcall	_DelayMs
	line	75
	
l3002:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(kodu_coz@b_1251),f
	skipnc
	incf	(kodu_coz@b_1251+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b_1251+1),f
	
l3004:	
	movf	(kodu_coz@b_1251+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3085
	movlw	low(04h)
	subwf	(kodu_coz@b_1251),w
u3085:

	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l749
u3080:
	goto	l3006
	
l750:	
	goto	l3006
	line	83
	
l748:	
	line	86
	
l3006:	
;receiver.c: 83: }
;receiver.c: 86: if(sonuc=='g') {RC0 = 0; RC2 = 0; RC1 = 0; RC3 = 0; }
	movlw	067h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u3091
	goto	u3090
u3091:
	goto	l755
u3090:
	
l3008:	
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(59/8),(59)&7
	goto	l755
	
l754:	
	line	87
	
l755:	
	return
	opt stack 0
GLOBAL	__end_of_kodu_coz
	__end_of_kodu_coz:
;; =============== function _kodu_coz ends ============

	signat	_kodu_coz,88
	global	_DelayMs
psect	text139,local,class=CODE,delta=2
global __ptext139
__ptext139:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 5 in file "c:/tc/delay.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    1[COMMON] unsigned char 
;;  _dcnt           1    3[COMMON] unsigned char 
;;  i               1    2[COMMON] unsigned char 
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
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_kodu_coz
;; This function uses a non-reentrant model
;;
psect	text139
	file	"c:/tc/delay.c"
	line	5
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 5
; Regs used in _DelayMs: [wreg+status,2+status,0]
;DelayMs@cnt stored from wreg
	movwf	(DelayMs@cnt)
	line	14
;delay.c: 13: unsigned char i;
;delay.c: 14: do {
	
l713:	
	line	15
	
l2902:	
;delay.c: 15: i = 4;
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@i)
	line	16
;delay.c: 16: do {
	
l714:	
	line	17
;delay.c: 17: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@_dcnt)
	goto	l2904
	
l716:	
	goto	l2904
	
l715:	
	
l2904:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u2781
	goto	u2780
u2781:
	goto	l2904
u2780:
	goto	l2906
	
l717:	
	line	18
	
l2906:	
;delay.c: 18: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u2791
	goto	u2790
u2791:
	goto	l714
u2790:
	goto	l2908
	
l718:	
	line	19
	
l2908:	
;delay.c: 19: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2801
	goto	u2800
u2801:
	goto	l713
u2800:
	goto	l720
	
l719:	
	line	21
	
l720:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
psect	text140,local,class=CODE,delta=2
global __ptext140
__ptext140:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
