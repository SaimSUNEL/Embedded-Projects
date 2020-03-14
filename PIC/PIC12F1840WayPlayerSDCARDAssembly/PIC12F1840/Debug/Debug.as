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
;;Data sizes: Strings 0, constant 0, data 0, bss 31, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     12      42
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
;; (0) _main                                                 8     8      0     492
;;                                              9 BANK0      3     3      0
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
;;ABS                  0      0      38       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50      C      2A       6       52.5%
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
;;DATA                 0      0      3B      11        0.0%
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
;;		line 344 in file "../PIC12f1840WavWithAssembly.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _ind            2    0        int 
;;  index           2    0        int 
;;  temp            1    0        unsigned char 
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
;;      Locals:         0       0       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
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
	file	"../PIC12f1840WavWithAssembly.c"
	line	344
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 13
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	346
	
l3940:	
	movlb 1	; select bank1
	bcf	(1225/8)^080h,(1225)&7
	line	347
	bcf	(1224/8)^080h,(1224)&7
	line	349
	bsf	(1230/8)^080h,(1230)&7
	line	350
	bsf	(1229/8)^080h,(1229)&7
	line	351
	bsf	(1228/8)^080h,(1228)&7
	line	352
	bcf	(1227/8)^080h,(1227)&7
	line	353
	bcf	(1231/8)^080h,(1231)&7
	line	360
	
l3942:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	361
	
l3944:	
	movlb 2	; select bank2
	bsf	(2280/8)^0100h,(2280)&7
	line	372
	
l3946:	
	movlb 1	; select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	373
	
l3948:	
	bcf	(1121/8)^080h,(1121)&7
	line	374
	
l3950:	
	bsf	(1122/8)^080h,(1122)&7
	line	379
	
l3952:	
	fcall	_InitSd
	line	381
	
l3954:	
	opt asmopt_off
movlw  5
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	15
movwf	((??_main+0)+0+1),f
	movlw	244
movwf	((??_main+0)+0),f
u2657:
	decfsz	((??_main+0)+0),f
	goto	u2657
	decfsz	((??_main+0)+0+1),f
	goto	u2657
	decfsz	((??_main+0)+0+2),f
	goto	u2657
opt asmopt_on

	line	382
	
l3956:	
	fcall	_initMedia
	movf	(1+(?_initMedia)),w
	movlb 0	; select bank0
	clrf	(_r+1)
	addwf	(_r+1)
	movf	(0+(?_initMedia)),w
	clrf	(_r)
	addwf	(_r)

	line	384
	
l3958:	
	movf	(_r+1),w
	iorwf	(_r),w
	skipnz
	goto	u2641
	goto	u2640
u2641:
	goto	l1156
u2640:
	goto	l1158
	line	387
	
l1157:	
	
l1158:	
	goto	l1158
	
l1159:	
	line	388
	
l1156:	
	line	390
	movlb 1	; select bank1
	bcf	(1125/8)^080h,(1125)&7
	line	409
	bsf	(1231/8)^080h,(1231)&7
	line	410
	
l3960:	
	opt asmopt_off
movlw  130
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	223
movwf	((??_main+0)+0+1),f
	movlw	232
movwf	((??_main+0)+0),f
u2667:
	decfsz	((??_main+0)+0),f
	goto	u2667
	decfsz	((??_main+0)+0+1),f
	goto	u2667
	decfsz	((??_main+0)+0+2),f
	goto	u2667
	clrwdt
opt asmopt_on

	line	412
	movlw	(0B4h)
	movlb 0	; select bank0
	movwf	(27)	;volatile
	line	413
	movlw	(04h)
	movwf	(28)	;volatile
	line	414
	movlw	(05Ah)
	movlb 5	; select bank5
	movwf	(657)^0280h	;volatile
	line	415
	movlw	(01Ch)
	movwf	(659)^0280h	;volatile
	line	440
	
l3962:	
	movlb 0	; select bank0
	bcf	(226/8),(226)&7
	line	444
	
l3964:	
	movlb 4	; select bank4
	bcf	(4265/8)^0200h,(4265)&7
	line	445
	
