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
	FNCALL	_main,_spi_hazirla
	FNCALL	_main,_spi_yaz
	FNCALL	_main,_spi_oku
	FNROOT	_main
	global	_data
	global	_count
	global	_c
	global	_gelen
	global	_ikinci
	global	_veri
	global	_PORTB
psect	text100,local,class=CODE,delta=2
global __ptext100
__ptext100:
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_SSPBUF
_SSPBUF	set	19
	global	_CARRY
_CARRY	set	24
	global	_CKP
_CKP	set	164
	global	_GIE
_GIE	set	95
	global	_RB1
_RB1	set	49
	global	_RC0
_RC0	set	56
	global	_SSPEN
_SSPEN	set	165
	global	_SSPIF
_SSPIF	set	99
	global	_SSPM0
_SSPM0	set	160
	global	_SSPM1
_SSPM1	set	161
	global	_SSPM2
_SSPM2	set	162
	global	_SSPM3
_SSPM3	set	163
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_BF
_BF	set	1184
	global	_CKE
_CKE	set	1190
	global	_SMP
_SMP	set	1191
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
_count:
       ds      2

_c:
       ds      1

_gelen:
       ds      1

_ikinci:
       ds      1

_veri:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_data:
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
	clrf	((__pbssCOMMON)+5)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+032h)
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
	global	??_spi_hazirla
??_spi_hazirla:	; 0 bytes @ 0x0
	global	??_spi_yaz
??_spi_yaz:	; 0 bytes @ 0x0
	global	??_spi_oku
??_spi_oku:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_spi_yaz
?_spi_yaz:	; 1 bytes @ 0x0
	global	?_spi_oku
?_spi_oku:	; 1 bytes @ 0x0
	global	spi_yaz@veri
spi_yaz@veri:	; 1 bytes @ 0x0
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1
	ds	3
	global	main@b
main@b:	; 2 bytes @ 0x4
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 56, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      12
;; BANK0           80      0      50
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_spi_yaz
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0      75
;;                                              1 COMMON     5     5      0
;;                        _spi_hazirla
;;                            _spi_yaz
;;                            _spi_oku
;; ---------------------------------------------------------------------------------
;; (1) _spi_oku                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _spi_yaz                                              1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _spi_hazirla                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _spi_hazirla
;;   _spi_yaz
;;   _spi_oku
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
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0      3E       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0      32       5       62.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      3F      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 134 in file "../SPIEEprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  b               2    4[COMMON] int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_spi_hazirla
;;		_spi_yaz
;;		_spi_oku
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../SPIEEprom.c"
	line	134
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	136
	
