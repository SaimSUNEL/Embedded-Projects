opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	12F1840
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
indf1	equ	1
pc	equ	2
pcl	equ	2
status	equ	3
fsr0l	equ	4
fsr0h	equ	5
fsr1l	equ	6
fsr1h	equ	7
bsr	equ	8
wreg	equ	9
intcon	equ	11
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_Usart_ayarla
	FNCALL	_main,_get_DHT11_data
	FNCALL	_main,_byte_send
	FNROOT	_main
	global	_dht_data
	global	_hata_array
	global	_nem
	global	_sicaklik
	global	_lk
	global	_mm
	global	_hata
	global	_kk
	global	_saim
	global	_PORTA
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:
_PORTA	set	12
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA5
_RA5	set	101
	global	_RCIF
_RCIF	set	141
	global	_TXIF
_TXIF	set	140
	global	_TRISA
_TRISA	set	140
	global	_IRCF0
_IRCF0	set	1227
	global	_IRCF1
_IRCF1	set	1228
	global	_IRCF2
_IRCF2	set	1229
	global	_IRCF3
_IRCF3	set	1230
	global	_SCS0
_SCS0	set	1224
	global	_SCS1
_SCS1	set	1225
	global	_TRISA1
_TRISA1	set	1121
	global	_TRISA3
_TRISA3	set	1123
	global	_TRISA5
_TRISA5	set	1125
	global	_EEADR
_EEADR	set	401
	global	_ANSELA
_ANSELA	set	396
	global	_EECON1
_EECON1	set	405
	global	_EECON2
_EECON2	set	406
	global	_EEDATA
_EEDATA	set	403
	global	_RCREG
_RCREG	set	409
	global	_SPBRG
_SPBRG	set	411
	global	_TXREG
_TXREG	set	410
	global	_ANSA0
_ANSA0	set	3168
	global	_ANSA1
_ANSA1	set	3169
	global	_BRG16
_BRG16	set	3323
	global	_BRGH
_BRGH	set	3314
	global	_CREN
_CREN	set	3308
	global	_RD
_RD	set	3240
	global	_SPEN
_SPEN	set	3311
	global	_SYNC
_SYNC	set	3316
	global	_TXEN
_TXEN	set	3317
	global	_WR
_WR	set	3241
	global	_WREN
_WREN	set	3242
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_hata:
       ds      1

_kk:
       ds      1

_saim:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_dht_data:
       ds      5

_hata_array:
       ds      5

_nem:
       ds      2

_sicaklik:
       ds      2

_lk:
       ds      1

_mm:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR0 containing the base address, and
;	WREG with the size to clear
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf0		;clear RAM location pointed to by FSR
	addfsr	0,1
	decfsz wreg		;Have we reached the end of clearing yet?
	goto clrloop	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	global __pbssCOMMON
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	movlw	low(__pbssBANK0)
	movwf	fsr0l
	movlw	high(__pbssBANK0)
	movwf	fsr0h
	movlw	010h
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_byte_send
??_byte_send:	; 0 bytes @ 0x0
	global	?_Usart_ayarla
?_Usart_ayarla:	; 0 bytes @ 0x0
	global	??_Usart_ayarla
??_Usart_ayarla:	; 0 bytes @ 0x0
	global	?_get_DHT11_data
?_get_DHT11_data:	; 0 bytes @ 0x0
	global	??_get_DHT11_data
??_get_DHT11_data:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_byte_send
?_byte_send:	; 2 bytes @ 0x0
	global	byte_send@data
byte_send@data:	; 1 bytes @ 0x0
	ds	2
	global	get_DHT11_data@temp
get_DHT11_data@temp:	; 1 bytes @ 0x2
	ds	1
	global	get_DHT11_data@sayi
get_DHT11_data@sayi:	; 1 bytes @ 0x3
	ds	1
	global	get_DHT11_data@fa
get_DHT11_data@fa:	; 1 bytes @ 0x4
	ds	1
	global	get_DHT11_data@index
get_DHT11_data@index:	; 1 bytes @ 0x5
	ds	1
	global	get_DHT11_data@count
get_DHT11_data@count:	; 1 bytes @ 0x6
	ds	1
	global	get_DHT11_data@_ind
