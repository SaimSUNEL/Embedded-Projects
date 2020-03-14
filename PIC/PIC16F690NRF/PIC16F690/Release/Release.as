opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F690
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
	FNCALL	_main,_SPI_Initialize
	FNCALL	_main,_UART_Initialize
	FNCALL	_main,_UART_SendString
	FNCALL	_main,_NRF_Initialize
	FNCALL	_main,_display_number
	FNCALL	_main,_NRF_ReceiveData
	FNCALL	_display_number,___awdiv
	FNCALL	_display_number,_set_segment_shift
	FNCALL	_display_number,___awmod
	FNCALL	_set_segment_shift,_shift_reg_set_pin
	FNCALL	_shift_reg_set_pin,_load_shift_data
	FNCALL	_NRF_ReceiveData,_SPI_WriteByte
	FNCALL	_NRF_Initialize,_SPI_WriteByte
	FNCALL	_UART_SendString,_UART_SendByte
	FNROOT	_main
	global	_rakamlar
	global	_what_to_display
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"../7Segments.h"
	line	10

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
	line	30

;initializer for _what_to_display
	retlw	05h
	global	_SendData
	global	_read
	global	_espera_ack
	global	_count
	global	_current_value
	global	_i
	global	_status
	global	_ReceiveData
	global	_PORTC
_PORTC	set	7
	global	_RCREG
_RCREG	set	26
	global	_SSPBUF
_SSPBUF	set	19
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CKP
_CKP	set	164
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RC0
_RC0	set	56
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RCIF
_RCIF	set	101
	global	_SPEN
_SPEN	set	199
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
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_BF
_BF	set	1184
	global	_BRG16
_BRG16	set	1243
	global	_BRGH
_BRGH	set	1218
	global	_CKE
_CKE	set	1190
	global	_IRCF0
_IRCF0	set	1148
	global	_IRCF1
_IRCF1	set	1149
	global	_IRCF2
_IRCF2	set	1150
	global	_RCIE
_RCIE	set	1125
	global	_SCS
_SCS	set	1144
	global	_SMP
_SMP	set	1191
	global	_SYNC
_SYNC	set	1220
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISB7
_TRISB7	set	1079
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TRMT
_TRMT	set	1217
	global	_TXEN
_TXEN	set	1221
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
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
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_3:	
	retlw	73	;'I'
	retlw	110	;'n'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	105	;'i'
	retlw	122	;'z'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	78	;'N'
	retlw	82	;'R'
	retlw	70	;'F'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	10
	retlw	0
	retlw	0
psect	strings
	
STR_4:	
	retlw	78	;'N'
	retlw	82	;'R'
	retlw	70	;'F'
	retlw	32	;' '
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	105	;'i'
	retlw	122	;'z'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	10
	retlw	0
	retlw	0
psect	strings
	
STR_2:	
	retlw	10
	retlw	83	;'S'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	10
	retlw	0
	retlw	0
psect	strings
	
STR_6:	
	retlw	82	;'R'
	retlw	101	;'e'
	retlw	99	;'c'
	retlw	101	;'e'
	retlw	105	;'i'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_5:	
	retlw	68	;'D'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	101	;'e'
	retlw	10
	retlw	0
	retlw	0
psect	strings
	
STR_1:	
	retlw	67	;'C'
	retlw	79	;'O'
	retlw	78	;'N'
	retlw	70	;'F'
	retlw	73	;'I'
	retlw	71	;'G'
	retlw	32	;' '
	retlw	0
	retlw	0
psect	strings
	file	"Release.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_SendData:
       ds      10

_read:
       ds      5

_espera_ack:
       ds      2

_count:
       ds      1

_current_value:
       ds      1

_i:
       ds      1

_status:
       ds      1

_ReceiveData:
       ds      10

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"../7Segments.h"
	line	10
_rakamlar:
       ds      10

psect	dataBANK0
	file	"../7Segments.h"
	line	30
_what_to_display:
       ds      1

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

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Fh)
	fcall	clear_ram
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+11)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_load_shift_data
?_load_shift_data:	; 0 bytes @ 0x0
	global	??_load_shift_data
??_load_shift_data:	; 0 bytes @ 0x0
	global	?_display_number
?_display_number:	; 0 bytes @ 0x0
	global	??_UART_SendByte
??_UART_SendByte:	; 0 bytes @ 0x0
	global	?_UART_Initialize
?_UART_Initialize:	; 0 bytes @ 0x0
	global	??_UART_Initialize
??_UART_Initialize:	; 0 bytes @ 0x0
	global	?_SPI_Initialize
?_SPI_Initialize:	; 0 bytes @ 0x0
	global	??_SPI_Initialize
??_SPI_Initialize:	; 0 bytes @ 0x0
	global	??_SPI_WriteByte
??_SPI_WriteByte:	; 0 bytes @ 0x0
	global	?_NRF_Initialize
?_NRF_Initialize:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_SPI_WriteByte
?_SPI_WriteByte:	; 1 bytes @ 0x0
	global	?_UART_SendByte
?_UART_SendByte:	; 2 bytes @ 0x0
	global	?_NRF_ReceiveData
?_NRF_ReceiveData:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	UART_SendByte@value
UART_SendByte@value:	; 1 bytes @ 0x0
	global	SPI_WriteByte@value
SPI_WriteByte@value:	; 1 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	?_UART_SendString
?_UART_SendString:	; 0 bytes @ 0x1
	global	??_NRF_Initialize
??_NRF_Initialize:	; 0 bytes @ 0x1
	global	??_NRF_ReceiveData
??_NRF_ReceiveData:	; 0 bytes @ 0x1
	global	load_shift_data@data
load_shift_data@data:	; 1 bytes @ 0x1
	global	UART_SendString@data
UART_SendString@data:	; 2 bytes @ 0x1
	ds	1
	global	load_shift_data@a
load_shift_data@a:	; 1 bytes @ 0x2
	global	NRF_ReceiveData@status
NRF_ReceiveData@status:	; 1 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	?_shift_reg_set_pin
?_shift_reg_set_pin:	; 0 bytes @ 0x3
	global	??_UART_SendString
??_UART_SendString:	; 0 bytes @ 0x3
	global	shift_reg_set_pin@value
shift_reg_set_pin@value:	; 1 bytes @ 0x3
	global	NRF_ReceiveData@i
NRF_ReceiveData@i:	; 2 bytes @ 0x3
	ds	1
	global	??_shift_reg_set_pin
