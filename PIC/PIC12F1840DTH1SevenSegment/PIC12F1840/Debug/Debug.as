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
;;		line 190 in file "../PIC12f1840Denemeler.c"
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
	line	190
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 11
; Regs used in _main: [wreg+fsr1l-status,0+pclath+cstack]
	line	192
	
l4301:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	193
	
l4303:	
	movlb 1	; select bank1
	bcf	(1231/8)^080h,(1231)&7
	line	195
	
l4305:	
	bsf	(1230/8)^080h,(1230)&7
	line	196
	
l4307:	
	bsf	(1229/8)^080h,(1229)&7
	line	197
	
l4309:	
	bsf	(1228/8)^080h,(1228)&7
	line	198
	
l4311:	
	bsf	(1227/8)^080h,(1227)&7
	line	200
	
l4313:	
	bsf	(1225/8)^080h,(1225)&7
	line	201
	
l4315:	
	bcf	(1224/8)^080h,(1224)&7
	line	202
	
l4317:	
	bcf	(1120/8)^080h,(1120)&7
	line	203
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	206
	
l4319:	
	movlb 1	; select bank1
	bsf	(1123/8)^080h,(1123)&7
	line	207
	
l4321:	
	bsf	(1125/8)^080h,(1125)&7
	line	209
	
l4323:	
	bcf	(1120/8)^080h,(1120)&7
	line	210
	
l4325:	
	bcf	(1121/8)^080h,(1121)&7
	line	211
	
l4327:	
	bcf	(1122/8)^080h,(1122)&7
	line	212
	
l4329:	
	bcf	(1124/8)^080h,(1124)&7
	line	214
	movlb 7	; select bank7
	clrf	(914)^0380h	;volatile
	line	215
	clrf	(913)^0380h	;volatile
	line	217
	
l4331:	
	bsf	(7307/8)^0380h,(7307)&7
	line	218
	
l4333:	
	bsf	(91/8),(91)&7
	line	219
	
l4335:	
	bcf	(88/8),(88)&7
	line	220
	
l4337:	
	bcf	(7325/8)^0380h,(7325)&7
	line	223
	movlb 0	; select bank0
	clrf	(23)	;volatile
	line	224
	clrf	(22)	;volatile
	line	228
	
l4339:	
	bcf	(199/8),(199)&7
	line	229
	
l4341:	
	bcf	(198/8),(198)&7
	line	232
	
l4343:	
	bsf	(197/8),(197)&7
	line	233
	
l4345:	
	bcf	(196/8),(196)&7
	line	236
	
l4347:	
	bcf	(192/8),(192)&7
	line	237
	
l4349:	
	movlw	low(03CAFh)
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	238
	
l4351:	
	bcf	(136/8),(136)&7
	line	239
	
l4353:	
	movlb 1	; select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	240
	
l4355:	
	bsf	(94/8),(94)&7
	line	241
	
l4357:	
	bsf	(95/8),(95)&7
	line	242
	
l4359:	
	fcall	_DHT11_get_data
	line	243
	
l4361:	
	opt asmopt_off
movlw  3
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	8
movwf	((??_main+0)+0+1),f
	movlw	120
movwf	((??_main+0)+0),f
u3817:
	decfsz	((??_main+0)+0),f
	goto	u3817
	decfsz	((??_main+0)+0+1),f
	goto	u3817
	decfsz	((??_main+0)+0+2),f
	goto	u3817
opt asmopt_on

	goto	l4363
	line	245
	
l1160:	
	line	248
	
l4363:	
	movlb 0	; select bank0
	movf	(_count_status),w
	xorlw	08h&0ffh
	skipz
	goto	u3801
	goto	u3800
u3801:
	goto	l4363
u3800:
	line	250
	
l4365:	
	fcall	_DHT11_get_data
	line	252
	
l4367:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_what_to_display)
	line	253
	
l4369:	
	movf	(_sicaklik),w
	fcall	_display_number
	line	254
	opt asmopt_off
movlw  21
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	75
movwf	((??_main+0)+0+1),f
	movlw	209
movwf	((??_main+0)+0),f
u3827:
	decfsz	((??_main+0)+0),f
	goto	u3827
	decfsz	((??_main+0)+0+1),f
	goto	u3827
	decfsz	((??_main+0)+0+2),f
	goto	u3827
	clrwdt