l2644:	
	movlw	(08h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	138
	
l2646:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	139
	
l2648:	
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	140
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	141
	
l2650:	
	bsf	(56/8),(56)&7
	line	142
	
l2652:	
	fcall	_spi_hazirla
	line	143
	
l2654:	
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2287:
	decfsz	((??_main+0)+0),f
	goto	u2287
	decfsz	((??_main+0)+0+1),f
	goto	u2287
	decfsz	((??_main+0)+0+2),f
	goto	u2287
	nop2
opt asmopt_on

	line	144
	
l2656:	
	opt asmopt_off
movlw  11
movwf	((??_main+0)+0+2),f
movlw	38
movwf	((??_main+0)+0+1),f
	movlw	102
movwf	((??_main+0)+0),f
u2297:
	decfsz	((??_main+0)+0),f
	goto	u2297
	decfsz	((??_main+0)+0+1),f
	goto	u2297
	decfsz	((??_main+0)+0+2),f
	goto	u2297
	nop2
opt asmopt_on

	line	146
	
l2658:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	148
	
l2660:	
	movlw	(06h)
	fcall	_spi_yaz
	line	150
	
l2662:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	152
	
l2664:	
	bcf	(56/8),(56)&7
	line	153
	
l2666:	
	movlw	(02h)
	fcall	_spi_yaz
	line	154
	
l2668:	
	movlw	(03h)
	fcall	_spi_yaz
	line	155
	
l2670:	
	movlw	(053h)
	fcall	_spi_yaz
	line	156
	
l2672:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	157
	
l2674:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2307:
	decfsz	((??_main+0)+0),f
	goto	u2307
	decfsz	((??_main+0)+0+1),f
	goto	u2307
opt asmopt_on

	line	158
	
l2676:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	162
	
l2678:	
	bcf	(56/8),(56)&7
	line	164
	
l2680:	
	movlw	(06h)
	fcall	_spi_yaz
	line	166
	
l2682:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	168
	
l2684:	
	bcf	(56/8),(56)&7
	line	169
	
l2686:	
	movlw	(02h)
	fcall	_spi_yaz
	line	170
	
l2688:	
	movlw	(04h)
	fcall	_spi_yaz
	line	171
	
l2690:	
	movlw	(041h)
	fcall	_spi_yaz
	line	172
	
l2692:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	173
	
l2694:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2317:
	decfsz	((??_main+0)+0),f
	goto	u2317
	decfsz	((??_main+0)+0+1),f
	goto	u2317
opt asmopt_on

	line	174
	
l2696:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	176
	
l2698:	
	bcf	(56/8),(56)&7
	line	178
	
l2700:	
	movlw	(06h)
	fcall	_spi_yaz
	line	180
	
l2702:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	182
	
l2704:	
	bcf	(56/8),(56)&7
	line	183
	
l2706:	
	movlw	(02h)
	fcall	_spi_yaz
	line	184
	
l2708:	
	movlw	(05h)
	fcall	_spi_yaz
	line	185
	
l2710:	
	movlw	(049h)
	fcall	_spi_yaz
	line	186
	
l2712:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	187
	
l2714:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2327:
	decfsz	((??_main+0)+0),f
	goto	u2327
	decfsz	((??_main+0)+0+1),f
	goto	u2327
opt asmopt_on

	line	188
	
l2716:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	189
	
l2718:	
	bcf	(56/8),(56)&7
	line	191
	
l2720:	
	movlw	(06h)
	fcall	_spi_yaz
	line	193
	
l2722:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	195
	
l2724:	
	bcf	(56/8),(56)&7
	line	196
	
l2726:	
	movlw	(02h)
	fcall	_spi_yaz
	line	197
	
l2728:	
	movlw	(06h)
	fcall	_spi_yaz
	line	198
	
l2730:	
	movlw	(04Dh)
	fcall	_spi_yaz
	line	199
	
l2732:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	200
	
l2734:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2337:
	decfsz	((??_main+0)+0),f
	goto	u2337
	decfsz	((??_main+0)+0+1),f
	goto	u2337
opt asmopt_on

	line	201
	
l2736:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	203
	
l2738:	
	bcf	(56/8),(56)&7
	line	205
	
l2740:	
	movlw	(06h)
	fcall	_spi_yaz
	line	207
	
l2742:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	209
	
l2744:	
	bcf	(56/8),(56)&7
	line	210
	
l2746:	
	movlw	(02h)
	fcall	_spi_yaz
	line	211
	
l2748:	
	movlw	(07h)
	fcall	_spi_yaz
	line	212
	
l2750:	
	movlw	(020h)
	fcall	_spi_yaz
	line	213
	
l2752:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	214
	
l2754:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2347:
	decfsz	((??_main+0)+0),f
	goto	u2347
	decfsz	((??_main+0)+0+1),f
	goto	u2347
opt asmopt_on

	line	215
	
l2756:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	218
	
l2758:	
	bcf	(56/8),(56)&7
	line	220
	
l2760:	
	movlw	(06h)
	fcall	_spi_yaz
	line	222
	
l2762:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	224
	
l2764:	
	bcf	(56/8),(56)&7
	line	225
	
l2766:	
	movlw	(02h)
	fcall	_spi_yaz
	line	226
	
l2768:	
	movlw	(08h)
	fcall	_spi_yaz
	line	227
	
l2770:	
	movlw	(04Eh)
	fcall	_spi_yaz
	line	228
	
l2772:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	229
	
l2774:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2357:
	decfsz	((??_main+0)+0),f
	goto	u2357
	decfsz	((??_main+0)+0+1),f
	goto	u2357
opt asmopt_on

	line	230
	
l2776:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	232
	
l2778:	
	bcf	(56/8),(56)&7
	line	234
	
l2780:	
	movlw	(06h)
	fcall	_spi_yaz
	line	236
	
l2782:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	238
	
l2784:	
	bcf	(56/8),(56)&7
	line	239
	
l2786:	
	movlw	(02h)
	fcall	_spi_yaz
	line	240
	
l2788:	
	movlw	(09h)
	fcall	_spi_yaz
	line	241
	
l2790:	
	movlw	(055h)
	fcall	_spi_yaz
	line	242
	
l2792:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	243
	
l2794:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2367:
	decfsz	((??_main+0)+0),f
	goto	u2367
	decfsz	((??_main+0)+0+1),f
	goto	u2367
opt asmopt_on

	line	244
	
l2796:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	245
	
l2798:	
	bcf	(56/8),(56)&7
	line	247
	
l2800:	
	movlw	(06h)
	fcall	_spi_yaz
	line	249
	
l2802:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	251
	
l2804:	
	bcf	(56/8),(56)&7
	line	252
	
l2806:	
	movlw	(02h)
	fcall	_spi_yaz
	line	253
	
l2808:	
	movlw	(0Ah)
	fcall	_spi_yaz
	line	254
	
l2810:	
	movlw	(04Eh)
	fcall	_spi_yaz
	line	255
	
l2812:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	256
	
l2814:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2377:
	decfsz	((??_main+0)+0),f
	goto	u2377
	decfsz	((??_main+0)+0+1),f
	goto	u2377
opt asmopt_on

	line	257
	
l2816:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	258
	
l2818:	
	bcf	(56/8),(56)&7
	line	260
	
l2820:	
	movlw	(06h)
	fcall	_spi_yaz
	line	262
	
l2822:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	264
	
l2824:	
	bcf	(56/8),(56)&7
	line	265
	
l2826:	
	movlw	(02h)
	fcall	_spi_yaz
	line	266
	
l2828:	
	movlw	(0Bh)
	fcall	_spi_yaz
	line	267
	
l2830:	
	movlw	(045h)
	fcall	_spi_yaz
	line	268
	
l2832:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	269
	
l2834:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2387:
	decfsz	((??_main+0)+0),f
	goto	u2387
	decfsz	((??_main+0)+0+1),f
	goto	u2387
opt asmopt_on

	line	270
	
l2836:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	272
	
l2838:	
	bcf	(56/8),(56)&7
	line	274
	
l2840:	
	movlw	(06h)
	fcall	_spi_yaz
	line	276
	
l2842:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	278
	
l2844:	
	bcf	(56/8),(56)&7
	line	279
	
l2846:	
	movlw	(02h)
	fcall	_spi_yaz
	line	280
	
l2848:	
	movlw	(0Ch)
	fcall	_spi_yaz
	line	281
	
l2850:	
	movlw	(04Ch)
	fcall	_spi_yaz
	line	282
	
l2852:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	283
	
l2854:	
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2397:
	decfsz	((??_main+0)+0),f
	goto	u2397
	decfsz	((??_main+0)+0+1),f
	goto	u2397
opt asmopt_on

	line	284
	
l2856:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	line	298
	
l2858:	
	clrf	(main@b)
	clrf	(main@b+1)
	
l2860:	
	movf	(main@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(031h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2265
	movlw	low(031h)
	subwf	(main@b),w
u2265:

	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l720
u2260:
	goto	l2882
	
l2862:	
	goto	l2882
	line	299
	
l720:	
	line	300
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	301
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	clrwdt
	opt asmopt_on

	line	302
	
l2864:	
	movlw	(03h)
	fcall	_spi_yaz
	line	303
	
l2866:	
	movf	(main@b),w
	fcall	_spi_yaz
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_gelen)
	line	304
	
l2868:	
	fcall	_spi_oku
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_ikinci)
	line	305
	
l2870:	
	movf	(_ikinci),w
	movwf	(??_main+0)+0
	movf	(main@b),w
	addlw	_data&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	306
	
l2872:	
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u2407:
	decfsz	((??_main+0)+0),f
	goto	u2407
	decfsz	((??_main+0)+0+1),f
	goto	u2407
	nop2
opt asmopt_on

	line	307
	
l2874:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	309
	
l2876:	
	opt asmopt_off
movlw	65
movwf	((??_main+0)+0+1),f
	movlw	238
movwf	((??_main+0)+0),f
u2417:
	decfsz	((??_main+0)+0),f
	goto	u2417
	decfsz	((??_main+0)+0+1),f
	goto	u2417
	clrwdt
opt asmopt_on

	line	298
	
l2878:	
	movlw	low(01h)
	addwf	(main@b),f
	skipnc
	incf	(main@b+1),f
	movlw	high(01h)
	addwf	(main@b+1),f
	
l2880:	
	movf	(main@b+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(031h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2275
	movlw	low(031h)
	subwf	(main@b),w
u2275:

	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l720
u2270:
	goto	l2882
	
l721:	
	goto	l2882
	line	320
	
l722:	
	line	323
	
l2882:	
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2427:
	decfsz	((??_main+0)+0),f
	goto	u2427
	decfsz	((??_main+0)+0+1),f
	goto	u2427
	decfsz	((??_main+0)+0+2),f
	goto	u2427
	nop2
opt asmopt_on

	goto	l2882
	line	326
	
l723:	
	line	320
	goto	l2882
	
l724:	
	line	332
	
l725:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_spi_oku
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:

;; *************** function _spi_oku *****************
;; Defined at:
;;		line 116 in file "../SPIEEprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
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
psect	text101
	file	"../SPIEEprom.c"
	line	116
	global	__size_of_spi_oku
	__size_of_spi_oku	equ	__end_of_spi_oku-_spi_oku
	
_spi_oku:	
	opt	stack 7
; Regs used in _spi_oku: [wreg+status,2]
	line	117
	
l1780:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(19)	;volatile
	line	118
	goto	l711
	
l712:	
	
l711:	
	btfss	(99/8),(99)&7
	goto	u31
	goto	u30
u31:
	goto	l711
u30:
	goto	l714
	
l713:	
	line	120
	goto	l714
	
l715:	
	
l714:	
	btfss	(99/8),(99)&7
	goto	u41
	goto	u40
u41:
	goto	l714
u40:
	goto	l1782
	
l716:	
	line	122
	
l1782:	
	movf	(19),w	;volatile
	goto	l717
	
l1784:	
	line	125
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_spi_oku
	__end_of_spi_oku:
;; =============== function _spi_oku ends ============

	signat	_spi_oku,89
	global	_spi_yaz
psect	text102,local,class=CODE,delta=2
global __ptext102
__ptext102:

;; *************** function _spi_yaz *****************
;; Defined at:
;;		line 98 in file "../SPIEEprom.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text102
	file	"../SPIEEprom.c"
	line	98
	global	__size_of_spi_yaz
	__size_of_spi_yaz	equ	__end_of_spi_yaz-_spi_yaz
	
_spi_yaz:	
	opt	stack 7
; Regs used in _spi_yaz: [wreg]
	line	102
	movwf	(spi_yaz@veri)
	
l1774:	
	movf	(spi_yaz@veri),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	104
	goto	l702
	
l703:	
	
l702:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1184/8)^080h,(1184)&7
	goto	u11
	goto	u10
u11:
	goto	l702
u10:
	goto	l705
	
l704:	
	line	106
	goto	l705
	
l706:	
	
l705:	
	btfss	(1184/8)^080h,(1184)&7
	goto	u21
	goto	u20
u21:
	goto	l705
u20:
	goto	l1776
	
l707:	
	line	108
	
l1776:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	goto	l708
	
l1778:	
	line	113
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_spi_yaz
	__end_of_spi_yaz:
;; =============== function _spi_yaz ends ============

	signat	_spi_yaz,4217
	global	_spi_hazirla
psect	text103,local,class=CODE,delta=2
global __ptext103
__ptext103:

;; *************** function _spi_hazirla *****************
;; Defined at:
;;		line 77 in file "../SPIEEprom.c"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text103
	file	"../SPIEEprom.c"
	line	77
	global	__size_of_spi_hazirla
	__size_of_spi_hazirla	equ	__end_of_spi_hazirla-_spi_hazirla
	
_spi_hazirla:	
	opt	stack 7
; Regs used in _spi_hazirla: []
	line	79
	
l1772:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(165/8),(165)&7
	line	80
	bcf	(164/8),(164)&7
	line	81
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1190/8)^080h,(1190)&7
	line	83
	bcf	(1191/8)^080h,(1191)&7
	line	86
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(163/8),(163)&7
	line	87
	bcf	(162/8),(162)&7
	line	88
	bcf	(161/8),(161)&7
	line	89
	bcf	(160/8),(160)&7
	line	94
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_spi_hazirla
	__end_of_spi_hazirla:
;; =============== function _spi_hazirla ends ============

	signat	_spi_hazirla,88
psect	text104,local,class=CODE,delta=2
global __ptext104
__ptext104:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
