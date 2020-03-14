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
	FNCALL	_main,_rand
	FNCALL	_main,___awmod
	FNCALL	_main,_SPI_ayarla
	FNCALL	_main,_SDCARD_baslat
	FNCALL	_main,_SDCARD_bir_sektor_oku
	FNCALL	_rand,_srand
	FNCALL	_rand,___lmul
	FNCALL	_SDCARD_baslat,_SPI_yaz
	FNCALL	_SDCARD_bir_sektor_oku,_SPI_yaz
	FNROOT	_main
	global	_randx
	global	_allocated
	global	_error
	global	_randf
	global	_cevap
	global	_buff
	global	_PORTA
psect	text252,local,class=CODE,delta=2
global __ptext252
__ptext252:
_PORTA	set	12
	global	_PR2
_PR2	set	27
	global	_TMR2
_TMR2	set	26
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA4
_RA4	set	100
	global	_SSP1IF
_SSP1IF	set	139
	global	_T2CKPS0
_T2CKPS0	set	224
	global	_T2CKPS1
_T2CKPS1	set	225
	global	_TMR2ON
_TMR2ON	set	226
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
	global	_SPLLEN
_SPLLEN	set	1231
	global	_TRISA0
_TRISA0	set	1120
	global	_TRISA1
_TRISA1	set	1121
	global	_TRISA2
_TRISA2	set	1122
	global	_TRISA4
_TRISA4	set	1124
	global	_CCP1SEL
_CCP1SEL	set	2280
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
	global	_RD
_RD	set	3240
	global	_WR
_WR	set	3241
	global	_WREN
_WREN	set	3242
	global	_SSP1ADD
_SSP1ADD	set	530
	global	_SSP1BUF
_SSP1BUF	set	529
	global	_SSPBUF
_SSPBUF	set	529
	global	_BF
_BF	set	4256
	global	_CKE
_CKE	set	4262
	global	_CKP
_CKP	set	4268
	global	_SMP
_SMP	set	4263
	global	_SSPEN
_SSPEN	set	4269
	global	_SSPM0
_SSPM0	set	4264
	global	_SSPM1
_SSPM1	set	4265
	global	_SSPM2
_SSPM2	set	4266
	global	_SSPM3
_SSPM3	set	4267
	global	_CCPR1L
_CCPR1L	set	657
	global	_CCP1M0
_CCP1M0	set	5272
	global	_CCP1M1
_CCP1M1	set	5273
	global	_CCP1M2
_CCP1M2	set	5274
	global	_CCP1M3
_CCP1M3	set	5275
	global	_DC1B0
_DC1B0	set	5276
	global	_DC1B1
_DC1B1	set	5277
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_cevap:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_randx:
       ds      4

_allocated:
       ds      1

_error:
       ds      1

_randf:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_buff:
       ds      64

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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	movlw	low(__pbssBANK0)
	movwf	fsr0l
	movlw	high(__pbssBANK0)
	movwf	fsr0h
	movlw	07h
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	global __pbssBANK1
	movlw	low(__pbssBANK1)
	movwf	fsr0l
	movlw	high(__pbssBANK1)
	movwf	fsr0h
	movlw	040h
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
	global	??_SPI_yaz
??_SPI_yaz:	; 0 bytes @ 0x0
	global	?_SDCARD_baslat
?_SDCARD_baslat:	; 0 bytes @ 0x0
	global	?_SPI_ayarla
?_SPI_ayarla:	; 0 bytes @ 0x0
	global	??_SPI_ayarla
??_SPI_ayarla:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_srand
?_srand:	; 0 bytes @ 0x0
	global	?_SPI_yaz
?_SPI_yaz:	; 1 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	SPI_yaz@data
SPI_yaz@data:	; 1 bytes @ 0x0
	global	srand@x
srand@x:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	1
	global	?_SDCARD_bir_sektor_oku
?_SDCARD_bir_sektor_oku:	; 0 bytes @ 0x1
	global	??_SDCARD_baslat
??_SDCARD_baslat:	; 0 bytes @ 0x1
	global	SDCARD_bir_sektor_oku@adres
SDCARD_bir_sektor_oku@adres:	; 4 bytes @ 0x1
	ds	1
	global	??_srand
??_srand:	; 0 bytes @ 0x2
	ds	2
	global	SDCARD_baslat@a
SDCARD_baslat@a:	; 2 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	1
	global	SDCARD_bir_sektor_oku@buff
SDCARD_bir_sektor_oku@buff:	; 1 bytes @ 0x5
	ds	1
	global	??_SDCARD_bir_sektor_oku
??_SDCARD_bir_sektor_oku:	; 0 bytes @ 0x6
	global	SDCARD_baslat@k
SDCARD_baslat@k:	; 2 bytes @ 0x6
	ds	2
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	SDCARD_baslat@a_1949
SDCARD_baslat@a_1949:	; 2 bytes @ 0x8
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	ds	4
	global	??___awmod
??___awmod:	; 0 bytes @ 0xC
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	SDCARD_bir_sektor_oku@a
SDCARD_bir_sektor_oku@a:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	SDCARD_bir_sektor_oku@j
SDCARD_bir_sektor_oku@j:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x4
	global	SDCARD_bir_sektor_oku@k
SDCARD_bir_sektor_oku@k:	; 2 bytes @ 0x4
	ds	1
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x5
	ds	1
	global	?_rand
?_rand:	; 2 bytes @ 0x6
	ds	2
	global	??_rand
