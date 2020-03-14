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
	FNROOT	_main
	FNCALL	_FNC,_seri_port
	FNCALL	intlevel1,_FNC
	global	intlevel1
	FNROOT	intlevel1
	global	_code
	global	_temp
	global	_bit_index
	global	_data_temp
	global	_ignored
	global	_index
	global	_is_data_ready
	global	_pressed_key
	global	_RCREG
psect	text93,local,class=CODE,delta=2
global __ptext93
__ptext93:
_RCREG	set	26
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PEIE
_PEIE	set	94
	global	_RB1
_RB1	set	49
	global	_RB5
_RB5	set	53
	global	_RCIF
_RCIF	set	101
	global	_RD7
_RD7	set	71
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_BRGH
_BRGH	set	1218
	global	_INTEDG
_INTEDG	set	1038
	global	_SYNC
_SYNC	set	1220
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISB1
_TRISB1	set	1073
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISD7
_TRISD7	set	1095
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
_bit_index:
       ds      1

_data_temp:
       ds      1

_ignored:
       ds      1

_index:
       ds      1

_is_data_ready:
       ds      1

_pressed_key:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_code:
       ds      2

_temp:
       ds      2

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
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_seri_port
?_seri_port:	; 0 bytes @ 0x0
	global	??_seri_port
??_seri_port:	; 0 bytes @ 0x0
	global	?_FNC
?_FNC:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	seri_port@jk
seri_port@jk:	; 1 bytes @ 0x0
	ds	1
	global	??_FNC
??_FNC:	; 0 bytes @ 0x1
	ds	6
	global	??_main
??_main:	; 0 bytes @ 0x7
;;Data sizes: Strings 0, constant 0, data 0, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      13
;; BANK0           80      0       4
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _FNC in COMMON
;;
;;   _FNC->_seri_port
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _FNC                                                  6     6      0      15
;;                                              1 COMMON     6     6      0
;;                          _seri_port
;; ---------------------------------------------------------------------------------
;; (2) _seri_port                                            1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;
;; _FNC (ROOT)
;;   _seri_port
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      11       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       4       5        5.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      15      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 192 in file "../PS2Keyboard.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PS2Keyboard.c"
	line	192
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: []
	line	193
	
l1952:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	194
	bsf	(1073/8)^080h,(1073)&7
	line	195
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
	line	196
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	197
	bcf	(1038/8)^080h,(1038)&7
	line	198
	bcf	(89/8),(89)&7
	line	199
	bsf	(92/8),(92)&7
	line	200
	bcf	(1095/8)^080h,(1095)&7
	line	201
	bsf	(95/8),(95)&7
	line	202
	bsf	(94/8),(94)&7
	goto	l769
	line	204
	
l768:	
	line	212
	
l769:	
	line	204
	goto	l769
	
l770:	
	line	213
	
l771:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_FNC
psect	text94,local,class=CODE,delta=2
global __ptext94
__ptext94:

;; *************** function _FNC *****************
;; Defined at:
;;		line 97 in file "../PS2Keyboard.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_seri_port
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text94
	file	"../PS2Keyboard.c"
	line	97
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 6
; Regs used in _FNC: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_FNC+2)
	movf	fsr0,w
	movwf	(??_FNC+3)
	movf	pclath,w
	movwf	(??_FNC+4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_FNC+5)
	ljmp	_FNC
psect	text94
	
i1l1846:	
	bcf	(95/8),(95)&7
	line	98
	bcf	(89/8),(89)&7
	line	100
	
i1l1848:	
	movlw	0
	btfsc	(49/8),(49)&7
	movlw	1
	movwf	(??_FNC+0)+0
	incf	(_index),w
	goto	u3_24
u3_25:
	clrc
	rlf	(??_FNC+0)+0,f
u3_24:
	addlw	-1
	skipz
	goto	u3_25
	movf	0+(??_FNC+0)+0,w
	movwf	(??_FNC+1)+0
	movf	(??_FNC+1)+0,w
	iorwf	(_data_temp),f
	line	102
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_index),f
	line	104
	
i1l1850:	
	movf	(_index),w
	xorlw	0Bh
	skipz
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l765
u4_20:
	line	107
	
i1l1852:	
	clrf	(_index)
	line	108
	
i1l1854:	
	movf	(_data_temp),w
	movwf	(??_FNC+0)+0
	clrc
	rrf	(??_FNC+0)+0,w
	movwf	(??_FNC+1)+0
	movf	(??_FNC+1)+0,w
	movwf	(_pressed_key)
	line	109
	
i1l1856:	
	movf	(_pressed_key),w
	xorlw	0F0h
	skipz
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l1860
u5_20:
	