opt asmopt_on

	line	255
	movlw	(03h)
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_what_to_display)
	line	256
	
l4371:	
	movf	(_nem),w
	fcall	_display_number
	line	258
	
l4373:	
	opt asmopt_off
movlw  21
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	75
movwf	((??_main+0)+0+1),f
	movlw	209
movwf	((??_main+0)+0),f
u3837:
	decfsz	((??_main+0)+0),f
	goto	u3837
	decfsz	((??_main+0)+0+1),f
	goto	u3837
	decfsz	((??_main+0)+0+2),f
	goto	u3837
	clrwdt
opt asmopt_on

	goto	l4363
	line	259
	
l1161:	
	goto	l4363
	line	261
	
l1162:	
	line	245
	goto	l4363
	
l1163:	
	line	263
	
l1164:	
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
	
l4295:	
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
	
l4297:	
	opt asmopt_off
movlw  2
	movlb 0	; select bank0
movwf	((??_display_number+0)+0+2),f
movlw	4
movwf	((??_display_number+0)+0+1),f
	movlw	186
movwf	((??_display_number+0)+0),f
u3847:
	decfsz	((??_display_number+0)+0),f
	goto	u3847
	decfsz	((??_display_number+0)+0+1),f
	goto	u3847
	decfsz	((??_display_number+0)+0+2),f
	goto	u3847
	clrwdt
opt asmopt_on

	line	134
	
l4299:	
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
	
l4253:	
	movf	(display_digit@value),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??_display_digit+0)+0
	movf	(??_display_digit+0)+0,w
	movwf	(display_digit@temp)
	line	74
	
l4255:	
	movf	(_what_to_display),w
	xorlw	02h&0ffh
	skipz
	goto	u3701
	goto	u3700
u3701:
	goto	l4261
u3700:
	line	76
	
