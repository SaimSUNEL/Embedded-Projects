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
# 5 "../PICWAVPUREC4410016MHZ.c"
	psect config,class=CONFIG,delta=2 ;#
# 5 "../PICWAVPUREC4410016MHZ.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFF7F & 0xFFFF & 0xFFFF ;#
	FNCALL	_main,_InitSd
	FNCALL	_main,_initMedia
	FNCALL	_main,_ReadMultiSector
	FNCALL	_ReadMultiSector,_sendSDCmd
	FNCALL	_initMedia,_spi_yaz
	FNCALL	_initMedia,_sendSDCmd
	FNCALL	_InitSd,_spi_hazirla
	FNCALL	_sendSDCmd,_spi_yaz
	FNROOT	_main
	FNCALL	intlevel1,_INTERRUPT_FONKSYONU
	global	intlevel1
	FNROOT	intlevel1
	global	_gelen
	global	_adress
	global	_i
	global	_i2
	global	_r
	global	_r2
	global	_read_data
	global	_result
	global	_read_index
	global	_temp
	global	_music_data
	global	_available_data_size
	global	_c
	global	_load_index
	global	_w_temp
	global	_buffer
	global	_CCP1CON
psect	text344,local,class=CODE,delta=2
global __ptext344
__ptext344:
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTB
_PORTB	set	6
	global	_SSPBUF
_SSPBUF	set	19
	global	_T2CON
_T2CON	set	18
	global	_CARRY
_CARRY	set	24
	global	_CCP1X
_CCP1X	set	189
	global	_CCP1Y
_CCP1Y	set	188
	global	_CKP
_CKP	set	164
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RB5
_RB5	set	53
	global	_RB7
_RB7	set	55
	global	_SSPEN
_SSPEN	set	165
	global	_SSPM0
_SSPM0	set	160
	global	_SSPM1
_SSPM1	set	161
	global	_SSPM2
_SSPM2	set	162
	global	_SSPM3
_SSPM3	set	163
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_PR2
_PR2	set	146
	global	_TRISB
_TRISB	set	134
	global	_BF
_BF	set	1184
	global	_CKE
_CKE	set	1190
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TRISB7
_TRISB7	set	1079
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
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
_music_data:
       ds      2

_available_data_size:
       ds      1

_c:
       ds      1

_load_index:
       ds      1

_w_temp:
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

_i2:
       ds      2

_r:
       ds      2

_r2:
       ds      2

_read_data:
       ds      2

_result:
       ds      2

_read_index:
       ds      1

_temp:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_buffer:
       ds      64

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
	clrf	((__pbssCOMMON)+5)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+026h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+040h)
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
	global	?_spi_hazirla
?_spi_hazirla:	; 0 bytes @ 0x0
	global	?_InitSd
?_InitSd:	; 0 bytes @ 0x0
	global	?_INTERRUPT_FONKSYONU
?_INTERRUPT_FONKSYONU:	; 0 bytes @ 0x0
	global	??_INTERRUPT_FONKSYONU
??_INTERRUPT_FONKSYONU:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_spi_yaz
?_spi_yaz:	; 1 bytes @ 0x0
	ds	6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_spi_yaz
??_spi_yaz:	; 0 bytes @ 0x0
	global	??_spi_hazirla
??_spi_hazirla:	; 0 bytes @ 0x0
	global	??_InitSd
??_InitSd:	; 0 bytes @ 0x0
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
	global	?_ReadMultiSector
?_ReadMultiSector:	; 1 bytes @ 0xB
	global	?_initMedia
?_initMedia:	; 2 bytes @ 0xB
	global	ReadMultiSector@adress
ReadMultiSector@adress:	; 4 bytes @ 0xB
	ds	2
	global	??_initMedia
??_initMedia:	; 0 bytes @ 0xD
	ds	2
	global	??_ReadMultiSector
??_ReadMultiSector:	; 0 bytes @ 0xF
	global	initMedia@i
initMedia@i:	; 2 bytes @ 0xF
	ds	2
	global	initMedia@k
initMedia@k:	; 2 bytes @ 0x11
	ds	2
	global	initMedia@r
initMedia@r:	; 2 bytes @ 0x13
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x15
	ds	2
	global	main@k
main@k:	; 2 bytes @ 0x17
	ds	2
	global	main@index
main@index:	; 2 bytes @ 0x19
	ds	2
	global	main@total_read
