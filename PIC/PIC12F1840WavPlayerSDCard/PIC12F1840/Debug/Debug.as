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
	FNCALL	_main,_InitSd
	FNCALL	_main,_initMedia
	FNCALL	_main,_ReadMultiSector
	FNCALL	_ReadMultiSector,_sendSDCmd
	FNCALL	_initMedia,_spi_yaz
	FNCALL	_initMedia,_sendSDCmd
	FNCALL	_InitSd,_spi_hazirla
	FNCALL	_sendSDCmd,_spi_yaz
	FNROOT	_main
	global	_gelen
	global	_adress
	global	_i
	global	_r
	global	_result
	global	_c
	global	_PR2
psect	text220,local,class=CODE,delta=2
global __ptext220
__ptext220:
_PR2	set	27
	global	_T2CON
_T2CON	set	28
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA4
_RA4	set	100
	global	_TMR2IF
_TMR2IF	set	137
	global	_TMR2ON
_TMR2ON	set	226
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
	global	_TRISA5
_TRISA5	set	1125
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
	global	_CCP1CON
_CCP1CON	set	659
	global	_CCPR1L
_CCPR1L	set	657
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
_c:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_gelen:
       ds      20

_adress:
       ds      4

_i:
       ds      2

_r:
       ds      2

_result:
       ds      2

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
	movlw	01Eh
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
	global	??_spi_yaz
??_spi_yaz:	; 0 bytes @ 0x0
	global	?_spi_hazirla
?_spi_hazirla:	; 0 bytes @ 0x0
	global	??_spi_hazirla
??_spi_hazirla:	; 0 bytes @ 0x0
	global	?_InitSd
?_InitSd:	; 0 bytes @ 0x0
	global	??_InitSd
??_InitSd:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_spi_yaz
?_spi_yaz:	; 1 bytes @ 0x0
	global	spi_yaz@veri
spi_yaz@veri:	; 1 bytes @ 0x0
	ds	1
	global	?_sendSDCmd
?_sendSDCmd:	; 2 bytes @ 0x1
	global	sendSDCmd@x
sendSDCmd@x:	; 4 bytes @ 0x1
	ds	4
	global	sendSDCmd@frame
sendSDCmd@frame:	; 1 bytes @ 0x5
	ds	1
	global	??_sendSDCmd
??_sendSDCmd:	; 0 bytes @ 0x6
	ds	4
	global	sendSDCmd@c
sendSDCmd@c:	; 1 bytes @ 0xA
	ds	1
	global	??_ReadMultiSector
??_ReadMultiSector:	; 0 bytes @ 0xB
	global	?_initMedia
?_initMedia:	; 2 bytes @ 0xB
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_initMedia
??_initMedia:	; 0 bytes @ 0x0
	global	?_ReadMultiSector
?_ReadMultiSector:	; 1 bytes @ 0x0
	global	ReadMultiSector@adress
ReadMultiSector@adress:	; 4 bytes @ 0x0
	ds	3
	global	initMedia@i
initMedia@i:	; 2 bytes @ 0x3
	ds	2
	global	initMedia@k
initMedia@k:	; 2 bytes @ 0x5
	ds	2
	global	initMedia@r
initMedia@r:	; 2 bytes @ 0x7
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x9
	ds	3
	global	main@_ind
main@_ind:	; 2 bytes @ 0xC
	ds	2
	global	main@temp
