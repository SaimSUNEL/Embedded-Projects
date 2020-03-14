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
	FNCALL	_main,_seri_porttan_veri_al
	FNROOT	_main
	FNCALL	_FNC,___wmul
	FNCALL	intlevel1,_FNC
	global	intlevel1
	FNROOT	intlevel1
	global	_iki
	global	_sag
	global	_sol
	global	_temp
	global	_temp2
	global	_uc
	global	_bir
	global	_dogru
	global	_servo_number
	global	_CCPR1
psect	text149,local,class=CODE,delta=2
global __ptext149
__ptext149:
_CCPR1	set	21
	global	_TMR1
_TMR1	set	14
	global	_CCP2CON
_CCP2CON	set	29
	global	_CCPR2L
_CCPR2L	set	27
	global	_PORTB
_PORTB	set	6
	global	_RCREG
_RCREG	set	26
	global	_T2CON
_T2CON	set	18
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CCP1IF
_CCP1IF	set	98
	global	_CCP1M0
_CCP1M0	set	184
	global	_CCP1M1
_CCP1M1	set	185
	global	_CCP1M2
_CCP1M2	set	186
	global	_CCP1M3
_CCP1M3	set	187
	global	_CCP2M0
_CCP2M0	set	232
	global	_CCP2M1
_CCP2M1	set	233
	global	_CCP2M2
_CCP2M2	set	234
	global	_CCP2M3
_CCP2M3	set	235
	global	_CCP2X
_CCP2X	set	237
	global	_CCP2Y
_CCP2Y	set	236
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RB1
_RB1	set	49
	global	_RB4
_RB4	set	52
	global	_RCIF
_RCIF	set	101
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_T1CKPS0
_T1CKPS0	set	132
	global	_T1CKPS1
_T1CKPS1	set	133
	global	_T1OSCEN
_T1OSCEN	set	131
	global	_TMR1CS
_TMR1CS	set	129
	global	_TMR1ON
_TMR1ON	set	128
	global	_TMR2ON
_TMR2ON	set	146
	global	_TXIF
_TXIF	set	100
	global	_PR2
_PR2	set	146
	global	_SPBRG
_SPBRG	set	153
	global	_TRISB
_TRISB	set	134
	global	_BRGH
_BRGH	set	1218
	global	_CCP1IE
_CCP1IE	set	1122
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
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_bir:
       ds      2

_dogru:
       ds      1

_servo_number:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_iki:
       ds      2

_sag:
       ds      2

_sol:
       ds      2

_temp:
       ds      2

_temp2:
       ds      2

_uc:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
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
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
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
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_seri_porttan_veri_al
??_seri_porttan_veri_al:	; 0 bytes @ 0x0
	global	??_seri_portu_ayarla
??_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
	global	main@angle
main@angle:	; 2 bytes @ 0x3
	ds	2
	global	main@open
main@open:	; 1 bytes @ 0x5
	ds	1
	global	main@temp
main@temp:	; 2 bytes @ 0x6
	ds	2
	global	main@speed
main@speed:	; 1 bytes @ 0x8
	ds	1
	global	main@data
main@data:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 16, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      14
;; BANK0           80     10      22
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

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
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _FNC in BANK3
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                12    12      0     203
;;                                              0 BANK0     10    10      0
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
;; (2) _FNC                                                  4     4      0      92
;;                                              6 COMMON     4     4      0
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
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       5       2        0.0%
;;ABS                  0      0      24       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      A      16       5       27.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      29      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 170 in file "../77aServo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            2    6[BANK0 ] int 
;;  angle           2    3[BANK0 ] unsigned int 
;;  l               2    0        int 
;;  data            1    9[BANK0 ] unsigned char 
;;  speed           1    8[BANK0 ] unsigned char 
;;  open            1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       7       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_seri_portu_ayarla
;;		_seri_porttan_veri_al
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../77aServo.c"
	line	170
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	173
	
l2901:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	175
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	180
	
l2903:	
	opt asmopt_off
movlw  7
movwf	((??_main+0)+0+2),f
movlw	88
movwf	((??_main+0)+0+1),f
	movlw	94