main@total_read:	; 1 bytes @ 0x1B
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 108, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      12
;; BANK0           80     28      66
;; BANK1           80      0      64
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_sendSDCmd	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _INTERRUPT_FONKSYONU in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_initMedia
;;   _ReadMultiSector->_sendSDCmd
;;   _initMedia->_sendSDCmd
;;   _sendSDCmd->_spi_yaz
;;
;; Critical Paths under _INTERRUPT_FONKSYONU in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _INTERRUPT_FONKSYONU in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _INTERRUPT_FONKSYONU in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _INTERRUPT_FONKSYONU in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 9     9      0     885
;;                                             21 BANK0      7     7      0
;;                             _InitSd
;;                          _initMedia
;;                    _ReadMultiSector
;; ---------------------------------------------------------------------------------
;; (1) _ReadMultiSector                                      5     1      4     248
;;                                             11 BANK0      5     1      4
;;                          _sendSDCmd
;; ---------------------------------------------------------------------------------
;; (1) _initMedia                                           10     8      2     458
;;                                             11 BANK0     10     8      2
;;                            _spi_yaz
;;                          _sendSDCmd
;; ---------------------------------------------------------------------------------
;; (1) _InitSd                                               0     0      0       0
;;                        _spi_hazirla
;; ---------------------------------------------------------------------------------
;; (2) _sendSDCmd                                           10     5      5     217
;;                                              1 BANK0     10     5      5
;;                            _spi_yaz
;; ---------------------------------------------------------------------------------
;; (2) _spi_hazirla                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _spi_yaz                                              1     1      0      31
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _INTERRUPT_FONKSYONU                                  6     6      0       0
;;                                              0 COMMON     6     6      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
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
;; _INTERRUPT_FONKSYONU (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      8E       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     1C      42       5       82.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      40       7       80.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      91      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 458 in file "../PICWAVPUREC4410016MHZ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           2   25[BANK0 ] int 
;;  k               2   23[BANK0 ] int 
;;  total_read      1   27[BANK0 ] volatile unsigned char 
;;  data            1    0        unsigned char 
;;  rr              1    0        unsigned char 
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
;;      Locals:         0       5       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_InitSd
;;		_initMedia
;;		_ReadMultiSector
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PICWAVPUREC4410016MHZ.c"
	line	458
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	459
	
l3450:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	460
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	461
	
l3452:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	462
	
l3454:	
	bcf	(1085/8)^080h,(1085)&7
	line	463
	
l3456:	
	bsf	(1084/8)^080h,(1084)&7
	line	465
	
l3458:	
	fcall	_InitSd
	line	467
	
l3460:	
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3507:
	decfsz	((??_main+0)+0),f
	goto	u3507
	decfsz	((??_main+0)+0+1),f
	goto	u3507
	clrwdt
opt asmopt_on

	line	468
	
l3462:	
	fcall	_initMedia
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_initMedia)),w
	clrf	(_r+1)
	addwf	(_r+1)
	movf	(0+(?_initMedia)),w
	clrf	(_r)
	addwf	(_r)

	line	470
	
l3464:	
	movf	(_r+1),w
	iorwf	(_r),w
	skipnz
	goto	u3361
	goto	u3360
u3361:
	goto	l785
u3360:
	line	471
	
l3466:	
	bsf	(53/8),(53)&7
	goto	l783
	line	473
	
l782:	
	
l783:	
	goto	l783
	
l784:	
	line	474
	goto	l785
	line	475
	
l781:	
	line	479
	
l785:	
	line	483
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	498
	