get_DHT11_data@_ind:	; 1 bytes @ 0x7
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 19, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80      0      16
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_get_DHT11_data
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
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
;; (0) _main                                                 3     3      0     433
;;                                              8 COMMON     3     3      0
;;                       _Usart_ayarla
;;                     _get_DHT11_data
;;                          _byte_send
;; ---------------------------------------------------------------------------------
;; (1) _get_DHT11_data                                       8     8      0     411
;;                                              0 COMMON     8     8      0
;; ---------------------------------------------------------------------------------
;; (1) _Usart_ayarla                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _byte_send                                            1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Usart_ayarla
;;   _get_DHT11_data
;;   _byte_send
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BIGRAM              F0      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITCOMMON            E      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               E      B       E       2      100.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       1       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      1E       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50      0      10       6       20.0%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50      0       0       8        0.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITBANK2            50      0       0       9        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BANK2               50      0       0      10        0.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;DATA                 0      0      1F      11        0.0%
;;BITSFR11             0      0       0      12        0.0%
;;SFR11                0      0       0      12        0.0%
;;BITSFR12             0      0       0      13        0.0%
;;SFR12                0      0       0      13        0.0%
;;BITSFR13             0      0       0      14        0.0%
;;SFR13                0      0       0      14        0.0%
;;BITSFR14             0      0       0      15        0.0%
;;SFR14                0      0       0      15        0.0%
;;BITSFR15             0      0       0      16        0.0%
;;SFR15                0      0       0      16        0.0%
;;BITSFR16             0      0       0      17        0.0%
;;SFR16                0      0       0      17        0.0%
;;BITSFR17             0      0       0      18        0.0%
;;SFR17                0      0       0      18        0.0%
;;BITSFR18             0      0       0      19        0.0%
;;SFR18                0      0       0      19        0.0%
;;BITSFR19             0      0       0      20        0.0%
;;SFR19                0      0       0      20        0.0%
;;BITSFR20             0      0       0      21        0.0%
;;SFR20                0      0       0      21        0.0%
;;BITSFR21             0      0       0      22        0.0%
;;SFR21                0      0       0      22        0.0%
;;BITSFR22             0      0       0      23        0.0%
;;SFR22                0      0       0      23        0.0%
;;BITSFR23             0      0       0      24        0.0%
;;SFR23                0      0       0      24        0.0%
;;BITSFR24             0      0       0      25        0.0%
;;SFR24                0      0       0      25        0.0%
;;BITSFR25             0      0       0      26        0.0%
;;SFR25                0      0       0      26        0.0%
;;BITSFR26             0      0       0      27        0.0%
;;SFR26                0      0       0      27        0.0%
;;BITSFR27             0      0       0      28        0.0%
;;SFR27                0      0       0      28        0.0%
;;BITSFR28             0      0       0      29        0.0%
;;SFR28                0      0       0      29        0.0%
;;BITSFR29             0      0       0      30        0.0%
;;SFR29                0      0       0      30        0.0%
;;BITSFR30             0      0       0      31        0.0%
;;SFR30                0      0       0      31        0.0%
;;BITSFR31             0      0       0      32        0.0%
;;SFR31                0      0       0      32        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 134 in file "../BluetoothTemperature.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Usart_ayarla
;;		_get_DHT11_data
;;		_byte_send
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../BluetoothTemperature.c"
	line	134
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 15
; Regs used in _main: [wreg+fsr1l-status,0+pclath+cstack]
	line	138
	
l3631:	
	movlb 1	; select bank1
	bsf	(1225/8)^080h,(1225)&7
	line	139
	bcf	(1224/8)^080h,(1224)&7
	line	142
	bsf	(1230/8)^080h,(1230)&7
	line	143
	bsf	(1229/8)^080h,(1229)&7
	line	145
	bsf	(1228/8)^080h,(1228)&7
	line	146
	bcf	(1227/8)^080h,(1227)&7
	line	153
	
l3633:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	156
	movlb 1	; select bank1
	clrf	(140)^080h	;volatile
	line	157
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	158
	
l3635:	
	fcall	_Usart_ayarla
	line	162
	
l3637:	
	movlb 1	; select bank1
	bsf	(1123/8)^080h,(1123)&7
	line	164
	
l3639:	
	bcf	(1125/8)^080h,(1125)&7
	line	165
	
l3641:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	goto	l3643
	line	167
	
l1149:	
	line	169
	
l3643:	
	fcall	_get_DHT11_data
	line	170
	
l3645:	
	movlb 0	; select bank0
	movf	0+(_dht_data)+02h,w
	fcall	_byte_send
	line	171
	