movwf	((??_main+0)+0),f
u2577:
	decfsz	((??_main+0)+0),f
	goto	u2577
	decfsz	((??_main+0)+0+1),f
	goto	u2577
	decfsz	((??_main+0)+0+2),f
	goto	u2577
	nop2
opt asmopt_on

	line	181
	
l2905:	
	fcall	_seri_portu_ayarla
	line	183
	
l2907:	
	opt asmopt_off
movlw  12
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	107
movwf	((??_main+0)+0+1),f
	movlw	19
movwf	((??_main+0)+0),f
u2587:
	decfsz	((??_main+0)+0),f
	goto	u2587
	decfsz	((??_main+0)+0+1),f
	goto	u2587
	decfsz	((??_main+0)+0+2),f
	goto	u2587
	nop2
opt asmopt_on

	line	184
	
l2909:	
	opt asmopt_off
movlw  12
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	107
movwf	((??_main+0)+0+1),f
	movlw	19
movwf	((??_main+0)+0),f
u2597:
	decfsz	((??_main+0)+0),f
	goto	u2597
	decfsz	((??_main+0)+0+1),f
	goto	u2597
	decfsz	((??_main+0)+0+2),f
	goto	u2597
	nop2
opt asmopt_on

	line	185
	
l2911:	
	bsf	(95/8),(95)&7
	line	186
	
l2913:	
	bsf	(94/8),(94)&7
	line	188
	
l2915:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(187/8),(187)&7
	line	189
	
l2917:	
	bcf	(186/8),(186)&7
	line	190
	
l2919:	
	bsf	(185/8),(185)&7
	line	191
	
l2921:	
	bsf	(184/8),(184)&7
	line	193
	
l2923:	
	bcf	(98/8),(98)&7
	line	194
	
l2925:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1122/8)^080h,(1122)&7
	line	198
	
l2927:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(133/8),(133)&7
	line	199
	
l2929:	
	bcf	(132/8),(132)&7
	line	200
	
l2931:	
	movlw	low(04E20h)
	movwf	(21)	;volatile
	movlw	high(04E20h)
	movwf	((21))+1	;volatile
	line	201
	
l2933:	
	bcf	(131/8),(131)&7
	line	202
	
l2935:	
	bcf	(129/8),(129)&7
	line	204
	
l2937:	
	clrf	(14)	;volatile
	clrf	(14+1)	;volatile
	line	205
	
l2939:	
	bsf	(128/8),(128)&7
	line	209
	
l2941:	
	bsf	(235/8),(235)&7
	line	210
	
l2943:	
	bsf	(234/8),(234)&7
	line	211
	
l2945:	
	bcf	(233/8),(233)&7
	line	212
	
l2947:	
	bcf	(232/8),(232)&7
	line	215
	
l2949:	
	movlw	(0F9h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	216
	
l2951:	
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	217
	
l2953:	
	movlw	(07Ch)
	movwf	(27)	;volatile
	line	218
	
l2955:	
	movlw	(03Ch)
	movwf	(29)	;volatile
	line	222
	
l2957:	
	bcf	(146/8),(146)&7
	line	232
	
l2959:	
	movlw	low(03h)
	movwf	(main@angle)
	movlw	high(03h)
	movwf	((main@angle))+1
	line	233
	
l2961:	
	clrf	(main@open)
	line	234
	
l2963:	
	movlw	low(03h)
	movwf	(_bir)
	movlw	high(03h)
	movwf	((_bir))+1
	line	235
	
l2965:	
	movlw	low(03h)
	movwf	(_iki)
	movlw	high(03h)
	movwf	((_iki))+1
	line	237
	
l2967:	
	movlw	low(03h)
	movwf	(_uc)
	movlw	high(03h)
	movwf	((_uc))+1
	goto	l2969
	line	241
	
l730:	
	line	244
	
l2969:	
	fcall	_seri_porttan_veri_al
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@data)
	line	245
	
l2971:	
	fcall	_seri_porttan_veri_al
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@speed)
	line	246
	
l2973:	
	movf	(main@data),w
	xorlw	0Ah
	skipz
	goto	u2471
	goto	u2470