l3468:	
	movlw	(016h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	499
	
l3470:	
	bsf	(189/8),(189)&7
	line	500
	
l3472:	
	bcf	(188/8),(188)&7
	line	502
	
l3474:	
	clrf	(main@k)
	clrf	(main@k+1)
	line	506
	
l3476:	
	movlw	(05Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	507
	
l3478:	
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	508
	
l3480:	
	movlw	(02Dh)
	movwf	(21)	;volatile
	line	509
	
l3482:	
	movlw	(01Ch)
	movwf	(23)	;volatile
	line	511
	
l3484:	
	bcf	(146/8),(146)&7
	line	516
	
l3486:	
	bcf	(161/8),(161)&7
	line	517
	
l3488:	
	bcf	(160/8),(160)&7
	line	519
	
l3490:	
	movlw	0
	movwf	(?_ReadMultiSector+3)
	movlw	0
	movwf	(?_ReadMultiSector+2)
	movlw	0
	movwf	(?_ReadMultiSector+1)
	movlw	0
	movwf	(?_ReadMultiSector)

	fcall	_ReadMultiSector
	line	522
	
l3492:	
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_read_index)	;volatile
	line	523
	
l3494:	
	bcf	(97/8),(97)&7
	line	524
	
l3496:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	525
	
l3498:	
	bsf	(94/8),(94)&7
	line	526
	
l3500:	
	bsf	(95/8),(95)&7
	line	530
	
l3502:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(146/8),(146)&7
	line	533
	
l3504:	
	clrf	(main@total_read)	;volatile
	goto	l3506
	line	535
	
l786:	
	goto	l3506
	line	540
	
l787:	
	line	542
	
l3506:	
	movlw	(0FFh)
	movwf	(19)	;volatile
	line	543
	goto	l788
	
l789:	
	
l788:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3371
	goto	u3370
u3371:
	goto	l788
u3370:
	goto	l3508
	
l790:	
	line	548
	
l3508:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	xorlw	0FEh
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l3506
u3380:
	
l791:	
	line	549
	clrf	(main@total_read)	;volatile
	line	552
	goto	l3540
	
l793:	
	line	555
	
l3510:	
	clrf	(main@index)
	clrf	(main@index+1)
	line	556
	goto	l3520
	
l795:	
	line	559
	
l3512:	
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	560
	goto	l796
	
l797:	
	
l796:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l796
u3390:
	goto	l3514
	
l798:	
	line	561
	
l3514:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_temp)
	line	563
	movlw	(0FFh)
	movwf	(19)	;volatile
	line	565
	goto	l799
	
l800:	
	
l799:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3401
	goto	u3400
u3401:
	goto	l799
u3400:
	goto	l3516
	
l801:	
	line	566
	
l3516:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_main+0)+0
	movf	(main@index),w
	addlw	_buffer&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l3518:	
	movlw	low(01h)
	addwf	(main@index),f
	skipnc
	incf	(main@index+1),f
	movlw	high(01h)
	addwf	(main@index+1),f
	goto	l3520
	line	568
	
l794:	
	line	556
	
l3520:	
	movf	(main@index+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(020h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3415
	movlw	low(020h)
	subwf	(main@index),w
u3415:

	skipc
	goto	u3411
	goto	u3410
u3411:
	goto	l3512
u3410:
	goto	l3522
	
l802:	
	line	572
	goto	l3522
	
l804:	
	goto	l3522
	
l803:	
	
l3522:	
	movlw	(021h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_read_index),w	;volatile
	skipnc
	goto	u3421
	goto	u3420
u3421:
	goto	l3522
u3420:
	goto	l3524
	
l805:	
	line	574
	
l3524:	
	movlw	low(020h)
	movwf	(main@index)
	movlw	high(020h)
	movwf	((main@index))+1
	line	575
	goto	l3534
	
l807:	
	line	578
	
l3526:	
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	579
	goto	l808
	
l809:	
	
l808:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3431
	goto	u3430
u3431:
	goto	l808
u3430:
	goto	l3528
	
l810:	
	line	580
	
l3528:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_temp)
	line	582
	movlw	(0FFh)
	movwf	(19)	;volatile
	line	584
	goto	l811
	
l812:	
	
l811:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3441
	goto	u3440
u3441:
	goto	l811
u3440:
	goto	l3530
	
l813:	
	line	585
	
l3530:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_main+0)+0
	movf	(main@index),w
	addlw	_buffer&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l3532:	
	movlw	low(01h)
	addwf	(main@index),f
	skipnc
	incf	(main@index+1),f
	movlw	high(01h)
	addwf	(main@index+1),f
	goto	l3534
	line	590
	
l806:	
	line	575
	
l3534:	
	movf	(main@index+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(040h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3455
	movlw	low(040h)
	subwf	(main@index),w
u3455:

	skipc
	goto	u3451
	goto	u3450
u3451:
	goto	l3526
u3450:
	goto	l3536
	
l814:	
	line	593
	goto	l3536
	
l816:	
	goto	l3536
	
l815:	
	
l3536:	
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_read_index),w	;volatile
	skipc
	goto	u3461
	goto	u3460
u3461:
	goto	l3536
u3460:
	goto	l3538
	
l817:	
	line	599
	
l3538:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@total_read),f	;volatile
	goto	l3540
	line	602
	