l3966:	
	bcf	(4264/8)^0200h,(4264)&7
	line	446
	
l3968:	
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
	line	447
	
l3970:	
	movlb 0	; select bank0
	bcf	(137/8),(137)&7
	line	448
	
l3972:	
	bsf	(226/8),(226)&7
	goto	l3974
	line	459
	
l1160:	
	line	473
	
l3974:	
# 473 "../PIC12f1840WavWithAssembly.c"
while_loop5: ;#
psect	maintext
	line	487
	
l3976:	
# 487 "../PIC12f1840WavWithAssembly.c"
                   movlb 4h ;#
psect	maintext
	line	489
	
l3978:	
# 489 "../PIC12f1840WavWithAssembly.c"
    start_karekteri_bekle: ;#
psect	maintext
	line	494
	
l3980:	
# 494 "../PIC12f1840WavWithAssembly.c"
    movlw 0xff ;#
psect	maintext
	line	495
	
l3982:	
# 495 "../PIC12f1840WavWithAssembly.c"
 movwf 0x11h ; ;#
psect	maintext
	line	504
	
l3984:	
# 504 "../PIC12f1840WavWithAssembly.c"
                dongu: ;#
psect	maintext
	line	505
	
l3986:	
# 505 "../PIC12f1840WavWithAssembly.c"
  btfss 0x14 , 0 ;#
psect	maintext
	line	506
	
l3988:	
# 506 "../PIC12f1840WavWithAssembly.c"
     goto dongu ; ;#
psect	maintext
	line	511
	
l3990:	
# 511 "../PIC12f1840WavWithAssembly.c"
         movf 0x11 , W ;#
psect	maintext
	line	513
	
l3992:	
# 513 "../PIC12f1840WavWithAssembly.c"
    XORLW 0xFE ;#
psect	maintext
	line	514
	
l3994:	
# 514 "../PIC12f1840WavWithAssembly.c"
  btfss 0x03 , 2 ;#
psect	maintext
	line	515
	
l3996:	
# 515 "../PIC12f1840WavWithAssembly.c"
  goto start_karekteri_bekle; ;#
psect	maintext
	line	520
	
l3998:	
# 520 "../PIC12f1840WavWithAssembly.c"
iorlw 0x1 ;#
psect	maintext
	line	523
	
l4000:	
# 523 "../PIC12f1840WavWithAssembly.c"
movlb 0h ;#
psect	maintext
	line	524
	
l4002:	
# 524 "../PIC12f1840WavWithAssembly.c"
movlw 0x00 ;#
psect	maintext
	line	525
	
l4004:	
# 525 "../PIC12f1840WavWithAssembly.c"
movwf 0x21 ;#
psect	maintext
	line	526
	
l4006:	
# 526 "../PIC12f1840WavWithAssembly.c"
for_loop : ;#
psect	maintext
	line	527
	
l4008:	
# 527 "../PIC12f1840WavWithAssembly.c"
btfsc 0x3 , 2 ;#
psect	maintext
	line	528
	
l4010:	
# 528 "../PIC12f1840WavWithAssembly.c"
goto for_loop_bitir; ;#
psect	maintext
	line	538
	
l4012:	
# 538 "../PIC12f1840WavWithAssembly.c"
         movlb 4h ;#
psect	maintext
	line	540
	
l4014:	
# 540 "../PIC12f1840WavWithAssembly.c"
     movlw 0xff ;#
psect	maintext
	line	542
	
l4016:	
# 542 "../PIC12f1840WavWithAssembly.c"
   movwf 0x11 ; ;#
psect	maintext
	line	548
	
l4018:	
# 548 "../PIC12f1840WavWithAssembly.c"
         dongu2: ;#
psect	maintext
	line	549
	
l4020:	
# 549 "../PIC12f1840WavWithAssembly.c"
  btfss 0x14 , 0 ;#
psect	maintext
	line	550
	
l4022:	
# 550 "../PIC12f1840WavWithAssembly.c"
     goto dongu2 ; ;#
psect	maintext
	line	554
	