??_rand:	; 0 bytes @ 0x8
	ds	5
	global	??_main
??_main:	; 0 bytes @ 0xD
	ds	3
	global	main@k
main@k:	; 2 bytes @ 0x10
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 72, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     18      25
;; BANK1           80      0      64
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?_rand	int  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; allocated	PTR unsigned char  size(1) Largest target is 0
;;		 -> NULL(NULL[0]), 
;;
;; SDCARD_bir_sektor_oku@buff	PTR unsigned char  size(1) Largest target is 64
;;		 -> buff(BANK1[64]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___awmod
;;   _rand->___awmod
;;   _SDCARD_baslat->_SPI_yaz
;;   _SDCARD_bir_sektor_oku->_SPI_yaz
;;   ___awmod->___lmul
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_rand
;;   _rand->___awmod
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
;; (0) _main                                                 5     5      0     885
;;                                             13 BANK0      5     5      0
;;                               _rand
;;                            ___awmod
;;                         _SPI_ayarla
;;                      _SDCARD_baslat
;;              _SDCARD_bir_sektor_oku
;; ---------------------------------------------------------------------------------
;; (1) _rand                                                 7     5      2     114
;;                                              6 BANK0      7     5      2
;;                              _srand
;;                             ___lmul
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _SDCARD_baslat                                        9     9      0     160
;;                                              1 COMMON     9     9      0
;;                            _SPI_yaz
;; ---------------------------------------------------------------------------------
;; (1) _SDCARD_bir_sektor_oku                               15    10      5     314
;;                                              1 COMMON     9     4      5
;;                                              0 BANK0      6     6      0
;;                            _SPI_yaz
;; ---------------------------------------------------------------------------------
;; (1) ___awmod                                              7     3      4     296
;;                                             12 COMMON     1     1      0
;;                                              0 BANK0      6     2      4
;;                              _srand (ARG)
;;                             ___lmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              12     4      8      92
;;                                              0 COMMON    12     4      8
;; ---------------------------------------------------------------------------------
;; (2) _srand                                                2     0      2      22
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _SPI_ayarla                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _SPI_yaz                                              1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _rand
;;     _srand
;;     ___lmul
;;     ___awmod (ARG)
;;       _srand (ARG)
;;       ___lmul (ARG)
;;   ___awmod
;;     _srand (ARG)
;;     ___lmul (ARG)
;;   _SPI_ayarla
;;   _SDCARD_baslat
;;     _SPI_yaz
;;   _SDCARD_bir_sektor_oku
;;     _SPI_yaz
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
;;COMMON               E      D       E       2      100.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       2       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      67       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50     12      19       6       31.3%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50      0      40       8       80.0%
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
;;DATA                 0      0      69      11        0.0%
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
;;		line 314 in file "../PIC12f1840SDFileReading.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               2   16[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_rand
;;		___awmod
;;		_SPI_ayarla
;;		_SDCARD_baslat
;;		_SDCARD_bir_sektor_oku
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC12f1840SDFileReading.c"
	line	314
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 14
; Regs used in _main: [wreg+fsr1l-status,0+btemp+1+pclath+cstack]
	line	316
	
l4086:	
	movlw	low(019h)
	movlb 0	; select bank0
	movwf	(?___awmod)
	movlw	high(019h)
	movwf	((?___awmod))+1
	fcall	_rand
	movlb 0	; select bank0
	movf	(1+(?_rand)),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(0+(?_rand)),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movlb 0	; select bank0
	movf	(1+(?___awmod)),w
	clrf	(main@k+1)
	addwf	(main@k+1)
	movf	(0+(?___awmod)),w
	clrf	(main@k)
	addwf	(main@k)

	line	320
	
l4088:	
	movlb 1	; select bank1
	clrf	(140)^080h	;volatile
	line	321
	
l4090:	
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	327
	
l4092:	
	movlb 1	; select bank1
	bsf	(1231/8)^080h,(1231)&7
	line	329
	
l4094:	
	bsf	(1230/8)^080h,(1230)&7
	line	330
	
l4096:	
	bsf	(1229/8)^080h,(1229)&7
	line	331
	
l4098:	
	bsf	(1228/8)^080h,(1228)&7
	line	332
	
l4100:	
	bcf	(1227/8)^080h,(1227)&7
	line	334
	
l4102:	
	bsf	(1225/8)^080h,(1225)&7
	line	335
	
l4104:	
	bcf	(1224/8)^080h,(1224)&7
	line	338
	
l4106:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	341
	
l4108:	
	movlb 2	; select bank2
	bsf	(2280/8)^0100h,(2280)&7
	line	348
	
l4110:	
	movlb 5	; select bank5
	bsf	(5275/8)^0280h,(5275)&7
	line	349
	
l4112:	
	bsf	(5274/8)^0280h,(5274)&7
	line	350
	
l4114:	
	bcf	(5273/8)^0280h,(5273)&7
	line	351
	
l4116:	
	bcf	(5272/8)^0280h,(5272)&7
	line	354
	
l4118:	
	movlw	(014h)
	movwf	(657)^0280h	;volatile
	line	355
	
l4120:	
	bcf	(5277/8)^0280h,(5277)&7
	line	356
	
l4122:	
	bcf	(5276/8)^0280h,(5276)&7
	line	359
	
l4124:	
	movlb 0	; select bank0
	bcf	(225/8),(225)&7
	line	360
	
l4126:	
	bsf	(224/8),(224)&7
	line	364
	
l4128:	
	movlw	(02Ch)
	movwf	(27)	;volatile
	line	365
	
l4130:	
	movlw	(016h)
	movlb 5	; select bank5
	movwf	(657)^0280h	;volatile
	line	367
	
l4132:	
	movlb 0	; select bank0
	clrf	(26)	;volatile
	line	375
	
l4134:	
	bsf	(226/8),(226)&7
	line	377
	
l4136:	
	opt asmopt_off
movlw  41
movwf	((??_main+0)+0+2),f
movlw	150
movwf	((??_main+0)+0+1),f
	movlw	166
movwf	((??_main+0)+0),f
u3167:
	decfsz	((??_main+0)+0),f
	goto	u3167
	decfsz	((??_main+0)+0+1),f
	goto	u3167
	decfsz	((??_main+0)+0+2),f
	goto	u3167
opt asmopt_on

	line	378
	fcall	_SPI_ayarla
	line	379
	
l4138:	
	opt asmopt_off
movlw  41
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	150
movwf	((??_main+0)+0+1),f
	movlw	166
movwf	((??_main+0)+0),f
u3177:
	decfsz	((??_main+0)+0),f
	goto	u3177
	decfsz	((??_main+0)+0+1),f
	goto	u3177
	decfsz	((??_main+0)+0+2),f
	goto	u3177
opt asmopt_on

	line	380
	
l4140:	
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	382
	
l4142:	
	fcall	_SDCARD_baslat
	line	383
	
l4144:	
	opt asmopt_off
movlw  61
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	225
movwf	((??_main+0)+0+1),f
	movlw	122
movwf	((??_main+0)+0),f
u3187:
	decfsz	((??_main+0)+0),f
	goto	u3187
	decfsz	((??_main+0)+0+1),f
	goto	u3187
	decfsz	((??_main+0)+0+2),f
	goto	u3187
	nop2
opt asmopt_on

	line	384
	
l4146:	
	movlw	0
	movwf	(?_SDCARD_bir_sektor_oku+3)
	movlw	0
	movwf	(?_SDCARD_bir_sektor_oku+2)
	movlw	0
	movwf	(?_SDCARD_bir_sektor_oku+1)
	movlw	0
	movwf	(?_SDCARD_bir_sektor_oku)

	movlw	(_buff)&0ffh
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_SDCARD_bir_sektor_oku)+04h
	fcall	_SDCARD_bir_sektor_oku
	goto	l4148
	line	389
	