l792:	
	line	552
	
l3540:	
	movlw	(04h)
	subwf	(main@total_read),w	;volatile
	skipc
	goto	u3471
	goto	u3470
u3471:
	goto	l3510
u3470:
	goto	l3542
	
l818:	
	line	622
	
l3542:	
	movlw	(0FFh)
	movwf	(19)	;volatile
	line	623
	goto	l819
	
l820:	
	
l819:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3481
	goto	u3480
u3481:
	goto	l819
u3480:
	goto	l3544
	
l821:	
	line	625
	
l3544:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_temp)
	line	626
	movlw	(0FFh)
	movwf	(19)	;volatile
	line	627
	goto	l822
	
l823:	
	
l822:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3491
	goto	u3490
u3491:
	goto	l822
u3490:
	goto	l3546
	
l824:	
	line	629
	
l3546:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_temp)
	goto	l3506
	line	634
	
l825:	
	line	535
	goto	l3506
	
l826:	
	line	636
	
l827:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_ReadMultiSector
psect	text345,local,class=CODE,delta=2
global __ptext345
__ptext345:

;; *************** function _ReadMultiSector *****************
;; Defined at:
;;		line 409 in file "../PICWAVPUREC4410016MHZ.c"
;; Parameters:    Size  Location     Type
;;  adress          4   11[BANK0 ] long 
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_sendSDCmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text345
	file	"../PICWAVPUREC4410016MHZ.c"
	line	409
	global	__size_of_ReadMultiSector
	__size_of_ReadMultiSector	equ	__end_of_ReadMultiSector-_ReadMultiSector
	
_ReadMultiSector:	
	opt	stack 4
; Regs used in _ReadMultiSector: [wreg+status,2+status,0+pclath+cstack]
	line	410
	
l771:	
	line	412
	
l3442:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_sendSDCmd)),w
	clrf	(_r+1)
	addwf	(_r+1)
	movf	(0+(?_sendSDCmd)),w
	clrf	(_r)
	addwf	(_r)

	line	414
	
l3444:	
	movf	((_r+1)),w
	iorwf	((_r)),w
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l771
u3350:
	goto	l774
	
l772:	
	goto	l774
	line	415
	
l3446:	
	goto	l774
	
l3448:	
;	Return value of _ReadMultiSector is never used
	goto	l774
	
l773:	
	line	419
;	Return value of _ReadMultiSector is never used
	
l774:	
	return
	opt stack 0
GLOBAL	__end_of_ReadMultiSector
	__end_of_ReadMultiSector:
;; =============== function _ReadMultiSector ends ============

	signat	_ReadMultiSector,4217
	global	_initMedia
psect	text346,local,class=CODE,delta=2
global __ptext346
__ptext346:

;; *************** function _initMedia *****************
;; Defined at:
;;		line 274 in file "../PICWAVPUREC4410016MHZ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               2   17[BANK0 ] int 
;;  r               2   19[BANK0 ] int 
;;  i               2   15[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2   11[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_spi_yaz
;;		_sendSDCmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text346
	file	"../PICWAVPUREC4410016MHZ.c"
	line	274
	global	__size_of_initMedia
	__size_of_initMedia	equ	__end_of_initMedia-_initMedia
	
_initMedia:	
	opt	stack 4
; Regs used in _initMedia: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	275
	
l3390:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_adress+3)
	movlw	0
	movwf	(_adress+2)
	movlw	0
	movwf	(_adress+1)
	movlw	0
	movwf	(_adress)

	line	278
	
l3392:	
	bsf	(55/8),(55)&7
	line	279
	
l3394:	
	clrf	(initMedia@i)
	clrf	(initMedia@i+1)
	
l3396:	
	movf	(initMedia@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3295
	movlw	low(014h)
	subwf	(initMedia@i),w
u3295:

	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l3400
u3290:
	goto	l756
	
l3398:	
	goto	l756
	line	280
	
l755:	
	
l3400:	
	movlw	(0FFh)
	fcall	_spi_yaz
	line	279
	
l3402:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(initMedia@i),f
	skipnc
	incf	(initMedia@i+1),f
	movlw	high(01h)
	addwf	(initMedia@i+1),f
	
l3404:	
	movf	(initMedia@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3305
	movlw	low(014h)
	subwf	(initMedia@i),w
u3305:

	skipc
	goto	u3301
	goto	u3300
u3301:
	goto	l3400
u3300:
	
l756:	
	line	284
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	285
	
l3406:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_sendSDCmd)),w
	clrf	(initMedia@r+1)
	addwf	(initMedia@r+1)
	movf	(0+(?_sendSDCmd)),w
	clrf	(initMedia@r)
	addwf	(initMedia@r)

	line	290
	
l3408:	
	movlw	01h
	xorwf	(initMedia@r),w
	iorwf	(initMedia@r+1),w
	skipnz
	goto	u3311
	goto	u3310
u3311:
	goto	l3414
u3310:
	line	291
	
l3410:	
	movlw	low(084h)
	movwf	(?_initMedia)
	movlw	high(084h)
	movwf	((?_initMedia))+1
	goto	l758
	
l3412:	
	goto	l758
	
l757:	
	line	297
	
l3414:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_sendSDCmd)),w
	clrf	(initMedia@r+1)
	addwf	(initMedia@r+1)
	movf	(0+(?_sendSDCmd)),w
	clrf	(initMedia@r)
	addwf	(initMedia@r)

	line	299
	