i1l1858:	
	clrf	(_ignored)	;volatile
	bsf	status,0
	rlf	(_ignored),f	;volatile
	goto	i1l1950
	line	110
	
i1l720:	
	
i1l1860:	
	movf	(_ignored),w	;volatile
	skipz
	goto	u6_20
	goto	i1l1944
u6_20:
	
i1l1862:	
	clrf	(_ignored)	;volatile
	goto	i1l1950
	line	111
	
i1l722:	
	line	113
	goto	i1l1944
	line	115
	
i1l725:	
	line	116
	
i1l1864:	
	movlw	(061h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	line	117
	movlw	1<<((71)&7)
	xorwf	((71)/8),f
	line	119
	goto	i1l1946
	line	120
	
i1l727:	
	
i1l1866:	
	movlw	(062h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	121
	
i1l728:	
	
i1l1868:	
	movlw	(063h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	122
	
i1l729:	
	
i1l1870:	
	movlw	(064h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	123
	
i1l730:	
	
i1l1872:	
	movlw	(065h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	124
	
i1l731:	
	
i1l1874:	
	movlw	(066h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	126
	
i1l732:	
	
i1l1876:	
	movlw	(067h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	127
	
i1l733:	
	
i1l1878:	
	movlw	(0F0h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	128
	
i1l734:	
	
i1l1880:	
	movlw	(068h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	129
	
i1l735:	
	
i1l1882:	
	movlw	(0FDh)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	130
	
i1l736:	
	
i1l1884:	
	movlw	(069h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	131
	
i1l737:	
	
i1l1886:	
	movlw	(06Ah)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	132
	
i1l738:	
	
i1l1888:	
	movlw	(06Bh)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	134
	
i1l739:	
	
i1l1890:	
	movlw	(020h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	135
	
i1l740:	
	
i1l1892:	
	movlw	(06Ch)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	136
	
i1l741:	
	
i1l1894:	
	movlw	(06Dh)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	138
	
i1l742:	
	
i1l1896:	
	movlw	(06Eh)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	139
	
i1l743:	
	
i1l1898:	
	movlw	(06Fh)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	140
	
i1l744:	
	
i1l1900:	
	movlw	(0F6h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	142
	
i1l745:	
	
i1l1902:	
	movlw	(070h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	143
	
i1l746:	
	
i1l1904:	
	movlw	(072h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	144
	
i1l747:	
	
i1l1906:	
	movlw	(073h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	145
	
i1l748:	
	
i1l1908:	
	movlw	(0FEh)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	146
	
i1l749:	
	
i1l1910:	
	movlw	(074h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	147
	
i1l750:	
	
i1l1912:	
	movlw	(075h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	148
	
i1l751:	
	
i1l1914:	
	movlw	(0FCh)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	149
	
i1l752:	
	
i1l1916:	
	movlw	(076h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	150
	
i1l753:	
	
i1l1918:	
	movlw	(079h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	151
	
i1l754:	
	
i1l1920:	
	movlw	(07Ah)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	152
	
i1l755:	
	
i1l1922:	
	movlw	(030h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	153
	
i1l756:	
	
i1l1924:	
	movlw	(031h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	154
	
i1l757:	
	
i1l1926:	
	movlw	(032h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	155
	
i1l758:	
	
i1l1928:	
	movlw	(033h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	156
	
i1l759:	
	
i1l1930:	
	movlw	(034h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	157
	
i1l760:	
	
i1l1932:	
	movlw	(035h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	158
	
i1l761:	
	
i1l1934:	
	movlw	(036h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	160
	
i1l762:	
	
i1l1936:	
	movlw	(037h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	161
	
i1l763:	
	
i1l1938:	
	movlw	(038h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	162
	
i1l764:	
	
i1l1940:	
	movlw	(039h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_pressed_key)
	goto	i1l1946
	line	165
	
i1l1942:	
	goto	i1l1946
	line	113
	
i1l724:	
	
i1l1944:	
	movf	(_pressed_key),w
	; Switch size 1, requested type "space"
; Number of cases is 39, Range of values is 26 to 125
; switch strategies available:
; Name         Instructions Cycles
; simple_byte          118    60 (average)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	26^0	; case 26
	skipnz
	goto	i1l1920
	xorlw	27^26	; case 27
	skipnz
	goto	i1l1906
	xorlw	28^27	; case 28
	skipnz
	goto	i1l1864
	xorlw	33^28	; case 33
	skipnz
	goto	i1l1868
	xorlw	35^33	; case 35
	skipnz
	goto	i1l1870
	xorlw	36^35	; case 36
	skipnz
	goto	i1l1872
	xorlw	41^36	; case 41
	skipnz
	goto	i1l1890
	xorlw	42^41	; case 42
	skipnz
	goto	i1l1916
	xorlw	43^42	; case 43
	skipnz
	goto	i1l1874
	xorlw	44^43	; case 44
	skipnz
	goto	i1l1910
	xorlw	45^44	; case 45
	skipnz
	goto	i1l1904
	xorlw	49^45	; case 49
	skipnz
	goto	i1l1896
	xorlw	50^49	; case 50
	skipnz
	goto	i1l1866
	xorlw	51^50	; case 51
	skipnz
	goto	i1l1880
	xorlw	52^51	; case 52
	skipnz
	goto	i1l1876
	xorlw	53^52	; case 53
	skipnz
	goto	i1l1918
	xorlw	58^53	; case 58
	skipnz
	goto	i1l1894
	xorlw	59^58	; case 59
	skipnz
	goto	i1l1886
	xorlw	60^59	; case 60
	skipnz
	goto	i1l1912
	xorlw	65^60	; case 65
	skipnz
	goto	i1l1900
	xorlw	66^65	; case 66
	skipnz
	goto	i1l1888
	xorlw	67^66	; case 67
	skipnz
	goto	i1l1882
	xorlw	68^67	; case 68
	skipnz
	goto	i1l1898
	xorlw	75^68	; case 75
	skipnz
	goto	i1l1892
	xorlw	76^75	; case 76
	skipnz
	goto	i1l1908
	xorlw	77^76	; case 77
	skipnz
	goto	i1l1902
	xorlw	82^77	; case 82
	skipnz
	goto	i1l1884
	xorlw	84^82	; case 84
	skipnz
	goto	i1l1878
	xorlw	91^84	; case 91
	skipnz
	goto	i1l1914
	xorlw	105^91	; case 105
	skipnz
	goto	i1l1924
	xorlw	107^105	; case 107
	skipnz
	goto	i1l1930
	xorlw	108^107	; case 108
	skipnz
	goto	i1l1936
	xorlw	112^108	; case 112
	skipnz
	goto	i1l1922
	xorlw	114^112	; case 114
	skipnz
	goto	i1l1926
	xorlw	115^114	; case 115
	skipnz
	goto	i1l1932
	xorlw	116^115	; case 116
	skipnz
	goto	i1l1934
	xorlw	117^116	; case 117
	skipnz
	goto	i1l1938
	xorlw	122^117	; case 122
	skipnz
	goto	i1l1928
	xorlw	125^122	; case 125
	skipnz
	goto	i1l1940
	goto	i1l1946
	opt asmopt_on

	line	165
	
i1l726:	
	line	167
	
i1l1946:	
	movf	(_pressed_key),w
	fcall	_seri_port
	line	168
	
i1l1948:	
	movlw	1<<((53)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((53)/8),f
	goto	i1l1950
	line	169
	
i1l723:	
	goto	i1l1950
	
i1l721:	
	line	171
	
i1l1950:	
	clrf	(_data_temp)
	goto	i1l765
	line	172
	
i1l719:	
	line	176
	
i1l765:	
	movf	(??_FNC+5),w
	movwf	btemp+1
	movf	(??_FNC+4),w
	movwf	pclath
	movf	(??_FNC+3),w
	movwf	fsr0
	swapf	(??_FNC+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_FNC
	__end_of_FNC:
;; =============== function _FNC ends ============

	signat	_FNC,88
	global	_seri_port
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:

;; *************** function _seri_port *****************
;; Defined at:
;;		line 25 in file "../PS2Keyboard.c"
;; Parameters:    Size  Location     Type
;;  jk              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  jk              1    0[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;;		_seri_porta_veri_gonder
;; This function uses a non-reentrant model
;;
psect	text95
	file	"../PS2Keyboard.c"
	line	25
	global	__size_of_seri_port
	__size_of_seri_port	equ	__end_of_seri_port-_seri_port
	
_seri_port:	
	opt	stack 6
; Regs used in _seri_port: [wreg]
	movwf	(seri_port@jk)
	
i1l1818:	
	goto	i1l701
	
i1l702:	
	
i1l701:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l701
u1_20:
	goto	i1l1820
	
i1l703:	
	line	26
	
i1l1820:	
	movf	(seri_port@jk),w
	movwf	(25)	;volatile
	line	29
	
i1l704:	
	return
	opt stack 0
GLOBAL	__end_of_seri_port
	__end_of_seri_port:
;; =============== function _seri_port ends ============

	signat	_seri_port,4216
psect	text96,local,class=CODE,delta=2
global __ptext96
__ptext96:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