??_shift_reg_set_pin:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	ds	1
	global	UART_SendString@a
UART_SendString@a:	; 1 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	shift_reg_set_pin@pin_number
shift_reg_set_pin@pin_number:	; 1 bytes @ 0x6
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	?_set_segment_shift
?_set_segment_shift:	; 0 bytes @ 0x7
	global	set_segment_shift@data
set_segment_shift@data:	; 1 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	??_set_segment_shift
??_set_segment_shift:	; 0 bytes @ 0x8
	ds	2
	global	set_segment_shift@segment_no
set_segment_shift@segment_no:	; 1 bytes @ 0xA
	ds	1
	global	set_segment_shift@a
set_segment_shift@a:	; 1 bytes @ 0xB
	ds	1
	global	display_number@number
display_number@number:	; 1 bytes @ 0xC
	ds	1
	global	display_number@digit
display_number@digit:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_display_number
??_display_number:	; 0 bytes @ 0x0
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x3
	ds	2
	global	main@mode
main@mode:	; 1 bytes @ 0x5
	ds	1
;;Data sizes: Strings 86, constant 0, data 11, bss 31, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      6      48
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; UART_SendString@data	PTR const unsigned char  size(2) Largest target is 22
;;		 -> STR_6(CODE[12]), STR_5(CODE[9]), STR_4(CODE[21]), STR_3(CODE[22]), 
;;		 -> ReceiveData(BANK0[10]), STR_2(CODE[13]), STR_1(CODE[9]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_display_number
;;   _display_number->_set_segment_shift
;;   _set_segment_shift->_shift_reg_set_pin
;;   _shift_reg_set_pin->_load_shift_data
;;   _NRF_ReceiveData->_SPI_WriteByte
;;   _NRF_Initialize->_SPI_WriteByte
;;   _UART_SendString->_UART_SendByte
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_display_number
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
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
;; (0) _main                                                 4     4      0    1229
;;                                              3 BANK0      3     3      0
;;                     _SPI_Initialize
;;                    _UART_Initialize
;;                    _UART_SendString
;;                     _NRF_Initialize
;;                     _display_number
;;                    _NRF_ReceiveData
;; ---------------------------------------------------------------------------------
;; (1) _display_number                                       5     5      0    1003
;;                                             12 COMMON     2     2      0
;;                                              0 BANK0      3     3      0
;;                            ___awdiv
;;                  _set_segment_shift
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (2) _set_segment_shift                                    5     4      1     315
;;                                              7 COMMON     5     4      1
;;                  _shift_reg_set_pin
;; ---------------------------------------------------------------------------------
;; (3) _shift_reg_set_pin                                    4     3      1     181
;;                                              3 COMMON     4     3      1
;;                    _load_shift_data
;; ---------------------------------------------------------------------------------
;; (1) _NRF_ReceiveData                                      4     4      0      91
;;                                              1 COMMON     4     4      0
;;                      _SPI_WriteByte
;; ---------------------------------------------------------------------------------
;; (1) _NRF_Initialize                                       2     2      0      22
;;                                              1 COMMON     2     2      0
;;                      _SPI_WriteByte
;; ---------------------------------------------------------------------------------
;; (1) _UART_SendString                                      5     3      2     112
;;                                              1 COMMON     5     3      2
;;                      _UART_SendByte
;; ---------------------------------------------------------------------------------
;; (4) _load_shift_data                                      3     3      0      90
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (2) _SPI_WriteByte                                        1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _SPI_Initialize                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _UART_Initialize                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _UART_SendByte                                        1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _SPI_Initialize
;;   _UART_Initialize
;;   _UART_SendString
;;     _UART_SendByte
;;   _NRF_Initialize
;;     _SPI_WriteByte
;;   _display_number
;;     ___awdiv
;;     _set_segment_shift
;;       _shift_reg_set_pin
;;         _load_shift_data
;;     ___awmod
;;   _NRF_ReceiveData
;;     _SPI_WriteByte
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               50      0       0       7        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITBANK1            50      0       0       4        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      42      10        0.0%
;;ABS                  0      0      3E       8        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50      6      30       3       60.0%
;;BITBANK0            50      0       0       9        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 42 in file "../PIC16f690NRF.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  mode            1    5[BANK0 ] unsigned char 
;;  status          1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_SPI_Initialize
;;		_UART_Initialize
;;		_UART_SendString
;;		_NRF_Initialize
;;		_display_number
;;		_NRF_ReceiveData
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC16f690NRF.c"
	line	42
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	44
	
l4051:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	45
	clrf	(287)^0100h	;volatile
	line	47
	
l4053:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1150/8)^080h,(1150)&7
	line	48
	
l4055:	
	bsf	(1149/8)^080h,(1149)&7
	line	49
	
l4057:	
	bcf	(1148/8)^080h,(1148)&7
	line	50
	
l4059:	
	bsf	(1144/8)^080h,(1144)&7
	line	52
	
l4061:	
	bsf	(1085/8)^080h,(1085)&7
	line	53
	
l4063:	
	bcf	(1086/8)^080h,(1086)&7
	line	54
	
l4065:	
	bcf	(1084/8)^080h,(1084)&7
	line	55
	
l4067:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	56
	
l4069:	
	bcf	(62/8),(62)&7
	line	57
	clrf	(7)	;volatile
	line	61
	
l4071:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1079/8)^080h,(1079)&7
	line	62
	
l4073:	
	bsf	(1077/8)^080h,(1077)&7
	line	65
	
l4075:	
	bcf	(1083/8)^080h,(1083)&7
	line	66
	
l4077:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	70
	
l4079:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1080/8)^080h,(1080)&7
	line	71
	
l4081:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	73
	
l4083:	
	fcall	_SPI_Initialize
	line	75
	
l4085:	
	opt asmopt_off
movlw	195
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	205
movwf	((??_main+0)+0),f
u2927:
	decfsz	((??_main+0)+0),f
	goto	u2927
	decfsz	((??_main+0)+0+1),f
	goto	u2927
opt asmopt_on

	line	77
	
l4087:	
	fcall	_UART_Initialize
	line	78
	
l4089:	
	opt asmopt_off
movlw	26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	248
movwf	((??_main+0)+0),f
u2937:
	decfsz	((??_main+0)+0),f
	goto	u2937
	decfsz	((??_main+0)+0+1),f
	goto	u2937
	clrwdt