l3416:	
	opt asmopt_off
movlw	33
movwf	((??_initMedia+0)+0+1),f
	movlw	118
movwf	((??_initMedia+0)+0),f
u3517:
	decfsz	((??_initMedia+0)+0),f
	goto	u3517
	decfsz	((??_initMedia+0)+0+1),f
	goto	u3517
	clrwdt
opt asmopt_on

	line	300
	
l3418:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(initMedia@k)
	clrf	(initMedia@k+1)
	
l3420:	
	movf	(initMedia@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3325
	movlw	low(05h)
	subwf	(initMedia@k),w
u3325:

	skipc
	goto	u3321
	goto	u3320
u3321:
	goto	l3424
u3320:
	goto	l3430
	
l3422:	
	goto	l3430
	
l759:	
	
l3424:	
	movlw	(0FFh)
	fcall	_spi_yaz
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initMedia+0)+0
	clrf	(??_initMedia+0)+0+1
	movf	0+(??_initMedia+0)+0,w
	movwf	(initMedia@r)
	movf	1+(??_initMedia+0)+0,w
	movwf	(initMedia@r+1)
	
l3426:	
	movlw	low(01h)
	addwf	(initMedia@k),f
	skipnc
	incf	(initMedia@k+1),f
	movlw	high(01h)
	addwf	(initMedia@k+1),f
	
l3428:	
	movf	(initMedia@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(05h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3335
	movlw	low(05h)
	subwf	(initMedia@k),w
u3335:

	skipc
	goto	u3331
	goto	u3330
u3331:
	goto	l3424
u3330:
	goto	l3430
	
l760:	
	line	304
	
l3430:	
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_initMedia+0)+0+1),f
	movlw	118
movwf	((??_initMedia+0)+0),f
u3527:
	decfsz	((??_initMedia+0)+0),f
	goto	u3527
	decfsz	((??_initMedia+0)+0+1),f
	goto	u3527
	clrwdt
opt asmopt_on

	goto	l3432
	line	306
	
l761:	
	line	308
	
l3432:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_sendSDCmd+3)
	movlw	0
	movwf	(?_sendSDCmd+2)
	movlw	0
	movwf	(?_sendSDCmd+1)
	movlw	0
	movwf	(?_sendSDCmd)

	movlw	(0FFh)
	movwf	(??_initMedia+0)+0
	movf	(??_initMedia+0)+0,w
	movwf	0+(?_sendSDCmd)+04h
	movlw	(037h)
	fcall	_sendSDCmd
	line	309
	
l3434:	
	movlw	040h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_sendSDCmd+3)
	movlw	0
	movwf	(?_sendSDCmd+2)
	movlw	0
	movwf	(?_sendSDCmd+1)
	movlw	0
	movwf	(?_sendSDCmd)

	movlw	(0FFh)
	movwf	(??_initMedia+0)+0
	movf	(??_initMedia+0)+0,w
	movwf	0+(?_sendSDCmd)+04h
	movlw	(069h)
	fcall	_sendSDCmd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_sendSDCmd)),w
	clrf	(initMedia@r+1)
	addwf	(initMedia@r+1)
	movf	(0+(?_sendSDCmd)),w
	clrf	(initMedia@r)
	addwf	(initMedia@r)

	line	311
	