l3647:	
	movlb 0	; select bank0
	movf	0+(_dht_data)+02h,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_sicaklik)
	movf	1+(??_main+0)+0,w
	movwf	(_sicaklik+1)
	line	172
	
l3649:	
	movlw	(03Ah)
	fcall	_byte_send
	line	173
	
l3651:	
	movlb 0	; select bank0
	movf	(_dht_data),w
	fcall	_byte_send
	line	174
	
l3653:	
	movlb 0	; select bank0
	movf	(_dht_data),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_nem)
	movf	1+(??_main+0)+0,w
	movwf	(_nem+1)
	line	175
	
l3655:	
	movlw	(02Dh)
	fcall	_byte_send
	line	176
	
l3657:	
	movlw	1<<((101)&7)
	movlb 0	; select bank0
	xorwf	((101)/8),f
	line	177
	
l3659:	
	opt asmopt_off
movlw  11
movwf	((??_main+0)+0+2),f
movlw	38
movwf	((??_main+0)+0+1),f
	movlw	102
movwf	((??_main+0)+0),f
u2527:
	decfsz	((??_main+0)+0),f
	goto	u2527
	decfsz	((??_main+0)+0+1),f
	goto	u2527
	decfsz	((??_main+0)+0+2),f
	goto	u2527
	nop2
opt asmopt_on

	goto	l3643
	line	179
	
l1150:	
	line	167
	goto	l3643
	
l1151:	
	line	182
	
l1152:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_get_DHT11_data
psect	text163,local,class=CODE,delta=2
global __ptext163
__ptext163:

;; *************** function _get_DHT11_data *****************
;; Defined at:
;;		line 53 in file "../BluetoothTemperature.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _ind            1    7[COMMON] unsigned char 
;;  count           1    6[COMMON] unsigned char 
;;  index           1    5[COMMON] unsigned char 
;;  fa              1    4[COMMON] unsigned char 
;;  sayi            1    3[COMMON] unsigned char 
;;  temp            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         6       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text163
	file	"../BluetoothTemperature.c"
	line	53
	global	__size_of_get_DHT11_data
	__size_of_get_DHT11_data	equ	__end_of_get_DHT11_data-_get_DHT11_data
	
_get_DHT11_data:	
	opt	stack 15
; Regs used in _get_DHT11_data: [wreg+fsr1l-status,0]
	line	58
	
l3553:	
	clrf	(get_DHT11_data@fa)
	
l3555:	
	movlw	(05h)
	subwf	(get_DHT11_data@fa),w
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l3559
u2350:
	goto	l1121
	
l3557:	
	goto	l1121
	line	59
	
l1120:	
	
l3559:	
	movf	(get_DHT11_data@fa),w
	addlw	_dht_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	line	58
	
l3561:	
	movlw	(01h)
	movwf	(??_get_DHT11_data+0)+0
	movf	(??_get_DHT11_data+0)+0,w
	addwf	(get_DHT11_data@fa),f
	
l3563:	
	movlw	(05h)
	subwf	(get_DHT11_data@fa),w
	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l3559
u2360:
	
l1121:	
	line	65
	movlb 1	; select bank1
	bcf	(1125/8)^080h,(1125)&7
	line	66
	movlb 0	; select bank0
	bcf	(101/8),(101)&7
	line	67
	
l3565:	
	opt asmopt_off
movlw	47
movwf	((??_get_DHT11_data+0)+0+1),f
	movlw	191
movwf	((??_get_DHT11_data+0)+0),f
u2537:
	decfsz	((??_get_DHT11_data+0)+0),f
	goto	u2537
	decfsz	((??_get_DHT11_data+0)+0+1),f
	goto	u2537
	nop2
opt asmopt_on

	line	68
	
l3567:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	70
	goto	l1122
	
l1123:	
	
l1122:	
	btfsc	(101/8),(101)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l1122
u2370:
	
l1124:	
	line	72
	bcf	(101/8),(101)&7
	line	76
	movlb 1	; select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	77
	clrf	(get_DHT11_data@sayi)
	line	79
	goto	l1125
	
l1126:	
	
l3569:	
	movlw	(01h)
	movwf	(??_get_DHT11_data+0)+0
	movf	(??_get_DHT11_data+0)+0,w
	addwf	(get_DHT11_data@sayi),f
	
l3571:	
	movf	(get_DHT11_data@sayi),w
	xorlw	0C8h&0ffh
	skipz
	goto	u2381
	goto	u2380
