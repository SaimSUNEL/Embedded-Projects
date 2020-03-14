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
	FNCALL	_main,_uyandir
	FNCALL	_main,_senkron
	FNCALL	_main,_kodla_gonder
	FNCALL	_main,_DelayMs
	FNCALL	_kodla_gonder,___awdiv
	FNROOT	_main
	global	_senk
	global	_senk1
	global	_uyan
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	59

;initializer for _senk
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	0
	line	60

;initializer for _senk1
	retlw	031h
	retlw	031h
	retlw	031h
	retlw	031h
	retlw	031h
	retlw	031h
	retlw	031h
	retlw	031h
	retlw	0
	line	43

;initializer for _uyan
	retlw	030h
	retlw	031h
	retlw	030h
	retlw	031h
	retlw	030h
	retlw	031h
	retlw	030h
	retlw	031h
	retlw	0
	global	_gelen_veri
	global	_bolum
	global	_index
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
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
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
	file	"RemoteCarverici.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_gelen_veri:
       ds      8

_bolum:
       ds      2

_index:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	59
_senk:
       ds      9

psect	dataBANK0
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	60
_senk1:
       ds      9

psect	dataBANK0
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	43
_uyan:
       ds      9

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
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
	clrf	((__pbssBANK0)+11)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+27)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
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
	global	?_seri_portu_ayarla
?_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	??_seri_portu_ayarla
??_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	?_uyandir
?_uyandir:	; 0 bytes @ 0x0
	global	??_uyandir
??_uyandir:	; 0 bytes @ 0x0
	global	?_senkron
?_senkron:	; 0 bytes @ 0x0
	global	??_senkron
??_senkron:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	ds	1
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x1
	global	uyandir@_dcnt
uyandir@_dcnt:	; 1 bytes @ 0x1
	global	senkron@_dcnt
senkron@_dcnt:	; 1 bytes @ 0x1
	ds	1
	global	DelayMs@i
DelayMs@i:	; 1 bytes @ 0x2
	global	uyandir@_dcnt_1243
uyandir@_dcnt_1243:	; 1 bytes @ 0x2
	global	senkron@_dcnt_1248
senkron@_dcnt_1248:	; 1 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	DelayMs@_dcnt
DelayMs@_dcnt:	; 1 bytes @ 0x3
	global	senkron@_dcnt_1249
senkron@_dcnt_1249:	; 1 bytes @ 0x3
	global	uyandir@a
uyandir@a:	; 2 bytes @ 0x3
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	senkron@a
senkron@a:	; 2 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	senkron@a_1247
senkron@a_1247:	; 2 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	?_kodla_gonder
?_kodla_gonder:	; 2 bytes @ 0x9
	global	kodla_gonder@sayi
kodla_gonder@sayi:	; 2 bytes @ 0x9
	ds	2
	global	??_kodla_gonder
??_kodla_gonder:	; 0 bytes @ 0xB
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xC
	ds	1
	global	main@gelen
main@gelen:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	kodla_gonder@_dcnt
kodla_gonder@_dcnt:	; 1 bytes @ 0x0
	ds	1
	global	kodla_gonder@_dcnt_1253
kodla_gonder@_dcnt_1253:	; 1 bytes @ 0x1
	ds	1
	global	kodla_gonder@_dcnt_1255
kodla_gonder@_dcnt_1255:	; 1 bytes @ 0x2
	ds	1
	global	kodla_gonder@_dcnt_1256
kodla_gonder@_dcnt_1256:	; 1 bytes @ 0x3
	ds	1
	global	kodla_gonder@a
kodla_gonder@a:	; 2 bytes @ 0x4
	ds	2
;;Data sizes: Strings 0, constant 0, data 27, bss 12, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      6      45
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_kodla_gonder
;;   _kodla_gonder->___awdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_kodla_gonder
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
;; (0) _main                                                 2     2      0    1046
;;                                             12 COMMON     2     2      0
;;                  _seri_portu_ayarla
;;                            _uyandir
;;                            _senkron
;;                       _kodla_gonder
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (1) _kodla_gonder                                         9     7      2     505
;;                                              9 COMMON     3     1      2
;;                                              0 BANK0      6     6      0
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) _senkron                                              8     8      0     205
;;                                              0 COMMON     8     8      0
;; ---------------------------------------------------------------------------------
;; (1) _uyandir                                              5     5      0     114
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; (1) _seri_portu_ayarla                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              4     4      0      45
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _seri_portu_ayarla
;;   _uyandir
;;   _senkron
;;   _kodla_gonder
;;     ___awdiv
;;   _DelayMs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      3D      12        0.0%
;;ABS                  0      0      3B       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      6      2D       5       56.3%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 116 in file "C:\Users\Saim\Desktop\RemoteCar\verici.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  gelen           1   13[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_seri_portu_ayarla
;;		_uyandir
;;		_senkron
;;		_kodla_gonder
;;		_DelayMs
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	116
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	118
	