main@temp:	; 1 bytes @ 0xE
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 31, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     15      45
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?_sendSDCmd	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_initMedia
;;   _ReadMultiSector->_sendSDCmd
;;   _initMedia->_sendSDCmd
;;   _sendSDCmd->_spi_yaz
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_initMedia
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
;; (0) _main                                                 8     8      0     608
;;                                              9 BANK0      6     6      0
;;                             _InitSd
;;                          _initMedia
;;                    _ReadMultiSector
;; ---------------------------------------------------------------------------------
;; (1) _ReadMultiSector                                      5     1      4     176
;;                                             11 COMMON     1     1      0
;;                                              0 BANK0      4     0      4
;;                          _sendSDCmd
;; ---------------------------------------------------------------------------------
;; (1) _initMedia                                           11     9      2     316
;;                                             11 COMMON     2     0      2
;;                                              0 BANK0      9     9      0
;;                            _spi_yaz
;;                          _sendSDCmd
;; ---------------------------------------------------------------------------------
;; (1) _InitSd                                               0     0      0       0
;;                        _spi_hazirla
;; ---------------------------------------------------------------------------------
;; (2) _sendSDCmd                                           10     5      5     154
;;                                              1 COMMON    10     5      5
;;                            _spi_yaz
;; ---------------------------------------------------------------------------------
;; (2) _spi_hazirla                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _spi_yaz                                              1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _InitSd
;;     _spi_hazirla
;;   _initMedia
;;     _spi_yaz
;;     _sendSDCmd
;;       _spi_yaz
;;   _ReadMultiSector
;;     _sendSDCmd
;;       _spi_yaz
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
;;STACK                0      0       3       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      3B       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50      F      2D       6       56.3%
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
;;DATA                 0      0      3E      11        0.0%
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
;;		line 343 in file "../PIC12f1840Wav.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _ind            2   12[BANK0 ] int 
;;  index           2    0        int 
;;  temp            1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_InitSd
;;		_initMedia
;;		_ReadMultiSector
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC12f1840Wav.c"
	line	343
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 13
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	345
	
l3826:	
	movlb 1	; select bank1
	bcf	(1225/8)^080h,(1225)&7
	line	346
	bcf	(1224/8)^080h,(1224)&7
	line	348
	bsf	(1230/8)^080h,(1230)&7
	line	349
	bsf	(1229/8)^080h,(1229)&7
	line	350
	bsf	(1228/8)^080h,(1228)&7
	line	351
	bcf	(1227/8)^080h,(1227)&7
	line	352
	bcf	(1231/8)^080h,(1231)&7
	line	359
	
l3828:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	360
	
l3830:	
	movlb 2	; select bank2
	bsf	(2280/8)^0100h,(2280)&7
	line	371
	
l3832:	
	movlb 1	; select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	372
	
l3834:	
	bcf	(1121/8)^080h,(1121)&7
	line	373
	
l3836:	
	bsf	(1122/8)^080h,(1122)&7
	line	378
	
l3838:	
	fcall	_InitSd
	line	380
	
l3840:	
	opt asmopt_off
movlw  5
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	15
movwf	((??_main+0)+0+1),f
	movlw	244
movwf	((??_main+0)+0),f
u2957:
	decfsz	((??_main+0)+0),f
	goto	u2957
	decfsz	((??_main+0)+0+1),f
	goto	u2957
	decfsz	((??_main+0)+0+2),f
	goto	u2957
opt asmopt_on

	line	381
	
l3842:	
	fcall	_initMedia
	movf	(1+(?_initMedia)),w
	movlb 0	; select bank0
	clrf	(_r+1)
	addwf	(_r+1)
	movf	(0+(?_initMedia)),w
	clrf	(_r)
	addwf	(_r)

	line	383
	
l3844:	
	movf	(_r+1),w
	iorwf	(_r),w
	skipnz
	goto	u2791
	goto	u2790
u2791:
	goto	l1156
u2790:
	goto	l1158
	line	386
	
l1157:	
	
l1158:	
	goto	l1158
	
l1159:	
	line	387
	
l1156:	
	line	389
	movlb 1	; select bank1
	bcf	(1125/8)^080h,(1125)&7
	line	402
	bsf	(1231/8)^080h,(1231)&7
	line	404
	
l3846:	
	opt asmopt_off
movlw  130
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	223
movwf	((??_main+0)+0+1),f
	movlw	232
movwf	((??_main+0)+0),f
u2967:
	decfsz	((??_main+0)+0),f
	goto	u2967
	decfsz	((??_main+0)+0+1),f
	goto	u2967
	decfsz	((??_main+0)+0+2),f
	goto	u2967
	clrwdt
