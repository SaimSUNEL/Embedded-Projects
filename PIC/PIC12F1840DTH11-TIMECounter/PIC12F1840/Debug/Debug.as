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
	FNCALL	_main,_DHT11_get_data
	FNCALL	_main,_display_number
	FNCALL	_display_number,___awdiv
	FNCALL	_display_number,_display_digit
	FNCALL	_display_number,___awmod
	FNROOT	_main
	FNCALL	_FNC,i1_display_number
	FNCALL	i1_display_number,i1___awdiv
	FNCALL	i1_display_number,i1_display_digit
	FNCALL	i1_display_number,i1___awmod
	FNCALL	intlevel1,_FNC
	global	intlevel1
	FNROOT	intlevel1
	global	_rakamlar
	global	_count_status
	global	_what_to_display
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"../PIC12f1840Denemeler.c"
	line	63

;initializer for _rakamlar
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	line	140

;initializer for _count_status
	retlw	08h
	line	69

;initializer for _what_to_display
	retlw	05h
	global	_dht11_data
	global	_count
	global	_high_time_count
	global	_low_time_count
	global	_nem
	global	_second_count
	global	_sicaklik
	global	_timer_count
	global	_TMR1
_TMR1	set	22
	global	_PORTA
_PORTA	set	12
	global	_TMR1H
_TMR1H	set	23
	global	_TMR1L
_TMR1L	set	22
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_IOCIE
_IOCIE	set	91
	global	_IOCIF
_IOCIF	set	88
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	96
	global	_RA1
_RA1	set	97
	global	_RA2
_RA2	set	98
	global	_RA4
_RA4	set	100
	global	_RA5
_RA5	set	101
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
	global	_TRISA3
_TRISA3	set	1123
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
	global	_RD
_RD	set	3240
	global	_WR
_WR	set	3241
	global	_WREN
_WREN	set	3242
	global	_IOCAN
_IOCAN	set	914
	global	_IOCAP
_IOCAP	set	913
	global	_IOCAF5
_IOCAF5	set	7325
	global	_IOCAP3
_IOCAP3	set	7307
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_dht11_data:
       ds      5

_count:
       ds      1

_high_time_count:
       ds      1

_low_time_count:
       ds      1

_nem:
       ds      1

_second_count:
       ds      1

_sicaklik:
       ds      1

_timer_count:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"../PIC12f1840Denemeler.c"
	line	63
_rakamlar:
       ds      10

psect	dataBANK0
	file	"../PIC12f1840Denemeler.c"
	line	140
_count_status:
       ds      1

psect	dataBANK0
	file	"../PIC12f1840Denemeler.c"
	line	69
_what_to_display:
       ds      1

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
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
psect inittext,class=CODE,delta=2
global init_ram,btemp
init_ram:
	movwf btemp,f
initloop:
	moviw fsr0++
	movwi fsr1++
	decfsz btemp
	goto initloop
	retlw 0
; Initialize objects allocated to BANK0
	global __pidataBANK0,__pdataBANK0
psect cinit,class=CODE,delta=2
	movlw low(__pidataBANK0)
	movwf fsr0l
	movlw high(__pidataBANK0)|80h
	movwf fsr0h
	movlw low(__pdataBANK0)
	movwf fsr1l
	movlw high(__pdataBANK0)
	movwf fsr1h
	movlw 0Ch
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DHT11_get_data
?_DHT11_get_data:	; 0 bytes @ 0x0
	global	?_display_number
?_display_number:	; 0 bytes @ 0x0
	global	?_FNC
?_FNC:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?i1_display_number
?i1_display_number:	; 0 bytes @ 0x0
	global	?i1___awdiv
?i1___awdiv:	; 2 bytes @ 0x0
	global	?i1___awmod
?i1___awmod:	; 2 bytes @ 0x0
	global	i1___awdiv@divisor
i1___awdiv@divisor:	; 2 bytes @ 0x0
	global	i1___awmod@divisor
i1___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	i1___awdiv@dividend
i1___awdiv@dividend:	; 2 bytes @ 0x2
	global	i1___awmod@dividend
i1___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??i1___awdiv
??i1___awdiv:	; 0 bytes @ 0x4
	global	??i1___awmod
??i1___awmod:	; 0 bytes @ 0x4
	ds	1
	global	i1___awdiv@counter
i1___awdiv@counter:	; 1 bytes @ 0x5
	global	i1___awmod@counter
i1___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	i1___awdiv@sign
i1___awdiv@sign:	; 1 bytes @ 0x6
	global	i1___awmod@sign
i1___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	i1___awdiv@quotient
i1___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	?i1_display_digit
?i1_display_digit:	; 0 bytes @ 0x9
	global	i1display_digit@value
i1display_digit@value:	; 1 bytes @ 0x9
	ds	1
	global	??i1_display_digit
??i1_display_digit:	; 0 bytes @ 0xA
	ds	1
	global	i1display_digit@temp
i1display_digit@temp:	; 1 bytes @ 0xB
	ds	1
	global	i1display_digit@segment_number
i1display_digit@segment_number:	; 1 bytes @ 0xC
	ds	1
	global	i1display_digit@index
i1display_digit@index:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??i1_display_number
??i1_display_number:	; 0 bytes @ 0x0
	ds	3
	global	i1display_number@number
i1display_number@number:	; 1 bytes @ 0x3
	ds	1
	global	??_FNC
??_FNC:	; 0 bytes @ 0x4
	ds	2
	global	??_DHT11_get_data
??_DHT11_get_data:	; 0 bytes @ 0x6
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x6
	global	?___awmod
?___awmod:	; 2 bytes @ 0x6
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x6
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x6
	ds	2
	global	DHT11_get_data@a
DHT11_get_data@a:	; 1 bytes @ 0x8
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x8
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x8
	ds	1
	global	DHT11_get_data@byte_index
DHT11_get_data@byte_index:	; 1 bytes @ 0x9
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0xA
	global	??___awmod
??___awmod:	; 0 bytes @ 0xA
	global	DHT11_get_data@bit_index
DHT11_get_data@bit_index:	; 1 bytes @ 0xA
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0xB
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0xB
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0xC
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0xC
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0xD
	ds	2
	global	?_display_digit
?_display_digit:	; 0 bytes @ 0xF
	global	display_digit@value
display_digit@value:	; 1 bytes @ 0xF
	ds	1
	global	??_display_digit
??_display_digit:	; 0 bytes @ 0x10
	ds	1
	global	display_digit@temp
display_digit@temp:	; 1 bytes @ 0x11
	ds	1
	global	display_digit@segment_number
display_digit@segment_number:	; 1 bytes @ 0x12
	ds	1
	global	display_digit@index
display_digit@index:	; 1 bytes @ 0x13
	ds	1
	global	??_display_number