l4024:	
# 554 "../PIC12f1840WavWithAssembly.c"
        movf 0x11 , W ;#
psect	maintext
	line	560
	
l4026:	
# 560 "../PIC12f1840WavWithAssembly.c"
movlw 0xff ;#
psect	maintext
	line	561
	
l4028:	
# 561 "../PIC12f1840WavWithAssembly.c"
 movwf 0x11 ; ;#
psect	maintext
	line	565
	
l4030:	
# 565 "../PIC12f1840WavWithAssembly.c"
     dongu3: ;#
psect	maintext
	line	566
	
l4032:	
# 566 "../PIC12f1840WavWithAssembly.c"
  btfss 0x14 , 0 ;#
psect	maintext
	line	567
	
l4034:	
# 567 "../PIC12f1840WavWithAssembly.c"
     goto dongu3 ; ;#
psect	maintext
	line	569
	
l4036:	
# 569 "../PIC12f1840WavWithAssembly.c"
    bcf 0x03, 5 ;#
psect	maintext
	line	571
	
l4038:	
# 571 "../PIC12f1840WavWithAssembly.c"
  movf 0x11 , W ;#
psect	maintext
	line	574
	
l4040:	
# 574 "../PIC12f1840WavWithAssembly.c"
      movlb 0h ;#
psect	maintext
	line	576
	
l4042:	
# 576 "../PIC12f1840WavWithAssembly.c"
  movwf 0x24 ;#
psect	maintext
	line	580
	
l4044:	
# 580 "../PIC12f1840WavWithAssembly.c"
       TMR2_loop: ;#
psect	maintext
	line	581
	
l4046:	
# 581 "../PIC12f1840WavWithAssembly.c"
btfss 0x011, 1 ;#
psect	maintext
	line	582
	
l4048:	
# 582 "../PIC12f1840WavWithAssembly.c"
goto TMR2_loop ;#
psect	maintext
	line	588
	
l4050:	
# 588 "../PIC12f1840WavWithAssembly.c"
       movlb 0h ;#
psect	maintext
	line	591
	
l4052:	
# 591 "../PIC12f1840WavWithAssembly.c"
    btfss 0x24 , 1 ;#
psect	maintext
	line	592
	
l4054:	
# 592 "../PIC12f1840WavWithAssembly.c"
        goto CCP1X_SIFIRLA; ;#
psect	maintext
	line	594
	
l4056:	
# 594 "../PIC12f1840WavWithAssembly.c"
           movlb 5h ;#
psect	maintext
	line	595
	
l4058:	
# 595 "../PIC12f1840WavWithAssembly.c"
        bsf 0x13, 5 ;#
psect	maintext
	line	596
	
l4060:	
# 596 "../PIC12f1840WavWithAssembly.c"
        goto devam_et; ;#
psect	maintext
	line	598
	
l4062:	
# 598 "../PIC12f1840WavWithAssembly.c"
        CCP1X_SIFIRLA: ;#
psect	maintext
	line	599
	
l4064:	
# 599 "../PIC12f1840WavWithAssembly.c"
        movlb 5h ;#
psect	maintext
	line	600
	
l4066:	
# 600 "../PIC12f1840WavWithAssembly.c"
  bcf 0x13 , 5 ;#
psect	maintext
	line	601
	
l4068:	
# 601 "../PIC12f1840WavWithAssembly.c"
        devam_et: ;#
psect	maintext
	line	604
	
l4070:	
# 604 "../PIC12f1840WavWithAssembly.c"
    movlb 0h ;#
psect	maintext
	line	605
	
l4072:	
# 605 "../PIC12f1840WavWithAssembly.c"
btfss 0x24 , 0 ;#
psect	maintext
	line	606
	
l4074:	
# 606 "../PIC12f1840WavWithAssembly.c"
goto CCP1Y_SIFIRLA; ;#
psect	maintext
	line	607
	
l4076:	
# 607 "../PIC12f1840WavWithAssembly.c"
movlb 5h ;#
psect	maintext
	line	608
	