opt asmopt_on

	line	406
	movlw	(0B4h)
	movlb 0	; select bank0
	movwf	(27)	;volatile
	line	407
	movlw	(04h)
	movwf	(28)	;volatile
	line	408
	movlw	(05Ah)
	movlb 5	; select bank5
	movwf	(657)^0280h	;volatile
	line	409
	movlw	(01Ch)
	movwf	(659)^0280h	;volatile
	line	430
	
l3848:	
	movlb 0	; select bank0
	bcf	(226/8),(226)&7
	line	434
	
l3850:	
	movlb 4	; select bank4
	bcf	(4265/8)^0200h,(4265)&7
	line	435
	
l3852:	
	bcf	(4264/8)^0200h,(4264)&7
	line	436
	
l3854:	
	movlw	0
	movlb 0	; select bank0
	movwf	(?_ReadMultiSector+3)
	movlw	0
	movwf	(?_ReadMultiSector+2)
	movlw	0
	movwf	(?_ReadMultiSector+1)
	movlw	0
	movwf	(?_ReadMultiSector)

	fcall	_ReadMultiSector
	line	437
	
l3856:	
	movlb 0	; select bank0
	bcf	(137/8),(137)&7
	line	438
	
l3858:	
	bsf	(226/8),(226)&7
	goto	l3860
	line	444
	
l1160:	
	goto	l3860
	line	450
	
l1161:	
	line	452
	
l3860:	
	movlw	(0FFh)
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	453
	goto	l1162
	
l1163:	
	
l1162:	
	btfss	(4256/8)^0200h,(4256)&7
	goto	u2801
	goto	u2800
u2801:
	goto	l1162
u2800:
	goto	l3862
	
l1164:	
	line	456
	
l3862:	
	movf	(529)^0200h,w	;volatile
	xorlw	0FEh&0ffh
	skipz
	goto	u2811
	goto	u2810
u2811:
	goto	l3860
u2810:
	goto	l3864
	
l1165:	
	line	457
	
l3864:	
	movlb 0	; select bank0
	clrf	(main@_ind)
	clrf	(main@_ind+1)
	
l3866:	
	movf	(main@_ind+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0100h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2825
	movlw	low(0100h)
	subwf	(main@_ind),w
u2825:

	skipc
	goto	u2821
	goto	u2820
u2821:
	goto	l3870
u2820:
	goto	l3886
	
l3868:	
	goto	l3886
	line	458
	
l1166:	
	line	460
	
l3870:	
	movlw	(0FFh)
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	461
	goto	l1168
	
l1169:	
	
l1168:	
	btfss	(4256/8)^0200h,(4256)&7
	goto	u2831
	goto	u2830
u2831:
	goto	l1168
u2830:
	goto	l3872
	
l1170:	
	line	462
	
l3872:	
	movf	(529)^0200h,w	;volatile
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@temp)
	line	465
	movlw	(0FFh)
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	467
	goto	l1171
	
l1172:	
	
l1171:	
	btfss	(4256/8)^0200h,(4256)&7
	goto	u2841
	goto	u2840
u2841:
	goto	l1171
u2840:
	goto	l3874
	
l1173:	
	line	468
	
l3874:	
	movf	(529)^0200h,w	;volatile
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@temp)
	line	470
	goto	l1174
	
l1175:	
	
l1174:	
	btfss	(137/8),(137)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l1174
u2850:
	goto	l3876
	
l1176:	
	line	472
	
l3876:	
	movf	(main@temp),w
	movwf	(??_main+0)+0
	movlw	01h
u2865:
	lsrf	(??_main+0)+0,f
	decfsz	wreg,f
	goto	u2865
	btfsc	0+(??_main+0)+0,0
	goto	u2871
	goto	u2870
	
u2871:
	movlb 5	; select bank5
	bsf	(5277/8)^0280h,(5277)&7
	goto	u2884
u2870:
	movlb 5	; select bank5
	bcf	(5277/8)^0280h,(5277)&7
u2884:
	line	473
	
l3878:	
	movlb 0	; select bank0
	btfsc	(main@temp),0
	goto	u2891
	goto	u2890
	
u2891:
	movlb 5	; select bank5
	bsf	(5276/8)^0280h,(5276)&7
	goto	u2904
u2890:
	movlb 5	; select bank5
	bcf	(5276/8)^0280h,(5276)&7
