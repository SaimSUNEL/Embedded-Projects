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
	FNCALL	_main,_seri_portu_ayarla
	FNCALL	_main,_seri_porttan_veri_al
	FNROOT	_main
	FNCALL	_FNC,___wmul
	FNCALL	intlevel1,_FNC
	global	intlevel1
	FNROOT	intlevel1
	global	_uc
	global	_dogru
	global	_servo_number
	global	_bir
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_bir:
       ds      2

	global	_iki
_iki:
       ds      2

	global	_code
_code:
       ds      1

	global	_speed
_speed:
       ds      1

	global	_TMR1
_TMR1	set	22
	global	_PR2
_PR2	set	27
	global	_T2CON
_T2CON	set	28
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	96
	global	_RA1
_RA1	set	97
	global	_RA4
_RA4	set	100
	global	_RA5
_RA5	set	101
	global	_RCIF
_RCIF	set	141
	global	_T1CKPS0
_T1CKPS0	set	196
	global	_T1CKPS1
_T1CKPS1	set	197
	global	_TMR1CS0
_TMR1CS0	set	198
	global	_TMR1CS1
_TMR1CS1	set	199
	global	_TMR1IF
_TMR1IF	set	136
	global	_TMR1ON
_TMR1ON	set	192
	global	_TXIF
_TXIF	set	140
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
	global	_TMR1IE
_TMR1IE	set	1160
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
	global	_BRGH
_BRGH	set	3314
	global	_CREN
_CREN	set	3308
	global	_RD
_RD	set	3240
	global	_RX9
_RX9	set	3310
	global	_SPEN
_SPEN	set	3311
	global	_SYNC
_SYNC	set	3316
	global	_TX9
_TX9	set	3318
	global	_TXEN
_TXEN	set	3317
	global	_WR
_WR	set	3241
	global	_WREN
_WREN	set	3242
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
_uc:
       ds      2

_dogru:
       ds      1

_servo_number:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	global __pbssCOMMON
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_seri_portu_ayarla
?_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	?_FNC
?_FNC:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_seri_porttan_veri_al
?_seri_porttan_veri_al:	; 1 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	ds	2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	2
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	2
	global	??_FNC
??_FNC:	; 0 bytes @ 0x6
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_seri_porttan_veri_al
??_seri_porttan_veri_al:	; 0 bytes @ 0x0
	global	??_seri_portu_ayarla
??_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	2
	global	main@temp
main@temp:	; 2 bytes @ 0x2
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 4, persistent 6 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      13
;; BANK0           80      4      10
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _FNC in COMMON
;;
;;   _FNC->___wmul
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK2
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
;; (0) _main                                                 4     4      0      67
;;                                              0 BANK0      4     4      0
;;                  _seri_portu_ayarla
;;               _seri_porttan_veri_al
;; ---------------------------------------------------------------------------------
;; (1) _seri_portu_ayarla                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _seri_porttan_veri_al                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _FNC                                                  3     3      0      92
;;                                              6 COMMON     3     3      0
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (3) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _seri_portu_ayarla
;;   _seri_porttan_veri_al
;;
;; _FNC (ROOT)
;;   ___wmul
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
;;COMMON               E      9       D       2       92.9%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       5       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      17       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50      4       A       6       12.5%
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
;;DATA                 0      0      1C      11        0.0%
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
;;		line 150 in file "../PIC12F1840.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            2    2[BANK0 ] int 
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
;;      Locals:         0       2       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_seri_portu_ayarla
;;		_seri_porttan_veri_al
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC12F1840.c"
	line	150
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 13
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	151
	
l3642:	
	movlw	low(03h)
	movlb 0	; select bank0
	movwf	(_bir)
	movlw	high(03h)
	movwf	((_bir))+1
	line	152
	movlw	low(03h)
	movwf	(_iki)
	movlw	high(03h)
	movwf	((_iki))+1
	line	154
	
l3644:	
	movlb 1	; select bank1
	bcf	(1225/8)^080h,(1225)&7
	line	155
	
l3646:	
	bcf	(1224/8)^080h,(1224)&7
	line	157
	
l3648:	
	bsf	(1230/8)^080h,(1230)&7
	line	158
	
l3650:	
	bsf	(1229/8)^080h,(1229)&7
	line	159
	
l3652:	
	bsf	(1228/8)^080h,(1228)&7
	line	160
	
l3654:	
	bcf	(1227/8)^080h,(1227)&7
	line	161
	
l3656:	
	bcf	(1231/8)^080h,(1231)&7
	line	164
	
l3658:	
	bcf	(1120/8)^080h,(1120)&7
	line	165
	