l4257:	
	movf	(display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u3711
	goto	u3710
u3711:
	goto	l1136
u3710:
	line	78
	
l4259:	
	bsf	(display_digit@temp)+(7/8),(7)&7
	goto	l1136
	line	79
	
l1135:	
	line	81
	goto	l1136
	line	82
	
l1134:	
	
l4261:	
	movf	(_what_to_display),w
	xorlw	03h&0ffh
	skipz
	goto	u3721
	goto	u3720
u3721:
	goto	l1136
u3720:
	line	84
	
l4263:	
	movf	(display_digit@segment_number),w
	xorlw	02h&0ffh
	skipz
	goto	u3731
	goto	u3730
u3731:
	goto	l1136
u3730:
	line	86
	
l4265:	
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
	
l4267:	
	movlw	(08h)
	subwf	(display_digit@index),w
	skipc
	goto	u3741
	goto	u3740
u3741:
	goto	l4271
u3740:
	goto	l4283
	
l4269:	
	goto	l4283
	line	93
	
l1139:	
	line	94
	
l4271:	
	movf	(display_digit@temp),w
	movwf	(??_display_digit+0)+0
	decf	(display_digit@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u3754
u3755:
	lsrf	(??_display_digit+0)+0,f
u3754:
	decfsz	wreg,f
	goto	u3755
	btfsc	0+(??_display_digit+0)+0,0
	goto	u3761
	goto	u3760
	
u3761:
	movlb 0	; select bank0
	bsf	(97/8),(97)&7
	goto	u3774
u3760:
	movlb 0	; select bank0
	bcf	(97/8),(97)&7
u3774:
	line	96
	
l4273:	
	bsf	(96/8),(96)&7
	line	98
	
l4275:	
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3857:
decfsz	(??_display_digit+0)+0,f
	goto	u3857
opt asmopt_on

	line	99
	
l4277:	
	movlb 0	; select bank0
	bcf	(96/8),(96)&7
	line	101
	
l4279:	
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3867:
decfsz	(??_display_digit+0)+0,f
	goto	u3867
opt asmopt_on

	line	92
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_display_digit+0)+0
	movf	(??_display_digit+0)+0,w
	addwf	(display_digit@index),f
	
l4281:	
	movlw	(08h)
	subwf	(display_digit@index),w
	skipc
	goto	u3781
	goto	u3780
u3781:
	goto	l4271
u3780:
	goto	l4283
	
l1140:	
	line	106
	
l4283:	
	movf	(display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u3791
	goto	u3790
u3791:
	goto	l1141
u3790:
	line	108
	
l4285:	
	bsf	(98/8),(98)&7
	line	110
	
l4287:	
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3877:
decfsz	(??_display_digit+0)+0,f
	goto	u3877
opt asmopt_on

	line	111
	
l4289:	
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	113
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3887:
decfsz	(??_display_digit+0)+0,f
	goto	u3887
opt asmopt_on

	line	114
	goto	l1143
	line	115
	
l1141:	
	line	117
	bsf	(100/8),(100)&7
	line	119
	
l4291:	
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3897:
decfsz	(??_display_digit+0)+0,f
	goto	u3897
opt asmopt_on

	line	120
	
l4293:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	122
	opt asmopt_off
movlw	133
movwf	(??_display_digit+0)+0,f
u3907:
decfsz	(??_display_digit+0)+0,f
	goto	u3907
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
	
l4201:	
	movlb 0	; select bank0
	clrf	(DHT11_get_data@a)
	
l4203:	
	movlw	(05h)
	subwf	(DHT11_get_data@a),w
	skipc
	goto	u3571
	goto	u3570
u3571:
	goto	l4207
u3570:
	goto	l1110
	
l4205:	
	goto	l1110
	
l1109:	
	
l4207:	
	movf	(DHT11_get_data@a),w
	addlw	_dht11_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l4209:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@a),f
	
l4211:	
	movlw	(05h)
	subwf	(DHT11_get_data@a),w
	skipc
	goto	u3581
	goto	u3580
u3581:
	goto	l4207
u3580:
	
l1110:	
	line	25
	bcf	(101/8),(101)&7
	line	26
	movlb 1	; select bank1
	bcf	(1125/8)^080h,(1125)&7
	line	27
	
l4213:	
	opt asmopt_off
movlw	104
	movlb 0	; select bank0
movwf	((??_DHT11_get_data+0)+0+1),f
	movlw	228
movwf	((??_DHT11_get_data+0)+0),f
u3917:
	decfsz	((??_DHT11_get_data+0)+0),f
	goto	u3917
	decfsz	((??_DHT11_get_data+0)+0+1),f
	goto	u3917
	clrwdt
opt asmopt_on

	line	28
	
l4215:	
	movlb 1	; select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	29
	opt asmopt_off
movlw	26
	movlb 0	; select bank0
movwf	(??_DHT11_get_data+0)+0,f
u3927:
decfsz	(??_DHT11_get_data+0)+0,f
	goto	u3927
	clrwdt
opt asmopt_on

	line	30
	goto	l1111
	
l1112:	
	
l1111:	
	movlb 0	; select bank0
	btfsc	(101/8),(101)&7
	goto	u3591
	goto	u3590
u3591:
	goto	l1111
u3590:
	goto	l1114
	
l1113:	
	line	32
	goto	l1114
	
l1115:	
	
l1114:	
	btfss	(101/8),(101)&7
	goto	u3601
	goto	u3600
u3601:
	goto	l1114
u3600:
	goto	l1117
	
l1116:	
	line	33
	goto	l1117
	
l1118:	
	
l1117:	
	btfsc	(101/8),(101)&7
	goto	u3611
	goto	u3610
u3611:
	goto	l1117
u3610:
	
l1119:	
	line	35
	clrf	(DHT11_get_data@byte_index)
	
l4217:	
	movlw	(05h)
	subwf	(DHT11_get_data@byte_index),w
	skipc
	goto	u3621
	goto	u3620
u3621:
	goto	l4221
u3620:
	goto	l4251
	
l4219:	
	goto	l4251
	line	36
	
l1120:	
	line	38
	
l4221:	
	movlw	(07h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	movwf	(DHT11_get_data@bit_index)
	
l4223:	
	btfss	(DHT11_get_data@bit_index),7
	goto	u3631
	goto	u3630
u3631:
	goto	l4229
u3630:
	goto	l4247
	
l4225:	
	goto	l4247
	line	39
	
l1122:	
	line	40
	goto	l4229
	
l1125:	
	
l4227:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(_low_time_count),f
	goto	l4229
	
l1124:	
	
l4229:	
	btfss	(101/8),(101)&7
	goto	u3641
	goto	u3640
u3641:
	goto	l4227
u3640:
	goto	l4233
	
l1126:	
	line	41
	goto	l4233
	
l1128:	
	
l4231:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(_high_time_count),f
	goto	l4233
	
l1127:	
	
l4233:	
	btfsc	(101/8),(101)&7
	goto	u3651
	goto	u3650
u3651:
	goto	l4231
u3650:
	goto	l4235
	
l1129:	
	line	42
	
l4235:	
	movf	(_high_time_count),w
	subwf	(_low_time_count),w
	skipnc
	goto	u3661
	goto	u3660
u3661:
	goto	l4239
u3660:
	line	44
	
l4237:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	incf	(DHT11_get_data@bit_index),w
	goto	u3674
u3675:
	lslf	(??_DHT11_get_data+0)+0,f
u3674:
	decfsz	wreg,f
	goto	u3675
	movf	0+(??_DHT11_get_data+0)+0,w
	movwf	(??_DHT11_get_data+1)+0
	movf	(DHT11_get_data@byte_index),w
	addlw	_dht11_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_DHT11_get_data+1)+0,w
	iorwf	indf1,f
	goto	l4239
	line	45
	
l1130:	
	line	47
	
l4239:	
	clrf	(_low_time_count)
	line	48
	
l4241:	
	clrf	(_high_time_count)
	line	38
	
l4243:	
	movlw	(-1)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@bit_index),f
	
