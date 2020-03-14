opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F688
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
	FNCALL	_main,_DHT11_get_data
	FNROOT	_main
	global	_dht11_data
	global	_bit_index
	global	_byte_index
	global	_high_time_count
	global	_low_time_count
	global	_nem
	global	_sicaklik
	global	_temp
	global	_var
	global	_FSR
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_FSR	set	4
	global	_PORTA
_PORTA	set	5
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA0
_RA0	set	40
	global	_RA2
_RA2	set	42
	global	_ANSEL
_ANSEL	set	145
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EECON2
_EECON2	set	157
	global	_EEDATA
_EEDATA	set	154
	global	_TRISA
_TRISA	set	133
	global	_IRCF0
_IRCF0	set	1148
	global	_IRCF1
_IRCF1	set	1149
	global	_IRCF2
_IRCF2	set	1150
	global	_RD
_RD	set	1248
	global	_SCS
_SCS	set	1144
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISA1
_TRISA1	set	1065
	global	_TRISA2
_TRISA2	set	1066
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISA4
_TRISA4	set	1068
	global	_TRISA5
_TRISA5	set	1069
	global	_WR
_WR	set	1249
	global	_WREN
_WREN	set	1250
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

_byte_index:
       ds      1

_high_time_count:
       ds      1

_low_time_count:
       ds      1

_nem:
       ds      1

_sicaklik:
       ds      1

_temp:
       ds      1

_var:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_dht11_data:
       ds      5

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
	clrf	((__pbssCOMMON)+6)&07Fh
	clrf	((__pbssCOMMON)+7)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DHT11_get_data
?_DHT11_get_data:	; 0 bytes @ 0x0
	global	??_DHT11_get_data
??_DHT11_get_data:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      13
;; BANK0           80      0       5
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DHT11_get_data
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;; (0) _main                                                 3     3      0       0
;;                                              2 COMMON     3     3      0
;;                     _DHT11_get_data
;; ---------------------------------------------------------------------------------
;; (1) _DHT11_get_data                                       2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DHT11_get_data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      0       5       3        6.3%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0      12       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0      13      10        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "../PIC16f688DHT11Assembly.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DHT11_get_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC16f688DHT11Assembly.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	9
	
l2456:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1144/8)^080h,(1144)&7
	line	12
	bsf	(1150/8)^080h,(1150)&7
	line	14
	bsf	(1149/8)^080h,(1149)&7
	line	15
	bsf	(1148/8)^080h,(1148)&7
	line	17
	
l2458:	
	clrf	(145)^080h	;volatile
	line	19
	
l2460:	
	bsf	(1067/8)^080h,(1067)&7
	line	20
	
l2462:	
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2227:
	decfsz	((??_main+0)+0),f
	goto	u2227
	decfsz	((??_main+0)+0+1),f
	goto	u2227
	decfsz	((??_main+0)+0+2),f
	goto	u2227
	clrwdt
opt asmopt_on

	line	22
	
l2464:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	23
	
l2466:	
	bcf	(1069/8)^080h,(1069)&7
	line	25
	
l2468:	
	bcf	(1066/8)^080h,(1066)&7
	line	26
	
l2470:	
	bcf	(1068/8)^080h,(1068)&7
	line	27
	
l2472:	
	bsf	(1065/8)^080h,(1065)&7
	line	30
	
l2474:	
	fcall	_DHT11_get_data
	goto	l2476
	line	32
	
l548:	
	line	34
	