u2381:
	goto	l1125
u2380:
	
l3573:	
	clrf	(_hata)
	bsf	status,0
	rlf	(_hata),f
	goto	l1128
	
l3575:	
	goto	l1128
	
l1127:	
	
l1125:	
	movlb 0	; select bank0
	btfss	(101/8),(101)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l3569
u2390:
	
l1129:	
	line	83
	clrf	(get_DHT11_data@sayi)
	line	85
	goto	l1130
	
l1131:	
	
l3577:	
	movlw	(01h)
	movwf	(??_get_DHT11_data+0)+0
	movf	(??_get_DHT11_data+0)+0,w
	addwf	(get_DHT11_data@sayi),f
	
l3579:	
	movf	(get_DHT11_data@sayi),w
	xorlw	0C8h&0ffh
	skipz
	goto	u2401
	goto	u2400
u2401:
	goto	l1130
u2400:
	
l3581:	
	clrf	(_hata)
	bsf	status,0
	rlf	(_hata),f
	goto	l1128
	
l3583:	
	goto	l1128
	
l1132:	
	
l1130:	
	btfsc	(101/8),(101)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l3577
u2410:
	
l1133:	
	line	88
	clrf	(get_DHT11_data@_ind)
	
l3585:	
	movlw	(05h)
	subwf	(get_DHT11_data@_ind),w
	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l1134
u2420:
	goto	l1135
	
l3587:	
	goto	l1135
	line	89
	
l1134:	
	line	90
	clrf	(get_DHT11_data@index)
	
l3589:	
	movlw	(08h)
	subwf	(get_DHT11_data@index),w
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l1136
u2430:
	goto	l3627
	
l3591:	
	goto	l3627
	line	91
	
l1136:	
	line	93
	clrf	(get_DHT11_data@count)
	line	95
	goto	l1138
	
l1139:	
	line	96
	
l3593:	
	movlw	(01h)
	movwf	(??_get_DHT11_data+0)+0
	movf	(??_get_DHT11_data+0)+0,w
	addwf	(get_DHT11_data@count),f
	line	97
	
l3595:	
	movlw	(0C9h)
	subwf	(get_DHT11_data@count),w
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l1138
u2440:
	
l3597:	
	clrf	(_hata)
	bsf	status,0
	rlf	(_hata),f
	line	98
	
l3599:	
	movf	(get_DHT11_data@_ind),w
	addlw	_hata_array&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	bsf	status,0
	rlf	indf1,f
	goto	l1128
	line	99
	
l3601:	
	goto	l1128
	line	100
	
l1140:	
	line	101
	
l1138:	
	line	95
	movlb 0	; select bank0
	btfss	(101/8),(101)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l3593
u2450:
	goto	l3603
	
l1141:	
	line	102
	
l3603:	
	movf	(get_DHT11_data@count),w
	movwf	(??_get_DHT11_data+0)+0
	movf	(??_get_DHT11_data+0)+0,w
	movwf	(get_DHT11_data@temp)
	line	103
	
l3605:	
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	105
	
l3607:	
	clrf	(get_DHT11_data@count)
	line	106
	goto	l1142
	
l1143:	
	line	107
	
l3609:	
	movlw	(01h)
	movwf	(??_get_DHT11_data+0)+0
	movf	(??_get_DHT11_data+0)+0,w
	addwf	(get_DHT11_data@count),f
	line	108
	
l3611:	
	movlw	(0C9h)
	subwf	(get_DHT11_data@count),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l1142
u2460:
	line	110
	
l3613:	
	clrf	(_hata)
	bsf	status,0
	rlf	(_hata),f
	line	111
	
l3615:	
	movf	(get_DHT11_data@_ind),w
	addlw	_hata_array&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	bsf	status,0
	rlf	indf1,f
	goto	l1128
	line	113
	
l3617:	
	goto	l1128
	
l1144:	
	line	114
	
l1142:	
	line	106
	movlb 0	; select bank0
	btfsc	(101/8),(101)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l3609
u2470:
	goto	l3619
	
l1145:	
	line	117
	
l3619:	
	movf	(get_DHT11_data@count),w
	subwf	(get_DHT11_data@temp),w
	skipnc
	goto	u2481
	goto	u2480
u2481:
	goto	l3623
u2480:
	