l4245:	
	btfss	(DHT11_get_data@bit_index),7
	goto	u3681
	goto	u3680
u3681:
	goto	l4229
u3680:
	goto	l4247
	
l1123:	
	line	35
	
l4247:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@byte_index),f
	
l4249:	
	movlw	(05h)
	subwf	(DHT11_get_data@byte_index),w
	skipc
	goto	u3691
	goto	u3690
u3691:
	goto	l4221
u3690:
	goto	l4251
	
l1121:	
	line	55
	
l4251:	
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
	
l4045:	
	movlb 0	; select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u3191
	goto	u3190
u3191:
	goto	l4049
u3190:
	line	10
	
l4047:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l4049
	line	12
	
l2397:	
	line	13
	
l4049:	
	btfss	(___awmod@divisor+1),7
	goto	u3201
	goto	u3200
u3201:
	goto	l4053
u3200:
	line	14
	
l4051:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l4053
	
l2398:	
	line	15
	
l4053:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u3211
	goto	u3210
u3211:
	goto	l4071
u3210:
	line	16
	
l4055:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l4061
	
l2401:	
	line	18
	
l4057:	
	movlw	01h
	
u3225:
	lslf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u3225
	line	19
	
l4059:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l4061
	line	20
	
l2400:	
	line	17
	
l4061:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u3231
	goto	u3230
u3231:
	goto	l4057
u3230:
	goto	l4063
	
l2402:	
	goto	l4063
	line	21
	
l2403:	
	line	22
	
l4063:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u3245
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u3245:
	skipc
	goto	u3241
	goto	u3240
u3241:
	goto	l4067
u3240:
	line	23
	
l4065:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	subwfb	(___awmod@dividend+1),f
	goto	l4067
	
l2404:	
	line	24
	
l4067:	
	movlw	01h
	
u3255:
	lsrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	decfsz	wreg,f
	goto	u3255
	line	25
	
l4069:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u3261
	goto	u3260
u3261:
	goto	l4063
u3260:
	goto	l4071
	
l2405:	
	goto	l4071
	line	26
	
l2399:	
	line	27
	
l4071:	
	movf	(___awmod@sign),w
	skipz
	goto	u3270
	goto	l4075
u3270:
	line	28
	
l4073:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l4075
	
l2406:	
	line	29
	
l4075:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l2407
	
l4077:	
	line	30
	
l2407:	
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
	
l4005:	
	movlb 0	; select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u3091
	goto	u3090
u3091:
	goto	l4009
u3090:
	line	11
	
l4007:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l4009
	line	13
	