l4078:	
# 608 "../PIC12f1840WavWithAssembly.c"
bsf 0x13 , 4 ;#
psect	maintext
	line	610
	
l4080:	
# 610 "../PIC12f1840WavWithAssembly.c"
goto devam_et2; ;#
psect	maintext
	line	611
	
l4082:	
# 611 "../PIC12f1840WavWithAssembly.c"
CCP1Y_SIFIRLA: ;#
psect	maintext
	line	612
	
l4084:	
# 612 "../PIC12f1840WavWithAssembly.c"
movlb 5h ;#
psect	maintext
	line	613
	
l4086:	
# 613 "../PIC12f1840WavWithAssembly.c"
bcf 0x13 , 4 ;#
psect	maintext
	line	615
	
l4088:	
# 615 "../PIC12f1840WavWithAssembly.c"
devam_et2: ;#
psect	maintext
	line	618
	
l4090:	
# 618 "../PIC12f1840WavWithAssembly.c"
movlb 0h ;#
psect	maintext
	line	619
	
l4092:	
# 619 "../PIC12f1840WavWithAssembly.c"
rrf 0x24 , W ;#
psect	maintext
	line	620
	
l4094:	
# 620 "../PIC12f1840WavWithAssembly.c"
movwf 0x25 ;#
psect	maintext
	line	621
	
l4096:	
# 621 "../PIC12f1840WavWithAssembly.c"
rrf 0x25 , W ;#
psect	maintext
	line	622
	
l4098:	
# 622 "../PIC12f1840WavWithAssembly.c"
ANDLW 0x3f ;#
psect	maintext
	line	623
	
l4100:	
# 623 "../PIC12f1840WavWithAssembly.c"
movlb 5h ;#
psect	maintext
	line	624
	
l4102:	
# 624 "../PIC12f1840WavWithAssembly.c"
movwf 0x11 ;#
psect	maintext
	line	628
	
l4104:	
# 628 "../PIC12f1840WavWithAssembly.c"
  movlb 0h ;#
psect	maintext
	line	630
	
l4106:	
# 630 "../PIC12f1840WavWithAssembly.c"
 bcf 0x11 , 1 ;#
psect	maintext
	line	632
	
l4108:	
# 632 "../PIC12f1840WavWithAssembly.c"
decf 0x21 , F ;#
psect	maintext
	line	634
	
l4110:	
# 634 "../PIC12f1840WavWithAssembly.c"
goto for_loop ; ;#
psect	maintext
	line	636
	
l4112:	
# 636 "../PIC12f1840WavWithAssembly.c"
for_loop_bitir: ;#
psect	maintext
	line	648
	
l4114:	
# 648 "../PIC12f1840WavWithAssembly.c"
                             movlb 4h ;#
psect	maintext
	line	649
	
l4116:	
# 649 "../PIC12f1840WavWithAssembly.c"
 movlw 0xff ;#
psect	maintext
	line	650
	
l4118:	
# 650 "../PIC12f1840WavWithAssembly.c"
 movwf 0x11 ; ;#
psect	maintext
	line	654
	
l4120:	
# 654 "../PIC12f1840WavWithAssembly.c"
      dongu5: ;#
psect	maintext
	line	655
	
l4122:	
# 655 "../PIC12f1840WavWithAssembly.c"
  btfss 0x14 , 0 ;#
psect	maintext
	line	656
	
l4124:	
# 656 "../PIC12f1840WavWithAssembly.c"
     goto dongu5 ; ;#
psect	maintext
	line	660
	
l4126:	
# 660 "../PIC12f1840WavWithAssembly.c"
        movf 0x11 , W ;#
psect	maintext
	line	666
	
l4128:	
# 666 "../PIC12f1840WavWithAssembly.c"
                  movlw 0xff ;#
psect	maintext
	line	667
	
l4130:	
# 667 "../PIC12f1840WavWithAssembly.c"
 movwf 0x11 ; ;#
psect	maintext
	line	671
	
l4132:	
# 671 "../PIC12f1840WavWithAssembly.c"
     dongu6: ;#
psect	maintext
	line	672
	
