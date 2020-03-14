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
	FNCALL	_main,_MainRegisterSetPin
	FNCALL	_MainRegisterSetPin,_MainRegisterLoadData
	FNROOT	_main
	global	_count
	global	_current_value
	global	_CARRY
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA5
_RA5	set	101
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
	global	_TRISA0
_TRISA0	set	1120
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
	file	"Debug.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_count:
       ds      1

_current_value:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	global __pbssCOMMON
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_MainRegisterLoadData
?_MainRegisterLoadData:	; 0 bytes @ 0x0
	global	??_MainRegisterLoadData
??_MainRegisterLoadData:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	1
	global	MainRegisterLoadData@data
MainRegisterLoadData@data:	; 1 bytes @ 0x1
	ds	1
	global	MainRegisterLoadData@a
MainRegisterLoadData@a:	; 1 bytes @ 0x2
	ds	1
	global	?_MainRegisterSetPin
?_MainRegisterSetPin:	; 0 bytes @ 0x3
	global	MainRegisterSetPin@value
MainRegisterSetPin@value:	; 1 bytes @ 0x3
	ds	1
	global	??_MainRegisterSetPin
??_MainRegisterSetPin:	; 0 bytes @ 0x4
	ds	2
	global	MainRegisterSetPin@pin_number
MainRegisterSetPin@pin_number:	; 1 bytes @ 0x6
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      12
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_MainRegisterSetPin
;;   _MainRegisterSetPin->_MainRegisterLoadData
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
;; (0) _main                                                 3     3      0     120
;;                                              7 COMMON     3     3      0
;;                 _MainRegisterSetPin
;; ---------------------------------------------------------------------------------
;; (1) _MainRegisterSetPin                                   4     3      1     120
;;                                              3 COMMON     4     3      1
;;               _MainRegisterLoadData
;; ---------------------------------------------------------------------------------
;; (2) _MainRegisterLoadData                                 3     3      0      60
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _MainRegisterSetPin
;;     _MainRegisterLoadData
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
;;COMMON               E      A       C       2       85.7%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       2       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0       C       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50      0       0       6        0.0%
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
;;DATA                 0      0       E      11        0.0%
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
;;		line 6 in file "../OneWireShiftRegister.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_MainRegisterSetPin
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../OneWireShiftRegister.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 14
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	8
	
l3407:	
	movlb 1	; select bank1
	bsf	(1225/8)^080h,(1225)&7
	line	9
	bcf	(1224/8)^080h,(1224)&7
	line	12
	bsf	(1230/8)^080h,(1230)&7
	line	13
	bsf	(1229/8)^080h,(1229)&7
	line	15
	bcf	(1228/8)^080h,(1228)&7
	line	16
	bsf	(1227/8)^080h,(1227)&7
	line	17
	
l3409:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	19
	
l3411:	
	movlb 1	; select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	20
	
l3413:	
	bcf	(1125/8)^080h,(1125)&7
	line	21
	
l3415:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	23
	
l3417:	
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u2237:
	decfsz	((??_main+0)+0),f
	goto	u2237
	decfsz	((??_main+0)+0+1),f
	goto	u2237
	nop2
opt asmopt_on

	goto	l3419
	line	25
	
l1105:	
	line	30
	
l3419:	
	clrf	(?_MainRegisterSetPin)
	bsf	status,0
	rlf	(?_MainRegisterSetPin),f
	movlw	(01h)
	fcall	_MainRegisterSetPin
	line	32
	
l3421:	
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2247:
	decfsz	((??_main+0)+0),f
	goto	u2247
	decfsz	((??_main+0)+0+1),f
	goto	u2247
	decfsz	((??_main+0)+0+2),f
	goto	u2247
	nop2
opt asmopt_on

	goto	l3419
	line	34
	
l1106:	
	line	25
	goto	l3419
	
l1107:	
	line	36
	