l3660:	
	movlb 0	; select bank0
	bcf	(96/8),(96)&7
	line	166
	
l3662:	
	movlb 1	; select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	167
	
l3664:	
	movlb 0	; select bank0
	bcf	(97/8),(97)&7
	line	168
	
l3666:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	169
	
l3668:	
	movlb 1	; select bank1
	bcf	(1122/8)^080h,(1122)&7
	line	171
	
l3670:	
	bcf	(1124/8)^080h,(1124)&7
	line	172
	
l3672:	
	bcf	(1125/8)^080h,(1125)&7
	line	175
	
l3674:	
	movlw	(07Ch)
	movlb 0	; select bank0
	movwf	(27)	;volatile
	line	176
	
l3676:	
	movlw	(07h)
	movwf	(28)	;volatile
	line	177
	
l3678:	
	movlw	(03Eh)
	movlb 5	; select bank5
	movwf	(657)^0280h	;volatile
	line	178
	
l3680:	
	movlw	(01Ch)
	movwf	(659)^0280h	;volatile
	line	179
	
l3682:	
	clrf	(657)^0280h	;volatile
	line	180
	
l3684:	
	movlb 1	; select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	181
	
l3686:	
	fcall	_seri_portu_ayarla
	line	186
	
l3688:	
	movlb 0	; select bank0
	bcf	(199/8),(199)&7
	line	187
	
l3690:	
	bsf	(198/8),(198)&7
	line	189
	
l3692:	
	bsf	(197/8),(197)&7
	line	190
	
l3694:	
	bsf	(196/8),(196)&7
	line	192
	
l3696:	
	movlw	low(0B1DFh)
	movwf	(22)	;volatile
	movlw	high(0B1DFh)
	movwf	((22))+1	;volatile
	line	193
	
l3698:	
	bsf	(192/8),(192)&7
	line	194
	
l3700:	
	movlb 1	; select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	195
	
l3702:	
	bsf	(95/8),(95)&7
	line	196
	
l3704:	
	bsf	(94/8),(94)&7
	goto	l3706
	line	204
	
l1124:	
	line	206
	
l3706:	
	fcall	_seri_porttan_veri_al
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_code)
	line	207
	
l3708:	
	fcall	_seri_porttan_veri_al
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_speed)
	line	208
	
l3710:	
	movf	(_code),w
	xorlw	0Ch&0ffh
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l3720
u2390:
	line	210
	
l3712:	
	movf	(_speed),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movlw	02h
u2405:
	lslf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	wreg,f
	goto	u2405
	movf	0+(??_main+0)+0,w
	movwf	(main@temp)
	movf	1+(??_main+0)+0,w
	movwf	(main@temp+1)
	line	211
	
l3714:	
	movf	(main@temp+1),w
	movwf	(??_main+0)+0+1
	movf	(main@temp),w
	movwf	(??_main+0)+0
	movlw	01h
	movwf	btemp+1
u2415:
	rlf	(??_main+0)+1,w
	rrf	(??_main+0)+1,f
	rrf	(??_main+0)+0,f
	decfsz	btemp+1,f
	goto	u2415
	btfsc	0+(??_main+0)+0,0
	goto	u2421
	goto	u2420
	
u2421:
	movlb 5	; select bank5
	bsf	(5277/8)^0280h,(5277)&7
	goto	u2434
u2420:
	movlb 5	; select bank5
	bcf	(5277/8)^0280h,(5277)&7
u2434:
	line	212
	
l3716:	
	movlb 0	; select bank0
	btfsc	(main@temp),0
	goto	u2441
	goto	u2440
	
u2441:
	movlb 5	; select bank5
	bsf	(5276/8)^0280h,(5276)&7
	goto	u2454
u2440:
	movlb 5	; select bank5
	bcf	(5276/8)^0280h,(5276)&7
u2454:
	line	213
	
l3718:	
	movlb 0	; select bank0
	movf	(main@temp+1),w
	movwf	(??_main+0)+0+1
	movf	(main@temp),w
	movwf	(??_main+0)+0
	movlw	02h
	movwf	btemp+1
u2465:
	rlf	(??_main+0)+1,w
	rrf	(??_main+0)+1,f
	rrf	(??_main+0)+0,f
	decfsz	btemp+1,f
	goto	u2465
	movf	0+(??_main+0)+0,w
	movlb 5	; select bank5
	movwf	(657)^0280h	;volatile
	line	216
	goto	l3706
	line	217
	
l1125:	
	
l3720:	
	movlb 0	; select bank0
	movf	(_code),w
	xorlw	0Ah&0ffh
	skipz
	goto	u2471
	goto	u2470