l1167:	
	line	392
	
l4148:	
	opt asmopt_off
movlw  122
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	193
movwf	((??_main+0)+0+1),f
	movlw	249
movwf	((??_main+0)+0),f
u3197:
	decfsz	((??_main+0)+0),f
	goto	u3197
	decfsz	((??_main+0)+0+1),f
	goto	u3197
	decfsz	((??_main+0)+0+2),f
	goto	u3197
	nop2
opt asmopt_on

	goto	l4148
	line	393
	
l1168:	
	line	389
	goto	l4148
	
l1169:	
	line	399
	
l1170:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_rand
psect	text253,local,class=CODE,delta=2
global __ptext253
__ptext253:

;; *************** function _rand *****************
;; Defined at:
;;		line 14 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\rand.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       5       0       0
;;      Totals:         0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_srand
;;		___lmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text253
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\rand.c"
	line	14
	global	__size_of_rand
	__size_of_rand	equ	__end_of_rand-_rand
	
_rand:	
	opt	stack 14
; Regs used in _rand: [wreg+status,2+status,0+pclath+cstack]
	line	15
	
l4080:	
	movlb 0	; select bank0
	movf	(_randf),f
	skipz
	goto	u3141
	goto	u3140
u3141:
	goto	l2196
u3140:
	line	16
	
l4082:	
	movlw	low(01h)
	movwf	(?_srand)
	movlw	high(01h)
	movwf	((?_srand))+1
	fcall	_srand
	
l2196:	
	line	17
	movlb 0	; select bank0
	movf	(_randx+3),w
	movwf	(?___lmul+3)
	movf	(_randx+2),w
	movwf	(?___lmul+2)
	movf	(_randx+1),w
	movwf	(?___lmul+1)
	movf	(_randx),w
	movwf	(?___lmul)

	movlw	041h
	movwf	3+(?___lmul)+04h
	movlw	0C6h
	movwf	2+(?___lmul)+04h
	movlw	04Eh
	movwf	1+(?___lmul)+04h
	movlw	06Dh
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movlw	039h
	addwf	((0+(?___lmul))),w
	movlb 0	; select bank0
	movwf	(_randx)
	movlw	030h
	addwfc	((1+(?___lmul))),w
	movwf	1+(_randx)
	movlw	0
	addwfc	((2+(?___lmul))),w
	movwf	2+(_randx)
	movlw	0
	addwfc	((3+(?___lmul))),w
	movwf	3+(_randx)
	movf	((_randx)),w
	movwf	(??_rand+0)+0
	movf	((_randx+1)),w
	movwf	((??_rand+0)+0+1)
	movf	((_randx+2)),w
	movwf	((??_rand+0)+0+2)
	movf	((_randx+3)),w
	movwf	((??_rand+0)+0+3)
	movlw	010h
	movwf	(??_rand+4)+0
u3155:
	asrf	(??_rand+0)+3,f
	rrf	(??_rand+0)+2,f
	rrf	(??_rand+0)+1,f
	rrf	(??_rand+0)+0,f