l3030:	
;verici.c: 118: TRISB=0b11100000;
	movlw	(0E0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	119
	
l3032:	
;verici.c: 119: PORTB=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	120
	
l3034:	
;verici.c: 120: TRISC=0b10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	121
;verici.c: 121: PORTC=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	122
	
l3036:	
;verici.c: 122: seri_portu_ayarla();
	fcall	_seri_portu_ayarla
	goto	l3038
	line	125
;verici.c: 123: unsigned char gelen;
;verici.c: 125: while (1)
	
l769:	
	line	128
	
l3038:	
;verici.c: 127: {
;verici.c: 128: if(RCIF==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u3001
	goto	u3000
u3001:
	goto	l770
u3000:
	line	129
	
l3040:	
;verici.c: 129: gelen=RCREG;
	movf	(26),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@gelen)
	
l770:	
	line	130
;verici.c: 130: if(gelen=='2')
	movf	(main@gelen),w
	xorlw	032h
	skipz
	goto	u3011
	goto	u3010
u3011:
	goto	l3044
u3010:
	line	132
	
l3042:	
;verici.c: 131: {
;verici.c: 132: uyandir();
	fcall	_uyandir
	line	133
;verici.c: 133: uyandir();
	fcall	_uyandir
	line	134
;verici.c: 134: uyandir();
	fcall	_uyandir
	line	135
;verici.c: 135: senkron();
	fcall	_senkron
	line	137
;verici.c: 137: kodla_gonder('2');
	movlw	low(032h)
	movwf	(?_kodla_gonder)
	movlw	high(032h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	goto	l3044
	line	141
	
l771:	
	line	143
	
l3044:	
;verici.c: 141: }
;verici.c: 143: if(gelen=='4')
	movf	(main@gelen),w
	xorlw	034h
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l3048
u3020:
	line	145
	
l3046:	
;verici.c: 144: {
;verici.c: 145: uyandir();
	fcall	_uyandir
	line	146
;verici.c: 146: uyandir();
	fcall	_uyandir
	line	147
;verici.c: 147: uyandir();
	fcall	_uyandir
	line	148
;verici.c: 148: senkron();
	fcall	_senkron
	line	150
;verici.c: 150: kodla_gonder('4');
	movlw	low(034h)
	movwf	(?_kodla_gonder)
	movlw	high(034h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	goto	l3048
	line	154
	
l772:	
	line	155
	
l3048:	
;verici.c: 154: }
;verici.c: 155: if(gelen=='5')
	movf	(main@gelen),w
	xorlw	035h
	skipz
	goto	u3031
	goto	u3030
u3031:
	goto	l3052
u3030:
	line	157
	
l3050:	
;verici.c: 156: {
;verici.c: 157: uyandir();
	fcall	_uyandir
	line	158
;verici.c: 158: uyandir();
	fcall	_uyandir
	line	159
;verici.c: 159: uyandir();
	fcall	_uyandir
	line	160
;verici.c: 160: senkron();
	fcall	_senkron
	line	162
;verici.c: 162: kodla_gonder('5');
	movlw	low(035h)
	movwf	(?_kodla_gonder)
	movlw	high(035h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	goto	l3052
	line	166
	
l773:	
	line	168
	
l3052:	
;verici.c: 166: }
;verici.c: 168: if(gelen=='7')
	movf	(main@gelen),w
	xorlw	037h
	skipz
	goto	u3041
	goto	u3040
u3041:
	goto	l3056
u3040:
	line	170
	
l3054:	
;verici.c: 169: {
;verici.c: 170: uyandir();
	fcall	_uyandir
	line	171
;verici.c: 171: uyandir();
	fcall	_uyandir
	line	172
;verici.c: 172: uyandir();
	fcall	_uyandir
	line	173
;verici.c: 173: senkron();
	fcall	_senkron
	line	175
;verici.c: 175: kodla_gonder('7');
	movlw	low(037h)
	movwf	(?_kodla_gonder)
	movlw	high(037h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	goto	l3056
	line	179
	
l774:	
	line	180
	
l3056:	
;verici.c: 179: }
;verici.c: 180: if(gelen=='b')
	movf	(main@gelen),w
	xorlw	062h
	skipz
	goto	u3051
	goto	u3050
u3051:
	goto	l3060
u3050:
	line	182
	
l3058:	
;verici.c: 181: {
;verici.c: 182: uyandir();
	fcall	_uyandir
	line	183
;verici.c: 183: uyandir();
	fcall	_uyandir
	line	184
;verici.c: 184: uyandir();
	fcall	_uyandir
	line	185
;verici.c: 185: senkron();
	fcall	_senkron
	line	187
;verici.c: 187: kodla_gonder('b');
	movlw	low(062h)
	movwf	(?_kodla_gonder)
	movlw	high(062h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	goto	l3060
	line	191
	
l775:	
	line	193
	
l3060:	
;verici.c: 191: }
;verici.c: 193: if(gelen=='d')
	movf	(main@gelen),w
	xorlw	064h
	skipz
	goto	u3061
	goto	u3060
u3061:
	goto	l3064
u3060:
	line	195
	
l3062:	
;verici.c: 194: {
;verici.c: 195: uyandir();
	fcall	_uyandir
	line	196
;verici.c: 196: uyandir();
	fcall	_uyandir
	line	197
;verici.c: 197: uyandir();
	fcall	_uyandir
	line	198
;verici.c: 198: senkron();
	fcall	_senkron
	line	200
;verici.c: 200: kodla_gonder('d');
	movlw	low(064h)
	movwf	(?_kodla_gonder)
	movlw	high(064h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	goto	l3064
	line	204
	
l776:	
	line	206
	
l3064:	
;verici.c: 204: }
;verici.c: 206: if(gelen=='e')
	movf	(main@gelen),w
	xorlw	065h
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l3068
u3070:
	line	208
	
l3066:	
;verici.c: 207: {
;verici.c: 208: uyandir();
	fcall	_uyandir
	line	209
;verici.c: 209: uyandir();
	fcall	_uyandir
	line	210
;verici.c: 210: uyandir();
	fcall	_uyandir
	line	211
;verici.c: 211: senkron();
	fcall	_senkron
	line	213
;verici.c: 213: kodla_gonder('e');
	movlw	low(065h)
	movwf	(?_kodla_gonder)
	movlw	high(065h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	goto	l3068
	line	217
	
l777:	
	line	219
	
l3068:	
;verici.c: 217: }
;verici.c: 219: if(gelen=='g')
	movf	(main@gelen),w
	xorlw	067h
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l3072
u3080:
	line	221
	
l3070:	
;verici.c: 220: {
;verici.c: 221: uyandir();
	fcall	_uyandir
	line	222
;verici.c: 222: uyandir();
	fcall	_uyandir
	line	223
;verici.c: 223: uyandir();
	fcall	_uyandir
	line	224
;verici.c: 224: senkron();
	fcall	_senkron
	line	226
;verici.c: 226: kodla_gonder('g');
	movlw	low(067h)
	movwf	(?_kodla_gonder)
	movlw	high(067h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	goto	l3072
	line	230
	
l778:	
	line	233
	
l3072:	
;verici.c: 230: }
;verici.c: 233: if(RB7==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(55/8),(55)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l3078
u3090:
	line	236
	
l3074:	
;verici.c: 234: {
;verici.c: 236: uyandir();
	fcall	_uyandir
	line	237
;verici.c: 237: uyandir();
	fcall	_uyandir
	line	238
;verici.c: 238: uyandir();
	fcall	_uyandir
	line	239
;verici.c: 239: senkron();
	fcall	_senkron
	line	241
;verici.c: 241: kodla_gonder('2');
	movlw	low(032h)
	movwf	(?_kodla_gonder)
	movlw	high(032h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	line	242
	
l3076:	
;verici.c: 242: DelayMs(650);
	movlw	(08Ah)
	fcall	_DelayMs
	goto	l3078
	line	243
	
l779:	
	line	244
	
l3078:	
;verici.c: 243: }
;verici.c: 244: if(RB6==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l3038
u3100:
	line	246
	
l3080:	
;verici.c: 245: {
;verici.c: 246: uyandir();
	fcall	_uyandir
	line	248
;verici.c: 248: uyandir();
	fcall	_uyandir
	line	249
;verici.c: 249: uyandir();
	fcall	_uyandir
	line	250
;verici.c: 250: senkron();
	fcall	_senkron
	line	251
;verici.c: 251: kodla_gonder('b');
	movlw	low(062h)
	movwf	(?_kodla_gonder)
	movlw	high(062h)
	movwf	((?_kodla_gonder))+1
	fcall	_kodla_gonder
	line	252
	
l3082:	
;verici.c: 252: DelayMs(650);
	movlw	(08Ah)
	fcall	_DelayMs
	goto	l3038
	line	253
	
l780:	
	goto	l3038
	line	267
	
l781:	
	line	125
	goto	l3038
	
l782:	
	line	271
	
l783:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_kodla_gonder
psect	text197,local,class=CODE,delta=2
global __ptext197
__ptext197:

;; *************** function _kodla_gonder *****************
;; Defined at:
;;		line 85 in file "C:\Users\Saim\Desktop\RemoteCar\verici.c"
;; Parameters:    Size  Location     Type
;;  sayi            2    9[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  _dcnt           1    2[BANK0 ] unsigned char 
;;  _dcnt           1    3[BANK0 ] unsigned char 
;;  a               2    4[BANK0 ] int 
;;  _dcnt           1    1[BANK0 ] unsigned char 
;;  _dcnt           1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    9[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       6       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text197
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	85
	global	__size_of_kodla_gonder
	__size_of_kodla_gonder	equ	__end_of_kodla_gonder-_kodla_gonder
	
_kodla_gonder:	
	opt	stack 6
; Regs used in _kodla_gonder: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	
l2990:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_index)
	clrf	(_index+1)
	line	86
;verici.c: 86: while(index!=8)
	goto	l3000
	
l750:	
	line	88
	
l2992:	
;verici.c: 87: {
;verici.c: 88: gelen_veri[7-index]=sayi%2;
	movf	(kodla_gonder@sayi),w
	andlw	01h
	movwf	(??_kodla_gonder+0)+0
	decf	(_index),w
	xorlw	0ffh
	addlw	07h
	addlw	_gelen_veri&0ffh
	movwf	fsr0
	movf	(??_kodla_gonder+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	89
	
l2994:	
;verici.c: 89: bolum=sayi/2;
	movlw	low(02h)
	movwf	(?___awdiv)
	movlw	high(02h)
	movwf	((?___awdiv))+1
	movf	(kodla_gonder@sayi+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(kodla_gonder@sayi),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_bolum+1)
	addwf	(_bolum+1)
	movf	(0+(?___awdiv)),w
	clrf	(_bolum)
	addwf	(_bolum)

	line	90
	
l2996:	
;verici.c: 90: sayi=bolum;
	movf	(_bolum+1),w
	clrf	(kodla_gonder@sayi+1)
	addwf	(kodla_gonder@sayi+1)
	movf	(_bolum),w
	clrf	(kodla_gonder@sayi)
	addwf	(kodla_gonder@sayi)

	line	91
	
l2998:	
;verici.c: 91: index++;
	movlw	low(01h)
	addwf	(_index),f
	skipnc
	incf	(_index+1),f
	movlw	high(01h)
	addwf	(_index+1),f
	goto	l3000
	line	92
	
l749:	
	line	86
	
l3000:	
	movlw	08h
	xorwf	(_index),w
	iorwf	(_index+1),w
	skipz
	goto	u2911
	goto	u2910
u2911:
	goto	l2992
u2910:
	
l751:	
	line	93
;verici.c: 92: }
;verici.c: 93: RB0=1;
	bsf	(48/8),(48)&7
	line	94
	
l3002:	
;verici.c: 94: { unsigned char _dcnt; _dcnt = (2000-1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(09Bh)
	movwf	(??_kodla_gonder+0)+0
	movf	(??_kodla_gonder+0)+0,w
	movwf	(kodla_gonder@_dcnt)
	goto	l3004
	
l753:	
	goto	l3004
	
l752:	
	
l3004:	
	movlw	low(01h)
	subwf	(kodla_gonder@_dcnt),f
	btfss	status,2
	goto	u2921
	goto	u2920
u2921:
	goto	l3004
u2920:
	
l754:	
	line	95
;verici.c: 95: RB0=0;
	bcf	(48/8),(48)&7
	line	96
	
l3006:	
;verici.c: 96: { unsigned char _dcnt; _dcnt = (1200-1)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(08Fh)
	movwf	(??_kodla_gonder+0)+0
	movf	(??_kodla_gonder+0)+0,w
	movwf	(kodla_gonder@_dcnt_1253)
	goto	l3008
	
l756:	
	goto	l3008
	
l755:	
	
l3008:	
	movlw	low(01h)
	subwf	(kodla_gonder@_dcnt_1253),f
	btfss	status,2
	goto	u2931
	goto	u2930
u2931:
	goto	l3008
u2930:
	goto	l3010
	
l757:	
	line	98
	
l3010:	
;verici.c: 98: for(int a=0;a<8;a++)
	clrf	(kodla_gonder@a)
	clrf	(kodla_gonder@a+1)
	
l3012:	
	movf	(kodla_gonder@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2945
	movlw	low(08h)
	subwf	(kodla_gonder@a),w
u2945:

	skipc
	goto	u2941
	goto	u2940
u2941:
	goto	l3016
u2940:
	goto	l3026
	
l3014:	
	goto	l3026
	line	99
	
l758:	
	line	100
	
l3016:	
;verici.c: 99: {
;verici.c: 100: RB0=gelen_veri[a];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(kodla_gonder@a),w
	addlw	_gelen_veri&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfsc	indf,0
	goto	u2951
	goto	u2950
	
u2951:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	goto	u2964
u2950:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
u2964:
	line	101
	
l3018:	
;verici.c: 101: { unsigned char _dcnt; _dcnt = (1500)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F5h)
	movwf	(??_kodla_gonder+0)+0
	movf	(??_kodla_gonder+0)+0,w
	movwf	(kodla_gonder@_dcnt_1255)
	goto	l3020
	
l761:	
	goto	l3020
	
l760:	
	
l3020:	
	movlw	low(01h)
	subwf	(kodla_gonder@_dcnt_1255),f
	btfss	status,2
	goto	u2971
	goto	u2970
u2971:
	goto	l3020
u2970:
	goto	l3022
	
l762:	
	line	98
	
l3022:	
	movlw	low(01h)
	addwf	(kodla_gonder@a),f
	skipnc
	incf	(kodla_gonder@a+1),f
	movlw	high(01h)
	addwf	(kodla_gonder@a+1),f
	
l3024:	
	movf	(kodla_gonder@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2985
	movlw	low(08h)
	subwf	(kodla_gonder@a),w
u2985:

	skipc
	goto	u2981
	goto	u2980
u2981:
	goto	l3016
u2980:
	goto	l3026
	
l759:	
	line	104
	
l3026:	
;verici.c: 103: }
;verici.c: 104: { unsigned char _dcnt; _dcnt = (1000)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(04Dh)
	movwf	(??_kodla_gonder+0)+0
	movf	(??_kodla_gonder+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(kodla_gonder@_dcnt_1256)
	goto	l3028
	
l764:	
	goto	l3028
	
l763:	
	
l3028:	
	movlw	low(01h)
	subwf	(kodla_gonder@_dcnt_1256),f
	btfss	status,2
	goto	u2991
	goto	u2990
u2991:
	goto	l3028
u2990:
	
l765:	
	line	105
;verici.c: 105: RB0=0;
	bcf	(48/8),(48)&7
	line	109
	
l766:	
	return
	opt stack 0
GLOBAL	__end_of_kodla_gonder
	__end_of_kodla_gonder:
;; =============== function _kodla_gonder ends ============

	signat	_kodla_gonder,4218
	global	___awdiv
psect	text198,local,class=CODE,delta=2
global __ptext198
__ptext198:

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
;;		_kodla_gonder
;; This function uses a non-reentrant model
;;
psect	text198
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2950:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2811
	goto	u2810
u2811:
	goto	l2954
u2810:
	line	11
	
l2952:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2954
	line	13
	
l1606:	
	line	14
	
l2954:	
	btfss	(___awdiv@dividend+1),7
	goto	u2821
	goto	u2820
u2821:
	goto	l2960
u2820:
	line	15
	
l2956:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2958:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l2960
	line	17
	
l1607:	
	line	18
	
l2960:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2962:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2831
	goto	u2830
u2831:
	goto	l2982
u2830:
	line	20
	
l2964:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2970
	
l1610:	
	line	22
	
l2966:	
	movlw	01h
	
u2845:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2845
	line	23
	
l2968:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2970
	line	24
	
l1609:	
	line	21
	
l2970:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l2966
u2850:
	goto	l2972
	
l1611:	
	goto	l2972
	line	25
	
l1612:	
	line	26
	
l2972:	
	movlw	01h
	
u2865:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2865
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2875
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2875:
	skipc
	goto	u2871
	goto	u2870
u2871:
	goto	l2978
u2870:
	line	28
	
l2974:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2976:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2978
	line	30
	
l1613:	
	line	31
	
l2978:	
	movlw	01h
	
u2885:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2885
	line	32
	
l2980:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2891
	goto	u2890
u2891:
	goto	l2972
u2890:
	goto	l2982
	
l1614:	
	goto	l2982
	line	33
	
l1608:	
	line	34
	
l2982:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2900
	goto	l2986
u2900:
	line	35
	
l2984:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2986
	
l1615:	
	line	36
	
l2986:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1616
	
l2988:	
	line	37
	
l1616:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_senkron
psect	text199,local,class=CODE,delta=2
global __ptext199
__ptext199:

;; *************** function _senkron *****************
;; Defined at:
;;		line 62 in file "C:\Users\Saim\Desktop\RemoteCar\verici.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1    2[COMMON] unsigned char 
;;  _dcnt           1    1[COMMON] unsigned char 
;;  _dcnt           1    3[COMMON] unsigned char 
;;  a               2    6[COMMON] int 
;;  a               2    4[COMMON] int 
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
;;      Locals:         7       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text199
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	62
	global	__size_of_senkron
	__size_of_senkron	equ	__end_of_senkron-_senkron
	
_senkron:	
	opt	stack 7
; Regs used in _senkron: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	63
	
l2914:	
;verici.c: 63: for(int a=0;a<8;a++)
	clrf	(senkron@a)
	clrf	(senkron@a+1)
	
l2916:	
	movf	(senkron@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2705
	movlw	low(08h)
	subwf	(senkron@a),w
u2705:

	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l2920
u2700:
	goto	l2930
	
l2918:	
	goto	l2930
	line	64
	
l733:	
	
l2920:	
;verici.c: 64: {RB0=senk[a]-48;
	movf	(senkron@a),w
	addlw	_senk&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfsc	indf,0
	goto	u2711
	goto	u2710
	
u2711:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	goto	u2724
u2710:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
u2724:
	line	65
	
l2922:	
;verici.c: 65: { unsigned char _dcnt; _dcnt = (1500)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F5h)
	movwf	(??_senkron+0)+0
	movf	(??_senkron+0)+0,w
	movwf	(senkron@_dcnt)
	goto	l2924
	
l736:	
	goto	l2924
	
l735:	
	
l2924:	
	movlw	low(01h)
	subwf	(senkron@_dcnt),f
	btfss	status,2
	goto	u2731
	goto	u2730
u2731:
	goto	l2924
u2730:
	goto	l2926
	
l737:	
	line	63
	
l2926:	
	movlw	low(01h)
	addwf	(senkron@a),f
	skipnc
	incf	(senkron@a+1),f
	movlw	high(01h)
	addwf	(senkron@a+1),f
	
l2928:	
	movf	(senkron@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2745
	movlw	low(08h)
	subwf	(senkron@a),w
u2745:

	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l2920
u2740:
	goto	l2930
	
l734:	
	line	68
	
l2930:	
;verici.c: 67: }
;verici.c: 68: for(int a=0;a<8;a++)
	clrf	(senkron@a_1247)
	clrf	(senkron@a_1247+1)
	
l2932:	
	movf	(senkron@a_1247+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2755
	movlw	low(08h)
	subwf	(senkron@a_1247),w
u2755:

	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l2936
u2750:
	goto	l739
	
l2934:	
	goto	l739
	line	69
	
l738:	
	
l2936:	
;verici.c: 69: {RB0=senk1[a]-48;
	movf	(senkron@a_1247),w
	addlw	_senk1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfsc	indf,0
	goto	u2761
	goto	u2760
	
u2761:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	goto	u2774
u2760:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
u2774:
	line	70
	
l2938:	
;verici.c: 70: { unsigned char _dcnt; _dcnt = (1500)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F5h)
	movwf	(??_senkron+0)+0
	movf	(??_senkron+0)+0,w
	movwf	(senkron@_dcnt_1248)
	goto	l2940
	
l741:	
	goto	l2940
	
l740:	
	
l2940:	
	movlw	low(01h)
	subwf	(senkron@_dcnt_1248),f
	btfss	status,2
	goto	u2781
	goto	u2780
u2781:
	goto	l2940
u2780:
	goto	l2942
	
l742:	
	line	68
	
l2942:	
	movlw	low(01h)
	addwf	(senkron@a_1247),f
	skipnc
	incf	(senkron@a_1247+1),f
	movlw	high(01h)
	addwf	(senkron@a_1247+1),f
	
l2944:	
	movf	(senkron@a_1247+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2795
	movlw	low(08h)
	subwf	(senkron@a_1247),w
u2795:

	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l2936
u2790:
	
l739:	
	line	73
;verici.c: 72: }
;verici.c: 73: RB0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	74
	
l2946:	
;verici.c: 74: { unsigned char _dcnt; _dcnt = (1500)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F5h)
	movwf	(??_senkron+0)+0
	movf	(??_senkron+0)+0,w
	movwf	(senkron@_dcnt_1249)
	goto	l2948
	
l744:	
	goto	l2948
	
l743:	
	
l2948:	
	movlw	low(01h)
	subwf	(senkron@_dcnt_1249),f
	btfss	status,2
	goto	u2801
	goto	u2800
u2801:
	goto	l2948
u2800:
	goto	l746
	
l745:	
	line	78
	
l746:	
	return
	opt stack 0
GLOBAL	__end_of_senkron
	__end_of_senkron:
;; =============== function _senkron ends ============

	signat	_senkron,88
	global	_uyandir
psect	text200,local,class=CODE,delta=2
global __ptext200
__ptext200:

;; *************** function _uyandir *****************
;; Defined at:
;;		line 46 in file "C:\Users\Saim\Desktop\RemoteCar\verici.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1    1[COMMON] unsigned char 
;;  _dcnt           1    2[COMMON] unsigned char 
;;  a               2    3[COMMON] int 
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
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text200
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	46
	global	__size_of_uyandir
	__size_of_uyandir	equ	__end_of_uyandir-_uyandir
	
_uyandir:	
	opt	stack 7
; Regs used in _uyandir: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	47
	
l2894:	
;verici.c: 47: for(int a=0;a<8;a++)
	clrf	(uyandir@a)
	clrf	(uyandir@a+1)
	
l2896:	
	movf	(uyandir@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2645
	movlw	low(08h)
	subwf	(uyandir@a),w
u2645:

	skipc
	goto	u2641
	goto	u2640
u2641:
	goto	l2900
u2640:
	goto	l723
	
l2898:	
	goto	l723
	line	48
	
l722:	
	
l2900:	
;verici.c: 48: {RB0=uyan[a]-48;
	movf	(uyandir@a),w
	addlw	_uyan&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfsc	indf,0
	goto	u2651
	goto	u2650
	
u2651:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	goto	u2664
u2650:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
u2664:
	line	49
	
l2902:	
;verici.c: 49: { unsigned char _dcnt; _dcnt = (1500)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F5h)
	movwf	(??_uyandir+0)+0
	movf	(??_uyandir+0)+0,w
	movwf	(uyandir@_dcnt)
	goto	l2904
	
l725:	
	goto	l2904
	
l724:	
	
l2904:	
	movlw	low(01h)
	subwf	(uyandir@_dcnt),f
	btfss	status,2
	goto	u2671
	goto	u2670
u2671:
	goto	l2904
u2670:
	goto	l2906
	
l726:	
	line	47
	
l2906:	
	movlw	low(01h)
	addwf	(uyandir@a),f
	skipnc
	incf	(uyandir@a+1),f
	movlw	high(01h)
	addwf	(uyandir@a+1),f
	
l2908:	
	movf	(uyandir@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2685
	movlw	low(08h)
	subwf	(uyandir@a),w
u2685:

	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l2900
u2680:
	
l723:	
	line	53
;verici.c: 51: }
;verici.c: 53: RB0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	54
	
l2910:	
;verici.c: 54: { unsigned char _dcnt; _dcnt = (1500)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0F5h)
	movwf	(??_uyandir+0)+0
	movf	(??_uyandir+0)+0,w
	movwf	(uyandir@_dcnt_1243)
	goto	l2912
	
l728:	
	goto	l2912
	
l727:	
	
l2912:	
	movlw	low(01h)
	subwf	(uyandir@_dcnt_1243),f
	btfss	status,2
	goto	u2691
	goto	u2690
u2691:
	goto	l2912
u2690:
	goto	l730
	
l729:	
	line	58
	
l730:	
	return
	opt stack 0
GLOBAL	__end_of_uyandir
	__end_of_uyandir:
;; =============== function _uyandir ends ============

	signat	_uyandir,88
	global	_seri_portu_ayarla
psect	text201,local,class=CODE,delta=2
global __ptext201
__ptext201:

;; *************** function _seri_portu_ayarla *****************
;; Defined at:
;;		line 27 in file "C:\Users\Saim\Desktop\RemoteCar\verici.c"
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
psect	text201
	file	"C:\Users\Saim\Desktop\RemoteCar\verici.c"
	line	27
	global	__size_of_seri_portu_ayarla
	__size_of_seri_portu_ayarla	equ	__end_of_seri_portu_ayarla-_seri_portu_ayarla
	
_seri_portu_ayarla:	
	opt	stack 7
; Regs used in _seri_portu_ayarla: [wreg]
	
l1862:	
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	28
	
l1864:	
;verici.c: 28: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	29
	
l1866:	
;verici.c: 29: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	30
	
l1868:	
;verici.c: 30: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	31
	
l1870:	
;verici.c: 31: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	32
	
l1872:	
;verici.c: 32: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	33
	
l1874:	
;verici.c: 33: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	34
	
l1876:	
;verici.c: 34: CREN=1;
	bsf	(196/8),(196)&7
	line	35
	
l1878:	
;verici.c: 35: RC6=1;
	bsf	(62/8),(62)&7
	line	36
	
l1880:	
;verici.c: 36: RC7=1;
	bsf	(63/8),(63)&7
	line	37
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_seri_portu_ayarla
	__end_of_seri_portu_ayarla:
;; =============== function _seri_portu_ayarla ends ============

	signat	_seri_portu_ayarla,88
	global	_DelayMs
psect	text202,local,class=CODE,delta=2
global __ptext202
__ptext202:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 11 in file "c:\\tc\\delay.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text202
	file	"c:\\tc\\delay.c"
	line	11
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 7
; Regs used in _DelayMs: [wreg+status,2+status,0]
;DelayMs@cnt stored from wreg
	movwf	(DelayMs@cnt)
	line	20
;delay.c: 19: unsigned char i;
;delay.c: 20: do {
	
l697:	
	line	21
	
l1844:	
;delay.c: 21: i = 4;
	movlw	(04h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@i)
	line	22
;delay.c: 22: do {
	
l698:	
	line	23
;delay.c: 23: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(??_DelayMs+0)+0
	movf	(??_DelayMs+0)+0,w
	movwf	(DelayMs@_dcnt)
	goto	l1846
	
l700:	
	goto	l1846
	
l699:	
	
l1846:	
	movlw	low(01h)
	subwf	(DelayMs@_dcnt),f
	btfss	status,2
	goto	u11
	goto	u10
u11:
	goto	l1846
u10:
	goto	l1848
	
l701:	
	line	24
	
l1848:	
;delay.c: 24: } while(--i);
	movlw	low(01h)
	subwf	(DelayMs@i),f
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l698
u20:
	goto	l1850
	
l702:	
	line	25
	
l1850:	
;delay.c: 25: } while(--cnt);
	movlw	low(01h)
	subwf	(DelayMs@cnt),f
	btfss	status,2
	goto	u31
	goto	u30
u31:
	goto	l697
u30:
	goto	l704
	
l703:	
	line	27
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
psect	text203,local,class=CODE,delta=2
global __ptext203
__ptext203:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