l2329:	
	line	14
	
l4009:	
	btfss	(___awdiv@dividend+1),7
	goto	u3101
	goto	u3100
u3101:
	goto	l4015
u3100:
	line	15
	
l4011:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4013:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l4015
	line	17
	
l2330:	
	line	18
	
l4015:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l4017:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u3111
	goto	u3110
u3111:
	goto	l4037
u3110:
	line	20
	
l4019:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l4025
	
l2333:	
	line	22
	
l4021:	
	movlw	01h
	
u3125:
	lslf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u3125
	line	23
	
l4023:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l4025
	line	24
	
l2332:	
	line	21
	
l4025:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u3131
	goto	u3130
u3131:
	goto	l4021
u3130:
	goto	l4027
	
l2334:	
	goto	l4027
	line	25
	
l2335:	
	line	26
	
l4027:	
	movlw	01h
	
u3145:
	lslf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u3145
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u3155
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u3155:
	skipc
	goto	u3151
	goto	u3150
u3151:
	goto	l4033
u3150:
	line	28
	
l4029:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	subwfb	(___awdiv@dividend+1),f
	line	29
	
l4031:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l4033
	line	30
	
l2336:	
	line	31
	
l4033:	
	movlw	01h
	
u3165:
	lsrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	decfsz	wreg,f
	goto	u3165
	line	32
	
l4035:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u3171
	goto	u3170
u3171:
	goto	l4027
u3170:
	goto	l4037
	
l2337:	
	goto	l4037
	line	33
	
l2331:	
	line	34
	
l4037:	
	movf	(___awdiv@sign),w
	skipz
	goto	u3180
	goto	l4041
u3180:
	line	35
	
l4039:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l4041
	
l2338:	
	line	36
	
l4041:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2339
	
l4043:	
	line	37
	
l2339:	
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
	
i1l3967:	
	btfss	(136/8),(136)&7
	goto	u303_21
	goto	u303_20
u303_21:
	goto	i1l1149
u303_20:
	line	147
	
i1l3969:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_timer_count),f
	line	148
	
i1l3971:	
	movf	(_timer_count),w
	xorlw	014h&0ffh
	skipz
	goto	u304_21
	goto	u304_20
u304_21:
	goto	i1l3985
u304_20:
	line	150
	
i1l3973:	
	clrf	(_timer_count)
	line	151
	
i1l3975:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_second_count),f
	line	152
	
i1l3977:	
	movf	(_second_count),w
	xorlw	063h&0ffh
	skipz
	goto	u305_21
	goto	u305_20
u305_21:
	goto	i1l3983
u305_20:
	line	155
	
i1l3979:	
	bcf	(192/8),(192)&7
	line	156
	