u3150:
	decfsz	(??_rand+4)+0,f
	goto	u3155
	movlw	low(07FFFh)
	andwf	0+(??_rand+0)+0,w
	movwf	(?_rand)
	movlw	high(07FFFh)
	andwf	1+(??_rand+0)+0,w
	movwf	1+(?_rand)
	goto	l2197
	
l4084:	
	line	18
	
l2197:	
	return
	opt stack 0
GLOBAL	__end_of_rand
	__end_of_rand:
;; =============== function _rand ends ============

	signat	_rand,90
	global	_SDCARD_baslat
psect	text254,local,class=CODE,delta=2
global __ptext254
__ptext254:

;; *************** function _SDCARD_baslat *****************
;; Defined at:
;;		line 173 in file "../PIC12f1840SDFileReading.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               2    8[COMMON] int 
;;  k               2    6[COMMON] int 
;;  a               2    4[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         6       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SPI_yaz
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text254
	file	"../PIC12f1840SDFileReading.c"
	line	173
	global	__size_of_SDCARD_baslat
	__size_of_SDCARD_baslat	equ	__end_of_SDCARD_baslat-_SDCARD_baslat
	
_SDCARD_baslat:	
	opt	stack 14
; Regs used in _SDCARD_baslat: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	174
	
l4002:	
	opt asmopt_off
movlw  130
movwf	((??_SDCARD_baslat+0)+0+2),f
movlw	223
movwf	((??_SDCARD_baslat+0)+0+1),f
	movlw	232
movwf	((??_SDCARD_baslat+0)+0),f
u3207:
	decfsz	((??_SDCARD_baslat+0)+0),f
	goto	u3207
	decfsz	((??_SDCARD_baslat+0)+0+1),f
	goto	u3207
	decfsz	((??_SDCARD_baslat+0)+0+2),f
	goto	u3207
	clrwdt
opt asmopt_on

	line	176
	
l4004:	
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	177
	
l4006:	
	clrf	(SDCARD_baslat@a)
	clrf	(SDCARD_baslat@a+1)
	
l4008:	
	movf	(SDCARD_baslat@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3045
	movlw	low(0Bh)
	subwf	(SDCARD_baslat@a),w
u3045:

	skipc
	goto	u3041
	goto	u3040
u3041:
	goto	l4012
u3040:
	goto	l4018
	
l4010:	
	goto	l4018
	line	178
	
l1139:	
	
l4012:	
	movlw	(0FFh)
	fcall	_SPI_yaz
	line	177
	
l4014:	
	movlw	low(01h)
	addwf	(SDCARD_baslat@a),f
	movlw	high(01h)
	addwfc	(SDCARD_baslat@a+1),f
	
l4016:	
	movf	(SDCARD_baslat@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3055
	movlw	low(0Bh)
	subwf	(SDCARD_baslat@a),w
u3055:

	skipc
	goto	u3051
	goto	u3050
u3051:
	goto	l4012
u3050:
	goto	l4018
	
l1140:	
	line	180
	
l4018:	
	opt asmopt_off
movlw  163
movwf	((??_SDCARD_baslat+0)+0+2),f
movlw	87
movwf	((??_SDCARD_baslat+0)+0+1),f
	movlw	163
movwf	((??_SDCARD_baslat+0)+0),f
u3217:
	decfsz	((??_SDCARD_baslat+0)+0),f
	goto	u3217
	decfsz	((??_SDCARD_baslat+0)+0+1),f
	goto	u3217
	decfsz	((??_SDCARD_baslat+0)+0+2),f
	goto	u3217
	clrwdt
opt asmopt_on

	line	183
	
l4020:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	185
	
l4022:	
	movlw	(040h)
	fcall	_SPI_yaz
	line	187
	
l4024:	
	movlw	(0)
	fcall	_SPI_yaz
	line	188
	
l4026:	
	movlw	(0)
	fcall	_SPI_yaz
	line	189
	
l4028:	
	movlw	(0)
	fcall	_SPI_yaz
	line	190
	
l4030:	
	movlw	(0)
	fcall	_SPI_yaz
	line	192
	
l4032:	
	movlw	(095h)
	fcall	_SPI_yaz
	line	198
	
l4034:	
	movlw	(0)
	fcall	_SPI_yaz
	movwf	(??_SDCARD_baslat+0)+0
	movf	(??_SDCARD_baslat+0)+0,w
	movwf	(_cevap)
	line	202
	
l4036:	
	clrf	(SDCARD_baslat@k)
	clrf	(SDCARD_baslat@k+1)
	
l4038:	
	movf	(SDCARD_baslat@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u3065
	movlw	low(0Ah)
	subwf	(SDCARD_baslat@k),w
u3065:

	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l4042
u3060:
	goto	l4054
	
l4040:	
	goto	l4054
	line	203
	
l1141:	
	line	204
	
l4042:	
	movlw	(0FFh)
	fcall	_SPI_yaz
	movwf	(??_SDCARD_baslat+0)+0
	movf	(??_SDCARD_baslat+0)+0,w
	movwf	(_cevap)
	line	205
	
l4044:	
	movf	(_cevap),w
	xorlw	01h&0ffh
	skipnz
	goto	u3071
	goto	u3070
u3071:
	goto	l4054
u3070:
	goto	l4050
	
l4046:	
	goto	l4050
	
l4048:	
	goto	l4050
	line	206
	
l1143:	
	goto	l4054
	
l1145:	
	goto	l4050
	line	202
	
l1144:	
	
l4050:	
	movlw	low(01h)
	addwf	(SDCARD_baslat@k),f
	movlw	high(01h)
	addwfc	(SDCARD_baslat@k+1),f
	
l4052:	
	movf	(SDCARD_baslat@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u3085
	movlw	low(0Ah)
	subwf	(SDCARD_baslat@k),w
u3085:

	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l4042
u3080:
	goto	l4054
	
l1142:	
	line	210
	
l4054:	
	opt asmopt_off
movlw  5
movwf	((??_SDCARD_baslat+0)+0+2),f
movlw	15
movwf	((??_SDCARD_baslat+0)+0+1),f
	movlw	244
movwf	((??_SDCARD_baslat+0)+0),f
u3227:
	decfsz	((??_SDCARD_baslat+0)+0),f
	goto	u3227
	decfsz	((??_SDCARD_baslat+0)+0+1),f
	goto	u3227
	decfsz	((??_SDCARD_baslat+0)+0+2),f
	goto	u3227
opt asmopt_on

	line	214
	movf	(_cevap),w
	xorlw	01h&0ffh
	skipz
	goto	u3091
	goto	u3090
u3091:
	goto	l1146
u3090:
	goto	l4056
	line	216
	
l1147:	
	line	219
	
l4056:	
	movlw	(041h)
	fcall	_SPI_yaz
	line	221
	movlw	(0)
	fcall	_SPI_yaz
	line	222
	movlw	(0)
	fcall	_SPI_yaz
	line	223
	movlw	(0)
	fcall	_SPI_yaz
	line	224
	movlw	(0)
	fcall	_SPI_yaz
	line	225
	movlw	(0FFh)
	fcall	_SPI_yaz
	line	227
	
l4058:	
	clrf	(SDCARD_baslat@a_1949)
	clrf	(SDCARD_baslat@a_1949+1)
	
l4060:	
	movf	(SDCARD_baslat@a_1949+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u3105
	movlw	low(0Ah)
	subwf	(SDCARD_baslat@a_1949),w
u3105:

	skipc
	goto	u3101
	goto	u3100
u3101:
	goto	l4064
u3100:
	goto	l4078
	
l4062:	
	goto	l4078
	line	228
	
l1148:	
	line	229
	
l4064:	
	movlw	(0FFh)
	fcall	_SPI_yaz
	movwf	(??_SDCARD_baslat+0)+0
	movf	(??_SDCARD_baslat+0)+0,w
	movwf	(_cevap)
	line	230
	
l4066:	
	movf	(_cevap),w
	xorlw	0FFh&0ffh
	skipnz
	goto	u3111
	goto	u3110
u3111:
	goto	l4070
u3110:
	goto	l4078
	
l4068:	
	goto	l4078
	
l1150:	
	line	227
	
l4070:	
	movlw	low(01h)
	addwf	(SDCARD_baslat@a_1949),f
	movlw	high(01h)
	addwfc	(SDCARD_baslat@a_1949+1),f
	
l4072:	
	movf	(SDCARD_baslat@a_1949+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u3125
	movlw	low(0Ah)
	subwf	(SDCARD_baslat@a_1949),w
u3125:

	skipc
	goto	u3121
	goto	u3120
u3121:
	goto	l4064
u3120:
	goto	l4078
	
l1149:	
	goto	l4078
	line	234
	
l4074:	
	goto	l4078
	line	241
	
l4076:	
	goto	l4078
	line	242
	
l1151:	
	goto	l4078
	
l1152:	
	goto	l4078
	line	244
	
l1153:	
	line	245
	
l4078:	
	movf	(_cevap),w
	xorlw	0FFh&0ffh
	skipnz
	goto	u3131
	goto	u3130
u3131:
	goto	l4056
u3130:
	goto	l1146
	
l1154:	
	line	248
	
l1146:	
	line	252
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	255
	
l1155:	
	return
	opt stack 0
GLOBAL	__end_of_SDCARD_baslat
	__end_of_SDCARD_baslat:
;; =============== function _SDCARD_baslat ends ============

	signat	_SDCARD_baslat,88
	global	_SDCARD_bir_sektor_oku
psect	text255,local,class=CODE,delta=2
global __ptext255
__ptext255:

;; *************** function _SDCARD_bir_sektor_oku *****************
;; Defined at:
;;		line 103 in file "../PIC12f1840SDFileReading.c"
;; Parameters:    Size  Location     Type
;;  adres           4    1[COMMON] unsigned long 
;;  buff            1    5[COMMON] PTR unsigned char 
;;		 -> buff(64), 
;; Auto vars:     Size  Location     Type
;;  k               2    4[BANK0 ] int 
;;  j               2    2[BANK0 ] int 
;;  a               2    0[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         5       0       0       0
;;      Locals:         0       6       0       0
;;      Temps:          4       0       0       0
;;      Totals:         9       6       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SPI_yaz
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text255
	file	"../PIC12f1840SDFileReading.c"
	line	103
	global	__size_of_SDCARD_bir_sektor_oku
	__size_of_SDCARD_bir_sektor_oku	equ	__end_of_SDCARD_bir_sektor_oku-_SDCARD_bir_sektor_oku
	
_SDCARD_bir_sektor_oku:	
	opt	stack 14
; Regs used in _SDCARD_bir_sektor_oku: [wreg+fsr1l-status,0+btemp+1+pclath+cstack]
	line	104
	
l3942:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	106
	
l3944:	
	movlw	(051h)
	fcall	_SPI_yaz
	line	108
	movf	(SDCARD_bir_sektor_oku@adres),w
	movwf	(??_SDCARD_bir_sektor_oku+0)+0
	movf	(SDCARD_bir_sektor_oku@adres+1),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+1)
	movf	(SDCARD_bir_sektor_oku@adres+2),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+2)
	movf	(SDCARD_bir_sektor_oku@adres+3),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+3)
	movlw	018h
u2905:
	lsrf	(??_SDCARD_bir_sektor_oku+0)+3,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+2,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+1,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+0,f
u2900:
	decfsz	wreg,f
	goto	u2905
	movf	0+(??_SDCARD_bir_sektor_oku+0)+0,w
	fcall	_SPI_yaz
	line	109
	movf	(SDCARD_bir_sektor_oku@adres),w
	movwf	(??_SDCARD_bir_sektor_oku+0)+0
	movf	(SDCARD_bir_sektor_oku@adres+1),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+1)
	movf	(SDCARD_bir_sektor_oku@adres+2),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+2)
	movf	(SDCARD_bir_sektor_oku@adres+3),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+3)
	movlw	010h
u2915:
	lsrf	(??_SDCARD_bir_sektor_oku+0)+3,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+2,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+1,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+0,f
u2910:
	decfsz	wreg,f
	goto	u2915
	movf	0+(??_SDCARD_bir_sektor_oku+0)+0,w
	fcall	_SPI_yaz
	line	110
	movf	(SDCARD_bir_sektor_oku@adres),w
	movwf	(??_SDCARD_bir_sektor_oku+0)+0
	movf	(SDCARD_bir_sektor_oku@adres+1),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+1)
	movf	(SDCARD_bir_sektor_oku@adres+2),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+2)
	movf	(SDCARD_bir_sektor_oku@adres+3),w
	movwf	((??_SDCARD_bir_sektor_oku+0)+0+3)
	movlw	08h
