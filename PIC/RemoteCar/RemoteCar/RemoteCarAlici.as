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
	global	_code
	global	_a
	global	_i
	global	_j
	global	_motor_suresi
	global	_sonuc
	global	_temp
	global	_sayi
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
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
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
	file	"RemoteCarAlici.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_sayi:
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

_i:
       ds      2

_j:
       ds      2

_motor_suresi:
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
	global	coz@_dcnt
coz@_dcnt:	; 1 bytes @ 0x5
	ds	1
	global	coz@_dcnt_1176
coz@_dcnt_1176:	; 1 bytes @ 0x6
	ds	1
	global	coz@k
coz@k:	; 2 bytes @ 0x7
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x9
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_kodu_coz
??_kodu_coz:	; 0 bytes @ 0x0
	ds	22
	global	kodu_coz@_dcnt
kodu_coz@_dcnt:	; 1 bytes @ 0x16
	ds	1
	global	kodu_coz@_dcnt_1168
kodu_coz@_dcnt_1168:	; 1 bytes @ 0x17
	ds	1
	global	kodu_coz@_dcnt_1170
kodu_coz@_dcnt_1170:	; 1 bytes @ 0x18
	ds	1
	global	kodu_coz@_dcnt_1172
kodu_coz@_dcnt_1172:	; 1 bytes @ 0x19
	ds	1
	global	kodu_coz@b
kodu_coz@b:	; 2 bytes @ 0x1A
	ds	2
	global	kodu_coz@a
kodu_coz@a:	; 2 bytes @ 0x1C
	ds	2
	global	kodu_coz@b_1169
kodu_coz@b_1169:	; 2 bytes @ 0x1E
	ds	2
	global	kodu_coz@b_1171
kodu_coz@b_1171:	; 2 bytes @ 0x20
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 79, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      14
;; BANK0           80     34      58
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
;; (0) _main                                                 0     0      0     458
;;                                _coz
;; ---------------------------------------------------------------------------------
;; (1) _coz                                                  5     5      0     458
;;                                              4 COMMON     5     5      0
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
;;COMMON               E      9       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      7A       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     22      3A       5       72.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      32       7       62.5%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      7D      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 111 in file "C:\Users\Saim\Desktop\RemoteCar\alici.c"
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
	file	"C:\Users\Saim\Desktop\RemoteCar\alici.c"
	line	111
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	112
	
l2893:	
;alici.c: 112: TRISB=0b00000001;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	113
	
l2895:	
;alici.c: 113: PORTB=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	115
	
l2897:	
;alici.c: 115: TRISC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	116
	
l2899:	
;alici.c: 116: PORTC=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	goto	l2901
	line	121
;alici.c: 121: while (1)
	
l728:	
	line	130
	