??_display_number:	; 0 bytes @ 0x14
	ds	3
	global	display_number@number
display_number@number:	; 1 bytes @ 0x17
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x18
	ds	3
;;Data sizes: Strings 0, constant 0, data 12, bss 12, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     27      51
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?i1___awmod	int  size(1) Largest target is 0
;;
;; ?i1___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _FNC in COMMON
;;
;;   i1_display_number->i1_display_digit
;;   i1_display_digit->i1___awdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_display_number
;;   _display_number->_display_digit
;;   _display_digit->___awdiv
;;
;; Critical Paths under _FNC in BANK0
;;
;;   _FNC->i1_display_number
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0    1025
;;                                             24 BANK0      3     3      0
;;                     _DHT11_get_data
;;                     _display_number
;; ---------------------------------------------------------------------------------
;; (1) _display_number                                       4     4      0     821
;;                                             20 BANK0      4     4      0
;;                            ___awdiv
;;                      _display_digit
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (2) _display_digit                                        5     4      1     181
;;                                             15 BANK0      5     4      1
;;                            ___awdiv (ARG)
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _DHT11_get_data                                       5     5      0     204
;;                                              6 BANK0      5     5      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              6 BANK0      7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              6 BANK0      9     5      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _FNC                                                  2     2      0    2686
;;                                              4 BANK0      2     2      0
;;                   i1_display_number
;; ---------------------------------------------------------------------------------
;; (4) i1_display_number                                     4     4      0    2686
;;                                              0 BANK0      4     4      0
;;                          i1___awdiv
;;                    i1_display_digit
;;                          i1___awmod
;; ---------------------------------------------------------------------------------
;; (5) i1_display_digit                                      5     4      1     594
;;                                              9 COMMON     5     4      1
;;                          i1___awdiv (ARG)
;;                          i1___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (5) i1___awmod                                            7     3      4     969
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (5) i1___awdiv                                            9     5      4     977
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DHT11_get_data
;;   _display_number
;;     ___awdiv
;;     _display_digit
;;       ___awdiv (ARG)
;;       ___awmod (ARG)
;;     ___awmod
;;
;; _FNC (ROOT)
;;   i1_display_number
;;     i1___awdiv
;;     i1_display_digit
;;       i1___awdiv (ARG)
;;       i1___awmod (ARG)
;;     i1___awmod
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
;;COMMON               E      E       E       2      100.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       8       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      41       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50     1B      33       6       63.8%
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
;;DATA                 0      0      49      11        0.0%
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
;;		line 199 in file "../PIC12f1840Denemeler.c"
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
;;      Temps:          0       3       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_DHT11_get_data
;;		_display_number
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC12f1840Denemeler.c"
	line	199
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 11
; Regs used in _main: [wreg+fsr1l-status,0+pclath+cstack]
	line	201
	
l4318:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	202
	
l4320:	
	movlb 1	; select bank1
	bcf	(1231/8)^080h,(1231)&7
	line	204
	
l4322:	
	bsf	(1230/8)^080h,(1230)&7
	line	205
	
l4324:	
	bsf	(1229/8)^080h,(1229)&7
	line	206
	
l4326:	
	bsf	(1228/8)^080h,(1228)&7
	line	207
	
l4328:	
	bsf	(1227/8)^080h,(1227)&7
	line	209
	
l4330:	
	bsf	(1225/8)^080h,(1225)&7
	line	210
	
l4332:	
	bcf	(1224/8)^080h,(1224)&7
	line	211
	
l4334:	
	bcf	(1120/8)^080h,(1120)&7
	line	212
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	215
	
l4336:	
	movlb 1	; select bank1
	bsf	(1123/8)^080h,(1123)&7
	line	216
	
l4338:	
	bsf	(1125/8)^080h,(1125)&7
	line	218
	
l4340:	
	bcf	(1120/8)^080h,(1120)&7
	line	219
	
l4342:	
	bcf	(1121/8)^080h,(1121)&7
	line	220
	
l4344:	
	bcf	(1122/8)^080h,(1122)&7
	line	221
	
l4346:	
	bcf	(1124/8)^080h,(1124)&7
	line	223
	movlb 7	; select bank7
	clrf	(914)^0380h	;volatile
	line	224
	clrf	(913)^0380h	;volatile
	line	226
	
l4348:	
	bsf	(7307/8)^0380h,(7307)&7
	line	227
	
l4350:	
	bsf	(91/8),(91)&7
	line	228
	
l4352:	
	bcf	(88/8),(88)&7
	line	229
	
l4354:	
	bcf	(7325/8)^0380h,(7325)&7
	line	232
	movlb 0	; select bank0
	clrf	(23)	;volatile
	line	233
	clrf	(22)	;volatile
	line	237
	
l4356:	
	bcf	(199/8),(199)&7
	line	238
	
l4358:	
	bcf	(198/8),(198)&7
	line	241
	
l4360:	
	bsf	(197/8),(197)&7
	line	242
	
l4362:	
	bcf	(196/8),(196)&7
	line	245
	
l4364:	
	bcf	(192/8),(192)&7
	line	246
	
l4366:	
	movlw	low(03CAFh)
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	247
	
l4368:	
	bcf	(136/8),(136)&7
	line	248
	
l4370:	
	movlb 1	; select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	249
	
l4372:	
	bsf	(94/8),(94)&7
	line	250
	
l4374:	
	bsf	(95/8),(95)&7
	line	251
	
l4376:	
	fcall	_DHT11_get_data
	line	252
	
l4378:	
	opt asmopt_off
movlw  3
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	8
movwf	((??_main+0)+0+1),f
	movlw	120
movwf	((??_main+0)+0),f
u3837:
	decfsz	((??_main+0)+0),f
	goto	u3837
	decfsz	((??_main+0)+0+1),f
	goto	u3837
	decfsz	((??_main+0)+0+2),f
	goto	u3837
opt asmopt_on

	goto	l4380
	line	254
	
l1161:	
	line	257
	
l4380:	
	movlb 0	; select bank0
	movf	(_count_status),w
	xorlw	08h&0ffh
	skipz
	goto	u3821
	goto	u3820
u3821:
	goto	l4380
u3820:
	line	259
	
l4382:	
	fcall	_DHT11_get_data
	line	261
	
l4384:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_what_to_display)
	line	262
	
l4386:	
	movf	(_sicaklik),w
	fcall	_display_number
	line	263
	opt asmopt_off
movlw  21
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	75
movwf	((??_main+0)+0+1),f
	movlw	209
movwf	((??_main+0)+0),f
u3847:
	decfsz	((??_main+0)+0),f
	goto	u3847
	decfsz	((??_main+0)+0+1),f
	goto	u3847
	decfsz	((??_main+0)+0+2),f
	goto	u3847
	clrwdt
