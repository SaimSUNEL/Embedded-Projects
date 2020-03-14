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
	FNCALL	_main,_eeprom_hazirla
	FNCALL	_main,_eeprom_yaz
	FNROOT	_main
	global	_veri
	global	_gelen
	global	_CARRY
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:
_CARRY	set	24
	global	_EEIF
_EEIF	set	108
	global	_GIE
_GIE	set	95
	global	_EEIE
_EEIE	set	1132
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_EEPGD
_EEPGD	set	3175
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
_gelen:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_veri:
       ds      20

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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+014h)
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
	global	?_eeprom_hazirla
?_eeprom_hazirla:	; 0 bytes @ 0x0
	global	??_eeprom_hazirla
??_eeprom_hazirla:	; 0 bytes @ 0x0
	global	?_eeprom_yaz
?_eeprom_yaz:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	eeprom_yaz@veri
eeprom_yaz@veri:	; 1 bytes @ 0x0
	ds	1
	global	??_eeprom_yaz
??_eeprom_yaz:	; 0 bytes @ 0x1
	global	eeprom_yaz@adres
eeprom_yaz@adres:	; 1 bytes @ 0x1
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	1
	global	main@a
main@a:	; 2 bytes @ 0x3
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 22, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       7
;; BANK0           80      0      20
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_eeprom_yaz
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0      90
;;                                              2 COMMON     3     3      0
;;                     _eeprom_hazirla
;;                         _eeprom_yaz
;; ---------------------------------------------------------------------------------
;; (1) _eeprom_yaz                                           2     1      1      30
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _eeprom_hazirla                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _eeprom_hazirla
;;   _eeprom_yaz
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       7       1       50.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0      1B       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0      14       5       25.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      1C      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 58 in file "../EEPROM.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               2    3[COMMON] int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_eeprom_hazirla
;;		_eeprom_yaz
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../EEPROM.c"
	line	58
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	59
	
l2629:	
	fcall	_eeprom_hazirla
	line	61
	
l2631:	
	movlw	(053h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(0)
	fcall	_eeprom_yaz
	line	62
	
l2633:	
	movlw	(053h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(0)
	fcall	_eeprom_yaz
	line	65
	
l2635:	
	clrf	(main@a)
	clrf	(main@a+1)
	
l2637:	
	movf	(main@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2235
	movlw	low(014h)
	subwf	(main@a),w
u2235:

	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l2641
u2230:
	goto	l2647
	
l2639:	
	goto	l2647
	line	66
	
l701:	
	line	67
	
l2641:	
	movf	(main@a),w
	addlw	019h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movf	(main@a),w
	fcall	_eeprom_yaz
	line	65
	
l2643:	
	movlw	low(01h)
	addwf	(main@a),f
	skipnc
	incf	(main@a+1),f
	movlw	high(01h)
	addwf	(main@a+1),f
	
l2645:	
	movf	(main@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2245
	movlw	low(014h)
	subwf	(main@a),w
u2245:

	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l2641
u2240:
	goto	l2647
	
l702:	
	line	79
	
l2647:	
	movlw	(073h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(064h)
	fcall	_eeprom_yaz
	line	80
	movlw	(067h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(066h)
	fcall	_eeprom_yaz
	line	81
	movlw	(072h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(067h)
	fcall	_eeprom_yaz
	line	82
	movlw	(064h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(068h)
	fcall	_eeprom_yaz
	line	83
	movlw	(073h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(069h)
	fcall	_eeprom_yaz
	line	84
	movlw	(020h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(06Ah)
	fcall	_eeprom_yaz
	line	85
	movlw	(067h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(06Bh)
	fcall	_eeprom_yaz
	line	86
	movlw	(068h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(06Ch)
	fcall	_eeprom_yaz
	line	87
	movlw	(06Ah)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(06Dh)
	fcall	_eeprom_yaz
	line	88
	movlw	(06Bh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_yaz)
	movlw	(06Eh)
	fcall	_eeprom_yaz
	goto	l704
	line	89
	
l703:	
	
l704:	
	goto	l704
	
l705:	
	line	92
	
l706:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_eeprom_yaz
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:

;; *************** function _eeprom_yaz *****************
;; Defined at:
;;		line 32 in file "../EEPROM.c"
;; Parameters:    Size  Location     Type
;;  adres           1    wreg     unsigned char 
;;  veri            1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  adres           1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text85
	file	"../EEPROM.c"
	line	32
	global	__size_of_eeprom_yaz
	__size_of_eeprom_yaz	equ	__end_of_eeprom_yaz-_eeprom_yaz
	
_eeprom_yaz:	
	opt	stack 7
; Regs used in _eeprom_yaz: [wreg]
	movwf	(eeprom_yaz@adres)
	
l1755:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3170/8)^0180h,(3170)&7
	line	34
	
l1757:	
	movf	(eeprom_yaz@adres),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	35
	movf	(eeprom_yaz@veri),w
	movwf	(268)^0100h	;volatile
	line	37
	movlw	(055h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(397)^0180h	;volatile
	line	38
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	line	39
	
l1759:	
	bsf	(3169/8)^0180h,(3169)&7
	line	40
	goto	l692
	
l693:	
	
l692:	
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u11
	goto	u10
u11:
	goto	l692
u10:
	
l694:	
	line	41
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(108/8),(108)&7
	line	42
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3170/8)^0180h,(3170)&7
	line	43
	
l695:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_yaz
	__end_of_eeprom_yaz:
;; =============== function _eeprom_yaz ends ============

	signat	_eeprom_yaz,8312
	global	_eeprom_hazirla
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:

;; *************** function _eeprom_hazirla *****************
;; Defined at:
;;		line 8 in file "../EEPROM.c"
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
psect	text86
	file	"../EEPROM.c"
	line	8
	global	__size_of_eeprom_hazirla
	__size_of_eeprom_hazirla	equ	__end_of_eeprom_hazirla-_eeprom_hazirla
	
_eeprom_hazirla:	
	opt	stack 7
; Regs used in _eeprom_hazirla: []
	line	26
	
l1753:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	28
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1132/8)^080h,(1132)&7
	line	29
	
l689:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_hazirla
	__end_of_eeprom_hazirla:
;; =============== function _eeprom_hazirla ends ============

	signat	_eeprom_hazirla,88
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