l2476:	
	movlw	1<<((42)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((42)/8),f
	line	35
	
l2478:	
	fcall	_DHT11_get_data
	line	36
	
l2480:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	37
	
l2482:	
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2237:
	decfsz	((??_main+0)+0),f
	goto	u2237
	decfsz	((??_main+0)+0+1),f
	goto	u2237
	decfsz	((??_main+0)+0+2),f
	goto	u2237
	nop2
opt asmopt_on

	goto	l2476
	line	38
	
l549:	
	line	32
	goto	l2476
	
l550:	
	line	40
	
l551:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DHT11_get_data
psect	text71,local,class=CODE,delta=2
global __ptext71
__ptext71:

;; *************** function _DHT11_get_data *****************
;; Defined at:
;;		line 10 in file "../DHT11.h"
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
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text71
	file	"../DHT11.h"
	line	10
	global	__size_of_DHT11_get_data
	__size_of_DHT11_get_data	equ	__end_of_DHT11_get_data-_DHT11_get_data
	
_DHT11_get_data:	
	opt	stack 7
; Regs used in _DHT11_get_data: [wreg]
	line	14
	
l2308:	
# 14 "../DHT11.h"
movlw _dht11_data ;#
	line	15
# 15 "../DHT11.h"
movwf _FSR ;#
	line	16
# 16 "../DHT11.h"
banksel _temp ;#
	line	17
# 17 "../DHT11.h"
movlw 5 ;#
	line	18
# 18 "../DHT11.h"
movwf _temp ;#
	line	19
# 19 "../DHT11.h"
kkk: ;#
	line	20
# 20 "../DHT11.h"
clrf indf ;#
	line	21
# 21 "../DHT11.h"
incf _FSR ;#
	line	22
# 22 "../DHT11.h"
decfsz _temp ;#
	line	23
# 23 "../DHT11.h"
goto kkk ;#
	line	27
# 27 "../DHT11.h"
banksel _byte_index ;#
	line	28
# 28 "../DHT11.h"
movlw 5 ;#
	line	29
# 29 "../DHT11.h"
movwf _byte_index ;#
	line	31
# 31 "../DHT11.h"
movlw _dht11_data ;#
	line	32
# 32 "../DHT11.h"
movwf _FSR ;#
	line	35
# 35 "../DHT11.h"
banksel _PORTA ;#
	line	36
# 36 "../DHT11.h"
bcf _PORTA, 1 ;#
	line	39
# 39 "../DHT11.h"
banksel _TRISA ;#
	line	40
# 40 "../DHT11.h"
bcf 0x5, 1 ;#
psect	text71
	line	43
	
l2310:	
	opt asmopt_off
movlw	52
movwf	((??_DHT11_get_data+0)+0+1),f
	movlw	241
movwf	((??_DHT11_get_data+0)+0),f
u2247:
	decfsz	((??_DHT11_get_data+0)+0),f
	goto	u2247
	decfsz	((??_DHT11_get_data+0)+0+1),f
	goto	u2247
	nop2
opt asmopt_on

	line	46
	
l2312:	
# 46 "../DHT11.h"
banksel _TRISA ;#
psect	text71
	line	47
	
l2314:	
# 47 "../DHT11.h"
bsf 0x5, 1 ;#
psect	text71
	line	49
	opt asmopt_off
movlw	16
movwf	(??_DHT11_get_data+0)+0,f
u2257:
decfsz	(??_DHT11_get_data+0)+0,f
	goto	u2257
	clrwdt
opt asmopt_on

	line	51
	
l2316:	
# 51 "../DHT11.h"
banksel _PORTA ;#
psect	text71
	line	53
	
l2318:	
# 53 "../DHT11.h"
loop5: ;#
psect	text71
	line	54
	
l2320:	
# 54 "../DHT11.h"
btfsc _PORTA, 1 ;#
psect	text71
	line	55
	
l2322:	
# 55 "../DHT11.h"
goto loop5 ;#
psect	text71
	line	59
	
l2324:	
# 59 "../DHT11.h"
loop6: ;#
psect	text71
	line	60
	
l2326:	
# 60 "../DHT11.h"
btfss _PORTA, 1 ;#
psect	text71
	line	61
	
l2328:	
# 61 "../DHT11.h"
goto loop6 ;#
psect	text71
	line	65
	
l2330:	
# 65 "../DHT11.h"
loop7: ;#
psect	text71
	line	66
	
l2332:	
# 66 "../DHT11.h"
btfsc _PORTA, 1 ;#
psect	text71
	line	67
	
l2334:	
# 67 "../DHT11.h"
goto loop7 ;#
psect	text71
	line	72
	
l2336:	
# 72 "../DHT11.h"
main_loop: ;#
psect	text71
	line	86
	
l2338:	
# 86 "../DHT11.h"
  banksel _bit_index ;#
psect	text71
	line	87
	
l2340:	
# 87 "../DHT11.h"
  bsf _bit_index, 7 ;#
psect	text71
	line	89
	
l2342:	
# 89 "../DHT11.h"
  banksel _var ;#
psect	text71
	line	90
	
l2344:	
# 90 "../DHT11.h"
  movlw 0x8 ;#
psect	text71
	line	91
	
l2346:	
# 91 "../DHT11.h"
  movwf _var ;#
psect	text71
	line	93
	
l2348:	
# 93 "../DHT11.h"
  for1: ;#
psect	text71
	line	95
	
l2350:	
# 95 "../DHT11.h"
    loop1: ;#
psect	text71
	line	96
	
l2352:	
# 96 "../DHT11.h"
  banksel _low_time_count; ;#
psect	text71
	line	97
	
l2354:	
# 97 "../DHT11.h"
  INCF _low_time_count; ;#
psect	text71
	line	98
	
l2356:	
# 98 "../DHT11.h"
  banksel _PORTA; ;#
psect	text71
	line	99
	
l2358:	
# 99 "../DHT11.h"
  btfss _PORTA, 1; ;#
psect	text71
	line	100
	
l2360:	
# 100 "../DHT11.h"
  goto loop1; ;#
psect	text71
	line	104
	
l2362:	
# 104 "../DHT11.h"
    loop2: ;#
psect	text71
	line	105
	
l2364:	
# 105 "../DHT11.h"
  banksel _high_time_count; ;#
psect	text71
	line	106
	
l2366:	
# 106 "../DHT11.h"
  INCF _high_time_count; ;#
psect	text71
	line	107
	
l2368:	
# 107 "../DHT11.h"
  banksel _PORTA; ;#
psect	text71
	line	108
	
l2370:	
# 108 "../DHT11.h"
  btfsc _PORTA, 1; ;#
psect	text71
	line	109
	
l2372:	
# 109 "../DHT11.h"
  goto loop2; ;#
psect	text71
	line	122
	
l2374:	
# 122 "../DHT11.h"
          banksel _high_time_count ;#
psect	text71
	line	123
	
l2376:	
# 123 "../DHT11.h"
  movf _high_time_count, W ;#
psect	text71
	line	124
	
l2378:	
# 124 "../DHT11.h"
  banksel _low_time_count ;#
psect	text71
	line	125
	
l2380:	
# 125 "../DHT11.h"
  subwf _low_time_count, W ;#
psect	text71
	line	127
	
l2382:	
# 127 "../DHT11.h"
  btfsc 0x3, 0; ;#
psect	text71
	line	128
	
l2384:	
# 128 "../DHT11.h"
  goto devam; ;#
psect	text71
	line	132
	
l2386:	
# 132 "../DHT11.h"
        banksel _bit_index ;#
psect	text71
	line	133
	
l2388:	
# 133 "../DHT11.h"
  movf _bit_index, W ;#
psect	text71
	line	134
	
l2390:	
# 134 "../DHT11.h"
  banksel _temp ;#
psect	text71
	line	135
	
l2392:	
# 135 "../DHT11.h"
  IORWF _temp, f ;#
psect	text71
	line	139
	
l2394:	
# 139 "../DHT11.h"
             devam: ;#
psect	text71
	line	141
	
l2396:	
# 141 "../DHT11.h"
  banksel _low_time_count ;#
psect	text71
	line	142
	
l2398:	
# 142 "../DHT11.h"
  CLRF _low_time_count ;#
psect	text71
	line	143
	
l2400:	
# 143 "../DHT11.h"
  banksel _high_time_count ;#
psect	text71
	line	144
	
l2402:	
# 144 "../DHT11.h"
  CLRF _high_time_count ;#
psect	text71
	line	151
	
l2404:	
# 151 "../DHT11.h"
      banksel _bit_index ;#
psect	text71
	line	152
	
l2406:	
# 152 "../DHT11.h"
  bcf 0x3, 0 ;#
psect	text71
	line	153
	
l2408:	
# 153 "../DHT11.h"
  RRF _bit_index, f ;#
psect	text71
	line	154
	
l2410:	
# 154 "../DHT11.h"
  banksel _var ;#
psect	text71
	line	155
	
l2412:	
# 155 "../DHT11.h"
  decfsz _var ;#
psect	text71
	line	156
	
l2414:	
# 156 "../DHT11.h"
  goto for1 ;#
psect	text71
	line	170
	
l2416:	
# 170 "../DHT11.h"
  banksel _temp ;#
psect	text71
	line	171
	
l2418:	
# 171 "../DHT11.h"
movf _temp, W ;#
psect	text71
	line	172
	
l2420:	
# 172 "../DHT11.h"
movwf indf ;#
psect	text71
	line	173
	
l2422:	
# 173 "../DHT11.h"
incf _FSR ;#
psect	text71
	line	176
	
l2424:	
# 176 "../DHT11.h"
banksel _temp ;#
psect	text71
	line	177
	
l2426:	
# 177 "../DHT11.h"
  CLRF _temp ;#
psect	text71
	line	179
	
l2428:	
# 179 "../DHT11.h"
banksel _byte_index ;#
psect	text71
	line	180
	
l2430:	
# 180 "../DHT11.h"
decfsz _byte_index ;#
psect	text71
	line	181
	
l2432:	
# 181 "../DHT11.h"
goto main_loop; ;#
psect	text71
	line	184
	
l2434:	
# 184 "../DHT11.h"
decf _FSR ;#
psect	text71
	line	185
	
l2436:	
# 185 "../DHT11.h"
decf _FSR ;#
psect	text71
	line	186
	
l2438:	
# 186 "../DHT11.h"
decf _FSR ;#
psect	text71
	line	187
	
l2440:	
# 187 "../DHT11.h"
movf indf, W ;#
psect	text71
	line	188
	
l2442:	
# 188 "../DHT11.h"
banksel _sicaklik ;#
psect	text71
	line	189
	
l2444:	
# 189 "../DHT11.h"
movwf _sicaklik ;#
psect	text71
	line	190
	
l2446:	
# 190 "../DHT11.h"
decf _FSR ;#
psect	text71
	line	191
	
l2448:	
# 191 "../DHT11.h"
decf _FSR ;#
psect	text71
	line	192
	
l2450:	
# 192 "../DHT11.h"
movf indf, W ;#
psect	text71
	line	193
	
l2452:	
# 193 "../DHT11.h"
banksel _nem ;#
psect	text71
	line	194
	
l2454:	
# 194 "../DHT11.h"
movwf _nem ;#
psect	text71
	line	196
	
l545:	
	return
	opt stack 0
GLOBAL	__end_of_DHT11_get_data
	__end_of_DHT11_get_data:
;; =============== function _DHT11_get_data ends ============

	signat	_DHT11_get_data,88
psect	text72,local,class=CODE,delta=2
global __ptext72
__ptext72:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