u2471:
	goto	l2977
u2470:
	line	247
	
l2975:	
	movf	(main@speed),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_bir)
	movf	1+(??_main+0)+0,w
	movwf	(_bir+1)
	goto	l2969
	line	248
	
l731:	
	
l2977:	
	movf	(main@data),w
	xorlw	0Bh
	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l2981
u2480:
	line	249
	
l2979:	
	movf	(main@speed),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_iki)
	movf	1+(??_main+0)+0,w
	movwf	(_iki+1)
	goto	l2969
	line	250
	
l733:	
	
l2981:	
	movf	(main@data),w
	xorlw	0Ch
	skipz
	goto	u2491
	goto	u2490
u2491:
	goto	l2969
u2490:
	line	252
	
l2983:	
	movf	(main@speed),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movlw	02h
	movwf	btemp+1
u2505:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+1,f
	goto	u2505
	movf	0+(??_main+0)+0,w
	movwf	(main@temp)
	movf	1+(??_main+0)+0,w
	movwf	(main@temp+1)
	line	253
	
l2985:	
	movf	(main@temp+1),w
	movwf	(??_main+0)+0+1
	movf	(main@temp),w
	movwf	(??_main+0)+0
	movlw	01h
	movwf	btemp+1
u2515:
	rlf	(??_main+0)+1,w
	rrf	(??_main+0)+1,f
	rrf	(??_main+0)+0,f
	decfsz	btemp+1,f
	goto	u2515
	btfsc	0+(??_main+0)+0,0
	goto	u2521
	goto	u2520
	
u2521:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(237/8),(237)&7
	goto	u2534
u2520:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(237/8),(237)&7
u2534:
	line	254
	
l2987:	
	btfsc	(main@temp),0
	goto	u2541
	goto	u2540
	
u2541:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(236/8),(236)&7
	goto	u2554
u2540:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(236/8),(236)&7
u2554:
	line	255
	
l2989:	
	movf	(main@temp+1),w
	movwf	(??_main+0)+0+1
	movf	(main@temp),w
	movwf	(??_main+0)+0
	movlw	02h
	movwf	btemp+1
u2565:
	rlf	(??_main+0)+1,w
	rrf	(??_main+0)+1,f
	rrf	(??_main+0)+0,f
	decfsz	btemp+1,f
	goto	u2565
	movf	0+(??_main+0)+0,w
	movwf	(27)	;volatile
	goto	l2969
	line	256
	
l735:	
	goto	l2969
	line	257
	
l734:	
	goto	l2969
	
l732:	
	goto	l2969
	
l736:	
	line	241
	goto	l2969
	
l737:	
	line	260
	
l738:	
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
;;		line 53 in file "../77aServo.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text150
	file	"../77aServo.c"
	line	53
	global	__size_of_seri_portu_ayarla
	__size_of_seri_portu_ayarla	equ	__end_of_seri_portu_ayarla-_seri_portu_ayarla
	
_seri_portu_ayarla:	
	opt	stack 5
; Regs used in _seri_portu_ayarla: [wreg]
	
l2837:	
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	54
	
l2839:	
	bcf	(1218/8)^080h,(1218)&7
	line	56
	
l2841:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	58
	
l2843:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	60
	
l2845:	
	bcf	(1222/8)^080h,(1222)&7
	line	62
	
l2847:	
	bsf	(1221/8)^080h,(1221)&7
	line	64
	
l2849:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	66
	
l2851:	
	bsf	(196/8),(196)&7
	line	74
	
l717:	
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
;;		line 42 in file "../77aServo.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
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
	file	"../77aServo.c"
	line	42
	global	__size_of_seri_porttan_veri_al
	__size_of_seri_porttan_veri_al	equ	__end_of_seri_porttan_veri_al-_seri_porttan_veri_al
	
_seri_porttan_veri_al:	
	opt	stack 5
; Regs used in _seri_porttan_veri_al: [wreg]
	line	43
	
l2831:	
	goto	l705
	
l706:	
	
l705:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l705
u2380:
	goto	l2833
	
l707:	
	line	44
	
l2833:	
	movf	(26),w	;volatile
	goto	l708
	