l1108:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_MainRegisterSetPin
psect	text83,local,class=CODE,delta=2
global __ptext83
__ptext83:

;; *************** function _MainRegisterSetPin *****************
;; Defined at:
;;		line 49 in file "../ShiftReg.h"
;; Parameters:    Size  Location     Type
;;  pin_number      1    wreg     unsigned char 
;;  value           1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  pin_number      1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_MainRegisterLoadData
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text83
	file	"../ShiftReg.h"
	line	49
	global	__size_of_MainRegisterSetPin
	__size_of_MainRegisterSetPin	equ	__end_of_MainRegisterSetPin-_MainRegisterSetPin
	
_MainRegisterSetPin:	
	opt	stack 14
; Regs used in _MainRegisterSetPin: [wreg+status,2+status,0+pclath+cstack]
	movwf	(MainRegisterSetPin@pin_number)
	line	50
	
l3391:	
	movf	(MainRegisterSetPin@value),w
	skipz
	goto	u2190
	goto	l1098
u2190:
	
l3393:	
	clrf	(MainRegisterSetPin@value)
	bsf	status,0
	rlf	(MainRegisterSetPin@value),f
	goto	l3395
	line	51
	
l1098:	
	clrf	(MainRegisterSetPin@value)
	goto	l3395
	
l1099:	
	line	52
	
l3395:	
	movlw	low(01h)
	subwf	(MainRegisterSetPin@pin_number),f
	line	53
	
l3397:	
	movf	(MainRegisterSetPin@value),w
	skipz
	goto	u2200
	goto	l3401
u2200:
	line	55
	
l3399:	
	movlw	(01h)
	movwf	(??_MainRegisterSetPin+0)+0
	incf	(MainRegisterSetPin@pin_number),w
	goto	u2214
u2215:
	lslf	(??_MainRegisterSetPin+0)+0,f
u2214:
	decfsz	wreg,f
	goto	u2215
	movf	0+(??_MainRegisterSetPin+0)+0,w
	movwf	(??_MainRegisterSetPin+1)+0
	movf	(??_MainRegisterSetPin+1)+0,w
	iorwf	(_current_value),f
	line	56
	goto	l3403
	line	57
	
l1100:	
	line	59
	
l3401:	
	movlw	(01h)
	movwf	(??_MainRegisterSetPin+0)+0
	incf	(MainRegisterSetPin@pin_number),w
	goto	u2224
u2225:
	lslf	(??_MainRegisterSetPin+0)+0,f
u2224:
	decfsz	wreg,f
	goto	u2225
	movf	0+(??_MainRegisterSetPin+0)+0,w
	xorlw	0ffh
	movwf	(??_MainRegisterSetPin+1)+0
	movf	(??_MainRegisterSetPin+1)+0,w
	andwf	(_current_value),f
	goto	l3403
	line	61
	
l1101:	
	line	63
	
l3403:	
	movf	(_current_value),w
	fcall	_MainRegisterLoadData
	line	64
	
l3405:	
	opt asmopt_off
movlw	66
movwf	(??_MainRegisterSetPin+0)+0,f
u2257:
decfsz	(??_MainRegisterSetPin+0)+0,f
	goto	u2257
	clrwdt
opt asmopt_on

	line	65
	
l1102:	
	return
	opt stack 0
GLOBAL	__end_of_MainRegisterSetPin
	__end_of_MainRegisterSetPin:
;; =============== function _MainRegisterSetPin ends ============

	signat	_MainRegisterSetPin,8312
	global	_MainRegisterLoadData
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:

;; *************** function _MainRegisterLoadData *****************
;; Defined at:
;;		line 11 in file "../ShiftReg.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    1[COMMON] unsigned char 
;;  a               1    2[COMMON] char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MainRegisterSetPin
;; This function uses a non-reentrant model
;;
psect	text84
	file	"../ShiftReg.h"
	line	11
	global	__size_of_MainRegisterLoadData
	__size_of_MainRegisterLoadData	equ	__end_of_MainRegisterLoadData-_MainRegisterLoadData
	