l2901:	
;alici.c: 122: {
;alici.c: 130: if(RB0==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(48/8),(48)&7
	goto	u3031
	goto	u3030
u3031:
	goto	l2901
u3030:
	line	132
	
l2903:	
;alici.c: 131: {
;alici.c: 132: coz();
	fcall	_coz
	goto	l2901
	line	133
	
l729:	
	goto	l2901
	line	140
	
l730:	
	line	121
	goto	l2901
	
l731:	
	line	143
	
l732:	
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
;;		line 89 in file "C:\Users\Saim\Desktop\RemoteCar\alici.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1    6[COMMON] unsigned char 
;;  k               2    7[COMMON] int 
;;  _dcnt           1    5[COMMON] unsigned char 
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
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_kodu_coz
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text137
	file	"C:\Users\Saim\Desktop\RemoteCar\alici.c"
	line	89
	global	__size_of_coz
	__size_of_coz	equ	__end_of_coz-_coz
	
_coz:	
	opt	stack 5
; Regs used in _coz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	
l2859:	
	clrf	(_sayi)
	clrf	(_sayi+1)
	line	90
;alici.c: 90: while(RB0==1)sayi++;
	goto	l2863
	
l713:	
	
l2861:	
	movlw	low(01h)
	addwf	(_sayi),f
	skipnc
	incf	(_sayi+1),f
	movlw	high(01h)
	addwf	(_sayi+1),f
	goto	l2863
	
l712:	
	
l2863:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2951
	goto	u2950
u2951:
	goto	l2861
u2950:
	goto	l2865
	
l714:	
	line	92
	
l2865:	
;alici.c: 92: if(sayi>68 && sayi<76)
	movf	(_sayi+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(045h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2965
	movlw	low(045h)
	subwf	(_sayi),w
u2965:

	skipc
	goto	u2961
	goto	u2960
u2961:
	goto	l725
u2960:
	
l2867:	
	movf	(_sayi+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u2975
	movlw	low(04Ch)
	subwf	(_sayi),w
u2975:

	skipnc
	goto	u2971
	goto	u2970
u2971:
	goto	l725
u2970:
	line	94
	
l2869:	
;alici.c: 93: {
;alici.c: 94: { unsigned char _dcnt; _dcnt = (1200-1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(08Fh)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt)
	goto	l2871
	
l717:	
	goto	l2871
	
l716:	
	
l2871:	
	movlw	low(01h)
	subwf	(coz@_dcnt),f
	btfss	status,2
	goto	u2981
	goto	u2980
u2981:
	goto	l2871
u2980:
	
l718:	
	line	95
;alici.c: 95: if(RB0==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u2991
	goto	u2990
u2991:
	goto	l725
u2990:
	line	97
	
l2873:	
;alici.c: 96: {
;alici.c: 97: for(int k=0;k<8;k++)
	clrf	(coz@k)
	clrf	(coz@k+1)
	
l2875:	
	movf	(coz@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3005
	movlw	low(08h)
	subwf	(coz@k),w
u3005:

	skipc
	goto	u3001
	goto	u3000
u3001:
	goto	l2879
u3000:
	goto	l2889
	
l2877:	
	goto	l2889
	line	98
	
l720:	
	
l2879:	
;alici.c: 98: {{ unsigned char _dcnt; _dcnt = (1495-1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F3h)
	movwf	(??_coz+0)+0
	movf	(??_coz+0)+0,w
	movwf	(coz@_dcnt_1176)
	goto	l2881
	
l723:	
	goto	l2881
	
l722:	
	
l2881:	
	movlw	low(01h)
	subwf	(coz@_dcnt_1176),f
	btfss	status,2
	goto	u3011
	goto	u3010
u3011:
	goto	l2881
u3010:
	goto	l2883
	
l724:	
	line	99
	
l2883:	
;alici.c: 99: gelen_veri[k]=RB0;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(48/8),(48)&7
	movlw	1
	movwf	(??_coz+0)+0
	movf	(coz@k),w
	addlw	_gelen_veri&0ffh
	movwf	fsr0
	movf	(??_coz+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	97
	
l2885:	
	movlw	low(01h)
	addwf	(coz@k),f
	skipnc
	incf	(coz@k+1),f
	movlw	high(01h)
	addwf	(coz@k+1),f
	
l2887:	
	movf	(coz@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3025
	movlw	low(08h)
	subwf	(coz@k),w
u3025:

	skipc
	goto	u3021
	goto	u3020
u3021:
	goto	l2879
u3020:
	goto	l2889
	
l721:	
	line	103
	
l2889:	
;alici.c: 100: }
;alici.c: 103: kodu_coz();
	fcall	_kodu_coz
	line	104
	
l2891:	
;alici.c: 104: temp=sayi;
	movf	(_sayi+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_temp+1)	;volatile
	addwf	(_temp+1)	;volatile
	movf	(_sayi),w
	clrf	(_temp)	;volatile
	addwf	(_temp)	;volatile

	goto	l725
	line	105
	
l719:	
	goto	l725
	line	108
	
l715:	
	line	109
	
l725:	
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
;;		line 29 in file "C:\Users\Saim\Desktop\RemoteCar\alici.c"
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
	file	"C:\Users\Saim\Desktop\RemoteCar\alici.c"
	line	29
	global	__size_of_kodu_coz
	__size_of_kodu_coz	equ	__end_of_kodu_coz-_kodu_coz
	
_kodu_coz:	
	opt	stack 5
; Regs used in _kodu_coz: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	30
	
l2759:	
;alici.c: 30: sonuc=64*gelen_veri[1]+32*gelen_veri[2]+16*gelen_veri[3]+8*gelen_veri[4]+4*gelen_veri[5]+2*gelen_veri[6]+gelen_veri[7];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_gelen_veri)+06h,w
	movwf	(??_kodu_coz+0)+0
	clrf	(??_kodu_coz+0)+0+1
	movlw	01h
	movwf	btemp+1
u2665:
	clrc
	rlf	(??_kodu_coz+0)+0,f
	rlf	(??_kodu_coz+0)+1,f
	decfsz	btemp+1,f
	goto	u2665
	movf	0+(_gelen_veri)+05h,w
	movwf	(??_kodu_coz+2)+0
	clrf	(??_kodu_coz+2)+0+1
	movlw	02h
	movwf	btemp+1
u2675:
	clrc
	rlf	(??_kodu_coz+2)+0,f
	rlf	(??_kodu_coz+2)+1,f
	decfsz	btemp+1,f
	goto	u2675
	movf	0+(_gelen_veri)+04h,w
	movwf	(??_kodu_coz+4)+0
	clrf	(??_kodu_coz+4)+0+1
	movlw	03h
	movwf	btemp+1
u2685:
	clrc
	rlf	(??_kodu_coz+4)+0,f
	rlf	(??_kodu_coz+4)+1,f
	decfsz	btemp+1,f
	goto	u2685
	movf	0+(_gelen_veri)+03h,w
	movwf	(??_kodu_coz+6)+0
	clrf	(??_kodu_coz+6)+0+1
	movlw	04h
	movwf	btemp+1
u2695:
	clrc
	rlf	(??_kodu_coz+6)+0,f
	rlf	(??_kodu_coz+6)+1,f
	decfsz	btemp+1,f
	goto	u2695
	movf	0+(_gelen_veri)+02h,w
	movwf	(??_kodu_coz+8)+0
	clrf	(??_kodu_coz+8)+0+1
	movlw	05h
	movwf	btemp+1
u2705:
	clrc
	rlf	(??_kodu_coz+8)+0,f
	rlf	(??_kodu_coz+8)+1,f
	decfsz	btemp+1,f
	goto	u2705
	movf	0+(_gelen_veri)+01h,w
	movwf	(??_kodu_coz+10)+0
	clrf	(??_kodu_coz+10)+0+1
	movlw	06h
	movwf	btemp+1
u2715:
	clrc
	rlf	(??_kodu_coz+10)+0,f
	rlf	(??_kodu_coz+10)+1,f
	decfsz	btemp+1,f
	goto	u2715
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
	
l2761:	
;alici.c: 31: array[a++]=sonuc;
	movf	(_sonuc),w
	movwf	(??_kodu_coz+0)+0
	movf	(_a),w
	addlw	_array&0ffh
	movwf	fsr0
	movf	(??_kodu_coz+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l2763:	
	movlw	low(01h)
	addwf	(_a),f
	skipnc
	incf	(_a+1),f
	movlw	high(01h)
	addwf	(_a+1),f
	line	32
	
l2765:	
;alici.c: 32: if(sonuc=='2'){RB1=1; RC0 = 1; RC2 = 1; RC1 = 0; RC3 = 0; }
	movlw	032h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2721
	goto	u2720
u2721:
	goto	l2769
u2720:
	
l2767:	
	bsf	(49/8),(49)&7
	bsf	(56/8),(56)&7
	bsf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(59/8),(59)&7
	goto	l2769
	
l677:	
	line	33
	
l2769:	
;alici.c: 33: if(sonuc==22)RB1=~RB1;
	movlw	016h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2731
	goto	u2730
u2731:
	goto	l678
u2730:
	
l2771:	
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	
l678:	
	line	34
;alici.c: 34: if(sonuc==33)RB2=~RB2;
	movlw	021h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2741
	goto	u2740
u2741:
	goto	l679
u2740:
	
l2773:	
	movlw	1<<((50)&7)
	xorwf	((50)/8),f
	
l679:	
	line	35
;alici.c: 35: if(sonuc=='4'){
	movlw	034h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2751
	goto	u2750
u2751:
	goto	l2791
u2750:
	line	36
	
l2775:	
;alici.c: 36: for(int b=0;b<3;b++)
	clrf	(kodu_coz@b)
	clrf	(kodu_coz@b+1)
	
l2777:	
	movf	(kodu_coz@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2765
	movlw	low(03h)
	subwf	(kodu_coz@b),w
u2765:

	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l681
u2760:
	goto	l2791
	
l2779:	
	goto	l2791
	line	37
	
l681:	
	line	38
;alici.c: 37: {
;alici.c: 38: RC7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	39
	
l2781:	
;alici.c: 39: { unsigned char _dcnt; _dcnt = (1498)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F3h)
	movwf	(??_kodu_coz+0)+0
	movf	(??_kodu_coz+0)+0,w
	movwf	(kodu_coz@_dcnt)
	goto	l2783
	
l684:	
	goto	l2783
	
l683:	
	
l2783:	
	movlw	low(01h)
	subwf	(kodu_coz@_dcnt),f
	btfss	status,2
	goto	u2771
	goto	u2770
u2771:
	goto	l2783
u2770:
	
l685:	
	line	40
;alici.c: 40: RC7 = 0;
	bcf	(63/8),(63)&7
	line	41
	
l2785:	
;alici.c: 41: DelayMs(19);
	movlw	(013h)
	fcall	_DelayMs
	line	42
;alici.c: 42: DelayMs( 1 ); }
	movlw	(01h)
	fcall	_DelayMs
	line	36
	
l2787:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(kodu_coz@b),f
	skipnc
	incf	(kodu_coz@b+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b+1),f
	
l2789:	
	movf	(kodu_coz@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2785
	movlw	low(03h)
	subwf	(kodu_coz@b),w
u2785:

	skipc
	goto	u2781
	goto	u2780
u2781:
	goto	l681
u2780:
	goto	l2791
	
l682:	
	goto	l2791
	line	46
	
l680:	
	line	47
	
l2791:	
;alici.c: 46: }
;alici.c: 47: if(sonuc=='5'){
	movlw	035h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2791
	goto	u2790
u2791:
	goto	l2809
u2790:
	line	48
	
l2793:	
;alici.c: 48: for(int a=0;a<3;a++)
	clrf	(kodu_coz@a)
	clrf	(kodu_coz@a+1)
	
l2795:	
	movf	(kodu_coz@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2805
	movlw	low(03h)
	subwf	(kodu_coz@a),w
u2805:

	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l687
u2800:
	goto	l2809
	
l2797:	
	goto	l2809
	line	49
	
l687:	
	line	50
;alici.c: 49: {
;alici.c: 50: RC7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	51
	
l2799:	
;alici.c: 51: { unsigned char _dcnt; _dcnt = (998)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(04Dh)
	movwf	(??_kodu_coz+0)+0
	movf	(??_kodu_coz+0)+0,w
	movwf	(kodu_coz@_dcnt_1168)
	goto	l2801
	
l690:	
	goto	l2801
	
l689:	
	
l2801:	
	movlw	low(01h)
	subwf	(kodu_coz@_dcnt_1168),f
	btfss	status,2
	goto	u2811
	goto	u2810
u2811:
	goto	l2801
u2810:
	
l691:	
	line	52
;alici.c: 52: RC7=0;
	bcf	(63/8),(63)&7
	line	53
	
l2803:	
;alici.c: 53: DelayMs(19);
	movlw	(013h)
	fcall	_DelayMs
	line	54
;alici.c: 54: DelayMs( 2 );
	movlw	(02h)
	fcall	_DelayMs
	line	48
	
l2805:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(kodu_coz@a),f
	skipnc
	incf	(kodu_coz@a+1),f
	movlw	high(01h)
	addwf	(kodu_coz@a+1),f
	
l2807:	
	movf	(kodu_coz@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2825
	movlw	low(03h)
	subwf	(kodu_coz@a),w
u2825:

	skipc
	goto	u2821
	goto	u2820
u2821:
	goto	l687
u2820:
	goto	l2809
	
l688:	
	goto	l2809
	line	58
	
l686:	
	line	59
	
l2809:	
;alici.c: 55: }
;alici.c: 58: }
;alici.c: 59: if(sonuc=='7'){ RC0 = 0; RC2 = 0; RC1 = 1; RC3 = 1; };
	movlw	037h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2831
	goto	u2830
u2831:
	goto	l2813
u2830:
	
l2811:	
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	bsf	(57/8),(57)&7
	bsf	(59/8),(59)&7
	goto	l2813
	
l692:	
	line	61
	
l2813:	
;alici.c: 61: if(sonuc=='b'){ RB1 = 0; RC0 = 0; RC2 = 0; }
	movlw	062h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2841
	goto	u2840
u2841:
	goto	l2817
u2840:
	
l2815:	
	bcf	(49/8),(49)&7
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	goto	l2817
	
l693:	
	line	62
	
l2817:	
;alici.c: 62: if(sonuc =='d' || sonuc == 'e' ){
	movlw	064h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipnz
	goto	u2851
	goto	u2850
u2851:
	goto	l2821
u2850:
	
l2819:	
	movlw	065h
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l2837
u2860:
	goto	l2821
	
l696:	
	line	63
	
l2821:	
;alici.c: 63: for(int b=0;b<4;b++)
	clrf	(kodu_coz@b_1169)
	clrf	(kodu_coz@b_1169+1)
	
l2823:	
	movf	(kodu_coz@b_1169+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2875
	movlw	low(04h)
	subwf	(kodu_coz@b_1169),w
u2875:

	skipc
	goto	u2871
	goto	u2870
u2871:
	goto	l697
u2870:
	goto	l2837
	
l2825:	
	goto	l2837
	line	64
	
l697:	
	line	65
;alici.c: 64: {
;alici.c: 65: RC7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	66
	
l2827:	
;alici.c: 66: { unsigned char _dcnt; _dcnt = (1998)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(09Bh)
	movwf	(??_kodu_coz+0)+0
	movf	(??_kodu_coz+0)+0,w
	movwf	(kodu_coz@_dcnt_1170)
	goto	l2829
	
l700:	
	goto	l2829
	
l699:	
	
l2829:	
	movlw	low(01h)
	subwf	(kodu_coz@_dcnt_1170),f
	btfss	status,2
	goto	u2881
	goto	u2880
u2881:
	goto	l2829
u2880:
	
l701:	
	line	67
;alici.c: 67: RC7 = 0;
	bcf	(63/8),(63)&7
	line	68
	
l2831:	
;alici.c: 68: DelayMs(19);
	movlw	(013h)
	fcall	_DelayMs
	line	69
;alici.c: 69: DelayMs( 1 ); }
	movlw	(01h)
	fcall	_DelayMs
	line	63
	
l2833:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(kodu_coz@b_1169),f
	skipnc
	incf	(kodu_coz@b_1169+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b_1169+1),f
	
l2835:	
	movf	(kodu_coz@b_1169+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2895
	movlw	low(04h)
	subwf	(kodu_coz@b_1169),w
u2895:

	skipc
	goto	u2891
	goto	u2890
u2891:
	goto	l697
u2890:
	goto	l2837
	
l698:	
	goto	l2837
	line	71
	
l694:	
	line	74
	
l2837:	
;alici.c: 71: }
;alici.c: 74: if(sonuc == 'e' ){
	movlw	065h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l2855
u2900:
	line	75
	
l2839:	
;alici.c: 75: for(int b=0;b<4;b++)
	clrf	(kodu_coz@b_1171)
	clrf	(kodu_coz@b_1171+1)
	
l2841:	
	movf	(kodu_coz@b_1171+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2915
	movlw	low(04h)
	subwf	(kodu_coz@b_1171),w
u2915:

	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l703
u2910:
	goto	l2855
	
l2843:	
	goto	l2855
	line	76
	
l703:	
	line	77
;alici.c: 76: {
;alici.c: 77: RC7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	78
	
l2845:	
;alici.c: 78: { unsigned char _dcnt; _dcnt = (1998)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(09Bh)
	movwf	(??_kodu_coz+0)+0
	movf	(??_kodu_coz+0)+0,w
	movwf	(kodu_coz@_dcnt_1172)
	goto	l2847
	
l706:	
	goto	l2847
	
l705:	
	
l2847:	
	movlw	low(01h)
	subwf	(kodu_coz@_dcnt_1172),f
	btfss	status,2
	goto	u2921
	goto	u2920
u2921:
	goto	l2847
u2920:
	
l707:	
	line	79
;alici.c: 79: RC7 = 0;
	bcf	(63/8),(63)&7
	line	80
	
l2849:	
;alici.c: 80: DelayMs(19);
	movlw	(013h)
	fcall	_DelayMs
	line	81
;alici.c: 81: DelayMs( 1 ); }
	movlw	(01h)
	fcall	_DelayMs
	line	75
	
l2851:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(kodu_coz@b_1171),f
	skipnc
	incf	(kodu_coz@b_1171+1),f
	movlw	high(01h)
	addwf	(kodu_coz@b_1171+1),f
	
l2853:	
	movf	(kodu_coz@b_1171+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2935
	movlw	low(04h)
	subwf	(kodu_coz@b_1171),w
u2935:

	skipc
	goto	u2931
	goto	u2930
u2931:
	goto	l703
u2930:
	goto	l2855
	
l704:	
	goto	l2855
	line	83
	
l702:	
	line	86
	
l2855:	
;alici.c: 83: }
;alici.c: 86: if(sonuc=='g') {RC0 = 0; RC2 = 0; RC1 = 0; RC3 = 0; }
	movlw	067h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_sonuc),w
	iorwf	(_sonuc+1),w
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l709
u2940:
	
l2857:	
	bcf	(56/8),(56)&7
	bcf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(59/8),(59)&7
	goto	l709
	
l708:	
	line	87
	
l709:	
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
	
l667:	
	line	15
	
l2751:	
;delay.c: 15: i = 4;
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@i)
	line	16
;delay.c: 16: do {
	
l668:	
	line	17
;delay.c: 17: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@_dcnt)
	goto	l2753
	
l670:	
	goto	l2753
	
l669:	
	
l2753:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u2631
	goto	u2630
u2631:
	goto	l2753
u2630:
	goto	l2755
	
l671:	
	line	18
	
l2755:	
;delay.c: 18: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u2641
	goto	u2640
u2641:
	goto	l668
u2640:
	goto	l2757
	
l672:	
	line	19
	
l2757:	
;delay.c: 19: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u2651
	goto	u2650
u2651:
	goto	l667
u2650:
	goto	l674
	
l673:	
	line	21
	
l674:	
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