opt asmopt_on

	line	81
	
l4091:	
	movlw	low((STR_3-__stringbase))
	movwf	(?_UART_SendString)
	movlw	80h
	movwf	(?_UART_SendString+1)
	fcall	_UART_SendString
	line	83
	
l4093:	
	fcall	_NRF_Initialize
	line	84
	
l4095:	
	movlw	low((STR_4-__stringbase))
	movwf	(?_UART_SendString)
	movlw	80h
	movwf	(?_UART_SendString+1)
	fcall	_UART_SendString
	line	86
	
l4097:	
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2947:
	decfsz	((??_main+0)+0),f
	goto	u2947
	decfsz	((??_main+0)+0+1),f
	goto	u2947
	nop2
opt asmopt_on

	line	87
	
l4099:	
	movlw	(053h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_SendData)
	line	88
	
l4101:	
	movlw	(061h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_SendData)+01h
	line	89
	
l4103:	
	movlw	(069h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_SendData)+02h
	line	90
	
l4105:	
	movlw	(06Dh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_SendData)+03h
	line	91
	
l4107:	
	movlw	(020h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_SendData)+04h
	line	92
	
l4109:	
	movlw	(053h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_SendData)+05h
	line	93
	
l4111:	
	movlw	(055h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_SendData)+06h
	line	94
	
l4113:	
	movlw	(04Eh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_SendData)+07h
	line	96
	
l4115:	
	movlw	low((STR_5-__stringbase))
	movwf	(?_UART_SendString)
	movlw	80h
	movwf	(?_UART_SendString+1)
	fcall	_UART_SendString
	line	97
	
l4117:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	99
	
l4119:	
	movlw	(0Ch)
	fcall	_display_number
	line	100
	
l4121:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@mode)
	goto	l4123
	line	101
	
l987:	
	line	103
	
l4123:	
	fcall	_NRF_ReceiveData
	line	104
	
l4125:	
	movlw	low((STR_6-__stringbase))
	movwf	(?_UART_SendString)
	movlw	80h
	movwf	(?_UART_SendString+1)
	fcall	_UART_SendString
	line	105
	
l4127:	
	movlw	(_ReceiveData&0ffh)
	movwf	(?_UART_SendString)
	movlw	(0x0/2)
	movwf	(?_UART_SendString+1)
	fcall	_UART_SendString
	line	107
	
l4129:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_ReceiveData),w
	xorlw	031h
	skipz
	goto	u2911
	goto	u2910
u2911:
	goto	l988
u2910:
	line	108
	
l4131:	
	bsf	(60/8),(60)&7
	goto	l4133
	line	109
	
l988:	
	bcf	(60/8),(60)&7
	goto	l4133
	
l989:	
	line	110
	
l4133:	
	movf	0+(_ReceiveData)+01h,w
	fcall	_display_number
	line	121
	
l4135:	
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2957:
	decfsz	((??_main+0)+0),f
	goto	u2957
	decfsz	((??_main+0)+0+1),f
	goto	u2957
	nop2
opt asmopt_on

	goto	l4123
	line	122
	
l990:	
	line	101
	goto	l4123
	
l991:	
	line	124
	
l992:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_display_number
psect	text346,local,class=CODE,delta=2
global __ptext346
__ptext346:

;; *************** function _display_number *****************
;; Defined at:
;;		line 59 in file "../7Segments.h"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   12[COMMON] unsigned char 
;;  digit           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       3       0       0
;;      Totals:         2       3       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___awdiv
;;		_set_segment_shift
;;		___awmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text346
	file	"../7Segments.h"
	line	59
	global	__size_of_display_number
	__size_of_display_number	equ	__end_of_display_number-_display_number
	
_display_number:	
	opt	stack 4
; Regs used in _display_number: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	movwf	(display_number@number)
	line	60
	
l4035:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(display_number@number),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_display_number+0)+0
	clrf	(??_display_number+0)+0+1
	movf	0+(??_display_number+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_display_number+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	_rakamlar&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_display_number+2)+0
	movf	(??_display_number+2)+0,w
	movwf	(display_number@digit)
	line	61
	
l4037:	
	movf	(_what_to_display),w
	xorlw	02h
	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l4041
u2890:
	line	62
	
l4039:	
	bsf	(display_number@digit)+(7/8),(7)&7
	goto	l4041
	
l928:	
	line	64
	
l4041:	
	movf	(display_number@digit),w
	movwf	(??_display_number+0)+0
	movf	(??_display_number+0)+0,w
	movwf	(?_set_segment_shift)
	movlw	(03h)
	fcall	_set_segment_shift
	line	66
	
l4043:	
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(display_number@number),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_display_number+0)+0
	clrf	(??_display_number+0)+0+1
	movf	0+(??_display_number+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_display_number+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	_rakamlar&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	comf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_display_number+2)+0
	movf	(??_display_number+2)+0,w
	movwf	(display_number@digit)
	line	67
	
l4045:	
	movf	(_what_to_display),w
	xorlw	03h
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l4049
u2900:
	line	68
	
l4047:	
	bsf	(display_number@digit)+(7/8),(7)&7
	goto	l4049
	
l929:	
	line	69
	
l4049:	
	movf	(display_number@digit),w
	movwf	(??_display_number+0)+0
	movf	(??_display_number+0)+0,w
	movwf	(?_set_segment_shift)
	movlw	(04h)
	fcall	_set_segment_shift
	line	71
	
l930:	
	return
	opt stack 0
GLOBAL	__end_of_display_number
	__end_of_display_number:
;; =============== function _display_number ends ============

	signat	_display_number,4216
	global	_set_segment_shift
psect	text347,local,class=CODE,delta=2
global __ptext347
__ptext347:

;; *************** function _set_segment_shift *****************
;; Defined at:
;;		line 35 in file "../7Segments.h"
;; Parameters:    Size  Location     Type
;;  segment_no      1    wreg     unsigned char 
;;  data            1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  segment_no      1   10[COMMON] unsigned char 
;;  a               1   11[COMMON] char 
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
;;      Locals:         2       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_shift_reg_set_pin
;; This function is called by:
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text347
	file	"../7Segments.h"
	line	35
	global	__size_of_set_segment_shift
	__size_of_set_segment_shift	equ	__end_of_set_segment_shift-_set_segment_shift
	
_set_segment_shift:	
	opt	stack 4