l3436:	
	movf	((initMedia@r+1)),w
	iorwf	((initMedia@r)),w
	skipz
	goto	u3341
	goto	u3340
u3341:
	goto	l3432
u3340:
	
l762:	
	line	329
	bsf	(55/8),(55)&7
	line	343
	
l3438:	
	clrf	(?_initMedia)
	clrf	(?_initMedia+1)
	goto	l758
	
l3440:	
	line	346
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_initMedia
	__end_of_initMedia:
;; =============== function _initMedia ends ============

	signat	_initMedia,90
	global	_InitSd
psect	text347,local,class=CODE,delta=2
global __ptext347
__ptext347:

;; *************** function _InitSd *****************
;; Defined at:
;;		line 401 in file "../PICWAVPUREC4410016MHZ.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_spi_hazirla
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text347
	file	"../PICWAVPUREC4410016MHZ.c"
	line	401
	global	__size_of_InitSd
	__size_of_InitSd	equ	__end_of_InitSd-_InitSd
	
_InitSd:	
	opt	stack 5
; Regs used in _InitSd: [status,2+status,0+pclath+cstack]
	line	402
	
l3386:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1079/8)^080h,(1079)&7
	line	403
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7
	line	404
	
l3388:	
	fcall	_spi_hazirla
	line	405
	
l768:	
	return
	opt stack 0
GLOBAL	__end_of_InitSd
	__end_of_InitSd:
;; =============== function _InitSd ends ============

	signat	_InitSd,88
	global	_sendSDCmd
psect	text348,local,class=CODE,delta=2
global __ptext348
__ptext348:

;; *************** function _sendSDCmd *****************
;; Defined at:
;;		line 111 in file "../PICWAVPUREC4410016MHZ.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;;  x               4    1[BANK0 ] unsigned long 
;;  frame           1    5[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    1[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_spi_yaz
;; This function is called by:
;;		_initMedia
;;		_ReadMultiSector
;;		_writeSector
;;		_readSector
;; This function uses a non-reentrant model
;;
psect	text348
	file	"../PICWAVPUREC4410016MHZ.c"
	line	111
	global	__size_of_sendSDCmd
	__size_of_sendSDCmd	equ	__end_of_sendSDCmd-_sendSDCmd
	
_sendSDCmd:	
	opt	stack 4
; Regs used in _sendSDCmd: [wreg+status,2+status,0+pclath+cstack]
	line	113
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sendSDCmd@c)
	
l3358:	
	bcf	(55/8),(55)&7
	line	114
	
l3360:	
	opt asmopt_off
movlw	98
movwf	((??_sendSDCmd+0)+0+1),f
	movlw	101
movwf	((??_sendSDCmd+0)+0),f
u3537:
	decfsz	((??_sendSDCmd+0)+0),f
	goto	u3537
	decfsz	((??_sendSDCmd+0)+0+1),f
	goto	u3537
	nop2
opt asmopt_on

	line	117
	
l3362:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sendSDCmd@c),w
	iorlw	040h
	fcall	_spi_yaz
	line	121
	
l3364:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	018h
u3245:
	clrc
	rrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u3240:
	addlw	-1
	skipz
	goto	u3245
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	123
	
l3366:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	010h
u3255:
	clrc
	rrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u3250:
	addlw	-1
	skipz
	goto	u3255
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	125
	
l3368:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sendSDCmd@x),w
	movwf	(??_sendSDCmd+0)+0
	movf	(sendSDCmd@x+1),w
	movwf	((??_sendSDCmd+0)+0+1)
	movf	(sendSDCmd@x+2),w
	movwf	((??_sendSDCmd+0)+0+2)
	movf	(sendSDCmd@x+3),w
	movwf	((??_sendSDCmd+0)+0+3)
	movlw	08h
u3265:
	clrc
	rrf	(??_sendSDCmd+0)+3,f
	rrf	(??_sendSDCmd+0)+2,f
	rrf	(??_sendSDCmd+0)+1,f
	rrf	(??_sendSDCmd+0)+0,f
u3260:
	addlw	-1
	skipz
	goto	u3265
	movf	0+(??_sendSDCmd+0)+0,w
	fcall	_spi_yaz
	line	127
	
l3370:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sendSDCmd@x),w
	fcall	_spi_yaz
	line	129
	
l3372:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sendSDCmd@frame),w
	fcall	_spi_yaz
	line	133
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_i)
	movlw	high(0Ah)
	movwf	((_i))+1
	goto	l3374
	line	134
	