l3621:	
	movlw	(01h)
	movwf	(??_get_DHT11_data+0)+0
	decf	(get_DHT11_data@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u2494
u2495:
	lslf	(??_get_DHT11_data+0)+0,f
u2494:
	decfsz	wreg,f
	goto	u2495
	movf	0+(??_get_DHT11_data+0)+0,w
	movwf	(??_get_DHT11_data+1)+0
	movf	(get_DHT11_data@_ind),w
	addlw	_dht_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_get_DHT11_data+1)+0,w
	iorwf	indf1,f
	goto	l3623
	
l1146:	
	line	90
	
l3623:	
	movlw	(01h)
	movwf	(??_get_DHT11_data+0)+0
	movf	(??_get_DHT11_data+0)+0,w
	addwf	(get_DHT11_data@index),f
	
l3625:	
	movlw	(08h)
	subwf	(get_DHT11_data@index),w
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l1136
u2500:
	goto	l3627
	
l1137:	
	line	88
	
l3627:	
	movlw	(01h)
	movwf	(??_get_DHT11_data+0)+0
	movf	(??_get_DHT11_data+0)+0,w
	addwf	(get_DHT11_data@_ind),f
	
l3629:	
	movlw	(05h)
	subwf	(get_DHT11_data@_ind),w
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l1134
u2510:
	
l1135:	
	line	123
	movlb 1	; select bank1
	bcf	(1125/8)^080h,(1125)&7
	line	124
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	126
	
l1128:	
	return
	opt stack 0
GLOBAL	__end_of_get_DHT11_data
	__end_of_get_DHT11_data:
;; =============== function _get_DHT11_data ends ============

	signat	_get_DHT11_data,88
	global	_Usart_ayarla
psect	text164,local,class=CODE,delta=2
global __ptext164
__ptext164:

;; *************** function _Usart_ayarla *****************
;; Defined at:
;;		line 23 in file "../BluetoothTemperature.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text164
	file	"../BluetoothTemperature.c"
	line	23
	global	__size_of_Usart_ayarla
	__size_of_Usart_ayarla	equ	__end_of_Usart_ayarla-_Usart_ayarla
	
_Usart_ayarla:	
	opt	stack 15
; Regs used in _Usart_ayarla: [wreg]
	line	25
	
l3543:	
	movlb 3	; select bank3
	bcf	(3169/8)^0180h,(3169)&7
	line	26
	movlb 1	; select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	28
	movlb 3	; select bank3
	bcf	(3168/8)^0180h,(3168)&7
	line	29
	movlb 1	; select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	32
	movlb 3	; select bank3
	bcf	(3316/8)^0180h,(3316)&7
	line	34
	bcf	(3314/8)^0180h,(3314)&7
	line	35
	bcf	(3323/8)^0180h,(3323)&7
	line	36
	
l3545:	
	movlw	(0Ch)
	movwf	(411)^0180h	;volatile
	line	38
	
l3547:	
	bsf	(3308/8)^0180h,(3308)&7
	line	40
	
l3549:	
	bsf	(3311/8)^0180h,(3311)&7
	line	41
	
l3551:	
	bsf	(3317/8)^0180h,(3317)&7
	line	43
	
l1117:	
	return
	opt stack 0
GLOBAL	__end_of_Usart_ayarla
	__end_of_Usart_ayarla:
;; =============== function _Usart_ayarla ends ============

	signat	_Usart_ayarla,88
	global	_byte_send
psect	text165,local,class=CODE,delta=2
global __ptext165
__ptext165:

;; *************** function _byte_send *****************
;; Defined at:
;;		line 8 in file "../BluetoothTemperature.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  1104[COMMON] int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text165
	file	"../BluetoothTemperature.c"
	line	8
	global	__size_of_byte_send
	__size_of_byte_send	equ	__end_of_byte_send-_byte_send
	
_byte_send:	
	opt	stack 15
; Regs used in _byte_send: [wreg]
	movwf	(byte_send@data)
	line	9
	
l3539:	
	goto	l1105
	
l1106:	
	
l1105:	
	movlb 0	; select bank0
	btfss	(140/8),(140)&7
	goto	u2341
	goto	u2340
u2341:
	goto	l1105
u2340:
	goto	l3541
	
l1107:	
	line	10
	
l3541:	
	movf	(byte_send@data),w
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	11
	
l1108:	
	return
	opt stack 0
GLOBAL	__end_of_byte_send
	__end_of_byte_send:
;; =============== function _byte_send ends ============

	signat	_byte_send,4218
psect	text166,local,class=CODE,delta=2
global __ptext166
__ptext166:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