; Regs used in _set_segment_shift: [wreg+status,2+status,0+pclath+cstack]
	line	37
	movwf	(set_segment_shift@segment_no)
	
l4013:	
	movlw	(07h)
	movwf	(??_set_segment_shift+0)+0
	movf	(??_set_segment_shift+0)+0,w
	movwf	(set_segment_shift@a)
	
l4015:	
	btfss	(set_segment_shift@a),7
	goto	u2861
	goto	u2860
u2861:
	goto	l4019
u2860:
	goto	l4029
	
l4017:	
	goto	l4029
	line	38
	
l923:	
	line	40
	
l4019:	
	movf	(set_segment_shift@data),w
	movwf	(??_set_segment_shift+0)+0
	incf	(set_segment_shift@a),w
	goto	u2874
u2875:
	clrc
	rrf	(??_set_segment_shift+0)+0,f
u2874:
	addlw	-1
	skipz
	goto	u2875
	movf	0+(??_set_segment_shift+0)+0,w
	andlw	01h
	movwf	(??_set_segment_shift+1)+0
	movf	(??_set_segment_shift+1)+0,w
	movwf	(?_shift_reg_set_pin)
	movlw	(02h)
	fcall	_shift_reg_set_pin
	line	41
	
l4021:	
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	42
	clrf	(?_shift_reg_set_pin)
	bsf	status,0
	rlf	(?_shift_reg_set_pin),f
	movlw	(01h)
	fcall	_shift_reg_set_pin
	line	43
	
l4023:	
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	44
	clrf	(?_shift_reg_set_pin)
	movlw	(01h)
	fcall	_shift_reg_set_pin
	line	37
	
l4025:	
	movlw	(-1)
	movwf	(??_set_segment_shift+0)+0
	movf	(??_set_segment_shift+0)+0,w
	addwf	(set_segment_shift@a),f
	
l4027:	
	btfss	(set_segment_shift@a),7
	goto	u2881
	goto	u2880
u2881:
	goto	l4019
u2880:
	goto	l4029
	
l924:	
	line	49
	
l4029:	
	clrf	(?_shift_reg_set_pin)
	bsf	status,0
	rlf	(?_shift_reg_set_pin),f
	movf	(set_segment_shift@segment_no),w
	fcall	_shift_reg_set_pin
	line	50
	
l4031:	
	opt asmopt_off
movlw	4
movwf	(??_set_segment_shift+0)+0,f
u2967:
decfsz	(??_set_segment_shift+0)+0,f
	goto	u2967
	nop2	;nop
opt asmopt_on

	line	51
	
l4033:	
	clrf	(?_shift_reg_set_pin)
	movf	(set_segment_shift@segment_no),w
	fcall	_shift_reg_set_pin
	line	54
	
l925:	
	return
	opt stack 0
GLOBAL	__end_of_set_segment_shift
	__end_of_set_segment_shift:
;; =============== function _set_segment_shift ends ============

	signat	_set_segment_shift,8312
	global	_shift_reg_set_pin
psect	text348,local,class=CODE,delta=2
global __ptext348
__ptext348:

;; *************** function _shift_reg_set_pin *****************
;; Defined at:
;;		line 42 in file "../OneWireShiftRegister.h"
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
;;		_load_shift_data
;; This function is called by:
;;		_set_segment_shift
;; This function uses a non-reentrant model
;;
psect	text348
	file	"../OneWireShiftRegister.h"
	line	42
	global	__size_of_shift_reg_set_pin
	__size_of_shift_reg_set_pin	equ	__end_of_shift_reg_set_pin-_shift_reg_set_pin
	
_shift_reg_set_pin:	
	opt	stack 4
; Regs used in _shift_reg_set_pin: [wreg+status,2+status,0+pclath+cstack]
	movwf	(shift_reg_set_pin@pin_number)
	line	43
	
l3999:	
	movf	(shift_reg_set_pin@value),w
	skipz
	goto	u2820
	goto	l916
u2820:
	
l4001:	
	clrf	(shift_reg_set_pin@value)
	bsf	status,0
	rlf	(shift_reg_set_pin@value),f
	goto	l4003
	line	44
	
l916:	
	clrf	(shift_reg_set_pin@value)
	goto	l4003
	
l917:	
	line	45
	
l4003:	
	movlw	low(01h)
	subwf	(shift_reg_set_pin@pin_number),f
	line	46
	
l4005:	
	movf	(shift_reg_set_pin@value),w
	skipz
	goto	u2830
	goto	l4009
u2830:
	line	48
	
l4007:	
	movlw	(01h)
	movwf	(??_shift_reg_set_pin+0)+0
	incf	(shift_reg_set_pin@pin_number),w
	goto	u2844
u2845:
	clrc
	rlf	(??_shift_reg_set_pin+0)+0,f
u2844:
	addlw	-1
	skipz
	goto	u2845
	movf	0+(??_shift_reg_set_pin+0)+0,w
	movwf	(??_shift_reg_set_pin+1)+0
	movf	(??_shift_reg_set_pin+1)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(_current_value),f
	line	49
	goto	l4011
	line	50
	
l918:	
	line	52
	
l4009:	
	movlw	(01h)
	movwf	(??_shift_reg_set_pin+0)+0
	incf	(shift_reg_set_pin@pin_number),w
	goto	u2854
u2855:
	clrc
	rlf	(??_shift_reg_set_pin+0)+0,f
u2854:
	addlw	-1
	skipz
	goto	u2855
	movf	0+(??_shift_reg_set_pin+0)+0,w
	xorlw	0ffh
	movwf	(??_shift_reg_set_pin+1)+0
	movf	(??_shift_reg_set_pin+1)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(_current_value),f
	goto	l4011
	line	54
	
l919:	
	line	56
	
l4011:	
	movf	(_current_value),w
	fcall	_load_shift_data
	line	58
	
l920:	
	return
	opt stack 0
GLOBAL	__end_of_shift_reg_set_pin
	__end_of_shift_reg_set_pin:
;; =============== function _shift_reg_set_pin ends ============

	signat	_shift_reg_set_pin,8312
	global	_NRF_ReceiveData
psect	text349,local,class=CODE,delta=2
global __ptext349
__ptext349:

;; *************** function _NRF_ReceiveData *****************
;; Defined at:
;;		line 280 in file "../NRF.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    3[COMMON] int 
;;  status          1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  977[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SPI_WriteByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text349
	file	"../NRF.h"
	line	280
	global	__size_of_NRF_ReceiveData
	__size_of_NRF_ReceiveData	equ	__end_of_NRF_ReceiveData-_NRF_ReceiveData
	
_NRF_ReceiveData:	
	opt	stack 6
; Regs used in _NRF_ReceiveData: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	282
	
l3929:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	284
	bsf	(62/8),(62)&7
	line	285
	
l3931:	
	opt asmopt_off
movlw	3
movwf	(??_NRF_ReceiveData+0)+0,f
u2977:
decfsz	(??_NRF_ReceiveData+0)+0,f
	goto	u2977
opt asmopt_on

	line	286
	
l3933:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	288
	
l3935:	
	movlw	(020h)
	fcall	_SPI_WriteByte
	line	289
	
l3937:	
	movlw	(0Bh)
	fcall	_SPI_WriteByte
	line	292
	
l3939:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	295
	goto	l978
	
l979:	
	
l978:	
	btfsc	(61/8),(61)&7
	goto	u2791
	goto	u2790
u2791:
	goto	l978
u2790:
	
l980:	
	line	305
	bsf	(62/8),(62)&7
	line	306
	
l3941:	
	opt asmopt_off
movlw	3
movwf	(??_NRF_ReceiveData+0)+0,f
u2987:
decfsz	(??_NRF_ReceiveData+0)+0,f
	goto	u2987
opt asmopt_on

	line	307
	
l3943:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	308
	
l3945:	
	movlw	(07h)
	fcall	_SPI_WriteByte
	line	309
	
l3947:	
	movlw	(0)
	fcall	_SPI_WriteByte
	movwf	(??_NRF_ReceiveData+0)+0
	movf	(??_NRF_ReceiveData+0)+0,w
	movwf	(NRF_ReceiveData@status)
	line	312
	
l3949:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	313
	
l3951:	
	opt asmopt_off
movlw	3
movwf	(??_NRF_ReceiveData+0)+0,f
u2997:
decfsz	(??_NRF_ReceiveData+0)+0,f
	goto	u2997
opt asmopt_on

	line	314
	
l3953:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	315
	
l3955:	
	movlw	(027h)
	fcall	_SPI_WriteByte
	line	316
	
l3957:	
	movlw	(070h)
	fcall	_SPI_WriteByte
	line	319
	goto	l981
	line	320
	
l3959:	
;	Return value of _NRF_ReceiveData is never used
	goto	l982
	
l981:	
	line	325
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	326
	
l3961:	
	opt asmopt_off
movlw	3
movwf	(??_NRF_ReceiveData+0)+0,f
u3007:
decfsz	(??_NRF_ReceiveData+0)+0,f
	goto	u3007
opt asmopt_on

	line	327
	
l3963:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	328
	
l3965:	
	movlw	(061h)
	fcall	_SPI_WriteByte
	line	329
	
l3967:	
	clrf	(NRF_ReceiveData@i)
	clrf	(NRF_ReceiveData@i+1)
	
l3969:	
	movf	(NRF_ReceiveData@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2805
	movlw	low(0Ah)
	subwf	(NRF_ReceiveData@i),w
u2805:

	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l3973
u2800:
	goto	l984
	
l3971:	
	goto	l984
	
l983:	
	
l3973:	
	movlw	(0)
	fcall	_SPI_WriteByte
	movwf	(??_NRF_ReceiveData+0)+0
	movf	(NRF_ReceiveData@i),w
	addlw	_ReceiveData&0ffh
	movwf	fsr0
	movf	(??_NRF_ReceiveData+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3975:	
	movlw	low(01h)
	addwf	(NRF_ReceiveData@i),f
	skipnc
	incf	(NRF_ReceiveData@i+1),f
	movlw	high(01h)
	addwf	(NRF_ReceiveData@i+1),f
	
l3977:	
	movf	(NRF_ReceiveData@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2815
	movlw	low(0Ah)
	subwf	(NRF_ReceiveData@i),w
u2815:

	skipc
	goto	u2811
	goto	u2810
u2811:
	goto	l3973
u2810:
	
l984:	
	line	334
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	335
	
l3979:	
	opt asmopt_off
movlw	3
movwf	(??_NRF_ReceiveData+0)+0,f
u3017:
decfsz	(??_NRF_ReceiveData+0)+0,f
	goto	u3017
opt asmopt_on

	line	336
	
l3981:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	337
	
l3983:	
	movlw	(0E2h)
	fcall	_SPI_WriteByte
	line	339
	
l3985:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	340
	
l3987:	
	opt asmopt_off
movlw	3
movwf	(??_NRF_ReceiveData+0)+0,f
u3027:
decfsz	(??_NRF_ReceiveData+0)+0,f
	goto	u3027
opt asmopt_on

	line	341
	
l3989:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	342
	movlw	(027h)
	fcall	_SPI_WriteByte
	line	343
	movlw	(040h)
	fcall	_SPI_WriteByte
	line	344
	
l3991:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	345
	
l3993:	
	opt asmopt_off
movlw	3
movwf	(??_NRF_ReceiveData+0)+0,f
u3037:
decfsz	(??_NRF_ReceiveData+0)+0,f
	goto	u3037
opt asmopt_on

	line	346
	
l3995:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	goto	l982
	line	348
	
l3997:	
	line	352
;	Return value of _NRF_ReceiveData is never used
	
l982:	
	return
	opt stack 0
GLOBAL	__end_of_NRF_ReceiveData
	__end_of_NRF_ReceiveData:
;; =============== function _NRF_ReceiveData ends ============

	signat	_NRF_ReceiveData,90
	global	_NRF_Initialize
psect	text350,local,class=CODE,delta=2
global __ptext350
__ptext350:

;; *************** function _NRF_Initialize *****************
;; Defined at:
;;		line 24 in file "../NRF.h"
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
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SPI_WriteByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text350
	file	"../NRF.h"
	line	24
	global	__size_of_NRF_Initialize
	__size_of_NRF_Initialize	equ	__end_of_NRF_Initialize-_NRF_Initialize
	
_NRF_Initialize:	
	opt	stack 6
; Regs used in _NRF_Initialize: [wreg+status,2+status,0+pclath+cstack]
	line	26
	
l3827:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	29
	bsf	(62/8),(62)&7
	line	30
	
l3829:	
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3047:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3047
opt asmopt_on

	line	31
	
l3831:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	36
	
l3833:	
	movlw	(020h)
	fcall	_SPI_WriteByte
	line	37
	
l3835:	
	movlw	(0Bh)
	fcall	_SPI_WriteByte
	line	39
	opt asmopt_off
movlw	3
movwf	((??_NRF_Initialize+0)+0+1),f
	movlw	151
movwf	((??_NRF_Initialize+0)+0),f
u3057:
	decfsz	((??_NRF_Initialize+0)+0),f
	goto	u3057
	decfsz	((??_NRF_Initialize+0)+0+1),f
	goto	u3057
	nop2
opt asmopt_on

	line	47
	
l3837:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	48
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3067:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3067
opt asmopt_on

	line	49
	
l3839:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	51
	
l3841:	
	movlw	(021h)
	fcall	_SPI_WriteByte
	line	52
	
l3843:	
	movlw	(01h)
	fcall	_SPI_WriteByte
	line	56
	
l3845:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	57
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3077:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3077
opt asmopt_on

	line	58
	
l3847:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	61
	
l3849:	
	movlw	(022h)
	fcall	_SPI_WriteByte
	line	62
	
l3851:	
	movlw	(01h)
	fcall	_SPI_WriteByte
	line	66
	
l3853:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	67
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3087:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3087
opt asmopt_on

	line	68
	
l3855:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	70
	
l3857:	
	movlw	(023h)
	fcall	_SPI_WriteByte
	line	71
	
l3859:	
	movlw	(03h)
	fcall	_SPI_WriteByte
	line	76
	
l3861:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	77
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3097:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3097
opt asmopt_on

	line	78
	
l3863:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	80
	
l3865:	
	movlw	(024h)
	fcall	_SPI_WriteByte
	line	81
	
l3867:	
	movlw	(03Fh)
	fcall	_SPI_WriteByte
	line	86
	
l3869:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	87
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3107:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3107
opt asmopt_on

	line	88
	
l3871:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	89
	
l3873:	
	movlw	(025h)
	fcall	_SPI_WriteByte
	line	90
	
l3875:	
	movlw	(02h)
	fcall	_SPI_WriteByte
	line	94
	
l3877:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	95
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3117:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3117
opt asmopt_on

	line	96
	
l3879:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	97
	
l3881:	
	movlw	(026h)
	fcall	_SPI_WriteByte
	line	98
	
l3883:	
	movlw	(026h)
	fcall	_SPI_WriteByte
	line	102
	
l3885:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	103
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3127:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3127
opt asmopt_on

	line	104
	
l3887:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	106
	
l3889:	
	movlw	(02Ah)
	fcall	_SPI_WriteByte
	line	107
	
l3891:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	108
	
l3893:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	109
	
l3895:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	110
	
l3897:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	111
	
l3899:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	114
	
l3901:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	115
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3137:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3137
opt asmopt_on

	line	116
	
l3903:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	118
	
l3905:	
	movlw	(030h)
	fcall	_SPI_WriteByte
	line	119
	
l3907:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	120
	
l3909:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	121
	
l3911:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	122
	
l3913:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	123
	
l3915:	
	movlw	(0E7h)
	fcall	_SPI_WriteByte
	line	126
	
l3917:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	127
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3147:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3147
opt asmopt_on

	line	128
	
l3919:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	130
	
l3921:	
	movlw	(031h)
	fcall	_SPI_WriteByte
	line	131
	
l3923:	
	movlw	(0Ah)
	fcall	_SPI_WriteByte
	line	133
	
l3925:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	134
	opt asmopt_off
movlw	3
movwf	(??_NRF_Initialize+0)+0,f
u3157:
decfsz	(??_NRF_Initialize+0)+0,f
	goto	u3157
opt asmopt_on

	line	135
	
l3927:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	144
	
l966:	
	return
	opt stack 0
GLOBAL	__end_of_NRF_Initialize
	__end_of_NRF_Initialize:
;; =============== function _NRF_Initialize ends ============

	signat	_NRF_Initialize,88
	global	_UART_SendString
psect	text351,local,class=CODE,delta=2
global __ptext351
__ptext351:

;; *************** function _UART_SendString *****************
;; Defined at:
;;		line 45 in file "../UART.h"
;; Parameters:    Size  Location     Type
;;  data            2    1[COMMON] PTR const unsigned char 
;;		 -> STR_6(12), STR_5(9), STR_4(21), STR_3(22), 
;;		 -> ReceiveData(10), STR_2(13), STR_1(9), 
;; Auto vars:     Size  Location     Type
;;  a               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_UART_SendByte
;; This function is called by:
;;		_main
;;		_NRF_SendData
;; This function uses a non-reentrant model
;;
psect	text351
	file	"../UART.h"
	line	45
	global	__size_of_UART_SendString
	__size_of_UART_SendString	equ	__end_of_UART_SendString-_UART_SendString
	
_UART_SendString:	
	opt	stack 6
; Regs used in _UART_SendString: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	47
	
l3817:	
	clrf	(UART_SendString@a)
	goto	l3825
	line	48
	
l949:	
	line	49
	
l3819:	
	movf	(UART_SendString@a),w
	addwf	(UART_SendString@data),w
	movwf	fsr0
	movf	(UART_SendString@data+1),w
	skipnc
	incf	(UART_SendString@data+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	fcall	_UART_SendByte
	line	50
	
l3821:	
	opt asmopt_off
movlw	4
movwf	((??_UART_SendString+0)+0+1),f
	movlw	228
movwf	((??_UART_SendString+0)+0),f
u3167:
	decfsz	((??_UART_SendString+0)+0),f
	goto	u3167
	decfsz	((??_UART_SendString+0)+0+1),f
	goto	u3167
	clrwdt
opt asmopt_on

	line	47
	
l3823:	
	movlw	(01h)
	movwf	(??_UART_SendString+0)+0
	movf	(??_UART_SendString+0)+0,w
	addwf	(UART_SendString@a),f
	goto	l3825
	
l948:	
	
l3825:	
	movf	(UART_SendString@a),w
	addwf	(UART_SendString@data),w
	movwf	fsr0
	movf	(UART_SendString@data+1),w
	skipnc
	incf	(UART_SendString@data+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	iorlw	0
	skipz
	goto	u2781
	goto	u2780
u2781:
	goto	l3819
u2780:
	goto	l951
	
l950:	
	line	53
	
l951:	
	return
	opt stack 0
GLOBAL	__end_of_UART_SendString
	__end_of_UART_SendString:
;; =============== function _UART_SendString ends ============

	signat	_UART_SendString,4216
	global	_load_shift_data
psect	text352,local,class=CODE,delta=2
global __ptext352
__ptext352:

;; *************** function _load_shift_data *****************
;; Defined at:
;;		line 9 in file "../OneWireShiftRegister.h"
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
;;		_shift_reg_set_pin
;; This function uses a non-reentrant model
;;
psect	text352
	file	"../OneWireShiftRegister.h"
	line	9
	global	__size_of_load_shift_data
	__size_of_load_shift_data	equ	__end_of_load_shift_data-_load_shift_data
	
_load_shift_data:	
	opt	stack 4
; Regs used in _load_shift_data: [wreg+status,2+status,0]
	line	11
	movwf	(load_shift_data@data)
	
l3793:	
	movlw	(07h)
	movwf	(??_load_shift_data+0)+0
	movf	(??_load_shift_data+0)+0,w
	movwf	(load_shift_data@a)
	
l3795:	
	btfss	(load_shift_data@a),7
	goto	u2741
	goto	u2740
u2741:
	goto	l3799
u2740:
	goto	l910
	
l3797:	
	goto	l910
	line	12
	
l909:	
	line	14
	
l3799:	
	movf	(load_shift_data@data),w
	movwf	(??_load_shift_data+0)+0
	incf	(load_shift_data@a),w
	goto	u2754
u2755:
	clrc
	rrf	(??_load_shift_data+0)+0,f
u2754:
	addlw	-1
	skipz
	goto	u2755
	btfss	0+(??_load_shift_data+0)+0,(0)&7
	goto	u2761
	goto	u2760
u2761:
	goto	l911
u2760:
	line	17
	
l3801:	
# 17 "../OneWireShiftRegister.h"
banksel _PORTC ;#
	line	18
# 18 "../OneWireShiftRegister.h"
bcf _PORTC, 3 ;#
	line	19
# 19 "../OneWireShiftRegister.h"
bsf _PORTC, 3 ;#
psect	text352
	line	22
	
l3803:	
	opt asmopt_off
movlw	4
movwf	(??_load_shift_data+0)+0,f
u3177:
decfsz	(??_load_shift_data+0)+0,f
	goto	u3177
	nop2	;nop
opt asmopt_on

	line	23
	goto	l3809
	line	24
	
l911:	
	line	26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	27
	
l3805:	
	opt asmopt_off
movlw	4
movwf	(??_load_shift_data+0)+0,f
u3187:
decfsz	(??_load_shift_data+0)+0,f
	goto	u3187
	nop2	;nop
opt asmopt_on

	line	28
	
l3807:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	29
	opt asmopt_off
movlw	9
movwf	(??_load_shift_data+0)+0,f
u3197:
decfsz	(??_load_shift_data+0)+0,f
	goto	u3197
	nop2	;nop
opt asmopt_on

	goto	l3809
	line	30
	
l912:	
	line	11
	
l3809:	
	movlw	(-1)
	movwf	(??_load_shift_data+0)+0
	movf	(??_load_shift_data+0)+0,w
	addwf	(load_shift_data@a),f
	
l3811:	
	btfss	(load_shift_data@a),7
	goto	u2771
	goto	u2770
u2771:
	goto	l3799
u2770:
	
l910:	
	line	34
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	35
	
l3813:	
	opt asmopt_off
movlw	66
movwf	(??_load_shift_data+0)+0,f
u3207:
decfsz	(??_load_shift_data+0)+0,f
	goto	u3207
opt asmopt_on

	line	36
	
l3815:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	37
	opt asmopt_off
movlw	99
movwf	(??_load_shift_data+0)+0,f
u3217:
decfsz	(??_load_shift_data+0)+0,f
	goto	u3217
	nop2	;nop
opt asmopt_on

	line	40
	
l913:	
	return
	opt stack 0
GLOBAL	__end_of_load_shift_data
	__end_of_load_shift_data:
;; =============== function _load_shift_data ends ============

	signat	_load_shift_data,4216
	global	___awmod
psect	text353,local,class=CODE,delta=2
global __ptext353
__ptext353:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
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
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text353
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l3759:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2651
	goto	u2650
u2651:
	goto	l3763
u2650:
	line	10
	
l3761:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l3763
	line	12
	
l2059:	
	line	13
	
l3763:	
	btfss	(___awmod@divisor+1),7
	goto	u2661
	goto	u2660
u2661:
	goto	l3767
u2660:
	line	14
	
l3765:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l3767
	
l2060:	
	line	15
	
l3767:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2671
	goto	u2670
u2671:
	goto	l3785
u2670:
	line	16
	
l3769:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l3775
	
l2063:	
	line	18
	
l3771:	
	movlw	01h
	
u2685:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2685
	line	19
	
l3773:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l3775
	line	20
	
l2062:	
	line	17
	
l3775:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2691
	goto	u2690
u2691:
	goto	l3771
u2690:
	goto	l3777
	
l2064:	
	goto	l3777
	line	21
	
l2065:	
	line	22
	
l3777:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2705
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2705:
	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l3781
u2700:
	line	23
	
l3779:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l3781
	
l2066:	
	line	24
	
l3781:	
	movlw	01h
	
u2715:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2715
	line	25
	
l3783:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2721
	goto	u2720
u2721:
	goto	l3777
u2720:
	goto	l3785
	
l2067:	
	goto	l3785
	line	26
	
l2061:	
	line	27
	
l3785:	
	movf	(___awmod@sign),w
	skipz
	goto	u2730
	goto	l3789
u2730:
	line	28
	
l3787:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l3789
	
l2068:	
	line	29
	
l3789:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l2069
	
l3791:	
	line	30
	
l2069:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text354,local,class=CODE,delta=2
global __ptext354
__ptext354:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
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
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text354
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l3719:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2551
	goto	u2550
u2551:
	goto	l3723
u2550:
	line	11
	
l3721:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l3723
	line	13
	
l1991:	
	line	14
	
l3723:	
	btfss	(___awdiv@dividend+1),7
	goto	u2561
	goto	u2560
u2561:
	goto	l3729
u2560:
	line	15
	
l3725:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l3727:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l3729
	line	17
	
l1992:	
	line	18
	
l3729:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l3731:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2571
	goto	u2570
u2571:
	goto	l3751
u2570:
	line	20
	
l3733:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l3739
	
l1995:	
	line	22
	
l3735:	
	movlw	01h
	
u2585:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2585
	line	23
	
l3737:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l3739
	line	24
	
l1994:	
	line	21
	
l3739:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l3735
u2590:
	goto	l3741
	
l1996:	
	goto	l3741
	line	25
	
l1997:	
	line	26
	
l3741:	
	movlw	01h
	
u2605:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2605
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2615
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2615:
	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l3747
u2610:
	line	28
	
l3743:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l3745:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l3747
	line	30
	
l1998:	
	line	31
	
l3747:	
	movlw	01h
	
u2625:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2625
	line	32
	
l3749:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2631
	goto	u2630
u2631:
	goto	l3741
u2630:
	goto	l3751
	
l1999:	
	goto	l3751
	line	33
	
l1993:	
	line	34
	
l3751:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2640
	goto	l3755
u2640:
	line	35
	
l3753:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l3755
	
l2000:	
	line	36
	
l3755:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2001
	
l3757:	
	line	37
	
l2001:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_SPI_WriteByte
psect	text355,local,class=CODE,delta=2
global __ptext355
__ptext355:

;; *************** function _SPI_WriteByte *****************
;; Defined at:
;;		line 27 in file "../SPI.h"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    0[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_NRF_Initialize
;;		_NRF_ReceiveData
;;		_NRF_SendData
;; This function uses a non-reentrant model
;;
psect	text355
	file	"../SPI.h"
	line	27
	global	__size_of_SPI_WriteByte
	__size_of_SPI_WriteByte	equ	__end_of_SPI_WriteByte-_SPI_WriteByte
	
_SPI_WriteByte:	
	opt	stack 6
; Regs used in _SPI_WriteByte: [wreg]
	movwf	(SPI_WriteByte@value)
	line	28
	
l3613:	
	movf	(SPI_WriteByte@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	29
	goto	l957
	
l958:	
	
l957:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l957
u2490:
	goto	l960
	
l959:	
	line	30
	goto	l960
	
l961:	
	
l960:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u2501
	goto	u2500
u2501:
	goto	l960
u2500:
	
l962:	
	line	33
	bcf	(99/8),(99)&7
	line	34
	
l3615:	
	movf	(19),w	;volatile
	goto	l963
	
l3617:	
	line	35
	
l963:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_WriteByte
	__end_of_SPI_WriteByte:
;; =============== function _SPI_WriteByte ends ============

	signat	_SPI_WriteByte,4217
	global	_SPI_Initialize
psect	text356,local,class=CODE,delta=2
global __ptext356
__ptext356:

;; *************** function _SPI_Initialize *****************
;; Defined at:
;;		line 6 in file "../SPI.h"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text356
	file	"../SPI.h"
	line	6
	global	__size_of_SPI_Initialize
	__size_of_SPI_Initialize	equ	__end_of_SPI_Initialize-_SPI_Initialize
	
_SPI_Initialize:	
	opt	stack 7
; Regs used in _SPI_Initialize: []
	line	9
	
l3611:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	10
	bcf	(1087/8)^080h,(1087)&7
	line	11
	bsf	(1076/8)^080h,(1076)&7
	line	13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(164/8),(164)&7
	line	14
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1190/8)^080h,(1190)&7
	line	15
	bcf	(1191/8)^080h,(1191)&7
	line	18
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(163/8),(163)&7
	line	19
	bcf	(162/8),(162)&7
	line	20
	bcf	(161/8),(161)&7
	line	21
	bcf	(160/8),(160)&7
	line	23
	bsf	(165/8),(165)&7
	line	24
	
l954:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_Initialize
	__end_of_SPI_Initialize:
;; =============== function _SPI_Initialize ends ============

	signat	_SPI_Initialize,88
	global	_UART_Initialize
psect	text357,local,class=CODE,delta=2
global __ptext357
__ptext357:

;; *************** function _UART_Initialize *****************
;; Defined at:
;;		line 21 in file "../UART.h"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text357
	file	"../UART.h"
	line	21
	global	__size_of_UART_Initialize
	__size_of_UART_Initialize	equ	__end_of_UART_Initialize-_UART_Initialize
	
_UART_Initialize:	
	opt	stack 7
; Regs used in _UART_Initialize: [wreg]
	line	23
	
l3591:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1218/8)^080h,(1218)&7
	line	24
	bcf	(1220/8)^080h,(1220)&7
	line	25
	bcf	(1243/8)^080h,(1243)&7
	line	26
	
l3593:	
	movlw	(019h)
	movwf	(153)^080h	;volatile
	line	31
	
l3595:	
	bsf	(1221/8)^080h,(1221)&7
	line	32
	
l3597:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	line	33
	
l3599:	
	bcf	(100/8),(100)&7
	line	34
	
l3601:	
	bcf	(101/8),(101)&7
	line	35
	
l3603:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	36
	
l3605:	
	bsf	(94/8),(94)&7
	line	39
	
l3607:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	40
	
l3609:	
	bsf	(95/8),(95)&7
	line	41
	
l945:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Initialize
	__end_of_UART_Initialize:
;; =============== function _UART_Initialize ends ============

	signat	_UART_Initialize,88
	global	_UART_SendByte
psect	text358,local,class=CODE,delta=2
global __ptext358
__ptext358:

;; *************** function _UART_SendByte *****************
;; Defined at:
;;		line 4 in file "../UART.h"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  932[COMMON] int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UART_SendString
;;		_NRF_SendData
;; This function uses a non-reentrant model
;;
psect	text358
	file	"../UART.h"
	line	4
	global	__size_of_UART_SendByte
	__size_of_UART_SendByte	equ	__end_of_UART_SendByte-_UART_SendByte
	
_UART_SendByte:	
	opt	stack 6
; Regs used in _UART_SendByte: [wreg]
	movwf	(UART_SendByte@value)
	line	5
	
l3589:	
	movf	(UART_SendByte@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	7
	goto	l933
	
l934:	
	
l933:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l933
u2480:
	goto	l936
	
l935:	
	line	10
	
l936:	
	return
	opt stack 0
GLOBAL	__end_of_UART_SendByte
	__end_of_UART_SendByte:
;; =============== function _UART_SendByte ends ============

	signat	_UART_SendByte,4218
psect	text359,local,class=CODE,delta=2
global __ptext359
__ptext359:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