l4134:	
# 672 "../PIC12f1840WavWithAssembly.c"
  btfss 0x14 , 0 ;#
psect	maintext
	line	673
	
l4136:	
# 673 "../PIC12f1840WavWithAssembly.c"
     goto dongu6 ; ;#
psect	maintext
	line	676
	
l4138:	
# 676 "../PIC12f1840WavWithAssembly.c"
      movf 0x11 , W ;#
psect	maintext
	line	679
	
l4140:	
# 679 "../PIC12f1840WavWithAssembly.c"
      goto while_loop5 ;#
psect	maintext
	goto	l3974
	line	682
	
l1161:	
	line	459
	goto	l3974
	
l1162:	
	line	684
	
l1163:	
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
;;		line 332 in file "../PIC12f1840WavWithAssembly.c"
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
	file	"../PIC12f1840WavWithAssembly.c"
	line	332
	global	__size_of_ReadMultiSector
	__size_of_ReadMultiSector	equ	__end_of_ReadMultiSector-_ReadMultiSector
	
_ReadMultiSector:	
	opt	stack 13
; Regs used in _ReadMultiSector: [wreg+status,2+status,0+pclath+cstack]
	line	333
	
l1151:	
	line	335
	
l3936:	
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

	line	337
	
l3938:	
	movf	((_r+1)),w
	iorwf	((_r)),w
	skipz
	goto	u2631
	goto	u2630
u2631:
	goto	l1151
u2630:
	goto	l1153
	
l1152:	
	line	340
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
;;		line 227 in file "../PIC12f1840WavWithAssembly.c"
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
	file	"../PIC12f1840WavWithAssembly.c"
	line	227
	global	__size_of_initMedia
	__size_of_initMedia	equ	__end_of_initMedia-_initMedia
	
_initMedia:	
	opt	stack 13
; Regs used in _initMedia: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	228
	
l3884:	
	movlw	0
	movlb 0	; select bank0
	movwf	(_adress+3)
	movlw	0
	movwf	(_adress+2)
	movlw	0
	movwf	(_adress+1)
	movlw	0
	movwf	(_adress)

	line	231
	
l3886:	
	bsf	(100/8),(100)&7
	line	232
	
l3888:	
	clrf	(initMedia@i)
	clrf	(initMedia@i+1)
	