i1l3981:	
	movlw	(08h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	goto	i1l3983
	line	157
	
i1l1151:	
	line	158
	
i1l3983:	
	movf	(_second_count),w
	fcall	i1_display_number
	goto	i1l3985
	line	159
	
i1l1150:	
	line	161
	
i1l3985:	
	movlb 0	; select bank0
	bcf	(136/8),(136)&7
	line	162
	goto	i1l1157
	line	163
	
i1l1149:	
	line	165
	btfss	(88/8),(88)&7
	goto	u306_21
	goto	u306_20
u306_21:
	goto	i1l1157
u306_20:
	line	167
	
i1l3987:	
	movf	(_count_status),w
	xorlw	08h&0ffh
	skipz
	goto	u307_21
	goto	u307_20
u307_21:
	goto	i1l3995
u307_20:
	line	169
	
i1l3989:	
	movlw	(09h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	line	170
	movlw	low(03CAFh)
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	171
	
i1l3991:	
	clrf	(_second_count)
	line	172
	
i1l3993:	
	bsf	(192/8),(192)&7
	line	173
	goto	i1l4001
	line	174
	
i1l1154:	
	
i1l3995:	
	movf	(_count_status),w
	xorlw	09h&0ffh
	skipz
	goto	u308_21
	goto	u308_20
u308_21:
	goto	i1l4001
u308_20:
	line	176
	
i1l3997:	
	movlw	(08h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	line	177
	
i1l3999:	
	bcf	(192/8),(192)&7
	goto	i1l4001
	line	179
	
i1l1156:	
	goto	i1l4001
	line	181
	
i1l1155:	
	
i1l4001:	
	bcf	(88/8),(88)&7
	line	182
	
i1l4003:	
	movlb 7	; select bank7
	bcf	(7325/8)^0380h,(7325)&7
	goto	i1l1157
	line	183
	
i1l1153:	
	goto	i1l1157
	line	185
	
i1l1152:	
	
i1l1157:	
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
	
i1l4121:	
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
	
i1l4123:	
	opt asmopt_off
movlw  2
	movlb 0	; select bank0
movwf	((??i1_display_number+0)+0+2),f
movlw	4
movwf	((??i1_display_number+0)+0+1),f
	movlw	186
movwf	((??i1_display_number+0)+0),f
u393_27:
	decfsz	((??i1_display_number+0)+0),f
	goto	u393_27
	decfsz	((??i1_display_number+0)+0+1),f
	goto	u393_27
	decfsz	((??i1_display_number+0)+0+2),f
	goto	u393_27
	clrwdt
opt asmopt_on

	line	134
	
i1l4125:	
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
	
i1l4079:	
	movf	(i1display_digit@value),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??i1_display_digit+0)+0
	movf	(??i1_display_digit+0)+0,w
	movwf	(i1display_digit@temp)
	line	74
	
i1l4081:	
	movlb 0	; select bank0
	movf	(_what_to_display),w
	xorlw	02h&0ffh
	skipz
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l4087
u328_20:
	line	76
	
i1l4083:	
	movf	(i1display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l1136
u329_20:
	line	78
	
i1l4085:	
	bsf	(i1display_digit@temp)+(7/8),(7)&7
	goto	i1l1136
	line	79
	
i1l1135:	
	line	81
	goto	i1l1136
	line	82
	
i1l1134:	
	
i1l4087:	
	movf	(_what_to_display),w
	xorlw	03h&0ffh
	skipz
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l1136
u330_20:
	line	84
	
i1l4089:	
	movf	(i1display_digit@segment_number),w
	xorlw	02h&0ffh
	skipz
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l1136
u331_20:
	line	86
	
i1l4091:	
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
	
i1l4093:	
	movlw	(08h)
	subwf	(i1display_digit@index),w
	skipc
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l4097
u332_20:
	goto	i1l4109
	
i1l4095:	
	goto	i1l4109
	line	93
	
i1l1139:	
	line	94
	
i1l4097:	
	movf	(i1display_digit@temp),w
	movwf	(??i1_display_digit+0)+0
	decf	(i1display_digit@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u333_24
u333_25:
	lsrf	(??i1_display_digit+0)+0,f
u333_24:
	decfsz	wreg,f
	goto	u333_25
	btfsc	0+(??i1_display_digit+0)+0,0
	goto	u334_21
	goto	u334_20
	
u334_21:
	movlb 0	; select bank0
	bsf	(97/8),(97)&7
	goto	u335_24
u334_20:
	movlb 0	; select bank0
	bcf	(97/8),(97)&7
u335_24:
	line	96
	
i1l4099:	
	bsf	(96/8),(96)&7
	line	98
	
i1l4101:	
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u394_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u394_27
opt asmopt_on

	line	99
	
i1l4103:	
	movlb 0	; select bank0
	bcf	(96/8),(96)&7
	line	101
	
i1l4105:	
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u395_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u395_27
opt asmopt_on

	line	92
	movlw	(01h)
	movwf	(??i1_display_digit+0)+0
	movf	(??i1_display_digit+0)+0,w
	addwf	(i1display_digit@index),f
	
i1l4107:	
	movlw	(08h)
	subwf	(i1display_digit@index),w
	skipc
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l4097
u336_20:
	goto	i1l4109
	
i1l1140:	
	line	106
	
i1l4109:	
	movf	(i1display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l1141
u337_20:
	line	108
	
i1l4111:	
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	110
	
i1l4113:	
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u396_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u396_27
opt asmopt_on

	line	111
	
i1l4115:	
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	113
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u397_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u397_27
opt asmopt_on

	line	114
	goto	i1l1143
	line	115
	
i1l1141:	
	line	117
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	119
	
i1l4117:	
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u398_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u398_27
opt asmopt_on

	line	120
	
i1l4119:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	122
	opt asmopt_off
movlw	133
movwf	(??i1_display_digit+0)+0,f
u399_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u399_27
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
	
i1l4167:	
	clrf	(i1___awmod@sign)
	line	9
	btfss	(i1___awmod@dividend+1),7
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l4171
u348_20:
	line	10
	
i1l4169:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	line	11
	clrf	(i1___awmod@sign)
	bsf	status,0
	rlf	(i1___awmod@sign),f
	goto	i1l4171
	line	12
	
i1l2397:	
	line	13
	
i1l4171:	
	btfss	(i1___awmod@divisor+1),7
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l4175
u349_20:
	line	14
	
i1l4173:	
	comf	(i1___awmod@divisor),f
	comf	(i1___awmod@divisor+1),f
	incf	(i1___awmod@divisor),f
	skipnz
	incf	(i1___awmod@divisor+1),f
	goto	i1l4175
	
i1l2398:	
	line	15
	
i1l4175:	
	movf	(i1___awmod@divisor+1),w
	iorwf	(i1___awmod@divisor),w
	skipnz
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l4193
u350_20:
	line	16
	
i1l4177:	
	clrf	(i1___awmod@counter)
	bsf	status,0
	rlf	(i1___awmod@counter),f
	line	17
	goto	i1l4183
	
i1l2401:	
	line	18
	
i1l4179:	
	movlw	01h
	
u351_25:
	lslf	(i1___awmod@divisor),f
	rlf	(i1___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u351_25
	line	19
	
i1l4181:	
	movlw	(01h)
	movwf	(??i1___awmod+0)+0
	movf	(??i1___awmod+0)+0,w
	addwf	(i1___awmod@counter),f
	goto	i1l4183
	line	20
	
i1l2400:	
	line	17
	
i1l4183:	
	btfss	(i1___awmod@divisor+1),(15)&7
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l4179
u352_20:
	goto	i1l4185
	
i1l2402:	
	goto	i1l4185
	line	21
	
i1l2403:	
	line	22
	
i1l4185:	
	movf	(i1___awmod@divisor+1),w
	subwf	(i1___awmod@dividend+1),w
	skipz
	goto	u353_25
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),w
u353_25:
	skipc
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l4189
u353_20:
	line	23
	
i1l4187:	
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),f
	movf	(i1___awmod@divisor+1),w
	subwfb	(i1___awmod@dividend+1),f
	goto	i1l4189
	
i1l2404:	
	line	24
	
i1l4189:	
	movlw	01h
	
u354_25:
	lsrf	(i1___awmod@divisor+1),f
	rrf	(i1___awmod@divisor),f
	decfsz	wreg,f
	goto	u354_25
	line	25
	
i1l4191:	
	movlw	low(01h)
	subwf	(i1___awmod@counter),f
	btfss	status,2
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l4185
u355_20:
	goto	i1l4193
	
i1l2405:	
	goto	i1l4193
	line	26
	
i1l2399:	
	line	27
	
i1l4193:	
	movf	(i1___awmod@sign),w
	skipz
	goto	u356_20
	goto	i1l4197
u356_20:
	line	28
	
i1l4195:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	goto	i1l4197
	
i1l2406:	
	line	29
	
i1l4197:	
	movf	(i1___awmod@dividend+1),w
	clrf	(?i1___awmod+1)
	addwf	(?i1___awmod+1)
	movf	(i1___awmod@dividend),w
	clrf	(?i1___awmod)
	addwf	(?i1___awmod)

	goto	i1l2407
	
i1l4199:	
	line	30
	
i1l2407:	
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
	
i1l4127:	
	clrf	(i1___awdiv@sign)
	line	10
	btfss	(i1___awdiv@divisor+1),7
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l4131
u338_20:
	line	11
	
i1l4129:	
	comf	(i1___awdiv@divisor),f
	comf	(i1___awdiv@divisor+1),f
	incf	(i1___awdiv@divisor),f
	skipnz
	incf	(i1___awdiv@divisor+1),f
	line	12
	clrf	(i1___awdiv@sign)
	bsf	status,0
	rlf	(i1___awdiv@sign),f
	goto	i1l4131
	line	13
	
i1l2329:	
	line	14
	
i1l4131:	
	btfss	(i1___awdiv@dividend+1),7
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l4137
u339_20:
	line	15
	
i1l4133:	
	comf	(i1___awdiv@dividend),f
	comf	(i1___awdiv@dividend+1),f
	incf	(i1___awdiv@dividend),f
	skipnz
	incf	(i1___awdiv@dividend+1),f
	line	16
	
i1l4135:	
	movlw	(01h)
	movwf	(??i1___awdiv+0)+0
	movf	(??i1___awdiv+0)+0,w
	xorwf	(i1___awdiv@sign),f
	goto	i1l4137
	line	17
	
i1l2330:	
	line	18
	
i1l4137:	
	clrf	(i1___awdiv@quotient)
	clrf	(i1___awdiv@quotient+1)
	line	19
	
i1l4139:	
	movf	(i1___awdiv@divisor+1),w
	iorwf	(i1___awdiv@divisor),w
	skipnz
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l4159
u340_20:
	line	20
	
i1l4141:	
	clrf	(i1___awdiv@counter)
	bsf	status,0
	rlf	(i1___awdiv@counter),f
	line	21
	goto	i1l4147
	
i1l2333:	
	line	22
	
i1l4143:	
	movlw	01h
	
u341_25:
	lslf	(i1___awdiv@divisor),f
	rlf	(i1___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u341_25
	line	23
	
i1l4145:	
	movlw	(01h)
	movwf	(??i1___awdiv+0)+0
	movf	(??i1___awdiv+0)+0,w
	addwf	(i1___awdiv@counter),f
	goto	i1l4147
	line	24
	
i1l2332:	
	line	21
	
i1l4147:	
	btfss	(i1___awdiv@divisor+1),(15)&7
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l4143
u342_20:
	goto	i1l4149
	
i1l2334:	
	goto	i1l4149
	line	25
	
i1l2335:	
	line	26
	
i1l4149:	
	movlw	01h
	
u343_25:
	lslf	(i1___awdiv@quotient),f
	rlf	(i1___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u343_25
	line	27
	movf	(i1___awdiv@divisor+1),w
	subwf	(i1___awdiv@dividend+1),w
	skipz
	goto	u344_25
	movf	(i1___awdiv@divisor),w
	subwf	(i1___awdiv@dividend),w
u344_25:
	skipc
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l4155
u344_20:
	line	28
	
i1l4151:	
	movf	(i1___awdiv@divisor),w
	subwf	(i1___awdiv@dividend),f
	movf	(i1___awdiv@divisor+1),w
	subwfb	(i1___awdiv@dividend+1),f
	line	29
	
i1l4153:	
	bsf	(i1___awdiv@quotient)+(0/8),(0)&7
	goto	i1l4155
	line	30
	
i1l2336:	
	line	31
	
i1l4155:	
	movlw	01h
	
u345_25:
	lsrf	(i1___awdiv@divisor+1),f
	rrf	(i1___awdiv@divisor),f
	decfsz	wreg,f
	goto	u345_25
	line	32
	
i1l4157:	
	movlw	low(01h)
	subwf	(i1___awdiv@counter),f
	btfss	status,2
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l4149
u346_20:
	goto	i1l4159
	
i1l2337:	
	goto	i1l4159
	line	33
	
i1l2331:	
	line	34
	
i1l4159:	
	movf	(i1___awdiv@sign),w
	skipz
	goto	u347_20
	goto	i1l4163
u347_20:
	line	35
	
i1l4161:	
	comf	(i1___awdiv@quotient),f
	comf	(i1___awdiv@quotient+1),f
	incf	(i1___awdiv@quotient),f
	skipnz
	incf	(i1___awdiv@quotient+1),f
	goto	i1l4163
	
i1l2338:	
	line	36
	
i1l4163:	
	movf	(i1___awdiv@quotient+1),w
	clrf	(?i1___awdiv+1)
	addwf	(?i1___awdiv+1)
	movf	(i1___awdiv@quotient),w
	clrf	(?i1___awdiv)
	addwf	(?i1___awdiv)

	goto	i1l2339
	
i1l4165:	
	line	37
	
i1l2339:	
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