l725:	
	line	136
	
l3374:	
	movlw	(0FFh)
	fcall	_spi_yaz
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_sendSDCmd+0)+0
	clrf	(??_sendSDCmd+0)+0+1
	movf	0+(??_sendSDCmd+0)+0,w
	movwf	(_r)
	movf	1+(??_sendSDCmd+0)+0,w
	movwf	(_r+1)
	line	137
	
l3376:	
	movlw	0FFh
	xorwf	(_r),w
	iorwf	(_r+1),w
	skipnz
	goto	u3271
	goto	u3270
u3271:
	goto	l3380
u3270:
	goto	l3382
	
l3378:	
	goto	l3382
	
l726:	
	line	139
	
l3380:	
	movlw	low(01h)
	subwf	(_i),f
	movlw	high(01h)
	skipc
	decf	(_i+1),f
	subwf	(_i+1),f
	movf	(((_i+1))),w
	iorwf	(((_i))),w
	skipz
	goto	u3281
	goto	u3280
u3281:
	goto	l3374
u3280:
	goto	l3382
	
l727:	
	line	141
	
l3382:	
	movf	(_r+1),w
	clrf	(?_sendSDCmd+1)
	addwf	(?_sendSDCmd+1)
	movf	(_r),w
	clrf	(?_sendSDCmd)
	addwf	(?_sendSDCmd)

	goto	l728
	
l3384:	
	line	163
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_sendSDCmd
	__end_of_sendSDCmd:
;; =============== function _sendSDCmd ends ============

	signat	_sendSDCmd,12410
	global	_spi_hazirla
psect	text349,local,class=CODE,delta=2
global __ptext349
__ptext349:

;; *************** function _spi_hazirla *****************
;; Defined at:
;;		line 353 in file "../PICWAVPUREC4410016MHZ.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_InitSd
;; This function uses a non-reentrant model
;;
psect	text349
	file	"../PICWAVPUREC4410016MHZ.c"
	line	353
	global	__size_of_spi_hazirla
	__size_of_spi_hazirla	equ	__end_of_spi_hazirla-_spi_hazirla
	
_spi_hazirla:	
	opt	stack 5
; Regs used in _spi_hazirla: []
	line	360
	
l3356:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(165/8),(165)&7
	line	361
	bcf	(164/8),(164)&7
	line	362
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1190/8)^080h,(1190)&7
	line	364
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(163/8),(163)&7
	line	366
	bcf	(162/8),(162)&7
	line	367
	bsf	(161/8),(161)&7
	line	368
	bcf	(160/8),(160)&7
	line	397
	
l765:	
	return
	opt stack 0
GLOBAL	__end_of_spi_hazirla
	__end_of_spi_hazirla:
;; =============== function _spi_hazirla ends ============

	signat	_spi_hazirla,88
	global	_spi_yaz
psect	text350,local,class=CODE,delta=2
global __ptext350
__ptext350:

;; *************** function _spi_yaz *****************
;; Defined at:
;;		line 99 in file "../PICWAVPUREC4410016MHZ.c"
;; Parameters:    Size  Location     Type
;;  veri            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  veri            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sendSDCmd
;;		_initMedia
;;		_writeSector
;;		_readSector
;; This function uses a non-reentrant model
;;
psect	text350
	file	"../PICWAVPUREC4410016MHZ.c"
	line	99
	global	__size_of_spi_yaz
	__size_of_spi_yaz	equ	__end_of_spi_yaz-_spi_yaz
	
_spi_yaz:	
	opt	stack 4
; Regs used in _spi_yaz: [wreg]
	line	101
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(spi_yaz@veri)
	
l3288:	
	movf	(spi_yaz@veri),w
	movwf	(19)	;volatile
	line	103
	goto	l719
	
l720:	
	
l719:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3121
	goto	u3120
u3121:
	goto	l719
u3120:
	goto	l3290
	
l721:	
	line	105
	
l3290:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	goto	l722
	
l3292:	
	line	107
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_spi_yaz
	__end_of_spi_yaz:
;; =============== function _spi_yaz ends ============

	signat	_spi_yaz,4217
	global	_INTERRUPT_FONKSYONU
psect	text351,local,class=CODE,delta=2
global __ptext351
__ptext351:

;; *************** function _INTERRUPT_FONKSYONU *****************
;; Defined at:
;;		line 437 in file "../PICWAVPUREC4410016MHZ.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text351
	file	"../PICWAVPUREC4410016MHZ.c"
	line	437
	global	__size_of_INTERRUPT_FONKSYONU
	__size_of_INTERRUPT_FONKSYONU	equ	__end_of_INTERRUPT_FONKSYONU-_INTERRUPT_FONKSYONU
	
_INTERRUPT_FONKSYONU:	
	opt	stack 4
; Regs used in _INTERRUPT_FONKSYONU: [wreg-fsr0h+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_INTERRUPT_FONKSYONU+2)
	movf	fsr0,w
	movwf	(??_INTERRUPT_FONKSYONU+3)
	movf	pclath,w
	movwf	(??_INTERRUPT_FONKSYONU+4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_INTERRUPT_FONKSYONU+5)
	ljmp	_INTERRUPT_FONKSYONU
psect	text351
	line	438
	
i1l3080:	
	bcf	(95/8),(95)&7
	line	441
	
i1l3082:	
	movf	(_read_index),w
	addlw	_buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_INTERRUPT_FONKSYONU+0)+0
	clrf	(??_INTERRUPT_FONKSYONU+0)+0+1
	movf	0+(??_INTERRUPT_FONKSYONU+0)+0,w
	movwf	(_music_data)
	movf	1+(??_INTERRUPT_FONKSYONU+0)+0,w
	movwf	(_music_data+1)
	
i1l3084:	
	movlw	(01h)
	movwf	(??_INTERRUPT_FONKSYONU+0)+0
	movf	(??_INTERRUPT_FONKSYONU+0)+0,w
	addwf	(_read_index),f	;volatile
	line	444
	
i1l3086:	
	movf	(_music_data+1),w
	movwf	(??_INTERRUPT_FONKSYONU+0)+0+1
	movf	(_music_data),w
	movwf	(??_INTERRUPT_FONKSYONU+0)+0
	movlw	01h
u279_25:
	clrc
	rrf	(??_INTERRUPT_FONKSYONU+0)+1,f
	rrf	(??_INTERRUPT_FONKSYONU+0)+0,f
	addlw	-1
	skipz
	goto	u279_25
	btfsc	0+(??_INTERRUPT_FONKSYONU+0)+0,0
	goto	u280_21
	goto	u280_20
	
u280_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(189/8),(189)&7
	goto	u281_24
u280_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(189/8),(189)&7
u281_24:
	line	445
	
i1l3088:	
	btfsc	(_music_data),0
	goto	u282_21
	goto	u282_20
	
u282_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(188/8),(188)&7
	goto	u283_24
u282_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(188/8),(188)&7
u283_24:
	line	446
	
i1l3090:	
	movf	(_music_data+1),w
	movwf	(??_INTERRUPT_FONKSYONU+0)+0+1
	movf	(_music_data),w
	movwf	(??_INTERRUPT_FONKSYONU+0)+0
	movlw	02h
u284_25:
	clrc
	rrf	(??_INTERRUPT_FONKSYONU+0)+1,f
	rrf	(??_INTERRUPT_FONKSYONU+0)+0,f
	addlw	-1
	skipz
	goto	u284_25
	movf	0+(??_INTERRUPT_FONKSYONU+0)+0,w
	movwf	(21)	;volatile
	line	447
	
i1l3092:	
	bcf	(97/8),(97)&7
	line	448
	
i1l3094:	
	movf	(_read_index),w	;volatile
	xorlw	040h
	skipz
	goto	u285_21
	goto	u285_20
u285_21:
	goto	i1l777
u285_20:
	
i1l3096:	
	clrf	(_read_index)	;volatile
	
i1l777:	
	line	451
	bsf	(95/8),(95)&7
	line	453
	
i1l778:	
	movf	(??_INTERRUPT_FONKSYONU+5),w
	movwf	btemp+1
	movf	(??_INTERRUPT_FONKSYONU+4),w
	movwf	pclath
	movf	(??_INTERRUPT_FONKSYONU+3),w
	movwf	fsr0
	swapf	(??_INTERRUPT_FONKSYONU+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_INTERRUPT_FONKSYONU
	__end_of_INTERRUPT_FONKSYONU:
;; =============== function _INTERRUPT_FONKSYONU ends ============

	signat	_INTERRUPT_FONKSYONU,88
psect	text352,local,class=CODE,delta=2
global __ptext352
__ptext352:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