u2471:
	goto	l3724
u2470:
	line	218
	
l3722:	
	movf	(_speed),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_bir)
	movf	1+(??_main+0)+0,w
	movwf	(_bir+1)
	goto	l3706
	line	219
	
l1127:	
	
l3724:	
	movf	(_speed),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_iki)
	movf	1+(??_main+0)+0,w
	movwf	(_iki+1)
	goto	l3706
	
l1128:	
	goto	l3706
	
l1126:	
	goto	l3706
	line	223
	
l1129:	
	line	204
	goto	l3706
	
l1130:	
	line	226
	
l1131:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_seri_portu_ayarla
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:

;; *************** function _seri_portu_ayarla *****************
;; Defined at:
;;		line 31 in file "../PIC12F1840.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text150
	file	"../PIC12F1840.c"
	line	31
	global	__size_of_seri_portu_ayarla
	__size_of_seri_portu_ayarla	equ	__end_of_seri_portu_ayarla-_seri_portu_ayarla
	
_seri_portu_ayarla:	
	opt	stack 13
; Regs used in _seri_portu_ayarla: [wreg]
	
l3578:	
	movlw	(033h)
	movlb 3	; select bank3
	movwf	(411)^0180h	;volatile
	line	32
	
l3580:	
	bsf	(3314/8)^0180h,(3314)&7
	line	34
	
l3582:	
	bsf	(3311/8)^0180h,(3311)&7
	line	36
	
l3584:	
	bcf	(3316/8)^0180h,(3316)&7
	line	38
	
l3586:	
	bcf	(3318/8)^0180h,(3318)&7
	line	40
	
l3588:	
	bsf	(3317/8)^0180h,(3317)&7
	line	42
	
l3590:	
	bcf	(3310/8)^0180h,(3310)&7
	line	44
	
l3592:	
	bsf	(3308/8)^0180h,(3308)&7
	line	52
	
l1111:	
	return
	opt stack 0
GLOBAL	__end_of_seri_portu_ayarla
	__end_of_seri_portu_ayarla:
;; =============== function _seri_portu_ayarla ends ============

	signat	_seri_portu_ayarla,88
	global	_seri_porttan_veri_al
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _seri_porttan_veri_al *****************
;; Defined at:
;;		line 20 in file "../PIC12F1840.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text151
	file	"../PIC12F1840.c"
	line	20
	global	__size_of_seri_porttan_veri_al
	__size_of_seri_porttan_veri_al	equ	__end_of_seri_porttan_veri_al-_seri_porttan_veri_al
	
_seri_porttan_veri_al:	
	opt	stack 13
; Regs used in _seri_porttan_veri_al: [wreg]
	line	21
	
l3572:	
	goto	l1099
	
l1100:	
	
l1099:	
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l1099
u2300:
	goto	l3574
	
l1101:	
	line	22
	
l3574:	
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	goto	l1102
	
l3576:	
	line	23
	
l1102:	
	return
	opt stack 0
GLOBAL	__end_of_seri_porttan_veri_al
	__end_of_seri_porttan_veri_al:
;; =============== function _seri_porttan_veri_al ends ============

	signat	_seri_porttan_veri_al,89
	global	_FNC
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:

;; *************** function _FNC *****************
;; Defined at:
;;		line 63 in file "../PIC12F1840.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"../PIC12F1840.c"
	line	63
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 13
; Regs used in _FNC: [wreg+status,2+status,0+pclath+cstack]
psect	intentry
	pagesel	$
	movlb 0	; select bank0
	movf	btemp+1,w
	movwf	(??_FNC+2)
	line	64
	
i1l3594:	
	bcf	(95/8),(95)&7
	line	67
	
i1l3596:	
	movf	(_servo_number),f
	skipz
	goto	u231_21
	goto	u231_20
u231_21:
	goto	i1l3610
u231_20:
	line	70
	
i1l3598:	
	movf	(_dogru),w
	skipz
	goto	u232_20
	goto	i1l1115
u232_20:
	line	72
	
i1l3600:	
	clrf	(_dogru)
	line	74
	bcf	(100/8),(100)&7
	line	77
	
i1l3602:	
	movlw	low(0B1DFh)
	movwf	(22)	;volatile
	movlw	high(0B1DFh)
	movwf	((22))+1	;volatile
	line	79
	
i1l3604:	
	clrf	(_servo_number)
	bsf	status,0
	rlf	(_servo_number),f
	line	82
	goto	i1l3626
	line	83
	
i1l1115:	
	line	85
	bsf	(100/8),(100)&7
	line	88
	