opt asmopt_on

	line	264
	movlw	(03h)
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_what_to_display)
	line	265
	
l4388:	
	movf	(_nem),w
	fcall	_display_number
	line	267
	
l4390:	
	opt asmopt_off
movlw  21
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	75
movwf	((??_main+0)+0+1),f
	movlw	209
movwf	((??_main+0)+0),f
u3857:
	decfsz	((??_main+0)+0),f
	goto	u3857
	decfsz	((??_main+0)+0+1),f
	goto	u3857
	decfsz	((??_main+0)+0+2),f
	goto	u3857
	clrwdt
opt asmopt_on

	goto	l4380
	line	268
	
l1162:	
	goto	l4380
	line	270
	
l1163:	
	line	254
	goto	l4380
	
l1164:	
	line	272
	
l1165:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_display_number
psect	text290,local,class=CODE,delta=2
global __ptext290
__ptext290:

;; *************** function _display_number *****************
;; Defined at:
;;		line 131 in file "../PIC12f1840Denemeler.c"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___awdiv
;;		_display_digit
;;		___awmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text290
	file	"../PIC12f1840Denemeler.c"
	line	131
	global	__size_of_display_number
	__size_of_display_number	equ	__end_of_display_number-_display_number
	
_display_number:	
	opt	stack 11
; Regs used in _display_number: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(display_number@number)
	line	132
	
l4312:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(display_number@number),w
	movwf	(??_display_number+0)+0
	clrf	(??_display_number+0)+0+1
	movf	0+(??_display_number+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_display_number+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movlb 0	; select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_display_number+2)+0
	movf	(??_display_number+2)+0,w
	movwf	(?_display_digit)
	movlw	(01h)
	fcall	_display_digit
	line	133
	
l4314:	
	opt asmopt_off
movlw  2
	movlb 0	; select bank0
movwf	((??_display_number+0)+0+2),f
movlw	4
movwf	((??_display_number+0)+0+1),f
	movlw	186
movwf	((??_display_number+0)+0),f
u3867:
	decfsz	((??_display_number+0)+0),f
	goto	u3867
	decfsz	((??_display_number+0)+0+1),f
	goto	u3867
	decfsz	((??_display_number+0)+0+2),f
	goto	u3867
	clrwdt
opt asmopt_on

	line	134
	