u2904:
	line	474
	movlb 0	; select bank0
	movf	(main@temp),w
	movwf	(??_main+0)+0
	movlw	02h
u2915:
	lsrf	(??_main+0)+0,f
	decfsz	wreg,f
	goto	u2915
	movf	0+(??_main+0)+0,w
	movlb 5	; select bank5
	movwf	(657)^0280h	;volatile
	line	475
	
l3880:	
	movlb 0	; select bank0
	bcf	(137/8),(137)&7
	line	457
	
l3882:	
	movlw	low(01h)
	addwf	(main@_ind),f
	movlw	high(01h)
	addwfc	(main@_ind+1),f
	
l3884:	
	movf	(main@_ind+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0100h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2925
	movlw	low(0100h)
	subwf	(main@_ind),w
u2925:

	skipc
	goto	u2921
	goto	u2920
u2921:
	goto	l3870
u2920:
	goto	l3886
	
l1167:	
	line	480
	
l3886:	
	movlw	(0FFh)
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	481
	goto	l1177
	
l1178:	
	
l1177:	
	btfss	(4256/8)^0200h,(4256)&7
	goto	u2931
	goto	u2930
u2931:
	goto	l1177
u2930:
	goto	l3888
	
l1179:	
	line	483
	
l3888:	
	movf	(529)^0200h,w	;volatile
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@temp)
	line	484
	movlw	(0FFh)
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	485
	goto	l1180
	
l1181:	
	
l1180:	
	btfss	(4256/8)^0200h,(4256)&7
	goto	u2941
	goto	u2940
u2941:
	goto	l1180
u2940:
	goto	l3890
	
l1182:	
	line	487
	
l3890:	
	movf	(529)^0200h,w	;volatile
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@temp)
	goto	l3860
	line	493
	
l1183:	
	line	444
	goto	l3860
	
l1184:	
	line	495
	
l1185:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_ReadMultiSector
psect	text221,local,class=CODE,delta=2
global __ptext221
__ptext221:

;; *************** function _ReadMultiSector *****************
;; Defined at:
;;		line 331 in file "../PIC12f1840Wav.c"
;; Parameters:    Size  Location     Type
;;  adress          4    0[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       4       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_sendSDCmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text221
	file	"../PIC12f1840Wav.c"
	line	331
	global	__size_of_ReadMultiSector
	__size_of_ReadMultiSector	equ	__end_of_ReadMultiSector-_ReadMultiSector
	
_ReadMultiSector:	
	opt	stack 13
; Regs used in _ReadMultiSector: [wreg+status,2+status,0+pclath+cstack]
	line	332
	
l1151:	
	line	334
	
l3822:	
	movlb 0	; select bank0
	movf	(ReadMultiSector@adress+3),w
	movwf	(?_sendSDCmd+3)
	movf	(ReadMultiSector@adress+2),w
	movwf	(?_sendSDCmd+2)
	movf	(ReadMultiSector@adress+1),w
	movwf	(?_sendSDCmd+1)
	movf	(ReadMultiSector@adress),w
	movwf	(?_sendSDCmd)

	movlw	(0FFh)
	movwf	(??_ReadMultiSector+0)+0
	movf	(??_ReadMultiSector+0)+0,w
	movwf	0+(?_sendSDCmd)+04h
	movlw	(012h)
	fcall	_sendSDCmd
	movf	(1+(?_sendSDCmd)),w
	movlb 0	; select bank0
	clrf	(_r+1)
	addwf	(_r+1)
	movf	(0+(?_sendSDCmd)),w
	clrf	(_r)
	addwf	(_r)

	line	336
	
l3824:	
	movf	((_r+1)),w
	iorwf	((_r)),w
	skipz
	goto	u2781
	goto	u2780
u2781:
	goto	l1151
u2780:
	goto	l1153
	
l1152:	
	line	339
;	Return value of _ReadMultiSector is never used
	
l1153:	
	return
	opt stack 0
GLOBAL	__end_of_ReadMultiSector
	__end_of_ReadMultiSector:
;; =============== function _ReadMultiSector ends ============

	signat	_ReadMultiSector,4217
	global	_initMedia
psect	text222,local,class=CODE,delta=2
global __ptext222
__ptext222:

;; *************** function _initMedia *****************
;; Defined at:
;;		line 226 in file "../PIC12f1840Wav.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               2    5[BANK0 ] int 
;;  r               2    7[BANK0 ] int 
;;  i               2    3[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2   11[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         0       6       0       0
;;      Temps:          0       3       0       0
;;      Totals:         2       9       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_spi_yaz
;;		_sendSDCmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text222
	file	"../PIC12f1840Wav.c"
	line	226
	global	__size_of_initMedia
	__size_of_initMedia	equ	__end_of_initMedia-_initMedia
	
_initMedia:	
	opt	stack 13
; Regs used in _initMedia: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	227
	
l3770:	
	movlw	0
	movlb 0	; select bank0
	movwf	(_adress+3)
	movlw	0
	movwf	(_adress+2)
	movlw	0
	movwf	(_adress+1)
	movlw	0
	movwf	(_adress)

	line	230
	
l3772:	
	bsf	(100/8),(100)&7
	line	231
	
l3774:	
	clrf	(initMedia@i)
	clrf	(initMedia@i+1)
	
l3776:	
	movf	(initMedia@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2725
	movlw	low(014h)
	subwf	(initMedia@i),w
u2725:

	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l3780
u2720:
	goto	l1136
	
l3778:	
	goto	l1136
	line	232
	
l1135:	
	
l3780:	
	movlw	(0FFh)
	fcall	_spi_yaz
	line	231
	
l3782:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(initMedia@i),f
	movlw	high(01h)
	addwfc	(initMedia@i+1),f
	
l3784:	
	movf	(initMedia@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2735
	movlw	low(014h)
	subwf	(initMedia@i),w
u2735:

	skipc
	goto	u2731
	goto	u2730
u2731:
	goto	l3780
u2730:
	
l1136:	
	line	236
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	237
	
l3786:	
	movf	(_adress+3),w
	movwf	(?_sendSDCmd+3)
	movf	(_adress+2),w
	movwf	(?_sendSDCmd+2)
	movf	(_adress+1),w
	movwf	(?_sendSDCmd+1)
	movf	(_adress),w
	movwf	(?_sendSDCmd)

	movlw	(095h)
	movwf	(??_initMedia+0)+0
	movf	(??_initMedia+0)+0,w
	movwf	0+(?_sendSDCmd)+04h
	movlw	(0)
	fcall	_sendSDCmd
	movf	(1+(?_sendSDCmd)),w
	movlb 0	; select bank0
	clrf	(initMedia@r+1)
	addwf	(initMedia@r+1)
	movf	(0+(?_sendSDCmd)),w
	clrf	(initMedia@r)
	addwf	(initMedia@r)

	line	240
	
l3788:	
	movlw	01h
	xorwf	(initMedia@r),w
	iorwf	(initMedia@r+1),w
	skipnz
	goto	u2741
	goto	u2740
u2741:
	goto	l3794
u2740:
	line	241
	
l3790:	
	movlw	low(084h)
	movwf	(?_initMedia)
	movlw	high(084h)
	movwf	((?_initMedia))+1
	goto	l1138
	
l3792:	
	goto	l1138
	
l1137:	
	line	257
	
l3794:	
	movlw	0
	movwf	(?_sendSDCmd+3)
	movlw	0
	movwf	(?_sendSDCmd+2)
	movlw	01h
	movwf	(?_sendSDCmd+1)
	movlw	0AAh
	movwf	(?_sendSDCmd)

	movlw	(087h)
	movwf	(??_initMedia+0)+0
	movf	(??_initMedia+0)+0,w
	movwf	0+(?_sendSDCmd)+04h
	movlw	(08h)
	fcall	_sendSDCmd
	movf	(1+(?_sendSDCmd)),w
	movlb 0	; select bank0
	clrf	(initMedia@r+1)
	addwf	(initMedia@r+1)
	movf	(0+(?_sendSDCmd)),w
	clrf	(initMedia@r)
	addwf	(initMedia@r)

	line	259
	
l3796:	
	opt asmopt_off
movlw  5
movwf	((??_initMedia+0)+0+2),f
movlw	15
movwf	((??_initMedia+0)+0+1),f
	movlw	244
movwf	((??_initMedia+0)+0),f
u2977:
	decfsz	((??_initMedia+0)+0),f
	goto	u2977
	decfsz	((??_initMedia+0)+0+1),f
	goto	u2977
	decfsz	((??_initMedia+0)+0+2),f
	goto	u2977
opt asmopt_on

	line	260
	
l3798:	
	movlb 0	; select bank0
	clrf	(initMedia@k)
	clrf	(initMedia@k+1)
	
l3800:	
	movf	(initMedia@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2755
	movlw	low(05h)
	subwf	(initMedia@k),w
u2755:

	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l3804
u2750:
	goto	l3810
	
l3802:	
	goto	l3810
	
l1139:	
	
l3804:	
	movlw	(0FFh)
	fcall	_spi_yaz
	movlb 0	; select bank0
	movwf	(??_initMedia+0)+0
	clrf	(??_initMedia+0)+0+1
	movf	0+(??_initMedia+0)+0,w
	movwf	(initMedia@r)
	movf	1+(??_initMedia+0)+0,w
	movwf	(initMedia@r+1)
	
l3806:	
	movlw	low(01h)
	addwf	(initMedia@k),f
	movlw	high(01h)
	addwfc	(initMedia@k+1),f
	
l3808:	
	movf	(initMedia@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2765
	movlw	low(05h)
	subwf	(initMedia@k),w
u2765:

	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l3804
u2760:
	goto	l3810
	
l1140:	
	line	264
	
l3810:	
	opt asmopt_off
movlw  5
	movlb 0	; select bank0
movwf	((??_initMedia+0)+0+2),f
movlw	15
movwf	((??_initMedia+0)+0+1),f
	movlw	244
movwf	((??_initMedia+0)+0),f
u2987:
	decfsz	((??_initMedia+0)+0),f
	goto	u2987
	decfsz	((??_initMedia+0)+0+1),f
	goto	u2987
	decfsz	((??_initMedia+0)+0+2),f
	goto	u2987
opt asmopt_on

	goto	l3812
	line	267
	
l1141:	
	line	269
	
l3812:	
	movlw	0
	movwf	(?_sendSDCmd+3)
	movlw	0
	movwf	(?_sendSDCmd+2)
	movlw	0
	movwf	(?_sendSDCmd+1)
	movlw	0
	movwf	(?_sendSDCmd)

	movlw	(0FFh)
	movlb 0	; select bank0
	movwf	(??_initMedia+0)+0
	movf	(??_initMedia+0)+0,w
	movwf	0+(?_sendSDCmd)+04h
	movlw	(037h)
	fcall	_sendSDCmd
	line	270
	
l3814:	
	movlw	040h
	movwf	(?_sendSDCmd+3)
	movlw	0
	movwf	(?_sendSDCmd+2)
	movlw	0
	movwf	(?_sendSDCmd+1)
	movlw	0
	movwf	(?_sendSDCmd)

	movlw	(0FFh)
	movlb 0	; select bank0
	movwf	(??_initMedia+0)+0
	movf	(??_initMedia+0)+0,w
	movwf	0+(?_sendSDCmd)+04h
	movlw	(069h)
	fcall	_sendSDCmd
	movf	(1+(?_sendSDCmd)),w
	movlb 0	; select bank0
	clrf	(initMedia@r+1)
	addwf	(initMedia@r+1)
	movf	(0+(?_sendSDCmd)),w
	clrf	(initMedia@r)
	addwf	(initMedia@r)

	line	272
	
l3816:	
	movf	((initMedia@r+1)),w
	iorwf	((initMedia@r)),w
	skipz
	goto	u2771
	goto	u2770
u2771:
	goto	l3812
u2770:
	
l1142:	
	line	291
	bsf	(100/8),(100)&7
	line	293
	
l3818:	
	clrf	(?_initMedia)
	clrf	(?_initMedia+1)
	goto	l1138
	
l3820:	
	line	296
	
l1138:	
	return
	opt stack 0
GLOBAL	__end_of_initMedia
	__end_of_initMedia:
;; =============== function _initMedia ends ============

	signat	_initMedia,90
	global	_InitSd
psect	text223,local,class=CODE,delta=2
global __ptext223
__ptext223:

;; *************** function _InitSd *****************
;; Defined at:
;;		line 323 in file "../PIC12f1840Wav.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_spi_hazirla
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text223
	file	"../PIC12f1840Wav.c"
	line	323
	global	__size_of_InitSd
	__size_of_InitSd	equ	__end_of_InitSd-_InitSd
	
_InitSd:	
	opt	stack 14
; Regs used in _InitSd: [status,2+status,0+pclath+cstack]
	line	324
	
l3766:	
	movlb 1	; select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	325
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	326
	
l3768:	
	fcall	_spi_hazirla
	line	327
	
l1148:	
	return
	opt stack 0
GLOBAL	__end_of_InitSd
	__end_of_InitSd:
;; =============== function _InitSd ends ============

	signat	_InitSd,88
	global	_sendSDCmd
psect	text224,local,class=CODE,delta=2
global __ptext224
__ptext224:

;; *************** function _sendSDCmd *****************
;; Defined at:
;;		line 63 in file "../PIC12f1840Wav.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;;  x               4    1[COMMON] unsigned long 
;;  frame           1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    1[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         5       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          4       0       0       0
;;      Totals:        10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_spi_yaz
;; This function is called by:
;;		_initMedia
;;		_ReadMultiSector
;;		_writeSector
;;		_readSector
;; This function uses a non-reentrant model
;;
psect	text224
	file	"../PIC12f1840Wav.c"
	line	63
	global	__size_of_sendSDCmd
	__size_of_sendSDCmd	equ	__end_of_sendSDCmd-_sendSDCmd
	
_sendSDCmd:	
	opt	stack 13
; Regs used in _sendSDCmd: [wreg+status,2+status,0+pclath+cstack]
	line	65
	movwf	(sendSDCmd@c)
	
l3738:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	66
	
l3740:	
	opt asmopt_off
movlw  13
movwf	((??_sendSDCmd+0)+0+2),f
movlw	45
movwf	((??_sendSDCmd+0)+0+1),f
	movlw	226
movwf	((??_sendSDCmd+0)+0),f
u2997:
	decfsz	((??_sendSDCmd+0)+0),f
	goto	u2997
	decfsz	((??_sendSDCmd+0)+0+1),f
	goto	u2997
	decfsz	((??_sendSDCmd+0)+0+2),f
	goto	u2997
	nop2
opt asmopt_on

	line	69
	
l3742:	
	movf	(sendSDCmd@c),w
	iorlw	040h
	fcall	_spi_yaz
	line	73
	
l3744:	
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	018h
u2675:
	lsrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u2670:
	decfsz	wreg,f
	goto	u2675
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	75
	
l3746:	
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	010h
u2685:
	lsrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u2680:
	decfsz	wreg,f
	goto	u2685
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	77
	
l3748:	
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	08h
u2695:
	lsrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u2690:
	decfsz	wreg,f
	goto	u2695
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	79
	
l3750:	
	movf	(sendSDCmd@x),w
	fcall	_spi_yaz
	line	81
	
l3752:	
	movf	(sendSDCmd@frame),w
	fcall	_spi_yaz
	line	85
	movlw	low(0Ah)
	movlb 0	; select bank0
	movwf	(_i)
	movlw	high(0Ah)
	movwf	((_i))+1
	goto	l3754
	line	86
	
l1105:	
	line	88
	
l3754:	
	movlw	(0FFh)
	fcall	_spi_yaz
	movwf	(??_sendSDCmd+0)+0
	clrf	(??_sendSDCmd+0)+0+1
	movf	0+(??_sendSDCmd+0)+0,w
	movlb 0	; select bank0
	movwf	(_r)
	movf	1+(??_sendSDCmd+0)+0,w
	movwf	(_r+1)
	line	89
	
l3756:	
	movlw	0FFh
	xorwf	(_r),w
	iorwf	(_r+1),w
	skipnz
	goto	u2701
	goto	u2700
u2701:
	goto	l3760
u2700:
	goto	l3762
	
l3758:	
	goto	l3762
	
l1106:	
	line	91
	
l3760:	
	movlw	low(01h)
	subwf	(_i),f
	movlw	high(01h)
	subwfb	(_i+1),f
	movf	(((_i+1))),w
	iorwf	(((_i))),w
	skipz
	goto	u2711
	goto	u2710
u2711:
	goto	l3754
u2710:
	goto	l3762
	
l1107:	
	line	93
	
l3762:	
	movf	(_r+1),w
	clrf	(?_sendSDCmd+1)
	addwf	(?_sendSDCmd+1)
	movf	(_r),w
	clrf	(?_sendSDCmd)
	addwf	(?_sendSDCmd)

	goto	l1108
	
l3764:	
	line	115
	
l1108:	
	return
	opt stack 0
GLOBAL	__end_of_sendSDCmd
	__end_of_sendSDCmd:
;; =============== function _sendSDCmd ends ============

	signat	_sendSDCmd,12410
	global	_spi_hazirla
psect	text225,local,class=CODE,delta=2
global __ptext225
__ptext225:

;; *************** function _spi_hazirla *****************
;; Defined at:
;;		line 303 in file "../PIC12f1840Wav.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;;		_InitSd
;; This function uses a non-reentrant model
;;
psect	text225
	file	"../PIC12f1840Wav.c"
	line	303
	global	__size_of_spi_hazirla
	__size_of_spi_hazirla	equ	__end_of_spi_hazirla-_spi_hazirla
	
_spi_hazirla:	
	opt	stack 14
; Regs used in _spi_hazirla: []
	line	309
	
l3736:	
	movlb 4	; select bank4
	bsf	(4269/8)^0200h,(4269)&7
	line	310
	bcf	(4268/8)^0200h,(4268)&7
	line	311
	bsf	(4262/8)^0200h,(4262)&7
	line	312
	bcf	(4263/8)^0200h,(4263)&7
	line	314
	bcf	(4267/8)^0200h,(4267)&7
	line	316
	bcf	(4266/8)^0200h,(4266)&7
	line	317
	bsf	(4265/8)^0200h,(4265)&7
	line	318
	bcf	(4264/8)^0200h,(4264)&7
	line	319
	
l1145:	
	return
	opt stack 0
GLOBAL	__end_of_spi_hazirla
	__end_of_spi_hazirla:
;; =============== function _spi_hazirla ends ============

	signat	_spi_hazirla,88
	global	_spi_yaz
psect	text226,local,class=CODE,delta=2
global __ptext226
__ptext226:

;; *************** function _spi_yaz *****************
;; Defined at:
;;		line 51 in file "../PIC12f1840Wav.c"
;; Parameters:    Size  Location     Type
;;  veri            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  veri            1    0[COMMON] unsigned char 
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
;;		_sendSDCmd
;;		_initMedia
;;		_writeSector
;;		_readSector
;; This function uses a non-reentrant model
;;
psect	text226
	file	"../PIC12f1840Wav.c"
	line	51
	global	__size_of_spi_yaz
	__size_of_spi_yaz	equ	__end_of_spi_yaz-_spi_yaz
	
_spi_yaz:	
	opt	stack 13
; Regs used in _spi_yaz: [wreg]
	line	53
	movwf	(spi_yaz@veri)
	
l3668:	
	movf	(spi_yaz@veri),w
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	55
	goto	l1099
	
l1100:	
	
l1099:	
	btfss	(4256/8)^0200h,(4256)&7
	goto	u2551
	goto	u2550
u2551:
	goto	l1099
u2550:
	goto	l3670
	
l1101:	
	line	57
	
l3670:	
	movf	(529)^0200h,w	;volatile
	goto	l1102
	
l3672:	
	line	59
	
l1102:	
	return
	opt stack 0
GLOBAL	__end_of_spi_yaz
	__end_of_spi_yaz:
;; =============== function _spi_yaz ends ============

	signat	_spi_yaz,4217
psect	text227,local,class=CODE,delta=2
global __ptext227
__ptext227:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