u2925:
	lsrf	(??_SDCARD_bir_sektor_oku+0)+3,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+2,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+1,f
	rrf	(??_SDCARD_bir_sektor_oku+0)+0,f
u2920:
	decfsz	wreg,f
	goto	u2925
	movf	0+(??_SDCARD_bir_sektor_oku+0)+0,w
	fcall	_SPI_yaz
	line	111
	movf	(SDCARD_bir_sektor_oku@adres),w
	fcall	_SPI_yaz
	line	113
	movlw	(0FFh)
	fcall	_SPI_yaz
	line	115
	
l3946:	
	movlb 0	; select bank0
	clrf	(SDCARD_bir_sektor_oku@a)
	clrf	(SDCARD_bir_sektor_oku@a+1)
	
l3948:	
	movf	(SDCARD_bir_sektor_oku@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2935
	movlw	low(0Bh)
	subwf	(SDCARD_bir_sektor_oku@a),w
u2935:

	skipc
	goto	u2931
	goto	u2930
u2931:
	goto	l3952
u2930:
	goto	l3962
	
l3950:	
	goto	l3962
	line	116
	
l1125:	
	line	117
	
l3952:	
	movlw	(0FFh)
	fcall	_SPI_yaz
	movwf	(??_SDCARD_bir_sektor_oku+0)+0
	movf	(??_SDCARD_bir_sektor_oku+0)+0,w
	movwf	(_cevap)
	line	118
	
l3954:	
	movf	(_cevap),f
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l3958
u2940:
	goto	l3962
	
l3956:	
	goto	l3962
	
l1127:	
	line	115
	
l3958:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(SDCARD_bir_sektor_oku@a),f
	movlw	high(01h)
	addwfc	(SDCARD_bir_sektor_oku@a+1),f
	
l3960:	
	movf	(SDCARD_bir_sektor_oku@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2955
	movlw	low(0Bh)
	subwf	(SDCARD_bir_sektor_oku@a),w
u2955:

	skipc
	goto	u2951
	goto	u2950
u2951:
	goto	l3952
u2950:
	goto	l3962
	
l1126:	
	line	125
	
l3962:	
	movf	(_cevap),f
	skipz
	goto	u2961
	goto	u2960
u2961:
	goto	l4000
u2960:
	line	131
	
l3964:	
	movlb 0	; select bank0
	clrf	(SDCARD_bir_sektor_oku@j)
	clrf	(SDCARD_bir_sektor_oku@j+1)
	
l3966:	
	movf	(SDCARD_bir_sektor_oku@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02710h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2975
	movlw	low(02710h)
	subwf	(SDCARD_bir_sektor_oku@j),w
u2975:

	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l3970
u2970:
	goto	l3980
	
l3968:	
	goto	l3980
	line	132
	
l1129:	
	line	133
	
l3970:	
	movlw	(0Fh)
	fcall	_SPI_yaz
	movwf	(??_SDCARD_bir_sektor_oku+0)+0
	movf	(??_SDCARD_bir_sektor_oku+0)+0,w
	movwf	(_cevap)
	line	134
	
l3972:	
	movf	(_cevap),w
	xorlw	0FEh&0ffh
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l3976
u2980:
	goto	l3980
	
l3974:	
	goto	l3980
	
l1131:	
	line	131
	
l3976:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(SDCARD_bir_sektor_oku@j),f
	movlw	high(01h)
	addwfc	(SDCARD_bir_sektor_oku@j+1),f
	
l3978:	
	movf	(SDCARD_bir_sektor_oku@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02710h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2995
	movlw	low(02710h)
	subwf	(SDCARD_bir_sektor_oku@j),w
u2995:

	skipc
	goto	u2991
	goto	u2990
u2991:
	goto	l3970
u2990:
	goto	l3980
	
l1130:	
	line	138
	
l3980:	
	movf	(_cevap),w
	xorlw	0FEh&0ffh
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l4000
u3000:
	line	142
	
l3982:	
	movlb 0	; select bank0
	clrf	(SDCARD_bir_sektor_oku@k)
	clrf	(SDCARD_bir_sektor_oku@k+1)
	
l3984:	
	movf	(SDCARD_bir_sektor_oku@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0200h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3015
	movlw	low(0200h)
	subwf	(SDCARD_bir_sektor_oku@k),w
u3015:

	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l3988
u3010:
	goto	l3998
	
l3986:	
	goto	l3998
	line	143
	
l1133:	
	line	144
	
l3988:	
	movlw	(0FFh)
	fcall	_SPI_yaz
	movwf	(??_SDCARD_bir_sektor_oku+0)+0
	movf	(??_SDCARD_bir_sektor_oku+0)+0,w
	movwf	(_cevap)
	line	145
	
l3990:	
	movlb 0	; select bank0
	movf	(SDCARD_bir_sektor_oku@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(040h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3025
	movlw	low(040h)
	subwf	(SDCARD_bir_sektor_oku@k),w
u3025:

	skipnc
	goto	u3021
	goto	u3020
u3021:
	goto	l3994
u3020:
	line	147
	
l3992:	
	movf	(_cevap),w
	movwf	(??_SDCARD_bir_sektor_oku+0)+0
	movlb 0	; select bank0
	movf	(SDCARD_bir_sektor_oku@k),w
	addwf	(SDCARD_bir_sektor_oku@buff),w
	movwf	(??_SDCARD_bir_sektor_oku+1)+0
	movf	0+(??_SDCARD_bir_sektor_oku+1)+0,w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_SDCARD_bir_sektor_oku+0)+0,w
	movwf	indf1
	goto	l3994
	line	148
	
l1135:	
	line	142
	
l3994:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(SDCARD_bir_sektor_oku@k),f
	movlw	high(01h)
	addwfc	(SDCARD_bir_sektor_oku@k+1),f
	
l3996:	
	movf	(SDCARD_bir_sektor_oku@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0200h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3035
	movlw	low(0200h)
	subwf	(SDCARD_bir_sektor_oku@k),w
u3035:

	skipc
	goto	u3031
	goto	u3030
u3031:
	goto	l3988
u3030:
	goto	l3998
	
l1134:	
	line	152
	
l3998:	
	movlw	(0FFh)
	fcall	_SPI_yaz
	line	153
	movlw	(0FFh)
	fcall	_SPI_yaz
	goto	l4000
	line	155
	
l1132:	
	goto	l4000
	line	160
	
l1128:	
	line	164
	
l4000:	
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	168
	
l1136:	
	return
	opt stack 0
GLOBAL	__end_of_SDCARD_bir_sektor_oku
	__end_of_SDCARD_bir_sektor_oku:
;; =============== function _SDCARD_bir_sektor_oku ends ============

	signat	_SDCARD_bir_sektor_oku,8312
	global	___awmod
psect	text256,local,class=CODE,delta=2
global __ptext256
__ptext256:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    5[BANK0 ] unsigned char 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       2       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       6       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text256
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 15
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l3908:	
	movlb 0	; select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2811
	goto	u2810
u2811:
	goto	l3912
u2810:
	line	10
	
l3910:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l3912
	line	12
	
l2414:	
	line	13
	
l3912:	
	btfss	(___awmod@divisor+1),7
	goto	u2821
	goto	u2820
u2821:
	goto	l3916
u2820:
	line	14
	
l3914:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l3916
	
l2415:	
	line	15
	
l3916:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2831
	goto	u2830
u2831:
	goto	l3934
u2830:
	line	16
	
l3918:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l3924
	
l2418:	
	line	18
	
l3920:	
	movlw	01h
	
u2845:
	lslf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u2845
	line	19
	
l3922:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l3924
	line	20
	
l2417:	
	line	17
	
l3924:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l3920
u2850:
	goto	l3926
	
l2419:	
	goto	l3926
	line	21
	
l2420:	
	line	22
	
l3926:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2865
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2865:
	skipc
	goto	u2861
	goto	u2860
u2861:
	goto	l3930
u2860:
	line	23
	
l3928:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	subwfb	(___awmod@dividend+1),f
	goto	l3930
	
l2421:	
	line	24
	
l3930:	
	movlw	01h
	
u2875:
	lsrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	decfsz	wreg,f
	goto	u2875
	line	25
	
l3932:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2881
	goto	u2880
u2881:
	goto	l3926
u2880:
	goto	l3934
	
l2422:	
	goto	l3934
	line	26
	
l2416:	
	line	27
	
l3934:	
	movf	(___awmod@sign),w
	skipz
	goto	u2890
	goto	l3938
u2890:
	line	28
	
l3936:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l3938
	
l2423:	
	line	29
	
l3938:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l2424
	
l3940:	
	line	30
	
l2424:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lmul
psect	text257,local,class=CODE,delta=2
global __ptext257
__ptext257:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[COMMON] unsigned long 
;;  multiplicand    4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    8[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         8       0       0       0
;;      Locals:         4       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:        12       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rand
;; This function uses a non-reentrant model
;;
psect	text257
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 14
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l3894:	
	movlw	0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	l3896
	line	6
	
l2281:	
	line	7
	
l3896:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l3900
u2770:
	line	8
	
l3898:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	addwfc	(___lmul@product+1),f
	movf	(___lmul@multiplicand+2),w
	addwfc	(___lmul@product+2),f
	movf	(___lmul@multiplicand+3),w
	addwfc	(___lmul@product+3),f
	goto	l3900
	
l2282:	
	line	9
	
l3900:	
	movlw	01h
u2785:
	lslf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	wreg,f
	goto	u2785
	line	10
	
l3902:	
	movlw	01h
u2795:
	lsrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	decfsz	wreg,f
	goto	u2795

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u2801
	goto	u2800
u2801:
	goto	l3896
u2800:
	goto	l3904
	
l2283:	
	line	12
	
l3904:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l2284
	
l3906:	
	line	13
	
l2284:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	_srand
psect	text258,local,class=CODE,delta=2
global __ptext258
__ptext258:

;; *************** function _srand *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\rand.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[COMMON] unsigned int 
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rand
;; This function uses a non-reentrant model
;;
psect	text258
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\rand.c"
	line	8
	global	__size_of_srand
	__size_of_srand	equ	__end_of_srand-_srand
	
_srand:	
	opt	stack 14
; Regs used in _srand: [wreg+status,2+status,0]
	line	9
	
l3890:	
	movf	(srand@x),w
	movlb 0	; select bank0
	movwf	(_randx)
	movf	(srand@x+1),w
	movwf	((_randx))+1
	clrf	2+((_randx))
	clrf	3+((_randx))
	line	10
	
l3892:	
	clrf	(_randf)
	bsf	status,0
	rlf	(_randf),f
	line	11
	
l2193:	
	return
	opt stack 0
GLOBAL	__end_of_srand
	__end_of_srand:
;; =============== function _srand ends ============

	signat	_srand,4216
	global	_SPI_ayarla
psect	text259,local,class=CODE,delta=2
global __ptext259
__ptext259:

;; *************** function _SPI_ayarla *****************
;; Defined at:
;;		line 278 in file "../PIC12f1840SDFileReading.c"
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
psect	text259
	file	"../PIC12f1840SDFileReading.c"
	line	278
	global	__size_of_SPI_ayarla
	__size_of_SPI_ayarla	equ	__end_of_SPI_ayarla-_SPI_ayarla
	
_SPI_ayarla:	
	opt	stack 15
; Regs used in _SPI_ayarla: [wreg]
	line	281
	
l3876:	
	movlb 1	; select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	285
	bcf	(1120/8)^080h,(1120)&7
	line	287
	bcf	(1121/8)^080h,(1121)&7
	line	289
	bsf	(1122/8)^080h,(1122)&7
	line	292
	movlb 4	; select bank4
	bcf	(4263/8)^0200h,(4263)&7
	line	295
	bcf	(4268/8)^0200h,(4268)&7
	line	296
	bcf	(4262/8)^0200h,(4262)&7
	line	299
	
l3878:	
	movlw	(01Fh)
	movwf	(530)^0200h	;volatile
	line	302
	
l3880:	
	bsf	(4267/8)^0200h,(4267)&7
	line	303
	
l3882:	
	bcf	(4266/8)^0200h,(4266)&7
	line	304
	
l3884:	
	bsf	(4265/8)^0200h,(4265)&7
	line	305
	
l3886:	
	bcf	(4264/8)^0200h,(4264)&7
	line	308
	
l3888:	
	bsf	(4269/8)^0200h,(4269)&7
	line	311
	
l1164:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_ayarla
	__end_of_SPI_ayarla:
;; =============== function _SPI_ayarla ends ============

	signat	_SPI_ayarla,88
	global	_SPI_yaz
psect	text260,local,class=CODE,delta=2
global __ptext260
__ptext260:

;; *************** function _SPI_yaz *****************
;; Defined at:
;;		line 260 in file "../PIC12f1840SDFileReading.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
;;		_SDCARD_bir_sektor_oku
;;		_SDCARD_baslat
;;		_SDCARD_bir_sektor_yaz
;; This function uses a non-reentrant model
;;
psect	text260
	file	"../PIC12f1840SDFileReading.c"
	line	260
	global	__size_of_SPI_yaz
	__size_of_SPI_yaz	equ	__end_of_SPI_yaz-_SPI_yaz
	
_SPI_yaz:	
	opt	stack 14
; Regs used in _SPI_yaz: [wreg]
	line	262
	movwf	(SPI_yaz@data)
	
l3870:	
	movf	(SPI_yaz@data),w
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	263
	goto	l1158
	
l1159:	
	
l1158:	
	btfss	(4256/8)^0200h,(4256)&7
	goto	u2761
	goto	u2760
u2761:
	goto	l1158
u2760:
	
l1160:	
	line	264
	movlb 0	; select bank0
	bcf	(139/8),(139)&7
	line	265
	
l3872:	
	movlb 4	; select bank4
	movf	(529)^0200h,w	;volatile
	goto	l1161
	
l3874:	
	line	273
	
l1161:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_yaz
	__end_of_SPI_yaz:
;; =============== function _SPI_yaz ends ============

	signat	_SPI_yaz,4217
psect	text261,local,class=CODE,delta=2
global __ptext261
__ptext261:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