l3890:	
	movf	(initMedia@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2575
	movlw	low(014h)
	subwf	(initMedia@i),w
u2575:

	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l3894
u2570:
	goto	l1136
	
l3892:	
	goto	l1136
	line	233
	
l1135:	
	
l3894:	
	movlw	(0FFh)
	fcall	_spi_yaz
	line	232
	
l3896:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(initMedia@i),f
	movlw	high(01h)
	addwfc	(initMedia@i+1),f
	
l3898:	
	movf	(initMedia@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2585
	movlw	low(014h)
	subwf	(initMedia@i),w
u2585:

	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l3894
u2580:
	
l1136:	
	line	237
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	238
	
l3900:	
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

	line	241
	
l3902:	
	movlw	01h
	xorwf	(initMedia@r),w
	iorwf	(initMedia@r+1),w
	skipnz
	goto	u2591
	goto	u2590
u2591:
	goto	l3908
u2590:
	line	242
	
l3904:	
	movlw	low(084h)
	movwf	(?_initMedia)
	movlw	high(084h)
	movwf	((?_initMedia))+1
	goto	l1138
	
l3906:	
	goto	l1138
	
l1137:	
	line	258
	
l3908:	
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

	line	260
	
l3910:	
	opt asmopt_off
movlw  5
movwf	((??_initMedia+0)+0+2),f
movlw	15
movwf	((??_initMedia+0)+0+1),f
	movlw	244
movwf	((??_initMedia+0)+0),f
u2677:
	decfsz	((??_initMedia+0)+0),f
	goto	u2677
	decfsz	((??_initMedia+0)+0+1),f
	goto	u2677
	decfsz	((??_initMedia+0)+0+2),f
	goto	u2677
opt asmopt_on

	line	261
	
l3912:	
	movlb 0	; select bank0
	clrf	(initMedia@k)
	clrf	(initMedia@k+1)
	
l3914:	
	movf	(initMedia@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2605
	movlw	low(05h)
	subwf	(initMedia@k),w
u2605:

	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l3918
u2600:
	goto	l3924
	
l3916:	
	goto	l3924
	
l1139:	
	
l3918:	
	movlw	(0FFh)
	fcall	_spi_yaz
	movlb 0	; select bank0
	movwf	(??_initMedia+0)+0
	clrf	(??_initMedia+0)+0+1
	movf	0+(??_initMedia+0)+0,w
	movwf	(initMedia@r)
	movf	1+(??_initMedia+0)+0,w
	movwf	(initMedia@r+1)
	
l3920:	
	movlw	low(01h)
	addwf	(initMedia@k),f
	movlw	high(01h)
	addwfc	(initMedia@k+1),f
	
l3922:	
	movf	(initMedia@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2615
	movlw	low(05h)
	subwf	(initMedia@k),w
u2615:

	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l3918
u2610:
	goto	l3924
	
l1140:	
	line	265
	
l3924:	
	opt asmopt_off
movlw  5
	movlb 0	; select bank0
movwf	((??_initMedia+0)+0+2),f
movlw	15
movwf	((??_initMedia+0)+0+1),f
	movlw	244
movwf	((??_initMedia+0)+0),f
u2687:
	decfsz	((??_initMedia+0)+0),f
	goto	u2687
	decfsz	((??_initMedia+0)+0+1),f
	goto	u2687
	decfsz	((??_initMedia+0)+0+2),f
	goto	u2687
opt asmopt_on

	goto	l3926
	line	268
	
l1141:	
	line	270
	
l3926:	
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
	line	271
	
l3928:	
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

	line	273
	
l3930:	
	movf	((initMedia@r+1)),w
	iorwf	((initMedia@r)),w
	skipz
	goto	u2621
	goto	u2620
u2621:
	goto	l3926
u2620:
	
l1142:	
	line	292
	bsf	(100/8),(100)&7
	line	294
	
l3932:	
	clrf	(?_initMedia)
	clrf	(?_initMedia+1)
	goto	l1138
	
l3934:	
	line	297
	
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
;;		line 324 in file "../PIC12f1840WavWithAssembly.c"
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
	file	"../PIC12f1840WavWithAssembly.c"
	line	324
	global	__size_of_InitSd
	__size_of_InitSd	equ	__end_of_InitSd-_InitSd
	
_InitSd:	
	opt	stack 14
; Regs used in _InitSd: [status,2+status,0+pclath+cstack]
	line	325
	
l3880:	
	movlb 1	; select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	326
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	327
	
l3882:	
	fcall	_spi_hazirla
	line	328
	
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
;;		line 64 in file "../PIC12f1840WavWithAssembly.c"
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
	file	"../PIC12f1840WavWithAssembly.c"
	line	64
	global	__size_of_sendSDCmd
	__size_of_sendSDCmd	equ	__end_of_sendSDCmd-_sendSDCmd
	
_sendSDCmd:	
	opt	stack 13
; Regs used in _sendSDCmd: [wreg+status,2+status,0+pclath+cstack]
	line	66
	movwf	(sendSDCmd@c)
	
l3852:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	67
	
l3854:	
	opt asmopt_off
movlw  13
movwf	((??_sendSDCmd+0)+0+2),f
movlw	45
movwf	((??_sendSDCmd+0)+0+1),f
	movlw	226
movwf	((??_sendSDCmd+0)+0),f
u2697:
	decfsz	((??_sendSDCmd+0)+0),f
	goto	u2697
	decfsz	((??_sendSDCmd+0)+0+1),f
	goto	u2697
	decfsz	((??_sendSDCmd+0)+0+2),f
	goto	u2697
	nop2
opt asmopt_on

	line	70
	
l3856:	
	movf	(sendSDCmd@c),w
	iorlw	040h
	fcall	_spi_yaz
	line	74
	
l3858:	
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	018h
u2525:
	lsrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u2520:
	decfsz	wreg,f
	goto	u2525
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	76
	
l3860:	
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	010h
u2535:
	lsrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u2530:
	decfsz	wreg,f
	goto	u2535
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	78
	
l3862:	
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	08h
u2545:
	lsrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u2540:
	decfsz	wreg,f
	goto	u2545
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	80
	
l3864:	
	movf	(sendSDCmd@x),w
	fcall	_spi_yaz
	line	82
	
l3866:	
	movf	(sendSDCmd@frame),w
	fcall	_spi_yaz
	line	86
	movlw	low(0Ah)
	movlb 0	; select bank0
	movwf	(_i)
	movlw	high(0Ah)
	movwf	((_i))+1
	goto	l3868
	line	87
	
l1105:	
	line	89
	
l3868:	
	movlw	(0FFh)
	fcall	_spi_yaz
	movwf	(??_sendSDCmd+0)+0
	clrf	(??_sendSDCmd+0)+0+1
	movf	0+(??_sendSDCmd+0)+0,w
	movlb 0	; select bank0
	movwf	(_r)
	movf	1+(??_sendSDCmd+0)+0,w
	movwf	(_r+1)
	line	90
	
l3870:	
	movlw	0FFh
	xorwf	(_r),w
	iorwf	(_r+1),w
	skipnz
	goto	u2551
	goto	u2550
u2551:
	goto	l3874
u2550:
	goto	l3876
	
l3872:	
	goto	l3876
	
l1106:	
	line	92
	
l3874:	
	movlw	low(01h)
	subwf	(_i),f
	movlw	high(01h)
	subwfb	(_i+1),f
	movf	(((_i+1))),w
	iorwf	(((_i))),w
	skipz
	goto	u2561
	goto	u2560
u2561:
	goto	l3868
u2560:
	goto	l3876
	
l1107:	
	line	94
	
l3876:	
	movf	(_r+1),w
	clrf	(?_sendSDCmd+1)
	addwf	(?_sendSDCmd+1)
	movf	(_r),w
	clrf	(?_sendSDCmd)
	addwf	(?_sendSDCmd)

	goto	l1108
	
l3878:	
	line	116
	
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
;;		line 304 in file "../PIC12f1840WavWithAssembly.c"
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
	file	"../PIC12f1840WavWithAssembly.c"
	line	304
	global	__size_of_spi_hazirla
	__size_of_spi_hazirla	equ	__end_of_spi_hazirla-_spi_hazirla
	
_spi_hazirla:	
	opt	stack 14
; Regs used in _spi_hazirla: []
	line	310
	
l3850:	
	movlb 4	; select bank4
	bsf	(4269/8)^0200h,(4269)&7
	line	311
	bcf	(4268/8)^0200h,(4268)&7
	line	312
	bsf	(4262/8)^0200h,(4262)&7
	line	313
	bcf	(4263/8)^0200h,(4263)&7
	line	315
	bcf	(4267/8)^0200h,(4267)&7
	line	317
	bcf	(4266/8)^0200h,(4266)&7
	line	318
	bsf	(4265/8)^0200h,(4265)&7
	line	319
	bcf	(4264/8)^0200h,(4264)&7
	line	320
	
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
;;		line 52 in file "../PIC12f1840WavWithAssembly.c"
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
	file	"../PIC12f1840WavWithAssembly.c"
	line	52
	global	__size_of_spi_yaz
	__size_of_spi_yaz	equ	__end_of_spi_yaz-_spi_yaz
	
_spi_yaz:	
	opt	stack 13
; Regs used in _spi_yaz: [wreg]
	line	54
	movwf	(spi_yaz@veri)
	
l3782:	
	movf	(spi_yaz@veri),w
	movlb 4	; select bank4
	movwf	(529)^0200h	;volatile
	line	56
	goto	l1099
	
l1100:	
	
l1099:	
	btfss	(4256/8)^0200h,(4256)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l1099
u2400:
	goto	l3784
	
l1101:	
	line	58
	
l3784:	
	movf	(529)^0200h,w	;volatile
	goto	l1102
	
l3786:	
	line	60
	
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