i1l3606:	
	movf	(_bir+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_bir),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(09h)
	movwf	0+(?___wmul)+02h
	movlw	high(09h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addlw	low(021Ch)
	movwf	(??_FNC+0)+0
	movlw	high(021Ch)
	addwfc	(1+(?___wmul)),w
	movwf	1+(??_FNC+0)+0
	comf	(??_FNC+0)+0,f
	comf	(??_FNC+0)+1,f
	incf	(??_FNC+0)+0,f
	skipnz
	incf	(??_FNC+0)+1,f
	movf	0+(??_FNC+0)+0,w
	addlw	low(0FFFFh)
	movlb 0	; select bank0
	movwf	(22)	;volatile
	movlw	high(0FFFFh)
	addwfc	1+(??_FNC+0)+0,w
	movwf	1+(22)	;volatile
	line	90
	
i1l3608:	
	clrf	(_dogru)
	bsf	status,0
	rlf	(_dogru),f
	goto	i1l3626
	line	91
	
i1l1116:	
	line	95
	goto	i1l3626
	line	96
	
i1l1114:	
	
i1l3610:	
	movf	(_servo_number),w
	xorlw	01h&0ffh
	skipz
	goto	u233_21
	goto	u233_20
u233_21:
	goto	i1l3626
u233_20:
	line	98
	
i1l3612:	
	movf	(_dogru),w
	skipz
	goto	u234_20
	goto	i1l3620
u234_20:
	line	100
	
i1l3614:	
	clrf	(_dogru)
	line	101
	bcf	(101/8),(101)&7
	line	104
	
i1l3616:	
	movlw	low(0B1DFh)
	movwf	(22)	;volatile
	movlw	high(0B1DFh)
	movwf	((22))+1	;volatile
	line	106
	
i1l3618:	
	clrf	(_servo_number)
	line	107
	goto	i1l3626
	line	108
	
i1l1119:	
	line	110
	
i1l3620:	
	clrf	(_dogru)
	bsf	status,0
	rlf	(_dogru),f
	line	111
	
i1l3622:	
	bsf	(101/8),(101)&7
	line	113
	
i1l3624:	
	movf	(_iki+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_iki),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(09h)
	movwf	0+(?___wmul)+02h
	movlw	high(09h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addlw	low(021Ch)
	movwf	(??_FNC+0)+0
	movlw	high(021Ch)
	addwfc	(1+(?___wmul)),w
	movwf	1+(??_FNC+0)+0
	comf	(??_FNC+0)+0,f
	comf	(??_FNC+0)+1,f
	incf	(??_FNC+0)+0,f
	skipnz
	incf	(??_FNC+0)+1,f
	movf	0+(??_FNC+0)+0,w
	addlw	low(0FFFFh)
	movlb 0	; select bank0
	movwf	(22)	;volatile
	movlw	high(0FFFFh)
	addwfc	1+(??_FNC+0)+0,w
	movwf	1+(22)	;volatile
	goto	i1l3626
	line	115
	
i1l1120:	
	goto	i1l3626
	line	129
	
i1l1118:	
	goto	i1l3626
	line	137
	
i1l1117:	
	
i1l3626:	
	bcf	(136/8),(136)&7
	line	138
	
i1l3628:	
	bsf	(95/8),(95)&7
	line	139
	
i1l1121:	
	movf	(??_FNC+2),w
	movwf	btemp+1
	retfie
	opt stack 0
GLOBAL	__end_of_FNC
	__end_of_FNC:
;; =============== function _FNC ends ============

	signat	_FNC,88
	global	___wmul
psect	text153,local,class=CODE,delta=2
global __ptext153
__ptext153:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text153
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 13
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
i1l3630:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	i1l3632
	line	6
	
i1l2156:	
	line	7
	
i1l3632:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u235_21
	goto	u235_20
u235_21:
	goto	i1l2157
u235_20:
	line	8
	
i1l3634:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	movf	(___wmul@multiplicand+1),w
	addwfc	(___wmul@product+1),f
	
i1l2157:	
	line	9
	movlw	01h
	
u236_25:
	lslf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	decfsz	wreg,f
	goto	u236_25
	line	10
	
i1l3636:	
	movlw	01h
	
u237_25:
	lsrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	decfsz	wreg,f
	goto	u237_25
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l3632
u238_20:
	goto	i1l3638
	
i1l2158:	
	line	12
	
i1l3638:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	i1l2159
	
i1l3640:	
	line	13
	
i1l2159:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
psect	text154,local,class=CODE,delta=2
global __ptext154
__ptext154:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