_MainRegisterLoadData:	
	opt	stack 14
; Regs used in _MainRegisterLoadData: [wreg+status,2+status,0]
	line	13
	movwf	(MainRegisterLoadData@data)
	
l3367:	
	movlw	(07h)
	movwf	(??_MainRegisterLoadData+0)+0
	movf	(??_MainRegisterLoadData+0)+0,w
	movwf	(MainRegisterLoadData@a)
	
l3369:	
	btfss	(MainRegisterLoadData@a),7
	goto	u2151
	goto	u2150
u2151:
	goto	l3373
u2150:
	goto	l1092
	
l3371:	
	goto	l1092
	line	14
	
l1091:	
	line	16
	
l3373:	
	movf	(MainRegisterLoadData@data),w
	movwf	(??_MainRegisterLoadData+0)+0
	incf	(MainRegisterLoadData@a),w
	goto	u2164
u2165:
	lsrf	(??_MainRegisterLoadData+0)+0,f
u2164:
	decfsz	wreg,f
	goto	u2165
	btfss	0+(??_MainRegisterLoadData+0)+0,(0)&7
	goto	u2171
	goto	u2170
u2171:
	goto	l1093
u2170:
	line	19
	
l3375:	
	movlb 0	; select bank0
	bcf	(101/8),(101)&7
	line	20
	bsf	(101/8),(101)&7
	line	23
	
l3377:	
	opt asmopt_off
movlw	19
movwf	(??_MainRegisterLoadData+0)+0,f
u2267:
decfsz	(??_MainRegisterLoadData+0)+0,f
	goto	u2267
	nop2	;nop
opt asmopt_on

	line	24
	goto	l3383
	line	25
	
l1093:	
	line	27
	movlb 0	; select bank0
	bcf	(101/8),(101)&7
	line	28
	
l3379:	
	opt asmopt_off
movlw	33
movwf	(??_MainRegisterLoadData+0)+0,f
u2277:
decfsz	(??_MainRegisterLoadData+0)+0,f
	goto	u2277
opt asmopt_on

	line	29
	
l3381:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	31
	opt asmopt_off
movlw	19
movwf	(??_MainRegisterLoadData+0)+0,f
u2287:
decfsz	(??_MainRegisterLoadData+0)+0,f
	goto	u2287
	nop2	;nop
opt asmopt_on

	goto	l3383
	line	33
	
l1094:	
	line	13
	
l3383:	
	movlw	(-1)
	movwf	(??_MainRegisterLoadData+0)+0
	movf	(??_MainRegisterLoadData+0)+0,w
	addwf	(MainRegisterLoadData@a),f
	
l3385:	
	btfss	(MainRegisterLoadData@a),7
	goto	u2181
	goto	u2180
u2181:
	goto	l3373
u2180:
	
l1092:	
	line	37
	movlb 0	; select bank0
	bcf	(101/8),(101)&7
	line	38
	
l3387:	
	opt asmopt_off
movlw	166
movwf	(??_MainRegisterLoadData+0)+0,f
u2297:
decfsz	(??_MainRegisterLoadData+0)+0,f
	goto	u2297
	clrwdt
opt asmopt_on

	line	39
	
l3389:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	43
	opt asmopt_off
movlw	49
movwf	(??_MainRegisterLoadData+0)+0,f
u2307:
decfsz	(??_MainRegisterLoadData+0)+0,f
	goto	u2307
	nop2	;nop
opt asmopt_on

	line	46
	
l1095:	
	return
	opt stack 0
GLOBAL	__end_of_MainRegisterLoadData
	__end_of_MainRegisterLoadData:
;; =============== function _MainRegisterLoadData ends ============

	signat	_MainRegisterLoadData,4216
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