l2835:	
	line	45
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_seri_porttan_veri_al
	__end_of_seri_porttan_veri_al:
;; =============== function _seri_porttan_veri_al ends ============

	signat	_seri_porttan_veri_al,89
	global	_FNC
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:

;; *************** function _FNC *****************
;; Defined at:
;;		line 92 in file "../77aServo.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text152
	file	"../77aServo.c"
	line	92
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 5
; Regs used in _FNC: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_FNC+0)
	movf	fsr0,w
	movwf	(??_FNC+1)
	movf	pclath,w
	movwf	(??_FNC+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_FNC+3)
	ljmp	_FNC
psect	text152
	line	93
	
i1l2853:	
	bcf	(95/8),(95)&7
	line	95
	bcf	(98/8),(98)&7
	line	96
	
i1l2855:	
	clrf	(14)	;volatile
	clrf	(14+1)	;volatile
	line	98
	
i1l2857:	
	movf	(_servo_number),f
	skipz
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l2871
u239_20:
	line	101
	
i1l2859:	
	movf	(_dogru),w
	skipz
	goto	u240_20
	goto	i1l721
u240_20:
	line	103
	
i1l2861:	
	clrf	(_dogru)
	line	105
	bcf	(52/8),(52)&7
	line	108
	
i1l2863:	
	movlw	low(04E20h)
	movwf	(21)	;volatile
	movlw	high(04E20h)
	movwf	((21))+1	;volatile
	line	110
	
i1l2865:	
	clrf	(_servo_number)
	bsf	status,0
	rlf	(_servo_number),f
	line	113
	goto	i1l2887
	line	114
	
i1l721:	
	line	116
	bsf	(52/8),(52)&7
	line	119
	
i1l2867:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(021Ch)
	movwf	1+(21)	;volatile
	line	121
	
i1l2869:	
	clrf	(_dogru)
	bsf	status,0
	rlf	(_dogru),f
	goto	i1l2887
	line	122
	
i1l722:	
	line	126
	goto	i1l2887
	line	127
	
i1l720:	
	
i1l2871:	
	movf	(_servo_number),w
	xorlw	01h
	skipz
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l2887
u241_20:
	line	129
	
i1l2873:	
	movf	(_dogru),w
	skipz
	goto	u242_20
	goto	i1l2881
u242_20:
	line	131
	
i1l2875:	
	clrf	(_dogru)
	line	132
	bcf	(49/8),(49)&7
	line	135
	
i1l2877:	
	movlw	low(04E20h)
	movwf	(21)	;volatile
	movlw	high(04E20h)
	movwf	((21))+1	;volatile
	line	137
	
i1l2879:	
	clrf	(_servo_number)
	line	138
	goto	i1l2887
	line	139
	
i1l725:	
	line	141
	
i1l2881:	
	clrf	(_dogru)
	bsf	status,0
	rlf	(_dogru),f
	line	142
	
i1l2883:	
	bsf	(49/8),(49)&7
	line	144
	
i1l2885:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(021Ch)
	movwf	1+(21)	;volatile
	goto	i1l2887
	line	146
	
i1l726:	
	goto	i1l2887
	line	160
	
i1l724:	
	goto	i1l2887
	line	164
	
i1l723:	
	
i1l2887:	
	bcf	(98/8),(98)&7
	line	166
	
i1l727:	
	movf	(??_FNC+3),w
	movwf	btemp+1
	movf	(??_FNC+2),w
	movwf	pclath
	movf	(??_FNC+1),w
	movwf	fsr0
	swapf	(??_FNC+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
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
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
i1l2889:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	i1l2891
	line	6
	
i1l1421:	
	line	7
	
i1l2891:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l1422
u243_20:
	line	8
	
i1l2893:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
i1l1422:	
	line	9
	movlw	01h
	
u244_25:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u244_25
	line	10
	
i1l2895:	
	movlw	01h
	
u245_25:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u245_25
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l2891
u246_20:
	goto	i1l2897
	
i1l1423:	
	line	12
	
i1l2897:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	i1l1424
	
i1l2899:	
	line	13
	
i1l1424:	
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