l4316:	
	movlw	low(0Ah)
	movlb 0	; select bank0
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(display_number@number),w
	movwf	(??_display_number+0)+0
	clrf	(??_display_number+0)+0+1
	movf	0+(??_display_number+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_display_number+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movlb 0	; select bank0
	movf	(0+(?___awmod)),w
	movwf	(??_display_number+2)+0
	movf	(??_display_number+2)+0,w
	movwf	(?_display_digit)
	movlw	(02h)
	fcall	_display_digit
	line	135
	
l1146:	
	return
	opt stack 0
GLOBAL	__end_of_display_number
	__end_of_display_number:
;; =============== function _display_number ends ============

	signat	_display_number,4216
	global	_display_digit
psect	text291,local,class=CODE,delta=2
global __ptext291
__ptext291:

;; *************** function _display_digit *****************
;; Defined at:
;;		line 72 in file "../PIC12f1840Denemeler.c"
;; Parameters:    Size  Location     Type
;;  segment_numb    1    wreg     unsigned char 
;;  value           1   15[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  segment_numb    1   18[BANK0 ] unsigned char 
;;  index           1   19[BANK0 ] unsigned char 
;;  temp            1   17[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text291
	file	"../PIC12f1840Denemeler.c"
	line	72
	global	__size_of_display_digit
	__size_of_display_digit	equ	__end_of_display_digit-_display_digit
	
_display_digit:	
	opt	stack 11
; Regs used in _display_digit: [wreg+fsr1l-status,0]
	movlb 0	; select bank0
	movwf	(display_digit@segment_number)
	line	73
	
l4270:	
	movf	(display_digit@value),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??_display_digit+0)+0
	movf	(??_display_digit+0)+0,w
	movwf	(display_digit@temp)
	line	74
	
l4272:	
	movf	(_what_to_display),w
	xorlw	02h&0ffh
	skipz
	goto	u3721
	goto	u3720
u3721:
	goto	l4278
u3720:
	line	76
	
l4274:	
	movf	(display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u3731
	goto	u3730
u3731:
	goto	l1136
u3730:
	line	78
	
l4276:	
	bsf	(display_digit@temp)+(7/8),(7)&7
	goto	l1136
	line	79
	
l1135:	
	line	81
	goto	l1136
	line	82
	
l1134:	
	
l4278:	
	movf	(_what_to_display),w
	xorlw	03h&0ffh
	skipz
	goto	u3741
	goto	u3740
u3741:
	goto	l1136
u3740:
	line	84
	
l4280:	
	movf	(display_digit@segment_number),w
	xorlw	02h&0ffh
	skipz
	goto	u3751
	goto	u3750
u3751:
	goto	l1136
u3750:
	line	86
	
l4282:	
	bsf	(display_digit@temp)+(7/8),(7)&7
	goto	l1136
	line	87
	
l1138:	
	goto	l1136
	line	89
	
l1137:	
	line	92
	
l1136:	
	clrf	(display_digit@index)
	
l4284:	
	movlw	(08h)
	subwf	(display_digit@index),w
	skipc
	goto	u3761
	goto	u3760
u3761:
	goto	l4288
u3760:
	goto	l4300
	
l4286:	
	goto	l4300
	line	93
	
l1139:	
	line	94
	
l4288:	
	movf	(display_digit@temp),w
	movwf	(??_display_digit+0)+0
	decf	(display_digit@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u3774
u3775:
	lsrf	(??_display_digit+0)+0,f
u3774:
	decfsz	wreg,f
	goto	u3775
	btfsc	0+(??_display_digit+0)+0,0
	goto	u3781
	goto	u3780
	
u3781:
	movlb 0	; select bank0
	bsf	(97/8),(97)&7
	goto	u3794
u3780:
	movlb 0	; select bank0
	bcf	(97/8),(97)&7
u3794:
	line	96
	
l4290:	
	bsf	(96/8),(96)&7
	line	98
	
l4292:	
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3877:
decfsz	(??_display_digit+0)+0,f
	goto	u3877
opt asmopt_on

	line	99
	
l4294:	
	movlb 0	; select bank0
	bcf	(96/8),(96)&7
	line	101
	
l4296:	
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3887:
decfsz	(??_display_digit+0)+0,f
	goto	u3887
opt asmopt_on

	line	92
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_display_digit+0)+0
	movf	(??_display_digit+0)+0,w
	addwf	(display_digit@index),f
	
l4298:	
	movlw	(08h)
	subwf	(display_digit@index),w
	skipc
	goto	u3801
	goto	u3800
u3801:
	goto	l4288
u3800:
	goto	l4300
	
l1140:	
	line	106
	
l4300:	
	movf	(display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u3811
	goto	u3810
u3811:
	goto	l1141
u3810:
	line	108
	
l4302:	
	bsf	(98/8),(98)&7
	line	110
	
l4304:	
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3897:
decfsz	(??_display_digit+0)+0,f
	goto	u3897
opt asmopt_on

	line	111
	
l4306:	
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	113
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3907:
decfsz	(??_display_digit+0)+0,f
	goto	u3907
opt asmopt_on

	line	114
	goto	l1143
	line	115
	
l1141:	
	line	117
	bsf	(100/8),(100)&7
	line	119
	
l4308:	
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3917:
decfsz	(??_display_digit+0)+0,f
	goto	u3917
opt asmopt_on

	line	120
	
l4310:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	122
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3927:
decfsz	(??_display_digit+0)+0,f
	goto	u3927
opt asmopt_on

	goto	l1143
	line	123
	
l1142:	
	line	126
	
l1143:	
	return
	opt stack 0
GLOBAL	__end_of_display_digit
	__end_of_display_digit:
;; =============== function _display_digit ends ============

	signat	_display_digit,8312
	global	_DHT11_get_data
psect	text292,local,class=CODE,delta=2
global __ptext292
__ptext292:

;; *************** function _DHT11_get_data *****************
;; Defined at:
;;		line 22 in file "../PIC12f1840Denemeler.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  bit_index       1   10[BANK0 ] char 
;;  byte_index      1    9[BANK0 ] unsigned char 
;;  a               1    8[BANK0 ] unsigned char 
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
;;      Locals:         0       3       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text292
	file	"../PIC12f1840Denemeler.c"
	line	22
	global	__size_of_DHT11_get_data
	__size_of_DHT11_get_data	equ	__end_of_DHT11_get_data-_DHT11_get_data
	
_DHT11_get_data:	
	opt	stack 12
; Regs used in _DHT11_get_data: [wreg+fsr1l-status,0]
	line	23
	
l4218:	
	movlb 0	; select bank0
	clrf	(DHT11_get_data@a)
	
l4220:	
	movlw	(05h)
	subwf	(DHT11_get_data@a),w
	skipc
	goto	u3591
	goto	u3590
u3591:
	goto	l4224
u3590:
	goto	l1110
	
l4222:	
	goto	l1110
	
l1109:	
	
l4224:	
	movf	(DHT11_get_data@a),w
	addlw	_dht11_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l4226:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@a),f
	
l4228:	
	movlw	(05h)
	subwf	(DHT11_get_data@a),w
	skipc
	goto	u3601
	goto	u3600
u3601:
	goto	l4224
u3600:
	
l1110:	
	line	25
	bcf	(101/8),(101)&7
	line	26
	movlb 1	; select bank1
	bcf	(1125/8)^080h,(1125)&7
	line	27
	
l4230:	
	opt asmopt_off
movlw	104
	movlb 0	; select bank0
movwf	((??_DHT11_get_data+0)+0+1),f
	movlw	228
movwf	((??_DHT11_get_data+0)+0),f
u3937:
	decfsz	((??_DHT11_get_data+0)+0),f
	goto	u3937
	decfsz	((??_DHT11_get_data+0)+0+1),f
	goto	u3937
	clrwdt
opt asmopt_on

	line	28
	
l4232:	
	movlb 1	; select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	29
	opt asmopt_off
movlw	26
	movlb 0	; select bank0
movwf	(??_DHT11_get_data+0)+0,f
u3947:
decfsz	(??_DHT11_get_data+0)+0,f
	goto	u3947
	clrwdt
opt asmopt_on

	line	30
	goto	l1111
	
l1112:	
	
l1111:	
	movlb 0	; select bank0
	btfsc	(101/8),(101)&7
	goto	u3611
	goto	u3610
u3611:
	goto	l1111
u3610:
	goto	l1114
	
l1113:	
	line	32
	goto	l1114
	
l1115:	
	
l1114:	
	btfss	(101/8),(101)&7
	goto	u3621
	goto	u3620
u3621:
	goto	l1114
u3620:
	goto	l1117
	
l1116:	
	line	33
	goto	l1117
	
l1118:	
	
l1117:	
	btfsc	(101/8),(101)&7
	goto	u3631
	goto	u3630
u3631:
	goto	l1117
u3630:
	
l1119:	
	line	35
	clrf	(DHT11_get_data@byte_index)
	
l4234:	
	movlw	(05h)
	subwf	(DHT11_get_data@byte_index),w
	skipc
	goto	u3641
	goto	u3640
u3641:
	goto	l4238
u3640:
	goto	l4268
	
l4236:	
	goto	l4268
	line	36
	
l1120:	
	line	38
	
l4238:	
	movlw	(07h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	movwf	(DHT11_get_data@bit_index)
	
l4240:	
	btfss	(DHT11_get_data@bit_index),7
	goto	u3651
	goto	u3650
u3651:
	goto	l4246
u3650:
	goto	l4264
	
l4242:	
	goto	l4264
	line	39
	
l1122:	
	line	40
	goto	l4246
	
l1125:	
	
l4244:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(_low_time_count),f
	goto	l4246
	
l1124:	
	
l4246:	
	btfss	(101/8),(101)&7
	goto	u3661
	goto	u3660
u3661:
	goto	l4244
u3660:
	goto	l4250
	
l1126:	
	line	41
	goto	l4250
	
l1128:	
	
l4248:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(_high_time_count),f
	goto	l4250
	
l1127:	
	
l4250:	
	btfsc	(101/8),(101)&7
	goto	u3671
	goto	u3670
u3671:
	goto	l4248
u3670:
	goto	l4252
	
l1129:	
	line	42
	
l4252:	
	movf	(_high_time_count),w
	subwf	(_low_time_count),w
	skipnc
	goto	u3681
	goto	u3680
u3681:
	goto	l4256
u3680:
	line	44
	
l4254:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	incf	(DHT11_get_data@bit_index),w
	goto	u3694
u3695:
	lslf	(??_DHT11_get_data+0)+0,f
u3694:
	decfsz	wreg,f
	goto	u3695
	movf	0+(??_DHT11_get_data+0)+0,w
	movwf	(??_DHT11_get_data+1)+0
	movf	(DHT11_get_data@byte_index),w
	addlw	_dht11_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_DHT11_get_data+1)+0,w
	iorwf	indf1,f
	goto	l4256
	line	45
	
l1130:	
	line	47
	
l4256:	
	clrf	(_low_time_count)
	line	48
	
l4258:	
	clrf	(_high_time_count)
	line	38
	
l4260:	
	movlw	(-1)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@bit_index),f
	
l4262:	
	btfss	(DHT11_get_data@bit_index),7
	goto	u3701
	goto	u3700
u3701:
	goto	l4246
u3700:
	goto	l4264
	
l1123:	
	line	35
	
l4264:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@byte_index),f
	
l4266:	
	movlw	(05h)
	subwf	(DHT11_get_data@byte_index),w
	skipc
	goto	u3711
	goto	u3710
u3711:
	goto	l4238
u3710:
	goto	l4268
	
l1121:	
	line	55
	
l4268:	
	movf	0+(_dht11_data)+02h,w
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	movwf	(_sicaklik)
	line	56
	movf	(_dht11_data),w
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	movwf	(_nem)
	line	61
	
l1131:	
	return
	opt stack 0
GLOBAL	__end_of_DHT11_get_data
	__end_of_DHT11_get_data:
;; =============== function _DHT11_get_data ends ============

	signat	_DHT11_get_data,88
	global	___awmod
psect	text293,local,class=CODE,delta=2
global __ptext293
__ptext293:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[BANK0 ] int 
;;  dividend        2    8[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   12[BANK0 ] unsigned char 
;;  counter         1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text293
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 11
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l4062:	
	movlb 0	; select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u3211
	goto	u3210
u3211:
	goto	l4066
u3210:
	line	10
	
l4064:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l4066
	line	12
	
l2398:	
	line	13
	
l4066:	
	btfss	(___awmod@divisor+1),7
	goto	u3221
	goto	u3220
u3221:
	goto	l4070
u3220:
	line	14
	
l4068:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l4070
	
l2399:	
	line	15
	
l4070:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u3231
	goto	u3230
u3231:
	goto	l4088
u3230:
	line	16
	
l4072:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l4078
	
l2402:	
	line	18
	
l4074:	
	movlw	01h
	
u3245:
	lslf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u3245
	line	19
	
l4076:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l4078
	line	20
	
l2401:	
	line	17
	
l4078:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u3251
	goto	u3250
u3251:
	goto	l4074
u3250:
	goto	l4080
	
l2403:	
	goto	l4080
	line	21
	
l2404:	
	line	22
	
l4080:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u3265
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u3265:
	skipc
	goto	u3261
	goto	u3260
u3261:
	goto	l4084
u3260:
	line	23
	
l4082:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	subwfb	(___awmod@dividend+1),f
	goto	l4084
	
l2405:	
	line	24
	
l4084:	
	movlw	01h
	
u3275:
	lsrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	decfsz	wreg,f
	goto	u3275
	line	25
	
l4086:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u3281
	goto	u3280
u3281:
	goto	l4080
u3280:
	goto	l4088
	
l2406:	
	goto	l4088
	line	26
	
l2400:	
	line	27
	
l4088:	
	movf	(___awmod@sign),w
	skipz
	goto	u3290
	goto	l4092
u3290:
	line	28
	
l4090:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l4092
	
l2407:	
	line	29
	
l4092:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l2408
	
l4094:	
	line	30
	
l2408:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text294,local,class=CODE,delta=2
global __ptext294
__ptext294:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[BANK0 ] int 
;;  dividend        2    8[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   13[BANK0 ] int 
;;  sign            1   12[BANK0 ] unsigned char 
;;  counter         1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       4       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text294
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 11
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l4022:	
	movlb 0	; select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u3111
	goto	u3110
u3111:
	goto	l4026
u3110:
	line	11
	
l4024:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l4026
	line	13
	
l2330:	
	line	14
	
l4026:	
	btfss	(___awdiv@dividend+1),7
	goto	u3121
	goto	u3120
u3121:
	goto	l4032
u3120:
	line	15
	
l4028:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4030:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l4032
	line	17
	
l2331:	
	line	18
	
l4032:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l4034:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u3131
	goto	u3130
u3131:
	goto	l4054
u3130:
	line	20
	
l4036:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l4042
	
l2334:	
	line	22
	
l4038:	
	movlw	01h
	
u3145:
	lslf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u3145
	line	23
	
l4040:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l4042
	line	24
	
l2333:	
	line	21
	
l4042:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l4038
u3150:
	goto	l4044
	
l2335:	
	goto	l4044
	line	25
	
l2336:	
	line	26
	
l4044:	
	movlw	01h
	
u3165:
	lslf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u3165
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u3175
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u3175:
	skipc
	goto	u3171
	goto	u3170
u3171:
	goto	l4050
u3170:
	line	28
	
l4046:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	subwfb	(___awdiv@dividend+1),f
	line	29
	
l4048:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l4050
	line	30
	
l2337:	
	line	31
	
l4050:	
	movlw	01h
	
u3185:
	lsrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	decfsz	wreg,f
	goto	u3185
	line	32
	
l4052:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u3191
	goto	u3190
u3191:
	goto	l4044
u3190:
	goto	l4054
	
l2338:	
	goto	l4054
	line	33
	
l2332:	
	line	34
	
l4054:	
	movf	(___awdiv@sign),w
	skipz
	goto	u3200
	goto	l4058
u3200:
	line	35
	
l4056:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l4058
	
l2339:	
	line	36
	
l4058:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2340
	
l4060:	
	line	37
	
l2340:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_FNC
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:

;; *************** function _FNC *****************
;; Defined at:
;;		line 144 in file "../PIC12f1840Denemeler.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_display_number
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"../PIC12f1840Denemeler.c"
	line	144
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 11
; Regs used in _FNC: [wreg+fsr1l-status,0+pclath+cstack]
psect	intentry
	pagesel	$
	movlb 0	; select bank0
	movf	btemp+1,w
	movwf	(??_FNC+1)
	line	145
	
i1l3976:	
	btfss	(136/8),(136)&7
	goto	u304_21
	goto	u304_20
u304_21:
	goto	i1l1149
u304_20:
	line	146
	
i1l3978:	
	bcf	(192/8),(192)&7
	line	147
	
i1l3980:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_timer_count),f
	line	148
	
i1l3982:	
	movf	(_timer_count),w
	xorlw	014h&0ffh
	skipz
	goto	u305_21
	goto	u305_20
u305_21:
	goto	i1l3996
u305_20:
	line	150
	
i1l3984:	
	clrf	(_timer_count)
	line	151
	
i1l3986:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_second_count),f
	line	152
	
i1l3988:	
	movf	(_second_count),w
	xorlw	063h&0ffh
	skipz
	goto	u306_21
	goto	u306_20
u306_21:
	goto	i1l3994
u306_20:
	line	155
	
i1l3990:	
	bcf	(192/8),(192)&7
	line	156
	
i1l3992:	
	movlw	(08h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	goto	i1l3994
	line	157
	
i1l1151:	
	line	162
	
i1l3994:	
	movf	(_second_count),w
	fcall	i1_display_number
	goto	i1l3996
	line	163
	
i1l1150:	
	line	165
	
i1l3996:	
	movlw	low(03CAFh)
	movlb 0	; select bank0
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	166
	
i1l3998:	
	bcf	(136/8),(136)&7
	line	167
	
i1l4000:	
	movf	(_count_status),w
	xorlw	08h&0ffh
	skipnz
	goto	u307_21
	goto	u307_20
u307_21:
	goto	i1l1158
u307_20:
	line	169
	
i1l4002:	
	bsf	(192/8),(192)&7
	goto	i1l1158
	line	170
	
i1l1152:	
	line	171
	goto	i1l1158
	line	172
	
i1l1149:	
	line	174
	btfss	(88/8),(88)&7
	goto	u308_21
	goto	u308_20
u308_21:
	goto	i1l1158
u308_20:
	line	176
	
i1l4004:	
	movf	(_count_status),w
	xorlw	08h&0ffh
	skipz
	goto	u309_21
	goto	u309_20
u309_21:
	goto	i1l4012
u309_20:
	line	178
	
i1l4006:	
	movlw	(09h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	line	179
	movlw	low(03CAFh)
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	180
	
i1l4008:	
	clrf	(_second_count)
	line	181
	
i1l4010:	
	bsf	(192/8),(192)&7
	line	182
	goto	i1l4018
	line	183
	
i1l1155:	
	
i1l4012:	
	movf	(_count_status),w
	xorlw	09h&0ffh
	skipz
	goto	u310_21
	goto	u310_20
u310_21:
	goto	i1l4018
u310_20:
	line	185
	
i1l4014:	
	movlw	(08h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	line	186
	
i1l4016:	
	bcf	(192/8),(192)&7
	goto	i1l4018
	line	188
	
i1l1157:	
	goto	i1l4018
	line	190
	
i1l1156:	
	
i1l4018:	
	bcf	(88/8),(88)&7
	line	191
	
i1l4020:	
	movlb 7	; select bank7
	bcf	(7325/8)^0380h,(7325)&7
	goto	i1l1158
	line	192
	
i1l1154:	
	goto	i1l1158
	line	194
	
i1l1153:	
	
i1l1158:	
	movlb 0	; select bank0
	movf	(??_FNC+1),w
	movwf	btemp+1
	retfie
	opt stack 0
GLOBAL	__end_of_FNC
	__end_of_FNC:
;; =============== function _FNC ends ============

	signat	_FNC,88
	global	i1_display_number
psect	text296,local,class=CODE,delta=2
global __ptext296
__ptext296:

;; *************** function i1_display_number *****************
;; Defined at:
;;		line 131 in file "../PIC12f1840Denemeler.c"
;; Parameters:    Size  Location     Type
;;  display_numb    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  display_numb    1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1___awdiv
;;		i1_display_digit
;;		i1___awmod
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text296
	file	"../PIC12f1840Denemeler.c"
	line	131
	global	__size_ofi1_display_number
	__size_ofi1_display_number	equ	__end_ofi1_display_number-i1_display_number
	
i1_display_number:	
	opt	stack 11
; Regs used in i1_display_number: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(i1display_number@number)
	line	132
	
i1l4138:	
	movlw	low(0Ah)
	movwf	(?i1___awdiv)
	movlw	high(0Ah)
	movwf	((?i1___awdiv))+1
	movf	(i1display_number@number),w
	movwf	(??i1_display_number+0)+0
	clrf	(??i1_display_number+0)+0+1
	movf	0+(??i1_display_number+0)+0,w
	movwf	0+(?i1___awdiv)+02h
	movf	1+(??i1_display_number+0)+0,w
	movwf	1+(?i1___awdiv)+02h
	fcall	i1___awdiv
	movf	(0+(?i1___awdiv)),w
	movlb 0	; select bank0
	movwf	(??i1_display_number+2)+0
	movf	(??i1_display_number+2)+0,w
	movwf	(?i1_display_digit)
	movlw	(01h)
	fcall	i1_display_digit
	line	133
	
i1l4140:	
	opt asmopt_off
movlw  2
	movlb 0	; select bank0
movwf	((??i1_display_number+0)+0+2),f
movlw	4
movwf	((??i1_display_number+0)+0+1),f
	movlw	186
movwf	((??i1_display_number+0)+0),f
u395_27:
	decfsz	((??i1_display_number+0)+0),f
	goto	u395_27
	decfsz	((??i1_display_number+0)+0+1),f
	goto	u395_27
	decfsz	((??i1_display_number+0)+0+2),f
	goto	u395_27
	clrwdt
opt asmopt_on

	line	134
	
i1l4142:	
	movlw	low(0Ah)
	movwf	(?i1___awmod)
	movlw	high(0Ah)
	movwf	((?i1___awmod))+1
	movlb 0	; select bank0
	movf	(i1display_number@number),w
	movwf	(??i1_display_number+0)+0
	clrf	(??i1_display_number+0)+0+1
	movf	0+(??i1_display_number+0)+0,w
	movwf	0+(?i1___awmod)+02h
	movf	1+(??i1_display_number+0)+0,w
	movwf	1+(?i1___awmod)+02h
	fcall	i1___awmod
	movf	(0+(?i1___awmod)),w
	movlb 0	; select bank0
	movwf	(??i1_display_number+2)+0
	movf	(??i1_display_number+2)+0,w
	movwf	(?i1_display_digit)
	movlw	(02h)
	fcall	i1_display_digit
	line	135
	
i1l1146:	
	return
	opt stack 0
GLOBAL	__end_ofi1_display_number
	__end_ofi1_display_number:
;; =============== function i1_display_number ends ============

	signat	i1_display_number,88
	global	i1_display_digit
psect	text297,local,class=CODE,delta=2
global __ptext297
__ptext297:

;; *************** function i1_display_digit *****************
;; Defined at:
;;		line 72 in file "../PIC12f1840Denemeler.c"
;; Parameters:    Size  Location     Type
;;  display_digi    1    wreg     unsigned char 
;;  display_digi    1    9[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  display_digi    1   12[COMMON] unsigned char 
;;  display_digi    1   13[COMMON] unsigned char 
;;  display_digi    1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_display_number
;; This function uses a non-reentrant model
;;
psect	text297
	file	"../PIC12f1840Denemeler.c"
	line	72
	global	__size_ofi1_display_digit
	__size_ofi1_display_digit	equ	__end_ofi1_display_digit-i1_display_digit
	
i1_display_digit:	
	opt	stack 11
; Regs used in i1_display_digit: [wreg+fsr1l-status,0]
	movwf	(i1display_digit@segment_number)
	line	73
	
i1l4096:	
	movf	(i1display_digit@value),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??i1_display_digit+0)+0
	movf	(??i1_display_digit+0)+0,w
	movwf	(i1display_digit@temp)
	line	74
	
i1l4098:	
	movlb 0	; select bank0
	movf	(_what_to_display),w
	xorlw	02h&0ffh
	skipz
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l4104
u330_20:
	line	76
	
i1l4100:	
	movf	(i1display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l1136
u331_20:
	line	78
	
i1l4102:	
	bsf	(i1display_digit@temp)+(7/8),(7)&7
	goto	i1l1136
	line	79
	
i1l1135:	
	line	81
	goto	i1l1136
	line	82
	
i1l1134:	
	
i1l4104:	
	movf	(_what_to_display),w
	xorlw	03h&0ffh
	skipz
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l1136
u332_20:
	line	84
	
i1l4106:	
	movf	(i1display_digit@segment_number),w
	xorlw	02h&0ffh
	skipz
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l1136
u333_20:
	line	86
	
i1l4108:	
	bsf	(i1display_digit@temp)+(7/8),(7)&7
	goto	i1l1136
	line	87
	
i1l1138:	
	goto	i1l1136
	line	89
	
i1l1137:	
	line	92
	
i1l1136:	
	clrf	(i1display_digit@index)
	
i1l4110:	
	movlw	(08h)
	subwf	(i1display_digit@index),w
	skipc
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l4114
u334_20:
	goto	i1l4126
	
i1l4112:	
	goto	i1l4126
	line	93
	
i1l1139:	
	line	94
	
i1l4114:	
	movf	(i1display_digit@temp),w
	movwf	(??i1_display_digit+0)+0
	decf	(i1display_digit@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u335_24
u335_25:
	lsrf	(??i1_display_digit+0)+0,f
u335_24:
	decfsz	wreg,f
	goto	u335_25
	btfsc	0+(??i1_display_digit+0)+0,0
	goto	u336_21
	goto	u336_20
	
u336_21:
	movlb 0	; select bank0
	bsf	(97/8),(97)&7
	goto	u337_24
u336_20:
	movlb 0	; select bank0
	bcf	(97/8),(97)&7
u337_24:
	line	96
	
i1l4116:	
	bsf	(96/8),(96)&7
	line	98
	
i1l4118:	
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u396_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u396_27
opt asmopt_on

	line	99
	
i1l4120:	
	movlb 0	; select bank0
	bcf	(96/8),(96)&7
	line	101
	
i1l4122:	
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u397_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u397_27
opt asmopt_on

	line	92
	movlw	(01h)
	movwf	(??i1_display_digit+0)+0
	movf	(??i1_display_digit+0)+0,w
	addwf	(i1display_digit@index),f
	
i1l4124:	
	movlw	(08h)
	subwf	(i1display_digit@index),w
	skipc
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l4114
u338_20:
	goto	i1l4126
	
i1l1140:	
	line	106
	
i1l4126:	
	movf	(i1display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l1141
u339_20:
	line	108
	
i1l4128:	
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	110
	
i1l4130:	
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u398_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u398_27
opt asmopt_on

	line	111
	
i1l4132:	
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	113
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u399_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u399_27
opt asmopt_on

	line	114
	goto	i1l1143
	line	115
	
i1l1141:	
	line	117
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	119
	
i1l4134:	
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u400_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u400_27
opt asmopt_on

	line	120
	
i1l4136:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	122
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u401_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u401_27
opt asmopt_on

	goto	i1l1143
	line	123
	
i1l1142:	
	line	126
	
i1l1143:	
	return
	opt stack 0
GLOBAL	__end_ofi1_display_digit
	__end_ofi1_display_digit:
;; =============== function i1_display_digit ends ============

	signat	i1_display_digit,88
	global	i1___awmod
psect	text298,local,class=CODE,delta=2
global __ptext298
__ptext298:

;; *************** function i1___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  __awmod         2    0[COMMON] int 
;;  __awmod         2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  __awmod         1    6[COMMON] unsigned char 
;;  __awmod         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_display_number
;; This function uses a non-reentrant model
;;
psect	text298
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_ofi1___awmod
	__size_ofi1___awmod	equ	__end_ofi1___awmod-i1___awmod
	
i1___awmod:	
	opt	stack 11
; Regs used in i1___awmod: [wreg+status,2+status,0]
	line	8
	
i1l4184:	
	clrf	(i1___awmod@sign)
	line	9
	btfss	(i1___awmod@dividend+1),7
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l4188
u350_20:
	line	10
	
i1l4186:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	line	11
	clrf	(i1___awmod@sign)
	bsf	status,0
	rlf	(i1___awmod@sign),f
	goto	i1l4188
	line	12
	
i1l2398:	
	line	13
	
i1l4188:	
	btfss	(i1___awmod@divisor+1),7
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l4192
u351_20:
	line	14
	
i1l4190:	
	comf	(i1___awmod@divisor),f
	comf	(i1___awmod@divisor+1),f
	incf	(i1___awmod@divisor),f
	skipnz
	incf	(i1___awmod@divisor+1),f
	goto	i1l4192
	
i1l2399:	
	line	15
	
i1l4192:	
	movf	(i1___awmod@divisor+1),w
	iorwf	(i1___awmod@divisor),w
	skipnz
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l4210
u352_20:
	line	16
	
i1l4194:	
	clrf	(i1___awmod@counter)
	bsf	status,0
	rlf	(i1___awmod@counter),f
	line	17
	goto	i1l4200
	
i1l2402:	
	line	18
	
i1l4196:	
	movlw	01h
	
u353_25:
	lslf	(i1___awmod@divisor),f
	rlf	(i1___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u353_25
	line	19
	
i1l4198:	
	movlw	(01h)
	movwf	(??i1___awmod+0)+0
	movf	(??i1___awmod+0)+0,w
	addwf	(i1___awmod@counter),f
	goto	i1l4200
	line	20
	
i1l2401:	
	line	17
	
i1l4200:	
	btfss	(i1___awmod@divisor+1),(15)&7
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l4196
u354_20:
	goto	i1l4202
	
i1l2403:	
	goto	i1l4202
	line	21
	
i1l2404:	
	line	22
	
i1l4202:	
	movf	(i1___awmod@divisor+1),w
	subwf	(i1___awmod@dividend+1),w
	skipz
	goto	u355_25
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),w
u355_25:
	skipc
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l4206
u355_20:
	line	23
	
i1l4204:	
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),f
	movf	(i1___awmod@divisor+1),w
	subwfb	(i1___awmod@dividend+1),f
	goto	i1l4206
	
i1l2405:	
	line	24
	
i1l4206:	
	movlw	01h
	
u356_25:
	lsrf	(i1___awmod@divisor+1),f
	rrf	(i1___awmod@divisor),f
	decfsz	wreg,f
	goto	u356_25
	line	25
	
i1l4208:	
	movlw	low(01h)
	subwf	(i1___awmod@counter),f
	btfss	status,2
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l4202
u357_20:
	goto	i1l4210
	
i1l2406:	
	goto	i1l4210
	line	26
	
i1l2400:	
	line	27
	
i1l4210:	
	movf	(i1___awmod@sign),w
	skipz
	goto	u358_20
	goto	i1l4214
u358_20:
	line	28
	
i1l4212:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	goto	i1l4214
	
i1l2407:	
	line	29
	
i1l4214:	
	movf	(i1___awmod@dividend+1),w
	clrf	(?i1___awmod+1)
	addwf	(?i1___awmod+1)
	movf	(i1___awmod@dividend),w
	clrf	(?i1___awmod)
	addwf	(?i1___awmod)

	goto	i1l2408
	
i1l4216:	
	line	30
	
i1l2408:	
	return
	opt stack 0
GLOBAL	__end_ofi1___awmod
	__end_ofi1___awmod:
;; =============== function i1___awmod ends ============

	signat	i1___awmod,90
	global	i1___awdiv
psect	text299,local,class=CODE,delta=2
global __ptext299
__ptext299:

;; *************** function i1___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  __awdiv         2    0[COMMON] int 
;;  __awdiv         2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  __awdiv         2    7[COMMON] int 
;;  __awdiv         1    6[COMMON] unsigned char 
;;  __awdiv         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         4       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_display_number
;; This function uses a non-reentrant model
;;
psect	text299
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_ofi1___awdiv
	__size_ofi1___awdiv	equ	__end_ofi1___awdiv-i1___awdiv
	
i1___awdiv:	
	opt	stack 11
; Regs used in i1___awdiv: [wreg+status,2+status,0]
	line	9
	
i1l4144:	
	clrf	(i1___awdiv@sign)
	line	10
	btfss	(i1___awdiv@divisor+1),7
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l4148
u340_20:
	line	11
	
i1l4146:	
	comf	(i1___awdiv@divisor),f
	comf	(i1___awdiv@divisor+1),f
	incf	(i1___awdiv@divisor),f
	skipnz
	incf	(i1___awdiv@divisor+1),f
	line	12
	clrf	(i1___awdiv@sign)
	bsf	status,0
	rlf	(i1___awdiv@sign),f
	goto	i1l4148
	line	13
	
i1l2330:	
	line	14
	
i1l4148:	
	btfss	(i1___awdiv@dividend+1),7
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l4154
u341_20:
	line	15
	
i1l4150:	
	comf	(i1___awdiv@dividend),f
	comf	(i1___awdiv@dividend+1),f
	incf	(i1___awdiv@dividend),f
	skipnz
	incf	(i1___awdiv@dividend+1),f
	line	16
	
i1l4152:	
	movlw	(01h)
	movwf	(??i1___awdiv+0)+0
	movf	(??i1___awdiv+0)+0,w
	xorwf	(i1___awdiv@sign),f
	goto	i1l4154
	line	17
	
i1l2331:	
	line	18
	
i1l4154:	
	clrf	(i1___awdiv@quotient)
	clrf	(i1___awdiv@quotient+1)
	line	19
	
i1l4156:	
	movf	(i1___awdiv@divisor+1),w
	iorwf	(i1___awdiv@divisor),w
	skipnz
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l4176
u342_20:
	line	20
	
i1l4158:	
	clrf	(i1___awdiv@counter)
	bsf	status,0
	rlf	(i1___awdiv@counter),f
	line	21
	goto	i1l4164
	
i1l2334:	
	line	22
	
i1l4160:	
	movlw	01h
	
u343_25:
	lslf	(i1___awdiv@divisor),f
	rlf	(i1___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u343_25
	line	23
	
i1l4162:	
	movlw	(01h)
	movwf	(??i1___awdiv+0)+0
	movf	(??i1___awdiv+0)+0,w
	addwf	(i1___awdiv@counter),f
	goto	i1l4164
	line	24
	
i1l2333:	
	line	21
	
i1l4164:	
	btfss	(i1___awdiv@divisor+1),(15)&7
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l4160
u344_20:
	goto	i1l4166
	
i1l2335:	
	goto	i1l4166
	line	25
	
i1l2336:	
	line	26
	
i1l4166:	
	movlw	01h
	
u345_25:
	lslf	(i1___awdiv@quotient),f
	rlf	(i1___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u345_25
	line	27
	movf	(i1___awdiv@divisor+1),w
	subwf	(i1___awdiv@dividend+1),w
	skipz
	goto	u346_25
	movf	(i1___awdiv@divisor),w
	subwf	(i1___awdiv@dividend),w
u346_25:
	skipc
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l4172
u346_20:
	line	28
	
i1l4168:	
	movf	(i1___awdiv@divisor),w
	subwf	(i1___awdiv@dividend),f
	movf	(i1___awdiv@divisor+1),w
	subwfb	(i1___awdiv@dividend+1),f
	line	29
	
i1l4170:	
	bsf	(i1___awdiv@quotient)+(0/8),(0)&7
	goto	i1l4172
	line	30
	
i1l2337:	
	line	31
	
i1l4172:	
	movlw	01h
	
u347_25:
	lsrf	(i1___awdiv@divisor+1),f
	rrf	(i1___awdiv@divisor),f
	decfsz	wreg,f
	goto	u347_25
	line	32
	
i1l4174:	
	movlw	low(01h)
	subwf	(i1___awdiv@counter),f
	btfss	status,2
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l4166
u348_20:
	goto	i1l4176
	
i1l2338:	
	goto	i1l4176
	line	33
	
i1l2332:	
	line	34
	
i1l4176:	
	movf	(i1___awdiv@sign),w
	skipz
	goto	u349_20
	goto	i1l4180
u349_20:
	line	35
	
i1l4178:	
	comf	(i1___awdiv@quotient),f
	comf	(i1___awdiv@quotient+1),f
	incf	(i1___awdiv@quotient),f
	skipnz
	incf	(i1___awdiv@quotient+1),f
	goto	i1l4180
	
i1l2339:	
	line	36
	
i1l4180:	
	movf	(i1___awdiv@quotient+1),w
	clrf	(?i1___awdiv+1)
	addwf	(?i1___awdiv+1)
	movf	(i1___awdiv@quotient),w
	clrf	(?i1___awdiv)
	addwf	(?i1___awdiv)

	goto	i1l2340
	
i1l4182:	
	line	37
	
i1l2340:	
	return
	opt stack 0
GLOBAL	__end_ofi1___awdiv
	__end_ofi1___awdiv:
;; =============== function i1___awdiv ends ============

	signat	i1___awdiv,90
psect	text300,local,class=CODE,delta=2
global __ptext300
__ptext300:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
