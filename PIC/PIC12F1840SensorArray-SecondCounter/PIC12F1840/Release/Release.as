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
	FNCALL	_main,_LCD_init
	FNCALL	_main,_ADC_init
	FNCALL	_main,_UART_init
	FNCALL	_main,_INT0_init
	FNCALL	_main,_TIMER1_init
	FNCALL	_main,_lcd_write
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_lcd_write_number
	FNCALL	_main,_display_number
	FNCALL	_lcd_write_number,_itoa
	FNCALL	_lcd_write_number,_lcd_write
	FNCALL	_LCD_init,_shift_reg_set_pin_lcd
	FNCALL	_LCD_init,_lcd_info
	FNCALL	_LCD_init,_lcd_clear
	FNCALL	_lcd_write,_lcd_yaz
	FNCALL	_lcd_clear,_lcd_info
	FNCALL	_lcd_clear,_lcd_goto
	FNCALL	_lcd_yaz,_lcd_info
	FNCALL	_lcd_yaz,_lcd_goto
	FNCALL	_display_number,___awdiv
	FNCALL	_display_number,_set_segment_shift
	FNCALL	_display_number,___awmod
	FNCALL	_lcd_goto,_lcd_info
	FNCALL	_set_segment_shift,_shift_reg_set_pin
	FNCALL	_lcd_info,_shift_reg_set_pin_lcd
	FNCALL	_itoa,_utoa
	FNCALL	_shift_reg_set_pin_lcd,_load_shift_data_lcd
	FNCALL	_shift_reg_set_pin,_load_shift_data
	FNCALL	_utoa,___lwdiv
	FNCALL	_utoa,___lwmod
	FNROOT	_main
	FNCALL	_FNC,_UART_byte_receive
	FNCALL	_FNC,_UART_byte_send
	FNCALL	_FNC,_EEPROM_WriteByte
	FNCALL	_FNC,_EEPROM_ReadByte
	FNCALL	_FNC,i1___awmod
	FNCALL	_FNC,i1_display_number
	FNCALL	_FNC,_display_message
	FNCALL	_display_message,_EEPROM_ReadByte
	FNCALL	_display_message,i1_lcd_yaz
	FNCALL	i1_lcd_yaz,i1_lcd_info
	FNCALL	i1_lcd_yaz,i1_lcd_goto
	FNCALL	i1_display_number,i1___awdiv
	FNCALL	i1_display_number,i1_set_segment_shift
	FNCALL	i1_display_number,i1___awmod
	FNCALL	i1_lcd_goto,i1_lcd_info
	FNCALL	i1_set_segment_shift,i1_shift_reg_set_pin
	FNCALL	i1_lcd_info,i1_shift_reg_set_pin_lcd
	FNCALL	i1_shift_reg_set_pin_lcd,i1_load_shift_data_lcd
	FNCALL	i1_shift_reg_set_pin,i1_load_shift_data
	FNCALL	intlevel1,_FNC
	global	intlevel1
	FNROOT	intlevel1
	global	__x
	global	__y
	global	_count_status
	global	_what_to_display
	global	_sensor_scalar
	global	_rakamlar
	global	_sensor_min_max
	global	_danger_sensor
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"../OneWireLCD.h"
	line	101

;initializer for __x
	retlw	01h

;initializer for __y
	retlw	01h
	file	"../INTERRUPT.h"
	line	4

;initializer for _count_status
	retlw	08h
	file	"../7Segments.h"
	line	29

;initializer for _what_to_display
	retlw	05h
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"../PIC12f1840CandAssembly.c"
	line	35

;initializer for _sensor_scalar
	retlw	0x0
	retlw	0xfa
	retlw	0x3e

	retlw	0x0
	retlw	0xfa
	retlw	0x3e

	retlw	0x0
	retlw	0xfa
	retlw	0x3e

	retlw	0x0
	retlw	0xfa
	retlw	0x3e

	file	"../7Segments.h"
	line	9

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
	file	"../PIC12f1840CandAssembly.c"
	line	34

;initializer for _sensor_min_max
	retlw	0
	retlw	03Ch
	retlw	0
	retlw	03Ch
	retlw	0
	retlw	03Ch
	retlw	0
	retlw	03Ch
	line	37

;initializer for _danger_sensor
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	global	_dht11_data
	global	_val
	global	_voltage
	global	_CURRENT_MESSAGE
	global	_SHOWN_BYTES
	global	__temp_
	global	_count
	global	_current_value
	global	_current_value_lcd
	global	_deneme
	global	_high_time_count
	global	_low_time_count
	global	_message_len
	global	_message_type
	global	_nem
	global	_oku1
	global	_oku2
	global	_pin_mem
	global	_received_byte
	global	_second_count
	global	_sicaklik
	global	_timer_closed
	global	_timer_count
	global	_kommand
	global	_sensor_measurements
	global	_number_array
	global	_TMR1
_TMR1	set	22
	global	_PORTA
_PORTA	set	12
	global	_TMR1H
_TMR1H	set	23
	global	_TMR1L
_TMR1L	set	22
	global	_ADIF
_ADIF	set	142
	global	_CARRY
_CARRY	set	24
	global	_EEIF
_EEIF	set	148
	global	_GIE
_GIE	set	95
	global	_IOCIE
_IOCIE	set	91
	global	_IOCIF
_IOCIF	set	88
	global	_PEIE
_PEIE	set	94
	global	_RA2
_RA2	set	98
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
	global	_ADRESH
_ADRESH	set	156
	global	_ADRESL
_ADRESL	set	155
	global	_ADCS0
_ADCS0	set	1268
	global	_ADCS1
_ADCS1	set	1269
	global	_ADCS2
_ADCS2	set	1270
	global	_ADFM
_ADFM	set	1271
	global	_ADGO
_ADGO	set	1257
	global	_ADON
_ADON	set	1256
	global	_CHS0
_CHS0	set	1258
	global	_CHS1
_CHS1	set	1259
	global	_CHS2
_CHS2	set	1260
	global	_CHS3
_CHS3	set	1261
	global	_CHS4
_CHS4	set	1262
	global	_IRCF0
_IRCF0	set	1227
	global	_IRCF1
_IRCF1	set	1228
	global	_IRCF2
_IRCF2	set	1229
	global	_IRCF3
_IRCF3	set	1230
	global	_RCIE
_RCIE	set	1165
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
	global	_TSEN
_TSEN	set	2237
	global	_TSRNG
_TSRNG	set	2236
	global	_EEADR
_EEADR	set	401
	global	_ANSELA
_ANSELA	set	396
	global	_EEADRL
_EEADRL	set	401
	global	_EECON1
_EECON1	set	405
	global	_EECON2
_EECON2	set	406
	global	_EEDATA
_EEDATA	set	403
	global	_EEDATL
_EEDATL	set	403
	global	_RCREG
_RCREG	set	409
	global	_SPBRG
_SPBRG	set	411
	global	_TXREG
_TXREG	set	410
	global	_ANSA0
_ANSA0	set	3168
	global	_ANSA1
_ANSA1	set	3169
	global	_ANSA4
_ANSA4	set	3172
	global	_BRG16
_BRG16	set	3323
	global	_BRGH
_BRGH	set	3314
	global	_CFGS
_CFGS	set	3246
	global	_CREN
_CREN	set	3308
	global	_EEPGD
_EEPGD	set	3247
	global	_RD
_RD	set	3240
	global	_SPEN
_SPEN	set	3311
	global	_SYNC
_SYNC	set	3316
	global	_TXEN
_TXEN	set	3317
	global	_WR
_WR	set	3241
	global	_WREN
_WREN	set	3242
	global	_IOCAN
_IOCAN	set	914
	global	_IOCAP
_IOCAP	set	913
	global	_IOCAP3
_IOCAP3	set	7307
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
	global    __stringtab
__stringtab:
	retlw	0
psect	strings
	
STR_1:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	97	;'a'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	114	;'r'
	retlw	121	;'y'
	retlw	0
psect	strings
	
STR_2:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
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
_dht11_data:
       ds      5

_val:
       ds      2

_voltage:
       ds      2

_CURRENT_MESSAGE:
       ds      1

_SHOWN_BYTES:
       ds      1

__temp_:
       ds      1

_count:
       ds      1

_current_value:
       ds      1

_current_value_lcd:
       ds      1

_deneme:
       ds      1

_high_time_count:
       ds      1

_low_time_count:
       ds      1

_message_len:
       ds      1

_message_type:
       ds      1

_nem:
       ds      1

_oku1:
       ds      1

_oku2:
       ds      1

_pin_mem:
       ds      1

_received_byte:
       ds      1

_second_count:
       ds      1

_sicaklik:
       ds      1

_timer_closed:
       ds      1

_timer_count:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"../OneWireLCD.h"
	line	101
__x:
       ds      1

psect	dataBANK0
	file	"../OneWireLCD.h"
__y:
       ds      1

psect	dataBANK0
	file	"../INTERRUPT.h"
	line	4
_count_status:
       ds      1

psect	dataBANK0
	file	"../7Segments.h"
	line	29
_what_to_display:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_sensor_measurements:
       ds      8

_number_array:
       ds      5

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"../PIC12f1840CandAssembly.c"
	line	35
_sensor_scalar:
       ds      12

psect	dataBANK1
	file	"../7Segments.h"
	line	9
_rakamlar:
       ds      10

psect	dataBANK1
	file	"../PIC12f1840CandAssembly.c"
	line	34
_sensor_min_max:
       ds      8

psect	dataBANK1
	file	"../PIC12f1840CandAssembly.c"
	line	37
_danger_sensor:
       ds      4

psect	bssBANK2,class=BANK2,space=1
global __pbssBANK2
__pbssBANK2:
_kommand:
       ds      60

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR0 containing the base address, and
;	WREG with the size to clear
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf0		;clear RAM location pointed to by FSR
	addfsr	0,1
	decfsz wreg		;Have we reached the end of clearing yet?
	goto clrloop	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	movlw	low(__pbssBANK0)
	movwf	fsr0l
	movlw	high(__pbssBANK0)
	movwf	fsr0h
	movlw	01Dh
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	global __pbssBANK1
	movlw	low(__pbssBANK1)
	movwf	fsr0l
	movlw	high(__pbssBANK1)
	movwf	fsr0h
	movlw	0Dh
	fcall	clear_ram
; Clear objects allocated to BANK2
psect cinit,class=CODE,delta=2
	global __pbssBANK2
	movlw	low(__pbssBANK2)
	movwf	fsr0l
	movlw	high(__pbssBANK2)
	movwf	fsr0h
	movlw	03Ch
	fcall	clear_ram
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
	movlw 04h
	fcall init_ram
; Initialize objects allocated to BANK1
	global __pidataBANK1,__pdataBANK1
psect cinit,class=CODE,delta=2
	movlw low(__pidataBANK1)
	movwf fsr0l
	movlw high(__pidataBANK1)|80h
	movwf fsr0h
	movlw low(__pdataBANK1)
	movwf fsr1l
	movlw high(__pdataBANK1)
	movwf fsr1h
	movlw 022h
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	?_lcd_write_number
?_lcd_write_number:	; 0 bytes @ 0x0
	global	lcd_write_number@number
lcd_write_number@number:	; 2 bytes @ 0x0
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	3
	global	main@rakam
main@rakam:	; 2 bytes @ 0x5
	ds	2
	global	main@j
main@j:	; 2 bytes @ 0x7
	ds	2
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_EEPROM_ReadByte
??_EEPROM_ReadByte:	; 0 bytes @ 0x0
	global	?_lcd_yaz
?_lcd_yaz:	; 0 bytes @ 0x0
	global	?_load_shift_data
?_load_shift_data:	; 0 bytes @ 0x0
	global	?_load_shift_data_lcd
?_load_shift_data_lcd:	; 0 bytes @ 0x0
	global	?_display_message
?_display_message:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_LCD_init
?_LCD_init:	; 0 bytes @ 0x0
	global	?_display_number
?_display_number:	; 0 bytes @ 0x0
	global	?_ADC_init
?_ADC_init:	; 0 bytes @ 0x0
	global	?_UART_byte_send
?_UART_byte_send:	; 0 bytes @ 0x0
	global	??_UART_byte_send
??_UART_byte_send:	; 0 bytes @ 0x0
	global	??_UART_byte_receive
??_UART_byte_receive:	; 0 bytes @ 0x0
	global	?_UART_init
?_UART_init:	; 0 bytes @ 0x0
	global	?_EEPROM_WriteByte
?_EEPROM_WriteByte:	; 0 bytes @ 0x0
	global	?_FNC
?_FNC:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?i1_load_shift_data
?i1_load_shift_data:	; 0 bytes @ 0x0
	global	??i1_load_shift_data
??i1_load_shift_data:	; 0 bytes @ 0x0
	global	?i1_load_shift_data_lcd
?i1_load_shift_data_lcd:	; 0 bytes @ 0x0
	global	??i1_load_shift_data_lcd
??i1_load_shift_data_lcd:	; 0 bytes @ 0x0
	global	?i1_lcd_yaz
?i1_lcd_yaz:	; 0 bytes @ 0x0
	global	?i1_display_number
?i1_display_number:	; 0 bytes @ 0x0
	global	?_EEPROM_ReadByte
?_EEPROM_ReadByte:	; 1 bytes @ 0x0
	global	?_UART_byte_receive
?_UART_byte_receive:	; 1 bytes @ 0x0
	global	?_INT0_init
?_INT0_init:	; 2 bytes @ 0x0
	global	?_TIMER1_init
?_TIMER1_init:	; 2 bytes @ 0x0
	global	?i1___awdiv
?i1___awdiv:	; 2 bytes @ 0x0
	global	?i1___awmod
?i1___awmod:	; 2 bytes @ 0x0
	global	UART_byte_send@data
UART_byte_send@data:	; 1 bytes @ 0x0
	global	EEPROM_WriteByte@value
EEPROM_WriteByte@value:	; 1 bytes @ 0x0
	global	EEPROM_ReadByte@address
EEPROM_ReadByte@address:	; 1 bytes @ 0x0
	global	i1___awdiv@divisor
i1___awdiv@divisor:	; 2 bytes @ 0x0
	global	i1___awmod@divisor
i1___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_EEPROM_WriteByte
??_EEPROM_WriteByte:	; 0 bytes @ 0x1
	global	EEPROM_WriteByte@address
EEPROM_WriteByte@address:	; 1 bytes @ 0x1
	global	i1load_shift_data@data
i1load_shift_data@data:	; 1 bytes @ 0x1
	global	i1load_shift_data_lcd@data
i1load_shift_data_lcd@data:	; 1 bytes @ 0x1
	ds	1
	global	i1load_shift_data@a
i1load_shift_data@a:	; 1 bytes @ 0x2
	global	i1load_shift_data_lcd@a
i1load_shift_data_lcd@a:	; 1 bytes @ 0x2
	global	i1___awdiv@dividend
i1___awdiv@dividend:	; 2 bytes @ 0x2
	global	i1___awmod@dividend
i1___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	?i1_shift_reg_set_pin
?i1_shift_reg_set_pin:	; 0 bytes @ 0x3
	global	?i1_shift_reg_set_pin_lcd
?i1_shift_reg_set_pin_lcd:	; 0 bytes @ 0x3
	global	i1shift_reg_set_pin@value
i1shift_reg_set_pin@value:	; 1 bytes @ 0x3
	global	i1shift_reg_set_pin_lcd@value
i1shift_reg_set_pin_lcd@value:	; 1 bytes @ 0x3
	ds	1
	global	??i1_shift_reg_set_pin
??i1_shift_reg_set_pin:	; 0 bytes @ 0x4
	global	??i1_shift_reg_set_pin_lcd
??i1_shift_reg_set_pin_lcd:	; 0 bytes @ 0x4
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
	global	i1shift_reg_set_pin@pin_number
i1shift_reg_set_pin@pin_number:	; 1 bytes @ 0x6
	global	i1shift_reg_set_pin_lcd@pin_number
i1shift_reg_set_pin_lcd@pin_number:	; 1 bytes @ 0x6
	global	i1___awdiv@sign
i1___awdiv@sign:	; 1 bytes @ 0x6
	global	i1___awmod@sign
i1___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	?i1_lcd_info
?i1_lcd_info:	; 0 bytes @ 0x7
	global	?i1_set_segment_shift
?i1_set_segment_shift:	; 0 bytes @ 0x7
	global	i1lcd_info@data_type
i1lcd_info@data_type:	; 1 bytes @ 0x7
	global	i1set_segment_shift@data
i1set_segment_shift@data:	; 1 bytes @ 0x7
	global	i1___awdiv@quotient
i1___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	??i1_lcd_info
??i1_lcd_info:	; 0 bytes @ 0x8
	global	??i1_set_segment_shift
??i1_set_segment_shift:	; 0 bytes @ 0x8
	ds	2
	global	i1lcd_info@c
i1lcd_info@c:	; 1 bytes @ 0xA
	global	i1set_segment_shift@segment_no
i1set_segment_shift@segment_no:	; 1 bytes @ 0xA
	ds	1
	global	?i1_lcd_goto
?i1_lcd_goto:	; 0 bytes @ 0xB
	global	i1lcd_goto@p_2
i1lcd_goto@p_2:	; 1 bytes @ 0xB
	global	i1set_segment_shift@a
i1set_segment_shift@a:	; 1 bytes @ 0xB
	ds	1
	global	??i1_lcd_goto
??i1_lcd_goto:	; 0 bytes @ 0xC
	global	i1display_number@number
i1display_number@number:	; 1 bytes @ 0xC
	ds	1
	global	i1display_number@digit
i1display_number@digit:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??i1_display_number
??i1_display_number:	; 0 bytes @ 0x0
	global	i1lcd_goto@p_1
i1lcd_goto@p_1:	; 1 bytes @ 0x0
	ds	1
	global	??i1_lcd_yaz
??i1_lcd_yaz:	; 0 bytes @ 0x1
	ds	1
	global	i1lcd_yaz@data
i1lcd_yaz@data:	; 1 bytes @ 0x2
	ds	1
	global	??_display_message
??_display_message:	; 0 bytes @ 0x3
	ds	1
	global	display_message@message_len
display_message@message_len:	; 1 bytes @ 0x4
	ds	1
	global	display_message@a
display_message@a:	; 2 bytes @ 0x5
	ds	2
	global	??_FNC
??_FNC:	; 0 bytes @ 0x7
	ds	3
	global	FNC@a
FNC@a:	; 1 bytes @ 0xA
	ds	1
	global	??_load_shift_data
??_load_shift_data:	; 0 bytes @ 0xB
	global	??_load_shift_data_lcd
??_load_shift_data_lcd:	; 0 bytes @ 0xB
	global	??_ADC_init
??_ADC_init:	; 0 bytes @ 0xB
	global	??_UART_init
??_UART_init:	; 0 bytes @ 0xB
	global	??_INT0_init
??_INT0_init:	; 0 bytes @ 0xB
	global	??_TIMER1_init
??_TIMER1_init:	; 0 bytes @ 0xB
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0xB
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0xB
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0xB
	global	?___awmod
?___awmod:	; 2 bytes @ 0xB
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0xB
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0xB
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0xB
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0xB
	ds	1
	global	load_shift_data@data
load_shift_data@data:	; 1 bytes @ 0xC
	global	load_shift_data_lcd@data
load_shift_data_lcd@data:	; 1 bytes @ 0xC
	ds	1
	global	load_shift_data@a
load_shift_data@a:	; 1 bytes @ 0xD
	global	load_shift_data_lcd@a
load_shift_data_lcd@a:	; 1 bytes @ 0xD
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0xD
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xD
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0xD
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0xD
	ds	1
	global	?_shift_reg_set_pin
?_shift_reg_set_pin:	; 0 bytes @ 0xE
	global	?_shift_reg_set_pin_lcd
?_shift_reg_set_pin_lcd:	; 0 bytes @ 0xE
	global	shift_reg_set_pin@value
shift_reg_set_pin@value:	; 1 bytes @ 0xE
	global	shift_reg_set_pin_lcd@value
shift_reg_set_pin_lcd@value:	; 1 bytes @ 0xE
	ds	1
	global	??_shift_reg_set_pin
??_shift_reg_set_pin:	; 0 bytes @ 0xF
	global	??_shift_reg_set_pin_lcd
??_shift_reg_set_pin_lcd:	; 0 bytes @ 0xF
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xF
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xF
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0xF
	global	??___awmod
??___awmod:	; 0 bytes @ 0xF
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x10
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x10
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x10
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x10
	ds	1
	global	shift_reg_set_pin@pin_number
shift_reg_set_pin@pin_number:	; 1 bytes @ 0x11
	global	shift_reg_set_pin_lcd@pin_number
shift_reg_set_pin_lcd@pin_number:	; 1 bytes @ 0x11
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x11
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x11
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x11
	ds	1
	global	?_lcd_info
?_lcd_info:	; 0 bytes @ 0x12
	global	?_set_segment_shift
?_set_segment_shift:	; 0 bytes @ 0x12
	global	lcd_info@data_type
lcd_info@data_type:	; 1 bytes @ 0x12
	global	set_segment_shift@data
set_segment_shift@data:	; 1 bytes @ 0x12
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x12
	ds	1
	global	??_lcd_info
??_lcd_info:	; 0 bytes @ 0x13
	global	??_set_segment_shift
??_set_segment_shift:	; 0 bytes @ 0x13
	global	?_utoa
?_utoa:	; 1 bytes @ 0x13
	global	utoa@val
utoa@val:	; 2 bytes @ 0x13
	ds	2
	global	lcd_info@c
lcd_info@c:	; 1 bytes @ 0x15
	global	set_segment_shift@segment_no
set_segment_shift@segment_no:	; 1 bytes @ 0x15
	global	utoa@base
utoa@base:	; 2 bytes @ 0x15
	ds	1
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x16
	global	lcd_goto@p_2
lcd_goto@p_2:	; 1 bytes @ 0x16
	global	set_segment_shift@a
set_segment_shift@a:	; 1 bytes @ 0x16
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x17
	global	??_utoa
??_utoa:	; 0 bytes @ 0x17
	global	??_display_number
??_display_number:	; 0 bytes @ 0x17
	ds	1
	global	utoa@v
utoa@v:	; 2 bytes @ 0x18
	ds	1
	global	lcd_goto@p_1
lcd_goto@p_1:	; 1 bytes @ 0x19
	ds	1
	global	??_lcd_yaz
??_lcd_yaz:	; 0 bytes @ 0x1A
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x1A
	global	display_number@number
display_number@number:	; 1 bytes @ 0x1A
	global	utoa@c
utoa@c:	; 1 bytes @ 0x1A
	ds	1
	global	lcd_yaz@data
lcd_yaz@data:	; 1 bytes @ 0x1B
	global	display_number@digit
display_number@digit:	; 1 bytes @ 0x1B
	global	utoa@buf
utoa@buf:	; 1 bytes @ 0x1B
	ds	1
	global	?_lcd_write
?_lcd_write:	; 0 bytes @ 0x1C
	global	??_LCD_init
??_LCD_init:	; 0 bytes @ 0x1C
	global	?_itoa
?_itoa:	; 1 bytes @ 0x1C
	global	lcd_write@s
lcd_write@s:	; 2 bytes @ 0x1C
	global	itoa@val
itoa@val:	; 2 bytes @ 0x1C
	ds	2
	global	??_lcd_write
??_lcd_write:	; 0 bytes @ 0x1E
	global	itoa@base
itoa@base:	; 2 bytes @ 0x1E
	ds	2
	global	??_itoa
??_itoa:	; 0 bytes @ 0x20
	ds	1
	global	itoa@cp
itoa@cp:	; 1 bytes @ 0x21
	ds	1
	global	itoa@buf
itoa@buf:	; 1 bytes @ 0x22
	ds	1
	global	??_lcd_write_number
??_lcd_write_number:	; 0 bytes @ 0x23
;;Data sizes: Strings 20, constant 0, data 38, bss 102, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     35      68
;; BANK1           80      9      56
;; BANK2           80      0      60

;;
;; Pointer list with targets:

;; ?i1___awdiv	int  size(1) Largest target is 0
;;
;; ?i1___awmod	int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?_utoa	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?_itoa	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; utoa@buf	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; sp__utoa	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; itoa@buf	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; itoa@cp	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; sp__itoa	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; lcd_write@s	PTR const unsigned char  size(2) Largest target is 14
;;		 -> STR_2(CODE[6]), STR_1(CODE[14]), number_array(BANK1[5]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _FNC in COMMON
;;
;;   _FNC->i1_display_number
;;   i1_lcd_yaz->i1_lcd_goto
;;   i1_display_number->i1_set_segment_shift
;;   i1_lcd_goto->i1_lcd_info
;;   i1_set_segment_shift->i1_shift_reg_set_pin
;;   i1_lcd_info->i1_shift_reg_set_pin_lcd
;;   i1_shift_reg_set_pin_lcd->i1_load_shift_data_lcd
;;   i1_shift_reg_set_pin->i1_load_shift_data
;;
;; Critical Paths under _main in BANK0
;;
;;   _lcd_write_number->_itoa
;;   _LCD_init->_lcd_clear
;;   _lcd_write->_lcd_yaz
;;   _lcd_clear->_lcd_goto
;;   _lcd_yaz->_lcd_goto
;;   _display_number->_set_segment_shift
;;   _lcd_goto->_lcd_info
;;   _set_segment_shift->_shift_reg_set_pin
;;   _lcd_info->_shift_reg_set_pin_lcd
;;   _itoa->_utoa
;;   _shift_reg_set_pin_lcd->_load_shift_data_lcd
;;   _shift_reg_set_pin->_load_shift_data
;;   _utoa->___lwdiv
;;
;; Critical Paths under _FNC in BANK0
;;
;;   _FNC->_display_message
;;   _display_message->i1_lcd_yaz
;;   i1_lcd_yaz->i1_lcd_goto
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_lcd_write_number
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
;; (0) _main                                                 7     7      0    7598
;;                                              2 BANK1      7     7      0
;;                           _LCD_init
;;                           _ADC_init
;;                          _UART_init
;;                          _INT0_init
;;                        _TIMER1_init
;;                          _lcd_write
;;                          _lcd_clear
;;                           _lcd_goto
;;                   _lcd_write_number
;;                     _display_number
;; ---------------------------------------------------------------------------------
;; (1) _lcd_write_number                                     2     0      2    2131
;;                                              0 BANK1      2     0      2
;;                               _itoa
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _LCD_init                                             2     2      0    1474
;;                                             28 BANK0      2     2      0
;;              _shift_reg_set_pin_lcd
;;                           _lcd_info
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (2) _lcd_write                                            4     2      2     957
;;                                             28 BANK0      4     2      2
;;                            _lcd_yaz
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clear                                            2     2      0     861
;;                                             26 BANK0      2     2      0
;;                           _lcd_info
;;                           _lcd_goto
;; ---------------------------------------------------------------------------------
;; (3) _lcd_yaz                                              2     2      0     892
;;                                             26 BANK0      2     2      0
;;                           _lcd_info
;;                           _lcd_goto
;; ---------------------------------------------------------------------------------
;; (1) _display_number                                       5     5      0    1469
;;                                             23 BANK0      5     5      0
;;                            ___awdiv
;;                  _set_segment_shift
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (4) _lcd_goto                                             4     3      1     508
;;                                             22 BANK0      4     3      1
;;                           _lcd_info
;; ---------------------------------------------------------------------------------
;; (2) _set_segment_shift                                    5     4      1     455
;;                                             18 BANK0      5     4      1
;;                  _shift_reg_set_pin
;; ---------------------------------------------------------------------------------
;; (5) _lcd_info                                             4     3      1     353
;;                                             18 BANK0      4     3      1
;;              _shift_reg_set_pin_lcd
;; ---------------------------------------------------------------------------------
;; (2) _itoa                                                 7     3      4    1143
;;                                             28 BANK0      7     3      4
;;                               _utoa
;; ---------------------------------------------------------------------------------
;; (6) _shift_reg_set_pin_lcd                                4     3      1     260
;;                                             14 BANK0      4     3      1
;;                _load_shift_data_lcd
;; ---------------------------------------------------------------------------------
;; (3) _shift_reg_set_pin                                    4     3      1     263
;;                                             14 BANK0      4     3      1
;;                    _load_shift_data
;; ---------------------------------------------------------------------------------
;; (3) _utoa                                                 9     5      4     910
;;                                             19 BANK0      9     5      4
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (1) _ADC_init                                             2     2      0       0
;;                                             11 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (7) _load_shift_data_lcd                                  3     3      0     130
;;                                             11 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _load_shift_data                                      3     3      0     130
;;                                             11 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     433
;;                                             11 BANK0      7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     445
;;                                             11 BANK0      9     5      4
;; ---------------------------------------------------------------------------------
;; (4) ___lwmod                                              6     2      4     232
;;                                             11 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (4) ___lwdiv                                              8     4      4     241
;;                                             11 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _TIMER1_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _INT0_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _UART_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (8) _FNC                                                  4     4      0    6536
;;                                              7 BANK0      4     4      0
;;                  _UART_byte_receive
;;                     _UART_byte_send
;;                   _EEPROM_WriteByte
;;                    _EEPROM_ReadByte
;;                          i1___awmod
;;                   i1_display_number
;;                    _display_message
;; ---------------------------------------------------------------------------------
;; (9) _display_message                                      4     4      0    2151
;;                                              3 BANK0      4     4      0
;;                    _EEPROM_ReadByte
;;                          i1_lcd_yaz
;; ---------------------------------------------------------------------------------
;; (10) i1_lcd_yaz                                           2     2      0    2060
;;                                              1 BANK0      2     2      0
;;                         i1_lcd_info
;;                         i1_lcd_goto
;; ---------------------------------------------------------------------------------
;; (9) i1_display_number                                     5     5      0    3282
;;                                             12 COMMON     2     2      0
;;                                              0 BANK0      3     3      0
;;                          i1___awdiv
;;                i1_set_segment_shift
;;                          i1___awmod
;; ---------------------------------------------------------------------------------
;; (11) i1_lcd_goto                                          4     3      1    1176
;;                                             11 COMMON     3     2      1
;;                                              0 BANK0      1     1      0
;;                         i1_lcd_info
;; ---------------------------------------------------------------------------------
;; (10) i1_set_segment_shift                                 5     4      1    1036
;;                                              7 COMMON     5     4      1
;;                i1_shift_reg_set_pin
;; ---------------------------------------------------------------------------------
;; (12) i1_lcd_info                                          4     3      1     811
;;                                              7 COMMON     4     3      1
;;            i1_shift_reg_set_pin_lcd
;; ---------------------------------------------------------------------------------
;; (13) i1_shift_reg_set_pin_lcd                             4     3      1     592
;;                                              3 COMMON     4     3      1
;;              i1_load_shift_data_lcd
;; ---------------------------------------------------------------------------------
;; (11) i1_shift_reg_set_pin                                 4     3      1     594
;;                                              3 COMMON     4     3      1
;;                  i1_load_shift_data
;; ---------------------------------------------------------------------------------
;; (14) i1_load_shift_data_lcd                               3     3      0     296
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (12) i1_load_shift_data                                   3     3      0     296
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (10) i1___awmod                                           7     3      4     969
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (10) i1___awdiv                                           9     5      4     977
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (9) _EEPROM_WriteByte                                     2     1      1      44
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (9) _UART_byte_receive                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (9) _UART_byte_send                                       1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (10) _EEPROM_ReadByte                                     1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 14
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _LCD_init
;;     _shift_reg_set_pin_lcd
;;       _load_shift_data_lcd
;;     _lcd_info
;;       _shift_reg_set_pin_lcd
;;         _load_shift_data_lcd
;;     _lcd_clear
;;       _lcd_info
;;         _shift_reg_set_pin_lcd
;;           _load_shift_data_lcd
;;       _lcd_goto
;;         _lcd_info
;;           _shift_reg_set_pin_lcd
;;             _load_shift_data_lcd
;;   _ADC_init
;;   _UART_init
;;   _INT0_init
;;   _TIMER1_init
;;   _lcd_write
;;     _lcd_yaz
;;       _lcd_info
;;         _shift_reg_set_pin_lcd
;;           _load_shift_data_lcd
;;       _lcd_goto
;;         _lcd_info
;;           _shift_reg_set_pin_lcd
;;             _load_shift_data_lcd
;;   _lcd_clear
;;     _lcd_info
;;       _shift_reg_set_pin_lcd
;;         _load_shift_data_lcd
;;     _lcd_goto
;;       _lcd_info
;;         _shift_reg_set_pin_lcd
;;           _load_shift_data_lcd
;;   _lcd_goto
;;     _lcd_info
;;       _shift_reg_set_pin_lcd
;;         _load_shift_data_lcd
;;   _lcd_write_number
;;     _itoa
;;       _utoa
;;         ___lwdiv
;;         ___lwmod
;;     _lcd_write
;;       _lcd_yaz
;;         _lcd_info
;;           _shift_reg_set_pin_lcd
;;             _load_shift_data_lcd
;;         _lcd_goto
;;           _lcd_info
;;             _shift_reg_set_pin_lcd
;;               _load_shift_data_lcd
;;   _display_number
;;     ___awdiv
;;     _set_segment_shift
;;       _shift_reg_set_pin
;;         _load_shift_data
;;     ___awmod
;;
;; _FNC (ROOT)
;;   _UART_byte_receive
;;   _UART_byte_send
;;   _EEPROM_WriteByte
;;   _EEPROM_ReadByte
;;   i1___awmod
;;   i1_display_number
;;     i1___awdiv
;;     i1_set_segment_shift
;;       i1_shift_reg_set_pin
;;         i1_load_shift_data
;;     i1___awmod
;;   _display_message
;;     _EEPROM_ReadByte
;;     i1_lcd_yaz
;;       i1_lcd_info
;;         i1_shift_reg_set_pin_lcd
;;           i1_load_shift_data_lcd
;;       i1_lcd_goto
;;         i1_lcd_info
;;           i1_shift_reg_set_pin_lcd
;;             i1_load_shift_data_lcd
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
;;STACK                0      0      15       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      C6       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50     23      44       6       85.0%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50      9      38       8       70.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITBANK2            50      0       0       9        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BANK2               50      0      3C      10       75.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;DATA                 0      0      DB      11        0.0%
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
;;		line 42 in file "../PIC12f1840CandAssembly.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2    7[BANK1 ] int 
;;  rakam           2    5[BANK1 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       4       0
;;      Temps:          0       0       3       0
;;      Totals:         0       0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels required when called:   14
;; This function calls:
;;		_LCD_init
;;		_ADC_init
;;		_UART_init
;;		_INT0_init
;;		_TIMER1_init
;;		_lcd_write
;;		_lcd_clear
;;		_lcd_goto
;;		_lcd_write_number
;;		_display_number
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC12f1840CandAssembly.c"
	line	42
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [allreg]
	line	44
	
l6356:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	45
	
l6358:	
	movlb 1	; select bank1
	bcf	(1231/8)^080h,(1231)&7
	line	47
	
l6360:	
	bsf	(1230/8)^080h,(1230)&7
	line	48
	
l6362:	
	bsf	(1229/8)^080h,(1229)&7
	line	49
	
l6364:	
	bsf	(1228/8)^080h,(1228)&7
	line	50
	
l6366:	
	bsf	(1227/8)^080h,(1227)&7
	line	52
	
l6368:	
	bsf	(1225/8)^080h,(1225)&7
	line	53
	
l6370:	
	bcf	(1224/8)^080h,(1224)&7
	line	54
	
l6372:	
	bcf	(1120/8)^080h,(1120)&7
	line	55
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	59
	
l6374:	
	movlb 1	; select bank1
	bsf	(1123/8)^080h,(1123)&7
	line	60
	
l6376:	
	bsf	(1124/8)^080h,(1124)&7
	line	62
	
l6378:	
	bcf	(1120/8)^080h,(1120)&7
	line	63
	
l6380:	
	bsf	(1121/8)^080h,(1121)&7
	line	64
	
l6382:	
	bcf	(1122/8)^080h,(1122)&7
	line	65
	
l6384:	
	bcf	(1125/8)^080h,(1125)&7
	line	67
	
l6386:	
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	68
	
l6388:	
	bsf	(101/8),(101)&7
	line	70
	movlb 1	; select bank1
	clrf	(main@j)^080h
	clrf	(main@j+1)^080h
	
l6390:	
	movf	(main@j+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u6225
	movlw	low(03Ch)
	subwf	(main@j)^080h,w
u6225:

	skipc
	goto	u6221
	goto	u6220
u6221:
	goto	l6394
u6220:
	goto	l6400
	
l6392:	
	goto	l6400
	line	71
	
l1348:	
	line	72
	
l6394:	
	movlb 1	; select bank1
	movf	(main@j)^080h,w
	movwf	(??_main+0)^080h+0
	movf	(main@j)^080h,w
	addlw	_kommand&0ffh
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	(??_main+0)^080h+0,w
	movwf	indf1
	line	70
	
l6396:	
	movlw	low(01h)
	addwf	(main@j)^080h,f
	movlw	high(01h)
	addwfc	(main@j+1)^080h,f
	
l6398:	
	movf	(main@j+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u6235
	movlw	low(03Ch)
	subwf	(main@j)^080h,w
u6235:

	skipc
	goto	u6231
	goto	u6230
u6231:
	goto	l6394
u6230:
	goto	l6400
	
l1349:	
	line	78
	
l6400:	
	opt asmopt_off
movlw  3
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	8
movwf	((??_main+0)^080h+0+1),f
	movlw	120
movwf	((??_main+0)^080h+0),f
u6247:
	decfsz	((??_main+0)^080h+0),f
	goto	u6247
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6247
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6247
opt asmopt_on

	line	79
	
l6402:	
	fcall	_LCD_init
	line	80
	
l6404:	
	fcall	_ADC_init
	line	81
	
l6406:	
	fcall	_UART_init
	line	82
	fcall	_INT0_init
	line	83
	
l6408:	
	fcall	_TIMER1_init
	line	85
	opt asmopt_off
movlw  3
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	8
movwf	((??_main+0)^080h+0+1),f
	movlw	120
movwf	((??_main+0)^080h+0),f
u6257:
	decfsz	((??_main+0)^080h+0),f
	goto	u6257
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6257
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6257
opt asmopt_on

	line	87
	
l6410:	
	bsf	(94/8),(94)&7
	line	88
	
l6412:	
	bsf	(95/8),(95)&7
	line	90
	
l6414:	
	movlb 1	; select bank1
	clrf	(main@rakam)^080h
	clrf	(main@rakam+1)^080h
	line	92
	
l6416:	
	movlw	low(STR_1|8000h)
	movlb 0	; select bank0
	movwf	(?_lcd_write)
	movlw	high(STR_1|8000h)
	movwf	(?_lcd_write+1)
	fcall	_lcd_write
	line	93
	
l6418:	
	opt asmopt_off
movlw  21
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	75
movwf	((??_main+0)^080h+0+1),f
	movlw	209
movwf	((??_main+0)^080h+0),f
u6267:
	decfsz	((??_main+0)^080h+0),f
	goto	u6267
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6267
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6267
	clrwdt
opt asmopt_on

	line	94
	
l6420:	
	fcall	_lcd_clear
	goto	l6422
	line	95
	
l1350:	
	line	97
	
l6422:	
	movlb 0	; select bank0
	clrf	(?_lcd_goto)
	bsf	status,0
	rlf	(?_lcd_goto),f
	movlw	(01h)
	fcall	_lcd_goto
	line	98
	
l6424:	
	movlw	low(01h)
	movlb 1	; select bank1
	addwf	(main@rakam)^080h,f
	movlw	high(01h)
	addwfc	(main@rakam+1)^080h,f
	line	99
	
l6426:	
	movf	(main@rakam+1)^080h,w
	clrf	(?_lcd_write_number+1)^080h
	addwf	(?_lcd_write_number+1)^080h
	movf	(main@rakam)^080h,w
	clrf	(?_lcd_write_number)^080h
	addwf	(?_lcd_write_number)^080h

	fcall	_lcd_write_number
	line	100
	
l6428:	
	movlb 1	; select bank1
	movf	(main@rakam)^080h,w
	fcall	_display_number
	line	102
	
l6430:	
	opt asmopt_off
movlw  21
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	75
movwf	((??_main+0)^080h+0+1),f
	movlw	209
movwf	((??_main+0)^080h+0),f
u6277:
	decfsz	((??_main+0)^080h+0),f
	goto	u6277
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6277
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6277
	clrwdt
opt asmopt_on

	line	103
	
l6432:	
	movlw	low(STR_2|8000h)
	movlb 0	; select bank0
	movwf	(?_lcd_write)
	movlw	high(STR_2|8000h)
	movwf	(?_lcd_write+1)
	fcall	_lcd_write
	goto	l6422
	line	107
	
l1351:	
	line	95
	goto	l6422
	
l1352:	
	line	223
	
l1353:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_write_number
psect	text1376,local,class=CODE,delta=2
global __ptext1376
__ptext1376:

;; *************** function _lcd_write_number *****************
;; Defined at:
;;		line 235 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  number          2    0[BANK1 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       2       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_itoa
;;		_lcd_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1376
	file	"../OneWireLCD.h"
	line	235
	global	__size_of_lcd_write_number
	__size_of_lcd_write_number	equ	__end_of_lcd_write_number-_lcd_write_number
	
_lcd_write_number:	
	opt	stack 2
; Regs used in _lcd_write_number: [wreg-status,0+pclath+cstack]
	line	236
	
l6352:	
	movlb 1	; select bank1
	movf	(lcd_write_number@number+1)^080h,w
	movlb 0	; select bank0
	clrf	(?_itoa+1)
	addwf	(?_itoa+1)
	movlb 1	; select bank1
	movf	(lcd_write_number@number)^080h,w
	movlb 0	; select bank0
	clrf	(?_itoa)
	addwf	(?_itoa)

	movlw	low(0Ah)
	movwf	0+(?_itoa)+02h
	movlw	high(0Ah)
	movwf	(0+(?_itoa)+02h)+1
	movlw	(_number_array)&0ffh
	fcall	_itoa
	line	237
	
l6354:	
	movlw	(_number_array&0ffh)
	movlb 0	; select bank0
	movwf	(?_lcd_write)
	movlw	0x1/2
	movwf	(?_lcd_write+1)
	fcall	_lcd_write
	line	238
	
l1224:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_number
	__end_of_lcd_write_number:
;; =============== function _lcd_write_number ends ============

	signat	_lcd_write_number,4216
	global	_LCD_init
psect	text1377,local,class=CODE,delta=2
global __ptext1377
__ptext1377:

;; *************** function _LCD_init *****************
;; Defined at:
;;		line 184 in file "../OneWireLCD.h"
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
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		_shift_reg_set_pin_lcd
;;		_lcd_info
;;		_lcd_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1377
	file	"../OneWireLCD.h"
	line	184
	global	__size_of_LCD_init
	__size_of_LCD_init	equ	__end_of_LCD_init-_LCD_init
	
_LCD_init:	
	opt	stack 3
; Regs used in _LCD_init: [wreg+status,2+status,0+pclath+cstack]
	line	185
	
l6334:	
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(01h)
	fcall	_shift_reg_set_pin_lcd
	line	187
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	190
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(02h)
	fcall	_lcd_info
	line	191
	
l6336:	
	opt asmopt_off
movlw	52
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	241
movwf	((??_LCD_init+0)+0),f
u6287:
	decfsz	((??_LCD_init+0)+0),f
	goto	u6287
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u6287
	nop2
opt asmopt_on

	line	192
	
l6338:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(028h)
	fcall	_lcd_info
	line	193
	opt asmopt_off
movlw	52
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	241
movwf	((??_LCD_init+0)+0),f
u6297:
	decfsz	((??_LCD_init+0)+0),f
	goto	u6297
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u6297
	nop2
opt asmopt_on

	line	195
	
l6340:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(06h)
	fcall	_lcd_info
	line	196
	
l6342:	
	opt asmopt_off
movlw	11
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	98
movwf	((??_LCD_init+0)+0),f
u6307:
	decfsz	((??_LCD_init+0)+0),f
	goto	u6307
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u6307
	clrwdt
opt asmopt_on

	line	198
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(0Ch)
	fcall	_lcd_info
	line	199
	
l6344:	
	opt asmopt_off
movlw	11
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	98
movwf	((??_LCD_init+0)+0),f
u6317:
	decfsz	((??_LCD_init+0)+0),f
	goto	u6317
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u6317
	clrwdt
opt asmopt_on

	line	201
	
l6346:	
	fcall	_lcd_clear
	line	202
	opt asmopt_off
movlw	11
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	98
movwf	((??_LCD_init+0)+0),f
u6327:
	decfsz	((??_LCD_init+0)+0),f
	goto	u6327
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u6327
	clrwdt
opt asmopt_on

	line	204
	
l6348:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(080h)
	fcall	_lcd_info
	line	205
	
l6350:	
	opt asmopt_off
movlw	52
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	241
movwf	((??_LCD_init+0)+0),f
u6337:
	decfsz	((??_LCD_init+0)+0),f
	goto	u6337
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u6337
	nop2
opt asmopt_on

	line	207
	
l1216:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_init
	__end_of_LCD_init:
;; =============== function _LCD_init ends ============

	signat	_LCD_init,88
	global	_lcd_write
psect	text1378,local,class=CODE,delta=2
global __ptext1378
__ptext1378:

;; *************** function _lcd_write *****************
;; Defined at:
;;		line 165 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  s               2   28[BANK0 ] PTR const unsigned char 
;;		 -> STR_2(6), STR_1(14), number_array(5), 
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		_lcd_yaz
;; This function is called by:
;;		_lcd_write_number
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1378
	file	"../OneWireLCD.h"
	line	165
	global	__size_of_lcd_write
	__size_of_lcd_write	equ	__end_of_lcd_write-_lcd_write
	
_lcd_write:	
	opt	stack 2
; Regs used in _lcd_write: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	166
	
l6322:	
	opt asmopt_off
movlw	6
	movlb 0	; select bank0
movwf	((??_lcd_write+0)+0+1),f
	movlw	48
movwf	((??_lcd_write+0)+0),f
u6347:
	decfsz	((??_lcd_write+0)+0),f
	goto	u6347
	decfsz	((??_lcd_write+0)+0+1),f
	goto	u6347
	clrwdt
opt asmopt_on

	line	167
	goto	l6330
	
l1206:	
	
l6324:	
	movlb 0	; select bank0
	movf	(lcd_write@s),w
	movwf	fsr0l
	movf	((lcd_write@s+1)),w
	movwf	fsr0h
	movf	indf0,w ;code access
	fcall	_lcd_yaz
	
l6326:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(lcd_write@s),f
	movlw	high(01h)
	addwfc	(lcd_write@s+1),f
	
l6328:	
	opt asmopt_off
movlw	6
movwf	((??_lcd_write+0)+0+1),f
	movlw	48
movwf	((??_lcd_write+0)+0),f
u6357:
	decfsz	((??_lcd_write+0)+0),f
	goto	u6357
	decfsz	((??_lcd_write+0)+0+1),f
	goto	u6357
	clrwdt
opt asmopt_on

	goto	l6330
	
l1205:	
	
l6330:	
	movlb 0	; select bank0
	movf	(lcd_write@s),w
	movwf	fsr0l
	movf	((lcd_write@s+1)),w
	movwf	fsr0h
	movf	indf0,w ;code access
	iorlw	0
	skipz
	goto	u6211
	goto	u6210
u6211:
	goto	l6324
u6210:
	goto	l6332
	
l1207:	
	line	168
	
l6332:	
	opt asmopt_off
movlw	16
movwf	((??_lcd_write+0)+0+1),f
	movlw	148
movwf	((??_lcd_write+0)+0),f
u6367:
	decfsz	((??_lcd_write+0)+0),f
	goto	u6367
	decfsz	((??_lcd_write+0)+0+1),f
	goto	u6367
	clrwdt
opt asmopt_on

	line	169
	
l1208:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write
	__end_of_lcd_write:
;; =============== function _lcd_write ends ============

	signat	_lcd_write,4216
	global	_lcd_clear
psect	text1379,local,class=CODE,delta=2
global __ptext1379
__ptext1379:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 156 in file "../OneWireLCD.h"
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
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   11
;; This function calls:
;;		_lcd_info
;;		_lcd_goto
;; This function is called by:
;;		_LCD_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1379
	file	"../OneWireLCD.h"
	line	156
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 4
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	158
	
l6314:	
	movlb 0	; select bank0
	clrf	(__y)
	bsf	status,0
	rlf	(__y),f
	clrf	(__x)
	bsf	status,0
	rlf	(__x),f
	line	159
	
l6316:	
	movlw	(02h)
	movwf	(??_lcd_clear+0)+0
	movf	(??_lcd_clear+0)+0,w
	movwf	(?_lcd_info)
	movlw	(01h)
	fcall	_lcd_info
	line	160
	
l6318:	
	opt asmopt_off
movlw	11
	movlb 0	; select bank0
movwf	((??_lcd_clear+0)+0+1),f
	movlw	98
movwf	((??_lcd_clear+0)+0),f
u6377:
	decfsz	((??_lcd_clear+0)+0),f
	goto	u6377
	decfsz	((??_lcd_clear+0)+0+1),f
	goto	u6377
	clrwdt
opt asmopt_on

	line	161
	
l6320:	
	movlb 0	; select bank0
	movf	(__x),w
	movwf	(??_lcd_clear+0)+0
	movf	(??_lcd_clear+0)+0,w
	movwf	(?_lcd_goto)
	movf	(__y),w
	fcall	_lcd_goto
	line	162
	
l1202:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_yaz
psect	text1380,local,class=CODE,delta=2
global __ptext1380
__ptext1380:

;; *************** function _lcd_yaz *****************
;; Defined at:
;;		line 214 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   27[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   11
;; This function calls:
;;		_lcd_info
;;		_lcd_goto
;; This function is called by:
;;		_lcd_write
;; This function uses a non-reentrant model
;;
psect	text1380
	file	"../OneWireLCD.h"
	line	214
	global	__size_of_lcd_yaz
	__size_of_lcd_yaz	equ	__end_of_lcd_yaz-_lcd_yaz
	
_lcd_yaz:	
	opt	stack 2
; Regs used in _lcd_yaz: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(lcd_yaz@data)
	line	215
	
l6300:	
	clrf	(?_lcd_info)
	bsf	status,0
	rlf	(?_lcd_info),f
	movf	(lcd_yaz@data),w
	fcall	_lcd_info
	line	216
	
l6302:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_lcd_yaz+0)+0
	movf	(??_lcd_yaz+0)+0,w
	addwf	(__x),f
	line	217
	
l6304:	
	movf	(__x),w
	xorlw	011h&0ffh
	skipz
	goto	u6191
	goto	u6190
u6191:
	goto	l1221
u6190:
	line	219
	
l6306:	
	clrf	(__x)
	bsf	status,0
	rlf	(__x),f
	line	220
	
l6308:	
	movlw	(01h)
	movwf	(??_lcd_yaz+0)+0
	movf	(??_lcd_yaz+0)+0,w
	addwf	(__y),f
	line	221
	movf	(__y),w
	xorlw	03h&0ffh
	skipz
	goto	u6201
	goto	u6200
u6201:
	goto	l6312
u6200:
	line	223
	
l6310:	
	clrf	(__y)
	bsf	status,0
	rlf	(__y),f
	goto	l6312
	line	224
	
l1220:	
	line	226
	
l6312:	
	movf	(__x),w
	movwf	(??_lcd_yaz+0)+0
	movf	(??_lcd_yaz+0)+0,w
	movwf	(?_lcd_goto)
	movf	(__y),w
	fcall	_lcd_goto
	goto	l1221
	line	229
	
l1219:	
	line	231
	
l1221:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_yaz
	__end_of_lcd_yaz:
;; =============== function _lcd_yaz ends ============

	signat	_lcd_yaz,4216
	global	_display_number
psect	text1381,local,class=CODE,delta=2
global __ptext1381
__ptext1381:

;; *************** function _display_number *****************
;; Defined at:
;;		line 58 in file "../7Segments.h"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   26[BANK0 ] unsigned char 
;;  digit           1   27[BANK0 ] unsigned char 
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
;;      Locals:         0       2       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   10
;; This function calls:
;;		___awdiv
;;		_set_segment_shift
;;		___awmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1381
	file	"../7Segments.h"
	line	58
	global	__size_of_display_number
	__size_of_display_number	equ	__end_of_display_number-_display_number
	
_display_number:	
	opt	stack 5
; Regs used in _display_number: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(display_number@number)
	line	59
	
l6284:	
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
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	comf	indf1,w
	movwf	(??_display_number+2)+0
	movf	(??_display_number+2)+0,w
	movwf	(display_number@digit)
	line	60
	
l6286:	
	movf	(_what_to_display),w
	xorlw	02h&0ffh
	skipz
	goto	u6171
	goto	u6170
u6171:
	goto	l6290
u6170:
	line	61
	
l6288:	
	bsf	(display_number@digit)+(7/8),(7)&7
	goto	l6290
	
l1232:	
	line	63
	
l6290:	
	movf	(display_number@digit),w
	movwf	(??_display_number+0)+0
	movf	(??_display_number+0)+0,w
	movwf	(?_set_segment_shift)
	movlw	(03h)
	fcall	_set_segment_shift
	line	65
	
l6292:	
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
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	comf	indf1,w
	movwf	(??_display_number+2)+0
	movf	(??_display_number+2)+0,w
	movwf	(display_number@digit)
	line	66
	
l6294:	
	movf	(_what_to_display),w
	xorlw	03h&0ffh
	skipz
	goto	u6181
	goto	u6180
u6181:
	goto	l6298
u6180:
	line	67
	
l6296:	
	bsf	(display_number@digit)+(7/8),(7)&7
	goto	l6298
	
l1233:	
	line	68
	
l6298:	
	movf	(display_number@digit),w
	movwf	(??_display_number+0)+0
	movf	(??_display_number+0)+0,w
	movwf	(?_set_segment_shift)
	movlw	(04h)
	fcall	_set_segment_shift
	line	70
	
l1234:	
	return
	opt stack 0
GLOBAL	__end_of_display_number
	__end_of_display_number:
;; =============== function _display_number ends ============

	signat	_display_number,4216
	global	_lcd_goto
psect	text1382,local,class=CODE,delta=2
global __ptext1382
__ptext1382:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 171 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  p_1             1    wreg     unsigned char 
;;  p_2             1   22[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  p_1             1   25[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   10
;; This function calls:
;;		_lcd_info
;; This function is called by:
;;		_lcd_clear
;;		_lcd_yaz
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1382
	file	"../OneWireLCD.h"
	line	171
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 2
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(lcd_goto@p_1)
	line	172
	
l6276:	
	movf	(lcd_goto@p_1),w
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(__y)
	line	173
	movf	(lcd_goto@p_2),w
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(__x)
	line	174
	movf	(lcd_goto@p_1),w
	xorlw	01h&0ffh
	skipz
	goto	u6161
	goto	u6160
u6161:
	goto	l6280
u6160:
	line	175
	
l6278:	
	movlw	(02h)
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(?_lcd_info)
	movf	(lcd_goto@p_2),w
	addlw	0FFh
	andlw	0Fh
	addlw	080h
	fcall	_lcd_info
	line	176
	goto	l6282
	
l1211:	
	line	177
	
l6280:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(?_lcd_info)
	movf	(lcd_goto@p_2),w
	addlw	0FFh
	andlw	0Fh
	addlw	0C0h
	fcall	_lcd_info
	goto	l6282
	line	178
	
l1212:	
	line	179
	
l6282:	
	opt asmopt_off
movlw	6
	movlb 0	; select bank0
movwf	((??_lcd_goto+0)+0+1),f
	movlw	48
movwf	((??_lcd_goto+0)+0),f
u6387:
	decfsz	((??_lcd_goto+0)+0),f
	goto	u6387
	decfsz	((??_lcd_goto+0)+0+1),f
	goto	u6387
	clrwdt
opt asmopt_on

	line	180
	
l1213:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,8312
	global	_set_segment_shift
psect	text1383,local,class=CODE,delta=2
global __ptext1383
__ptext1383:

;; *************** function _set_segment_shift *****************
;; Defined at:
;;		line 34 in file "../7Segments.h"
;; Parameters:    Size  Location     Type
;;  segment_no      1    wreg     unsigned char 
;;  data            1   18[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  segment_no      1   21[BANK0 ] unsigned char 
;;  a               1   22[BANK0 ] char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_shift_reg_set_pin
;; This function is called by:
;;		_display_number
;;		_led_on
;;		_input_selection
;; This function uses a non-reentrant model
;;
psect	text1383
	file	"../7Segments.h"
	line	34
	global	__size_of_set_segment_shift
	__size_of_set_segment_shift	equ	__end_of_set_segment_shift-_set_segment_shift
	
_set_segment_shift:	
	opt	stack 5
; Regs used in _set_segment_shift: [wreg+status,2+status,0+pclath+cstack]
	line	36
	movlb 0	; select bank0
	movwf	(set_segment_shift@segment_no)
	
l6252:	
	movlw	(07h)
	movwf	(??_set_segment_shift+0)+0
	movf	(??_set_segment_shift+0)+0,w
	movwf	(set_segment_shift@a)
	
l6254:	
	btfss	(set_segment_shift@a),7
	goto	u6131
	goto	u6130
u6131:
	goto	l6258
u6130:
	goto	l6270
	
l6256:	
	goto	l6270
	line	37
	
l1227:	
	line	39
	
l6258:	
	movf	(set_segment_shift@data),w
	movwf	(??_set_segment_shift+0)+0
	incf	(set_segment_shift@a),w
	goto	u6144
u6145:
	lsrf	(??_set_segment_shift+0)+0,f
u6144:
	decfsz	wreg,f
	goto	u6145
	movf	0+(??_set_segment_shift+0)+0,w
	andlw	01h
	movwf	(??_set_segment_shift+1)+0
	movf	(??_set_segment_shift+1)+0,w
	movwf	(?_shift_reg_set_pin)
	movlw	(02h)
	fcall	_shift_reg_set_pin
	line	40
	
l6260:	
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	41
	
l6262:	
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin)
	bsf	status,0
	rlf	(?_shift_reg_set_pin),f
	movlw	(01h)
	fcall	_shift_reg_set_pin
	line	42
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	43
	
l6264:	
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin)
	movlw	(01h)
	fcall	_shift_reg_set_pin
	line	36
	
l6266:	
	movlw	(-1)
	movlb 0	; select bank0
	movwf	(??_set_segment_shift+0)+0
	movf	(??_set_segment_shift+0)+0,w
	addwf	(set_segment_shift@a),f
	
l6268:	
	btfss	(set_segment_shift@a),7
	goto	u6151
	goto	u6150
u6151:
	goto	l6258
u6150:
	goto	l6270
	
l1228:	
	line	48
	
l6270:	
	clrf	(?_shift_reg_set_pin)
	bsf	status,0
	rlf	(?_shift_reg_set_pin),f
	movf	(set_segment_shift@segment_no),w
	fcall	_shift_reg_set_pin
	line	49
	
l6272:	
	opt asmopt_off
movlw	19
	movlb 0	; select bank0
movwf	(??_set_segment_shift+0)+0,f
u6397:
decfsz	(??_set_segment_shift+0)+0,f
	goto	u6397
	nop2	;nop
opt asmopt_on

	line	50
	
l6274:	
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin)
	movf	(set_segment_shift@segment_no),w
	fcall	_shift_reg_set_pin
	line	53
	
l1229:	
	return
	opt stack 0
GLOBAL	__end_of_set_segment_shift
	__end_of_set_segment_shift:
;; =============== function _set_segment_shift ends ============

	signat	_set_segment_shift,8312
	global	_lcd_info
psect	text1384,local,class=CODE,delta=2
global __ptext1384
__ptext1384:

;; *************** function _lcd_info *****************
;; Defined at:
;;		line 115 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;;  data_type       1   18[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_shift_reg_set_pin_lcd
;; This function is called by:
;;		_lcd_clear
;;		_lcd_goto
;;		_LCD_init
;;		_lcd_yaz
;; This function uses a non-reentrant model
;;
psect	text1384
	file	"../OneWireLCD.h"
	line	115
	global	__size_of_lcd_info
	__size_of_lcd_info	equ	__end_of_lcd_info-_lcd_info
	
_lcd_info:	
	opt	stack 2
; Regs used in _lcd_info: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(lcd_info@c)
	line	116
	
l6212:	
	movf	(lcd_info@data_type),w
	xorlw	02h&0ffh
	skipz
	goto	u6031
	goto	u6030
u6031:
	goto	l6216
u6030:
	line	117
	
l6214:	
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(01h)
	fcall	_shift_reg_set_pin_lcd
	goto	l1198
	line	118
	
l1197:	
	
l6216:	
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?_shift_reg_set_pin_lcd),f
	movlw	(01h)
	fcall	_shift_reg_set_pin_lcd
	
l1198:	
	line	120
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?_shift_reg_set_pin_lcd),f
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	124
	
l6218:	
	movlb 0	; select bank0
	movf	(lcd_info@c),w
	andlw	0F0h
	movwf	(??_lcd_info+0)+0
	movf	(??_lcd_info+0)+0,w
	movwf	(__temp_)
	line	125
	
l6220:	
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	07h
u6045:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u6045
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(06h)
	fcall	_shift_reg_set_pin_lcd
	line	126
	
l6222:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	06h
u6055:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u6055
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(05h)
	fcall	_shift_reg_set_pin_lcd
	line	127
	
l6224:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	05h
u6065:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u6065
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(04h)
	fcall	_shift_reg_set_pin_lcd
	line	128
	
l6226:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	04h
u6075:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u6075
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(03h)
	fcall	_shift_reg_set_pin_lcd
	line	131
	
l6228:	
	opt asmopt_off
movlw	21
	movlb 0	; select bank0
movwf	((??_lcd_info+0)+0+1),f
	movlw	198
movwf	((??_lcd_info+0)+0),f
u6407:
	decfsz	((??_lcd_info+0)+0),f
	goto	u6407
	decfsz	((??_lcd_info+0)+0+1),f
	goto	u6407
	clrwdt
opt asmopt_on

	line	132
	
l6230:	
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	135
	
l6232:	
	opt asmopt_off
movlw	21
	movlb 0	; select bank0
movwf	((??_lcd_info+0)+0+1),f
	movlw	198
movwf	((??_lcd_info+0)+0),f
u6417:
	decfsz	((??_lcd_info+0)+0),f
	goto	u6417
	decfsz	((??_lcd_info+0)+0+1),f
	goto	u6417
	clrwdt
opt asmopt_on

	line	136
	
l6234:	
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?_shift_reg_set_pin_lcd),f
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	138
	
l6236:	
	movlb 0	; select bank0
	movf	(lcd_info@c),w
	andlw	0Fh
	movwf	(??_lcd_info+0)+0
	movlw	(04h)-1
u6085:
	lslf	(??_lcd_info+0)+0,f
	addlw	-1
	skipz
	goto	u6085
	lslf	(??_lcd_info+0)+0,w
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(__temp_)
	line	140
	
l6238:	
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	07h
u6095:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u6095
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(06h)
	fcall	_shift_reg_set_pin_lcd
	line	141
	
l6240:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	06h
u6105:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u6105
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(05h)
	fcall	_shift_reg_set_pin_lcd
	line	142
	
l6242:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	05h
u6115:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u6115
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(04h)
	fcall	_shift_reg_set_pin_lcd
	line	143
	
l6244:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	04h
u6125:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u6125
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(03h)
	fcall	_shift_reg_set_pin_lcd
	line	148
	
l6246:	
	opt asmopt_off
movlw	21
	movlb 0	; select bank0
movwf	((??_lcd_info+0)+0+1),f
	movlw	198
movwf	((??_lcd_info+0)+0),f
u6427:
	decfsz	((??_lcd_info+0)+0),f
	goto	u6427
	decfsz	((??_lcd_info+0)+0+1),f
	goto	u6427
	clrwdt
opt asmopt_on

	line	149
	
l6248:	
	movlb 0	; select bank0
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	152
	
l6250:	
	opt asmopt_off
movlw	52
	movlb 0	; select bank0
movwf	((??_lcd_info+0)+0+1),f
	movlw	241
movwf	((??_lcd_info+0)+0),f
u6437:
	decfsz	((??_lcd_info+0)+0),f
	goto	u6437
	decfsz	((??_lcd_info+0)+0+1),f
	goto	u6437
	nop2
opt asmopt_on

	line	153
	
l1199:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_info
	__end_of_lcd_info:
;; =============== function _lcd_info ends ============

	signat	_lcd_info,8312
	global	_itoa
psect	text1385,local,class=CODE,delta=2
global __ptext1385
__ptext1385:

;; *************** function _itoa *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> number_array(5), 
;;  val             2   28[BANK0 ] int 
;;  base            2   30[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  buf             1   34[BANK0 ] PTR unsigned char 
;;		 -> number_array(5), 
;;  cp              1   33[BANK0 ] PTR unsigned char 
;;		 -> number_array(5), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_utoa
;; This function is called by:
;;		_lcd_write_number
;; This function uses a non-reentrant model
;;
psect	text1385
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
	line	5
	global	__size_of_itoa
	__size_of_itoa	equ	__end_of_itoa-_itoa
	
_itoa:	
	opt	stack 5
; Regs used in _itoa: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(itoa@buf)
	line	6
	
l6198:	
	movf	(itoa@buf),w
	movwf	(??_itoa+0)+0
	movf	(??_itoa+0)+0,w
	movwf	(itoa@cp)
	line	8
	
l6200:	
	btfss	(itoa@val+1),7
	goto	u6021
	goto	u6020
u6021:
	goto	l6208
u6020:
	line	9
	
l6202:	
	movlw	(02Dh)
	movwf	(??_itoa+0)+0
	movf	(itoa@buf),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_itoa+0)+0,w
	movwf	indf1
	
l6204:	
	movlw	(01h)
	movwf	(??_itoa+0)+0
	movf	(??_itoa+0)+0,w
	addwf	(itoa@buf),f
	line	10
	
l6206:	
	comf	(itoa@val),f
	comf	(itoa@val+1),f
	incf	(itoa@val),f
	skipnz
	incf	(itoa@val+1),f
	goto	l6208
	line	11
	
l2374:	
	line	12
	
l6208:	
	movf	(itoa@val+1),w
	clrf	(?_utoa+1)
	addwf	(?_utoa+1)
	movf	(itoa@val),w
	clrf	(?_utoa)
	addwf	(?_utoa)

	movf	(itoa@base+1),w
	clrf	1+(?_utoa)+02h
	addwf	1+(?_utoa)+02h
	movf	(itoa@base),w
	clrf	0+(?_utoa)+02h
	addwf	0+(?_utoa)+02h

	movf	(itoa@buf),w
	fcall	_utoa
	goto	l2375
	line	13
	
l6210:	
	line	14
;	Return value of _itoa is never used
	
l2375:	
	return
	opt stack 0
GLOBAL	__end_of_itoa
	__end_of_itoa:
;; =============== function _itoa ends ============

	signat	_itoa,12409
	global	_shift_reg_set_pin_lcd
psect	text1386,local,class=CODE,delta=2
global __ptext1386
__ptext1386:

;; *************** function _shift_reg_set_pin_lcd *****************
;; Defined at:
;;		line 40 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  pin_number      1    wreg     unsigned char 
;;  value           1   14[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  pin_number      1   17[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_load_shift_data_lcd
;; This function is called by:
;;		_lcd_info
;;		_LCD_init
;;		_alarm_on
;;		_alarm_off
;; This function uses a non-reentrant model
;;
psect	text1386
	file	"../OneWireLCD.h"
	line	40
	global	__size_of_shift_reg_set_pin_lcd
	__size_of_shift_reg_set_pin_lcd	equ	__end_of_shift_reg_set_pin_lcd-_shift_reg_set_pin_lcd
	
_shift_reg_set_pin_lcd:	
	opt	stack 2
; Regs used in _shift_reg_set_pin_lcd: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(shift_reg_set_pin_lcd@pin_number)
	line	41
	
l6186:	
	movf	(shift_reg_set_pin_lcd@value),w
	andlw	01h
	movwf	(??_shift_reg_set_pin_lcd+0)+0
	movf	(??_shift_reg_set_pin_lcd+0)+0,w
	movwf	(shift_reg_set_pin_lcd@value)
	line	42
	
l6188:	
	movlw	low(01h)
	subwf	(shift_reg_set_pin_lcd@pin_number),f
	line	43
	
l6190:	
	movf	(shift_reg_set_pin_lcd@value),w
	skipz
	goto	u5990
	goto	l6194
u5990:
	line	45
	
l6192:	
	movlw	(01h)
	movwf	(??_shift_reg_set_pin_lcd+0)+0
	incf	(shift_reg_set_pin_lcd@pin_number),w
	goto	u6004
u6005:
	lslf	(??_shift_reg_set_pin_lcd+0)+0,f
u6004:
	decfsz	wreg,f
	goto	u6005
	movf	0+(??_shift_reg_set_pin_lcd+0)+0,w
	movwf	(??_shift_reg_set_pin_lcd+1)+0
	movf	(??_shift_reg_set_pin_lcd+1)+0,w
	iorwf	(_current_value_lcd),f
	line	46
	goto	l6196
	line	47
	
l1186:	
	line	49
	
l6194:	
	movlw	(01h)
	movwf	(??_shift_reg_set_pin_lcd+0)+0
	incf	(shift_reg_set_pin_lcd@pin_number),w
	goto	u6014
u6015:
	lslf	(??_shift_reg_set_pin_lcd+0)+0,f
u6014:
	decfsz	wreg,f
	goto	u6015
	movf	0+(??_shift_reg_set_pin_lcd+0)+0,w
	xorlw	0ffh
	movwf	(??_shift_reg_set_pin_lcd+1)+0
	movf	(??_shift_reg_set_pin_lcd+1)+0,w
	andwf	(_current_value_lcd),f
	goto	l6196
	line	50
	
l1187:	
	line	52
	
l6196:	
	movf	(_current_value_lcd),w
	fcall	_load_shift_data_lcd
	line	54
	
l1188:	
	return
	opt stack 0
GLOBAL	__end_of_shift_reg_set_pin_lcd
	__end_of_shift_reg_set_pin_lcd:
;; =============== function _shift_reg_set_pin_lcd ends ============

	signat	_shift_reg_set_pin_lcd,8312
	global	_shift_reg_set_pin
psect	text1387,local,class=CODE,delta=2
global __ptext1387
__ptext1387:

;; *************** function _shift_reg_set_pin *****************
;; Defined at:
;;		line 43 in file "../OneWireShiftRegister.h"
;; Parameters:    Size  Location     Type
;;  pin_number      1    wreg     unsigned char 
;;  value           1   14[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  pin_number      1   17[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_load_shift_data
;; This function is called by:
;;		_set_segment_shift
;; This function uses a non-reentrant model
;;
psect	text1387
	file	"../OneWireShiftRegister.h"
	line	43
	global	__size_of_shift_reg_set_pin
	__size_of_shift_reg_set_pin	equ	__end_of_shift_reg_set_pin-_shift_reg_set_pin
	
_shift_reg_set_pin:	
	opt	stack 5
; Regs used in _shift_reg_set_pin: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(shift_reg_set_pin@pin_number)
	line	44
	
l6172:	
	movf	(shift_reg_set_pin@value),w
	skipz
	goto	u5950
	goto	l1172
u5950:
	
l6174:	
	clrf	(shift_reg_set_pin@value)
	bsf	status,0
	rlf	(shift_reg_set_pin@value),f
	goto	l6176
	line	45
	
l1172:	
	clrf	(shift_reg_set_pin@value)
	goto	l6176
	
l1173:	
	line	46
	
l6176:	
	movlw	low(01h)
	subwf	(shift_reg_set_pin@pin_number),f
	line	47
	
l6178:	
	movf	(shift_reg_set_pin@value),w
	skipz
	goto	u5960
	goto	l6182
u5960:
	line	49
	
l6180:	
	movlw	(01h)
	movwf	(??_shift_reg_set_pin+0)+0
	incf	(shift_reg_set_pin@pin_number),w
	goto	u5974
u5975:
	lslf	(??_shift_reg_set_pin+0)+0,f
u5974:
	decfsz	wreg,f
	goto	u5975
	movf	0+(??_shift_reg_set_pin+0)+0,w
	movwf	(??_shift_reg_set_pin+1)+0
	movf	(??_shift_reg_set_pin+1)+0,w
	iorwf	(_current_value),f
	line	50
	goto	l6184
	line	51
	
l1174:	
	line	53
	
l6182:	
	movlw	(01h)
	movwf	(??_shift_reg_set_pin+0)+0
	incf	(shift_reg_set_pin@pin_number),w
	goto	u5984
u5985:
	lslf	(??_shift_reg_set_pin+0)+0,f
u5984:
	decfsz	wreg,f
	goto	u5985
	movf	0+(??_shift_reg_set_pin+0)+0,w
	xorlw	0ffh
	movwf	(??_shift_reg_set_pin+1)+0
	movf	(??_shift_reg_set_pin+1)+0,w
	andwf	(_current_value),f
	goto	l6184
	line	55
	
l1175:	
	line	57
	
l6184:	
	movf	(_current_value),w
	fcall	_load_shift_data
	line	59
	
l1176:	
	return
	opt stack 0
GLOBAL	__end_of_shift_reg_set_pin
	__end_of_shift_reg_set_pin:
;; =============== function _shift_reg_set_pin ends ============

	signat	_shift_reg_set_pin,8312
	global	_utoa
psect	text1388,local,class=CODE,delta=2
global __ptext1388
__ptext1388:

;; *************** function _utoa *****************
;; Defined at:
;;		line 18 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> number_array(5), 
;;  val             2   19[BANK0 ] unsigned int 
;;  base            2   21[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  buf             1   27[BANK0 ] PTR unsigned char 
;;		 -> number_array(5), 
;;  v               2   24[BANK0 ] unsigned int 
;;  c               1   26[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    8
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_itoa
;; This function uses a non-reentrant model
;;
psect	text1388
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
	line	18
	global	__size_of_utoa
	__size_of_utoa	equ	__end_of_utoa-_utoa
	
_utoa:	
	opt	stack 5
; Regs used in _utoa: [wreg+fsr1l-status,0+pclath+cstack]
	line	22
	movlb 0	; select bank0
	movwf	(utoa@buf)
	
l6146:	
	movf	(utoa@val+1),w
	clrf	(utoa@v+1)
	addwf	(utoa@v+1)
	movf	(utoa@val),w
	clrf	(utoa@v)
	addwf	(utoa@v)

	goto	l6148
	line	23
	
l2378:	
	line	24
	
l6148:	
	movf	(utoa@base+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(utoa@base),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movf	(utoa@v+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(utoa@v),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movlb 0	; select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(utoa@v+1)
	addwf	(utoa@v+1)
	movf	(0+(?___lwdiv)),w
	clrf	(utoa@v)
	addwf	(utoa@v)

	line	25
	
l6150:	
	movlw	(01h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@buf),f
	line	26
	
l6152:	
	movf	((utoa@v+1)),w
	iorwf	((utoa@v)),w
	skipz
	goto	u5921
	goto	u5920
u5921:
	goto	l6148
u5920:
	goto	l6154
	
l2379:	
	line	27
	
l6154:	
	movf	(utoa@buf),w
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l6156:	
	movlw	low(01h)
	subwf	(utoa@buf),f
	goto	l6158
	line	28
	
l2380:	
	line	29
	
l6158:	
	movf	(utoa@base+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(utoa@base),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movf	(utoa@val+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(utoa@val),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movlb 0	; select bank0
	movf	(0+(?___lwmod)),w
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	movwf	(utoa@c)
	line	30
	
l6160:	
	movf	(utoa@base+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(utoa@base),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movf	(utoa@val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(utoa@val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movlb 0	; select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(utoa@val+1)
	addwf	(utoa@val+1)
	movf	(0+(?___lwdiv)),w
	clrf	(utoa@val)
	addwf	(utoa@val)

	line	31
	
l6162:	
	movlw	(0Ah)
	subwf	(utoa@c),w
	skipc
	goto	u5931
	goto	u5930
u5931:
	goto	l2381
u5930:
	line	32
	
l6164:	
	movlw	(07h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@c),f
	
l2381:	
	line	33
	movlw	(030h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@c),f
	line	34
	
l6166:	
	movf	(utoa@c),w
	movwf	(??_utoa+0)+0
	movf	(utoa@buf),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_utoa+0)+0,w
	movwf	indf1
	
l6168:	
	movlw	low(01h)
	subwf	(utoa@buf),f
	line	35
	
l6170:	
	movf	((utoa@val+1)),w
	iorwf	((utoa@val)),w
	skipz
	goto	u5941
	goto	u5940
u5941:
	goto	l6158
u5940:
	goto	l2383
	
l2382:	
	line	37
;	Return value of _utoa is never used
	
l2383:	
	return
	opt stack 0
GLOBAL	__end_of_utoa
	__end_of_utoa:
;; =============== function _utoa ends ============

	signat	_utoa,12409
	global	_ADC_init
psect	text1389,local,class=CODE,delta=2
global __ptext1389
__ptext1389:

;; *************** function _ADC_init *****************
;; Defined at:
;;		line 35 in file "../ADC.h"
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
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1389
	file	"../ADC.h"
	line	35
	global	__size_of_ADC_init
	__size_of_ADC_init	equ	__end_of_ADC_init-_ADC_init
	
_ADC_init:	
	opt	stack 8
; Regs used in _ADC_init: [wreg]
	line	43
	
l6140:	
	movlb 1	; select bank1
	bcf	(1261/8)^080h,(1261)&7
	line	44
	bcf	(1260/8)^080h,(1260)&7
	line	45
	bsf	(1259/8)^080h,(1259)&7
	line	46
	bsf	(1258/8)^080h,(1258)&7
	line	49
	bsf	(1271/8)^080h,(1271)&7
	line	52
	bsf	(1270/8)^080h,(1270)&7
	line	53
	bsf	(1269/8)^080h,(1269)&7
	line	54
	bcf	(1268/8)^080h,(1268)&7
	line	55
	
l6142:	
	opt asmopt_off
movlw	78
	movlb 0	; select bank0
movwf	((??_ADC_init+0)+0+1),f
	movlw	235
movwf	((??_ADC_init+0)+0),f
u6447:
	decfsz	((??_ADC_init+0)+0),f
	goto	u6447
	decfsz	((??_ADC_init+0)+0+1),f
	goto	u6447
opt asmopt_on

	line	56
	
l6144:	
	movlb 1	; select bank1
	bsf	(1256/8)^080h,(1256)&7
	line	57
	opt asmopt_off
movlw	78
	movlb 0	; select bank0
movwf	((??_ADC_init+0)+0+1),f
	movlw	235
movwf	((??_ADC_init+0)+0),f
u6457:
	decfsz	((??_ADC_init+0)+0),f
	goto	u6457
	decfsz	((??_ADC_init+0)+0+1),f
	goto	u6457
opt asmopt_on

	line	60
	
l1271:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_init
	__end_of_ADC_init:
;; =============== function _ADC_init ends ============

	signat	_ADC_init,88
	global	_load_shift_data_lcd
psect	text1390,local,class=CODE,delta=2
global __ptext1390
__ptext1390:

;; *************** function _load_shift_data_lcd *****************
;; Defined at:
;;		line 6 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   12[BANK0 ] unsigned char 
;;  a               1   13[BANK0 ] char 
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
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_shift_reg_set_pin_lcd
;; This function uses a non-reentrant model
;;
psect	text1390
	file	"../OneWireLCD.h"
	line	6
	global	__size_of_load_shift_data_lcd
	__size_of_load_shift_data_lcd	equ	__end_of_load_shift_data_lcd-_load_shift_data_lcd
	
_load_shift_data_lcd:	
	opt	stack 2
; Regs used in _load_shift_data_lcd: [wreg+status,2+status,0]
	movlb 0	; select bank0
	movwf	(load_shift_data_lcd@data)
	line	7
	
l6116:	
	movlw	(07h)
	movwf	(??_load_shift_data_lcd+0)+0
	movf	(??_load_shift_data_lcd+0)+0,w
	movwf	(load_shift_data_lcd@a)
	
l6118:	
	btfss	(load_shift_data_lcd@a),7
	goto	u5881
	goto	u5880
u5881:
	goto	l6122
u5880:
	goto	l1180
	
l6120:	
	goto	l1180
	line	8
	
l1179:	
	line	10
	
l6122:	
	movf	(load_shift_data_lcd@data),w
	movwf	(??_load_shift_data_lcd+0)+0
	incf	(load_shift_data_lcd@a),w
	goto	u5894
u5895:
	lsrf	(??_load_shift_data_lcd+0)+0,f
u5894:
	decfsz	wreg,f
	goto	u5895
	btfss	0+(??_load_shift_data_lcd+0)+0,(0)&7
	goto	u5901
	goto	u5900
u5901:
	goto	l1181
u5900:
	line	13
	
l6124:	
# 13 "../OneWireLCD.h"
banksel _PORTA ;#
	line	14
# 14 "../OneWireLCD.h"
bcf _PORTA, 2 ;#
	line	15
# 15 "../OneWireLCD.h"
nop ;#
	line	16
# 16 "../OneWireLCD.h"
nop ;#
	line	17
# 17 "../OneWireLCD.h"
bsf _PORTA, 2 ;#
psect	text1390
	line	20
	
l6126:	
	opt asmopt_off
movlw	19
	movlb 0	; select bank0
movwf	(??_load_shift_data_lcd+0)+0,f
u6467:
decfsz	(??_load_shift_data_lcd+0)+0,f
	goto	u6467
	nop2	;nop
opt asmopt_on

	line	21
	goto	l6132
	line	22
	
l1181:	
	line	24
	bcf	(98/8),(98)&7
	line	25
	
l6128:	
	opt asmopt_off
movlw	19
movwf	(??_load_shift_data_lcd+0)+0,f
u6477:
decfsz	(??_load_shift_data_lcd+0)+0,f
	goto	u6477
	nop2	;nop
opt asmopt_on

	line	26
	
l6130:	
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	27
	opt asmopt_off
movlw	39
movwf	(??_load_shift_data_lcd+0)+0,f
u6487:
decfsz	(??_load_shift_data_lcd+0)+0,f
	goto	u6487
	nop2	;nop
opt asmopt_on

	goto	l6132
	line	28
	
l1182:	
	line	7
	
l6132:	
	movlw	(-1)
	movlb 0	; select bank0
	movwf	(??_load_shift_data_lcd+0)+0
	movf	(??_load_shift_data_lcd+0)+0,w
	addwf	(load_shift_data_lcd@a),f
	
l6134:	
	btfss	(load_shift_data_lcd@a),7
	goto	u5911
	goto	u5910
u5911:
	goto	l6122
u5910:
	
l1180:	
	line	32
	bcf	(98/8),(98)&7
	line	33
	
l6136:	
	opt asmopt_off
movlw	159
movwf	(??_load_shift_data_lcd+0)+0,f
u6497:
	nop2
decfsz	(??_load_shift_data_lcd+0)+0,f
	goto	u6497
opt asmopt_on

	line	34
	
l6138:	
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	35
	opt asmopt_off
movlw	239
movwf	(??_load_shift_data_lcd+0)+0,f
u6507:
	nop2
decfsz	(??_load_shift_data_lcd+0)+0,f
	goto	u6507
	nop2	;nop
	nop2	;nop
opt asmopt_on

	line	38
	
l1183:	
	return
	opt stack 0
GLOBAL	__end_of_load_shift_data_lcd
	__end_of_load_shift_data_lcd:
;; =============== function _load_shift_data_lcd ends ============

	signat	_load_shift_data_lcd,4216
	global	_load_shift_data
psect	text1391,local,class=CODE,delta=2
global __ptext1391
__ptext1391:

;; *************** function _load_shift_data *****************
;; Defined at:
;;		line 8 in file "../OneWireShiftRegister.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   12[BANK0 ] unsigned char 
;;  a               1   13[BANK0 ] char 
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
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_shift_reg_set_pin
;; This function uses a non-reentrant model
;;
psect	text1391
	file	"../OneWireShiftRegister.h"
	line	8
	global	__size_of_load_shift_data
	__size_of_load_shift_data	equ	__end_of_load_shift_data-_load_shift_data
	
_load_shift_data:	
	opt	stack 5
; Regs used in _load_shift_data: [wreg+status,2+status,0]
	line	10
	movlb 0	; select bank0
	movwf	(load_shift_data@data)
	
l6092:	
	movlw	(07h)
	movwf	(??_load_shift_data+0)+0
	movf	(??_load_shift_data+0)+0,w
	movwf	(load_shift_data@a)
	
l6094:	
	btfss	(load_shift_data@a),7
	goto	u5841
	goto	u5840
u5841:
	goto	l6098
u5840:
	goto	l1166
	
l6096:	
	goto	l1166
	line	11
	
l1165:	
	line	13
	
l6098:	
	movf	(load_shift_data@data),w
	movwf	(??_load_shift_data+0)+0
	incf	(load_shift_data@a),w
	goto	u5854
u5855:
	lsrf	(??_load_shift_data+0)+0,f
u5854:
	decfsz	wreg,f
	goto	u5855
	btfss	0+(??_load_shift_data+0)+0,(0)&7
	goto	u5861
	goto	u5860
u5861:
	goto	l1167
u5860:
	line	16
	
l6100:	
# 16 "../OneWireShiftRegister.h"
banksel _PORTA ;#
	line	17
# 17 "../OneWireShiftRegister.h"
bcf _PORTA, 5 ;#
	line	18
# 18 "../OneWireShiftRegister.h"
nop ;#
	line	19
# 19 "../OneWireShiftRegister.h"
nop ;#
	line	20
# 20 "../OneWireShiftRegister.h"
bsf _PORTA, 5 ;#
psect	text1391
	line	23
	
l6102:	
	opt asmopt_off
movlw	19
	movlb 0	; select bank0
movwf	(??_load_shift_data+0)+0,f
u6517:
decfsz	(??_load_shift_data+0)+0,f
	goto	u6517
	nop2	;nop
opt asmopt_on

	line	24
	goto	l6108
	line	25
	
l1167:	
	line	27
	bcf	(101/8),(101)&7
	line	28
	
l6104:	
	opt asmopt_off
movlw	19
movwf	(??_load_shift_data+0)+0,f
u6527:
decfsz	(??_load_shift_data+0)+0,f
	goto	u6527
	nop2	;nop
opt asmopt_on

	line	29
	
l6106:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	30
	opt asmopt_off
movlw	39
movwf	(??_load_shift_data+0)+0,f
u6537:
decfsz	(??_load_shift_data+0)+0,f
	goto	u6537
	nop2	;nop
opt asmopt_on

	goto	l6108
	line	31
	
l1168:	
	line	10
	
l6108:	
	movlw	(-1)
	movlb 0	; select bank0
	movwf	(??_load_shift_data+0)+0
	movf	(??_load_shift_data+0)+0,w
	addwf	(load_shift_data@a),f
	
l6110:	
	btfss	(load_shift_data@a),7
	goto	u5871
	goto	u5870
u5871:
	goto	l6098
u5870:
	
l1166:	
	line	35
	bcf	(101/8),(101)&7
	line	36
	
l6112:	
	opt asmopt_off
movlw	159
movwf	(??_load_shift_data+0)+0,f
u6547:
	nop2
decfsz	(??_load_shift_data+0)+0,f
	goto	u6547
opt asmopt_on

	line	37
	
l6114:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	38
	opt asmopt_off
movlw	239
movwf	(??_load_shift_data+0)+0,f
u6557:
	nop2
decfsz	(??_load_shift_data+0)+0,f
	goto	u6557
	nop2	;nop
	nop2	;nop
opt asmopt_on

	line	41
	
l1169:	
	return
	opt stack 0
GLOBAL	__end_of_load_shift_data
	__end_of_load_shift_data:
;; =============== function _load_shift_data ends ============

	signat	_load_shift_data,4216
	global	___awmod
psect	text1392,local,class=CODE,delta=2
global __ptext1392
__ptext1392:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   11[BANK0 ] int 
;;  dividend        2   13[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   17[BANK0 ] unsigned char 
;;  counter         1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   11[BANK0 ] int 
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text1392
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 7
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l6058:	
	movlb 0	; select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u5751
	goto	u5750
u5751:
	goto	l6062
u5750:
	line	10
	
l6060:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l6062
	line	12
	
l2600:	
	line	13
	
l6062:	
	btfss	(___awmod@divisor+1),7
	goto	u5761
	goto	u5760
u5761:
	goto	l6066
u5760:
	line	14
	
l6064:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l6066
	
l2601:	
	line	15
	
l6066:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u5771
	goto	u5770
u5771:
	goto	l6084
u5770:
	line	16
	
l6068:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l6074
	
l2604:	
	line	18
	
l6070:	
	movlw	01h
	
u5785:
	lslf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u5785
	line	19
	
l6072:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l6074
	line	20
	
l2603:	
	line	17
	
l6074:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u5791
	goto	u5790
u5791:
	goto	l6070
u5790:
	goto	l6076
	
l2605:	
	goto	l6076
	line	21
	
l2606:	
	line	22
	
l6076:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u5805
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u5805:
	skipc
	goto	u5801
	goto	u5800
u5801:
	goto	l6080
u5800:
	line	23
	
l6078:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	subwfb	(___awmod@dividend+1),f
	goto	l6080
	
l2607:	
	line	24
	
l6080:	
	movlw	01h
	
u5815:
	lsrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	decfsz	wreg,f
	goto	u5815
	line	25
	
l6082:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u5821
	goto	u5820
u5821:
	goto	l6076
u5820:
	goto	l6084
	
l2608:	
	goto	l6084
	line	26
	
l2602:	
	line	27
	
l6084:	
	movf	(___awmod@sign),w
	skipz
	goto	u5830
	goto	l6088
u5830:
	line	28
	
l6086:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l6088
	
l2609:	
	line	29
	
l6088:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l2610
	
l6090:	
	line	30
	
l2610:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text1393,local,class=CODE,delta=2
global __ptext1393
__ptext1393:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   11[BANK0 ] int 
;;  dividend        2   13[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   18[BANK0 ] int 
;;  sign            1   17[BANK0 ] unsigned char 
;;  counter         1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   11[BANK0 ] int 
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text1393
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 7
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l6018:	
	movlb 0	; select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u5651
	goto	u5650
u5651:
	goto	l6022
u5650:
	line	11
	
l6020:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l6022
	line	13
	
l2532:	
	line	14
	
l6022:	
	btfss	(___awdiv@dividend+1),7
	goto	u5661
	goto	u5660
u5661:
	goto	l6028
u5660:
	line	15
	
l6024:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l6026:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l6028
	line	17
	
l2533:	
	line	18
	
l6028:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l6030:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u5671
	goto	u5670
u5671:
	goto	l6050
u5670:
	line	20
	
l6032:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l6038
	
l2536:	
	line	22
	
l6034:	
	movlw	01h
	
u5685:
	lslf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u5685
	line	23
	
l6036:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l6038
	line	24
	
l2535:	
	line	21
	
l6038:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u5691
	goto	u5690
u5691:
	goto	l6034
u5690:
	goto	l6040
	
l2537:	
	goto	l6040
	line	25
	
l2538:	
	line	26
	
l6040:	
	movlw	01h
	
u5705:
	lslf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u5705
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u5715
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u5715:
	skipc
	goto	u5711
	goto	u5710
u5711:
	goto	l6046
u5710:
	line	28
	
l6042:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	subwfb	(___awdiv@dividend+1),f
	line	29
	
l6044:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l6046
	line	30
	
l2539:	
	line	31
	
l6046:	
	movlw	01h
	
u5725:
	lsrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	decfsz	wreg,f
	goto	u5725
	line	32
	
l6048:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u5731
	goto	u5730
u5731:
	goto	l6040
u5730:
	goto	l6050
	
l2540:	
	goto	l6050
	line	33
	
l2534:	
	line	34
	
l6050:	
	movf	(___awdiv@sign),w
	skipz
	goto	u5740
	goto	l6054
u5740:
	line	35
	
l6052:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l6054
	
l2541:	
	line	36
	
l6054:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2542
	
l6056:	
	line	37
	
l2542:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text1394,local,class=CODE,delta=2
global __ptext1394
__ptext1394:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   11[BANK0 ] unsigned int 
;;  dividend        2   13[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   11[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_utoa
;; This function uses a non-reentrant model
;;
psect	text1394
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l5996:	
	movlb 0	; select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u5591
	goto	u5590
u5591:
	goto	l6014
u5590:
	line	9
	
l5998:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l6004
	
l2410:	
	line	11
	
l6000:	
	movlw	01h
	
u5605:
	lslf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	decfsz	wreg,f
	goto	u5605
	line	12
	
l6002:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l6004
	line	13
	
l2409:	
	line	10
	
l6004:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u5611
	goto	u5610
u5611:
	goto	l6000
u5610:
	goto	l6006
	
l2411:	
	goto	l6006
	line	14
	
l2412:	
	line	15
	
l6006:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u5625
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u5625:
	skipc
	goto	u5621
	goto	u5620
u5621:
	goto	l6010
u5620:
	line	16
	
l6008:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	subwfb	(___lwmod@dividend+1),f
	goto	l6010
	
l2413:	
	line	17
	
l6010:	
	movlw	01h
	
u5635:
	lsrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	decfsz	wreg,f
	goto	u5635
	line	18
	
l6012:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u5641
	goto	u5640
u5641:
	goto	l6006
u5640:
	goto	l6014
	
l2414:	
	goto	l6014
	line	19
	
l2408:	
	line	20
	
l6014:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l2415
	
l6016:	
	line	21
	
l2415:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1395,local,class=CODE,delta=2
global __ptext1395
__ptext1395:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   11[BANK0 ] unsigned int 
;;  dividend        2   13[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   17[BANK0 ] unsigned int 
;;  counter         1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   11[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_utoa
;; This function uses a non-reentrant model
;;
psect	text1395
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l5970:	
	movlb 0	; select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l5972:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u5521
	goto	u5520
u5521:
	goto	l5992
u5520:
	line	11
	
l5974:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l5980
	
l2400:	
	line	13
	
l5976:	
	movlw	01h
	
u5535:
	lslf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	decfsz	wreg,f
	goto	u5535
	line	14
	
l5978:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l5980
	line	15
	
l2399:	
	line	12
	
l5980:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u5541
	goto	u5540
u5541:
	goto	l5976
u5540:
	goto	l5982
	
l2401:	
	goto	l5982
	line	16
	
l2402:	
	line	17
	
l5982:	
	movlw	01h
	
u5555:
	lslf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	decfsz	wreg,f
	goto	u5555
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u5565
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u5565:
	skipc
	goto	u5561
	goto	u5560
u5561:
	goto	l5988
u5560:
	line	19
	
l5984:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	subwfb	(___lwdiv@dividend+1),f
	line	20
	
l5986:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l5988
	line	21
	
l2403:	
	line	22
	
l5988:	
	movlw	01h
	
u5575:
	lsrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	decfsz	wreg,f
	goto	u5575
	line	23
	
l5990:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u5581
	goto	u5580
u5581:
	goto	l5982
u5580:
	goto	l5992
	
l2404:	
	goto	l5992
	line	24
	
l2398:	
	line	25
	
l5992:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l2405
	
l5994:	
	line	26
	
l2405:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_TIMER1_init
psect	text1396,local,class=CODE,delta=2
global __ptext1396
__ptext1396:

;; *************** function _TIMER1_init *****************
;; Defined at:
;;		line 3 in file "../TIMER1.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  1309[COMMON] int 
;; Registers used:
;;		wreg, status,2
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1396
	file	"../TIMER1.h"
	line	3
	global	__size_of_TIMER1_init
	__size_of_TIMER1_init	equ	__end_of_TIMER1_init-_TIMER1_init
	
_TIMER1_init:	
	opt	stack 8
; Regs used in _TIMER1_init: [wreg+status,2]
	line	4
	
l5948:	
	movlb 0	; select bank0
	clrf	(23)	;volatile
	line	5
	clrf	(22)	;volatile
	line	9
	
l5950:	
	bcf	(199/8),(199)&7
	line	10
	
l5952:	
	bcf	(198/8),(198)&7
	line	14
	
l5954:	
	bsf	(197/8),(197)&7
	line	15
	
l5956:	
	bcf	(196/8),(196)&7
	line	19
	
l5958:	
	bcf	(192/8),(192)&7
	line	20
	
l5960:	
	movlw	low(03CAFh)
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	21
	
l5962:	
	bcf	(136/8),(136)&7
	line	22
	
l5964:	
	movlb 1	; select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	23
	
l1310:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_init
	__end_of_TIMER1_init:
;; =============== function _TIMER1_init ends ============

	signat	_TIMER1_init,90
	global	_INT0_init
psect	text1397,local,class=CODE,delta=2
global __ptext1397
__ptext1397:

;; *************** function _INT0_init *****************
;; Defined at:
;;		line 4 in file "../INT0.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  1306[COMMON] int 
;; Registers used:
;;		status,2
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1397
	file	"../INT0.h"
	line	4
	global	__size_of_INT0_init
	__size_of_INT0_init	equ	__end_of_INT0_init-_INT0_init
	
_INT0_init:	
	opt	stack 8
; Regs used in _INT0_init: [status,2]
	line	5
	
l5940:	
	movlb 7	; select bank7
	clrf	(914)^0380h	;volatile
	line	6
	clrf	(913)^0380h	;volatile
	line	8
	
l5942:	
	bsf	(7307/8)^0380h,(7307)&7
	line	9
	
l5944:	
	bsf	(91/8),(91)&7
	line	10
	
l5946:	
	bcf	(88/8),(88)&7
	line	11
	
l1307:	
	return
	opt stack 0
GLOBAL	__end_of_INT0_init
	__end_of_INT0_init:
;; =============== function _INT0_init ends ============

	signat	_INT0_init,90
	global	_UART_init
psect	text1398,local,class=CODE,delta=2
global __ptext1398
__ptext1398:

;; *************** function _UART_init *****************
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1398
	file	"../UART.h"
	line	21
	global	__size_of_UART_init
	__size_of_UART_init	equ	__end_of_UART_init-_UART_init
	
_UART_init:	
	opt	stack 8
; Regs used in _UART_init: [wreg]
	line	23
	
l5928:	
	movlb 3	; select bank3
	bcf	(3169/8)^0180h,(3169)&7
	line	24
	movlb 1	; select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	26
	movlb 3	; select bank3
	bcf	(3168/8)^0180h,(3168)&7
	line	27
	movlb 1	; select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	30
	movlb 3	; select bank3
	bcf	(3316/8)^0180h,(3316)&7
	line	32
	bcf	(3314/8)^0180h,(3314)&7
	line	33
	bcf	(3323/8)^0180h,(3323)&7
	line	34
	
l5930:	
	movlw	(019h)
	movwf	(411)^0180h	;volatile
	line	36
	
l5932:	
	bsf	(3308/8)^0180h,(3308)&7
	line	38
	
l5934:	
	bsf	(3311/8)^0180h,(3311)&7
	line	39
	
l5936:	
	bsf	(3317/8)^0180h,(3317)&7
	line	42
	
l5938:	
	movlb 1	; select bank1
	bsf	(1165/8)^080h,(1165)&7
	line	43
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	line	48
	
l1292:	
	return
	opt stack 0
GLOBAL	__end_of_UART_init
	__end_of_UART_init:
;; =============== function _UART_init ends ============

	signat	_UART_init,88
	global	_FNC
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:

;; *************** function _FNC *****************
;; Defined at:
;;		line 16 in file "../INTERRUPT.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_UART_byte_receive
;;		_UART_byte_send
;;		_EEPROM_WriteByte
;;		_EEPROM_ReadByte
;;		i1___awmod
;;		i1_display_number
;;		_display_message
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"../INTERRUPT.h"
	line	16
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 2
; Regs used in _FNC: [allreg]
psect	intentry
	pagesel	$
	movlb 0	; select bank0
	movf	btemp+1,w
	movwf	(??_FNC+2)
	line	17
	
i1l5080:	
	btfss	(141/8),(141)&7
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l1313
u414_20:
	line	19
	
i1l5082:	
	btfss	(136/8),(136)&7
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l1314
u415_20:
	line	21
	
i1l5084:	
	bcf	(136/8),(136)&7
	line	22
	
i1l1314:	
	line	23
	btfss	(192/8),(192)&7
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l1315
u416_20:
	line	25
	
i1l5086:	
	clrf	(_timer_closed)
	bsf	status,0
	rlf	(_timer_closed),f
	line	26
	goto	i1l1316
	line	27
	
i1l1315:	
	clrf	(_timer_closed)
	
i1l1316:	
	line	29
	bcf	(192/8),(192)&7
	line	30
	
i1l5088:	
	fcall	_UART_byte_receive
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_received_byte)
	line	31
	goto	i1l5128
	line	33
	
i1l1318:	
	line	34
	
i1l5090:	
	fcall	_UART_byte_receive
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_message_len)
	line	35
	
i1l5092:	
	opt asmopt_off
movlw	52
movwf	((??_FNC+0)+0+1),f
	movlw	241
movwf	((??_FNC+0)+0),f
u656_27:
	decfsz	((??_FNC+0)+0),f
	goto	u656_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u656_27
	nop2
opt asmopt_on

	line	36
	
i1l5094:	
	movlw	(054h)
	fcall	_UART_byte_send
	line	37
	
i1l5096:	
	opt asmopt_off
movlw	26
	movlb 0	; select bank0
movwf	((??_FNC+0)+0+1),f
	movlw	248
movwf	((??_FNC+0)+0),f
u657_27:
	decfsz	((??_FNC+0)+0),f
	goto	u657_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u657_27
	clrwdt
opt asmopt_on

	line	38
	
i1l5098:	
	fcall	_UART_byte_receive
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_message_type)
	line	39
	
i1l5100:	
	opt asmopt_off
movlw	26
movwf	((??_FNC+0)+0+1),f
	movlw	248
movwf	((??_FNC+0)+0),f
u658_27:
	decfsz	((??_FNC+0)+0),f
	goto	u658_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u658_27
	clrwdt
opt asmopt_on

	line	40
	
i1l5102:	
	movlw	(054h)
	fcall	_UART_byte_send
	line	41
	opt asmopt_off
movlw	26
	movlb 0	; select bank0
movwf	((??_FNC+0)+0+1),f
	movlw	248
movwf	((??_FNC+0)+0),f
u659_27:
	decfsz	((??_FNC+0)+0),f
	goto	u659_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u659_27
	clrwdt
opt asmopt_on

	line	42
	
i1l5104:	
	movlb 0	; select bank0
	movf	(_message_len),w
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(?_EEPROM_WriteByte)
	movf	(_message_type),w
	fcall	_EEPROM_WriteByte
	line	47
	
i1l5106:	
	movlb 0	; select bank0
	clrf	(FNC@a)
	goto	i1l5120
	line	48
	
i1l1320:	
	line	49
	
i1l5108:	
	fcall	_UART_byte_receive
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_received_byte)
	line	50
	
i1l5110:	
	movf	(_received_byte),w
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(?_EEPROM_WriteByte)
	movf	(FNC@a),w
	addwf	(_message_type),w
	addlw	01h
	fcall	_EEPROM_WriteByte
	line	51
	
i1l5112:	
	opt asmopt_off
movlw	32
	movlb 0	; select bank0
movwf	((??_FNC+0)+0+1),f
	movlw	41
movwf	((??_FNC+0)+0),f
u660_27:
	decfsz	((??_FNC+0)+0),f
	goto	u660_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u660_27
	nop2
opt asmopt_on

	line	52
	
i1l5114:	
	movlw	(054h)
	fcall	_UART_byte_send
	line	53
	
i1l5116:	
	opt asmopt_off
movlw	32
	movlb 0	; select bank0
movwf	((??_FNC+0)+0+1),f
	movlw	41
movwf	((??_FNC+0)+0),f
u661_27:
	decfsz	((??_FNC+0)+0),f
	goto	u661_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u661_27
	nop2
opt asmopt_on

	line	47
	
i1l5118:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(FNC@a),f
	goto	i1l5120
	
i1l1319:	
	
i1l5120:	
	movf	(_message_len),w
	subwf	(FNC@a),w
	skipc
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l5108
u417_20:
	goto	i1l5122
	
i1l1321:	
	line	57
	
i1l5122:	
	movlw	(054h)
	fcall	_UART_byte_send
	line	58
	
i1l5124:	
	opt asmopt_off
movlw	32
	movlb 0	; select bank0
movwf	((??_FNC+0)+0+1),f
	movlw	41
movwf	((??_FNC+0)+0),f
u662_27:
	decfsz	((??_FNC+0)+0),f
	goto	u662_27
	decfsz	((??_FNC+0)+0+1),f
	goto	u662_27
	nop2
opt asmopt_on

	line	59
	goto	i1l5130
	line	61
	
i1l5126:	
	goto	i1l5130
	line	31
	
i1l1317:	
	
i1l5128:	
	movlb 0	; select bank0
	movf	(_received_byte),w
	; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 77 to 77
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	77^0	; case 77
	skipnz
	goto	i1l5090
	goto	i1l5130
	opt asmopt_on

	line	61
	
i1l1322:	
	line	64
	
i1l5130:	
	movlb 0	; select bank0
	movf	(_timer_closed),w
	xorlw	01h&0ffh
	skipz
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l1336
u418_20:
	line	65
	
i1l5132:	
	bsf	(192/8),(192)&7
	goto	i1l1336
	
i1l1323:	
	line	70
	goto	i1l1336
	line	72
	
i1l1313:	
	line	73
	btfss	(136/8),(136)&7
	goto	u419_21
	goto	u419_20
u419_21:
	goto	i1l1325
u419_20:
	line	75
	
i1l5134:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_timer_count),f
	line	76
	
i1l5136:	
	movf	(_timer_count),w
	xorlw	014h&0ffh
	skipz
	goto	u420_21
	goto	u420_20
u420_21:
	goto	i1l5166
u420_20:
	line	79
	
i1l5138:	
	clrf	(_timer_count)
	line	80
	
i1l5140:	
	movf	(_second_count),f
	skipz
	goto	u421_21
	goto	u421_20
u421_21:
	goto	i1l5148
u421_20:
	line	82
	
i1l5142:	
	movlw	(0)
	fcall	_EEPROM_ReadByte
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_second_count)
	line	84
	
i1l5144:	
	movlw	(060h)
	subwf	(_second_count),w
	skipc
	goto	u422_21
	goto	u422_20
u422_21:
	goto	i1l5148
u422_20:
	line	85
	
i1l5146:	
	clrf	(_second_count)
	goto	i1l5148
	
i1l1328:	
	goto	i1l5148
	line	87
	
i1l1327:	
	line	89
	
i1l5148:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_second_count),f
	line	93
	
i1l5150:	
	movlw	low(05h)
	movwf	(?i1___awmod)
	movlw	high(05h)
	movwf	((?i1___awmod))+1
	movf	(_second_count),w
	movwf	(??_FNC+0)+0
	clrf	(??_FNC+0)+0+1
	movf	0+(??_FNC+0)+0,w
	movwf	0+(?i1___awmod)+02h
	movf	1+(??_FNC+0)+0,w
	movwf	1+(?i1___awmod)+02h
	fcall	i1___awmod
	movf	((1+(?i1___awmod))),w
	iorwf	((0+(?i1___awmod))),w
	skipz
	goto	u423_21
	goto	u423_20
u423_21:
	goto	i1l5154
u423_20:
	line	94
	
i1l5152:	
	movlb 0	; select bank0
	movf	(_second_count),w
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(?_EEPROM_WriteByte)
	movlw	(0)
	fcall	_EEPROM_WriteByte
	goto	i1l5154
	
i1l1329:	
	line	95
	
i1l5154:	
	movlb 0	; select bank0
	movf	(_second_count),w
	xorlw	063h&0ffh
	skipz
	goto	u424_21
	goto	u424_20
u424_21:
	goto	i1l5162
u424_20:
	line	97
	
i1l5156:	
	clrf	(?_EEPROM_WriteByte)
	movlw	(0)
	fcall	_EEPROM_WriteByte
	line	98
	
i1l5158:	
	movlb 0	; select bank0
	bcf	(192/8),(192)&7
	line	99
	
i1l5160:	
	movlw	(08h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	goto	i1l5162
	line	100
	
i1l1330:	
	line	101
	
i1l5162:	
	movlw	(05h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_what_to_display)
	line	102
	
i1l5164:	
	movf	(_second_count),w
	fcall	i1_display_number
	goto	i1l5166
	line	103
	
i1l1326:	
	line	105
	
i1l5166:	
	movlb 0	; select bank0
	bcf	(136/8),(136)&7
	line	106
	goto	i1l1336
	line	107
	
i1l1325:	
	line	109
	btfss	(88/8),(88)&7
	goto	u425_21
	goto	u425_20
u425_21:
	goto	i1l1336
u425_20:
	line	111
	
i1l5168:	
	movf	(_count_status),w
	xorlw	08h&0ffh
	skipz
	goto	u426_21
	goto	u426_20
u426_21:
	goto	i1l5184
u426_20:
	line	113
	
i1l5170:	
	movlw	(0C8h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_CURRENT_MESSAGE)
	line	114
	
i1l5172:	
	clrf	(_SHOWN_BYTES)
	line	115
	
i1l5174:	
	fcall	_display_message
	line	117
	
i1l5176:	
	movlw	(09h)
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	line	118
	
i1l5178:	
	movlw	low(03CAFh)
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	119
	
i1l5180:	
	clrf	(_second_count)
	line	120
	
i1l5182:	
	bsf	(192/8),(192)&7
	line	121
	goto	i1l5192
	line	122
	
i1l1333:	
	
i1l5184:	
	movf	(_count_status),w
	xorlw	09h&0ffh
	skipz
	goto	u427_21
	goto	u427_20
u427_21:
	goto	i1l5192
u427_20:
	line	124
	
i1l5186:	
	clrf	(?_EEPROM_WriteByte)
	movlw	(0)
	fcall	_EEPROM_WriteByte
	line	126
	
i1l5188:	
	movlw	(08h)
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	line	127
	
i1l5190:	
	bcf	(192/8),(192)&7
	goto	i1l5192
	line	129
	
i1l1335:	
	goto	i1l5192
	line	131
	
i1l1334:	
	
i1l5192:	
	bcf	(88/8),(88)&7
	goto	i1l1336
	line	132
	
i1l1332:	
	goto	i1l1336
	line	134
	
i1l1331:	
	goto	i1l1336
	
i1l1324:	
	
i1l1336:	
	movf	(??_FNC+2),w
	movwf	btemp+1
	retfie
	opt stack 0
GLOBAL	__end_of_FNC
	__end_of_FNC:
;; =============== function _FNC ends ============

	signat	_FNC,88
	global	_display_message
psect	text1400,local,class=CODE,delta=2
global __ptext1400
__ptext1400:

;; *************** function _display_message *****************
;; Defined at:
;;		line 63 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               2    5[BANK0 ] int 
;;  message_len     1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_EEPROM_ReadByte
;;		i1_lcd_yaz
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text1400
	file	"../OneWireLCD.h"
	line	63
	global	__size_of_display_message
	__size_of_display_message	equ	__end_of_display_message-_display_message
	
_display_message:	
	opt	stack 2
; Regs used in _display_message: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	64
	
i1l4936:	
	movlb 0	; select bank0
	movf	(_CURRENT_MESSAGE),w
	fcall	_EEPROM_ReadByte
	movlb 0	; select bank0
	movwf	(??_display_message+0)+0
	movf	(??_display_message+0)+0,w
	movwf	(display_message@message_len)
	line	66
	
i1l4938:	
	clrf	(display_message@a)
	clrf	(display_message@a+1)
	
i1l4940:	
	movf	(display_message@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(020h))^80h
	subwf	btemp+1,w
	skipz
	goto	u394_25
	movlw	low(020h)
	subwf	(display_message@a),w
u394_25:

	skipc
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l4944
u394_20:
	goto	i1l1194
	
i1l4942:	
	goto	i1l1194
	line	67
	
i1l1191:	
	line	68
	
i1l4944:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_display_message+0)+0
	movf	(??_display_message+0)+0,w
	addwf	(_SHOWN_BYTES),f
	line	69
	
i1l4946:	
	movf	(_SHOWN_BYTES),w
	subwf	(display_message@message_len),w
	skipnc
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l4950
u395_20:
	goto	i1l1194
	
i1l4948:	
	goto	i1l1194
	
i1l1193:	
	line	70
	
i1l4950:	
	movf	(_CURRENT_MESSAGE),w
	addwf	(_SHOWN_BYTES),w
	fcall	_EEPROM_ReadByte
	fcall	i1_lcd_yaz
	line	66
	
i1l4952:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(display_message@a),f
	movlw	high(01h)
	addwfc	(display_message@a+1),f
	
i1l4954:	
	movf	(display_message@a+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(020h))^80h
	subwf	btemp+1,w
	skipz
	goto	u396_25
	movlw	low(020h)
	subwf	(display_message@a),w
u396_25:

	skipc
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l4944
u396_20:
	goto	i1l1194
	
i1l1192:	
	line	74
	
i1l1194:	
	return
	opt stack 0
GLOBAL	__end_of_display_message
	__end_of_display_message:
;; =============== function _display_message ends ============

	signat	_display_message,88
	global	i1_lcd_yaz
psect	text1401,local,class=CODE,delta=2
global __ptext1401
__ptext1401:

;; *************** function i1_lcd_yaz *****************
;; Defined at:
;;		line 214 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  lcd_yaz         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  lcd_yaz         1    2[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		i1_lcd_info
;;		i1_lcd_goto
;; This function is called by:
;;		_display_message
;; This function uses a non-reentrant model
;;
psect	text1401
	file	"../OneWireLCD.h"
	line	214
	global	__size_ofi1_lcd_yaz
	__size_ofi1_lcd_yaz	equ	__end_ofi1_lcd_yaz-i1_lcd_yaz
	
i1_lcd_yaz:	
	opt	stack 2
; Regs used in i1_lcd_yaz: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(i1lcd_yaz@data)
	line	215
	
i1l5442:	
	clrf	(?i1_lcd_info)
	bsf	status,0
	rlf	(?i1_lcd_info),f
	movf	(i1lcd_yaz@data),w
	fcall	i1_lcd_info
	line	216
	
i1l5444:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??i1_lcd_yaz+0)+0
	movf	(??i1_lcd_yaz+0)+0,w
	addwf	(__x),f
	line	217
	
i1l5446:	
	movf	(__x),w
	xorlw	011h&0ffh
	skipz
	goto	u486_21
	goto	u486_20
u486_21:
	goto	i1l1221
u486_20:
	line	219
	
i1l5448:	
	clrf	(__x)
	bsf	status,0
	rlf	(__x),f
	line	220
	
i1l5450:	
	movlw	(01h)
	movwf	(??i1_lcd_yaz+0)+0
	movf	(??i1_lcd_yaz+0)+0,w
	addwf	(__y),f
	line	221
	movf	(__y),w
	xorlw	03h&0ffh
	skipz
	goto	u487_21
	goto	u487_20
u487_21:
	goto	i1l5454
u487_20:
	line	223
	
i1l5452:	
	clrf	(__y)
	bsf	status,0
	rlf	(__y),f
	goto	i1l5454
	line	224
	
i1l1220:	
	line	226
	
i1l5454:	
	movf	(__x),w
	movwf	(??i1_lcd_yaz+0)+0
	movf	(??i1_lcd_yaz+0)+0,w
	movwf	(?i1_lcd_goto)
	movf	(__y),w
	fcall	i1_lcd_goto
	goto	i1l1221
	line	229
	
i1l1219:	
	line	231
	
i1l1221:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_yaz
	__end_ofi1_lcd_yaz:
;; =============== function i1_lcd_yaz ends ============

	signat	i1_lcd_yaz,88
	global	i1_display_number
psect	text1402,local,class=CODE,delta=2
global __ptext1402
__ptext1402:

;; *************** function i1_display_number *****************
;; Defined at:
;;		line 58 in file "../7Segments.h"
;; Parameters:    Size  Location     Type
;;  display_numb    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  display_numb    1   12[COMMON] unsigned char 
;;  display_numb    1   13[COMMON] unsigned char 
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
;;      Locals:         2       0       0       0
;;      Temps:          0       3       0       0
;;      Totals:         2       3       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		i1___awdiv
;;		i1_set_segment_shift
;;		i1___awmod
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text1402
	file	"../7Segments.h"
	line	58
	global	__size_ofi1_display_number
	__size_ofi1_display_number	equ	__end_ofi1_display_number-i1_display_number
	
i1_display_number:	
	opt	stack 4
; Regs used in i1_display_number: [wreg+fsr1l-status,0+pclath+cstack]
	movwf	(i1display_number@number)
	line	59
	
i1l5480:	
	movlw	low(0Ah)
	movwf	(?i1___awdiv)
	movlw	high(0Ah)
	movwf	((?i1___awdiv))+1
	movf	(i1display_number@number),w
	movlb 0	; select bank0
	movwf	(??i1_display_number+0)+0
	clrf	(??i1_display_number+0)+0+1
	movf	0+(??i1_display_number+0)+0,w
	movwf	0+(?i1___awdiv)+02h
	movf	1+(??i1_display_number+0)+0,w
	movwf	1+(?i1___awdiv)+02h
	fcall	i1___awdiv
	movf	(0+(?i1___awdiv)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	comf	indf1,w
	movlb 0	; select bank0
	movwf	(??i1_display_number+2)+0
	movf	(??i1_display_number+2)+0,w
	movwf	(i1display_number@digit)
	line	60
	
i1l5482:	
	movf	(_what_to_display),w
	xorlw	02h&0ffh
	skipz
	goto	u491_21
	goto	u491_20
u491_21:
	goto	i1l5486
u491_20:
	line	61
	
i1l5484:	
	bsf	(i1display_number@digit)+(7/8),(7)&7
	goto	i1l5486
	
i1l1232:	
	line	63
	
i1l5486:	
	movf	(i1display_number@digit),w
	movwf	(??i1_display_number+0)+0
	movf	(??i1_display_number+0)+0,w
	movwf	(?i1_set_segment_shift)
	movlw	(03h)
	fcall	i1_set_segment_shift
	line	65
	
i1l5488:	
	movlw	low(0Ah)
	movwf	(?i1___awmod)
	movlw	high(0Ah)
	movwf	((?i1___awmod))+1
	movf	(i1display_number@number),w
	movlb 0	; select bank0
	movwf	(??i1_display_number+0)+0
	clrf	(??i1_display_number+0)+0+1
	movf	0+(??i1_display_number+0)+0,w
	movwf	0+(?i1___awmod)+02h
	movf	1+(??i1_display_number+0)+0,w
	movwf	1+(?i1___awmod)+02h
	fcall	i1___awmod
	movf	(0+(?i1___awmod)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	comf	indf1,w
	movlb 0	; select bank0
	movwf	(??i1_display_number+2)+0
	movf	(??i1_display_number+2)+0,w
	movwf	(i1display_number@digit)
	line	66
	
i1l5490:	
	movf	(_what_to_display),w
	xorlw	03h&0ffh
	skipz
	goto	u492_21
	goto	u492_20
u492_21:
	goto	i1l5494
u492_20:
	line	67
	
i1l5492:	
	bsf	(i1display_number@digit)+(7/8),(7)&7
	goto	i1l5494
	
i1l1233:	
	line	68
	
i1l5494:	
	movf	(i1display_number@digit),w
	movwf	(??i1_display_number+0)+0
	movf	(??i1_display_number+0)+0,w
	movwf	(?i1_set_segment_shift)
	movlw	(04h)
	fcall	i1_set_segment_shift
	line	70
	
i1l1234:	
	return
	opt stack 0
GLOBAL	__end_ofi1_display_number
	__end_ofi1_display_number:
;; =============== function i1_display_number ends ============

	signat	i1_display_number,88
	global	i1_lcd_goto
psect	text1403,local,class=CODE,delta=2
global __ptext1403
__ptext1403:

;; *************** function i1_lcd_goto *****************
;; Defined at:
;;		line 171 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  lcd_goto        1    wreg     unsigned char 
;;  lcd_goto        1   11[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  lcd_goto        1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0
;;      Temps:          2       0       0       0
;;      Totals:         3       1       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		i1_lcd_info
;; This function is called by:
;;		i1_lcd_yaz
;; This function uses a non-reentrant model
;;
psect	text1403
	file	"../OneWireLCD.h"
	line	171
	global	__size_ofi1_lcd_goto
	__size_ofi1_lcd_goto	equ	__end_ofi1_lcd_goto-i1_lcd_goto
	
i1_lcd_goto:	
	opt	stack 2
; Regs used in i1_lcd_goto: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(i1lcd_goto@p_1)
	line	172
	
i1l5434:	
	movf	(i1lcd_goto@p_1),w
	movwf	(??i1_lcd_goto+0)+0
	movf	(??i1_lcd_goto+0)+0,w
	movwf	(__y)
	line	173
	movf	(i1lcd_goto@p_2),w
	movwf	(??i1_lcd_goto+0)+0
	movf	(??i1_lcd_goto+0)+0,w
	movwf	(__x)
	line	174
	movf	(i1lcd_goto@p_1),w
	xorlw	01h&0ffh
	skipz
	goto	u485_21
	goto	u485_20
u485_21:
	goto	i1l5438
u485_20:
	line	175
	
i1l5436:	
	movlw	(02h)
	movwf	(??i1_lcd_goto+0)+0
	movf	(??i1_lcd_goto+0)+0,w
	movwf	(?i1_lcd_info)
	movf	(i1lcd_goto@p_2),w
	addlw	0FFh
	andlw	0Fh
	addlw	080h
	fcall	i1_lcd_info
	line	176
	goto	i1l5440
	
i1l1211:	
	line	177
	
i1l5438:	
	movlw	(02h)
	movwf	(??i1_lcd_goto+0)+0
	movf	(??i1_lcd_goto+0)+0,w
	movwf	(?i1_lcd_info)
	movf	(i1lcd_goto@p_2),w
	addlw	0FFh
	andlw	0Fh
	addlw	0C0h
	fcall	i1_lcd_info
	goto	i1l5440
	line	178
	
i1l1212:	
	line	179
	
i1l5440:	
	opt asmopt_off
movlw	6
movwf	((??i1_lcd_goto+0)+0+1),f
	movlw	48
movwf	((??i1_lcd_goto+0)+0),f
u663_27:
	decfsz	((??i1_lcd_goto+0)+0),f
	goto	u663_27
	decfsz	((??i1_lcd_goto+0)+0+1),f
	goto	u663_27
	clrwdt
opt asmopt_on

	line	180
	
i1l1213:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_goto
	__end_ofi1_lcd_goto:
;; =============== function i1_lcd_goto ends ============

	signat	i1_lcd_goto,88
	global	i1_set_segment_shift
psect	text1404,local,class=CODE,delta=2
global __ptext1404
__ptext1404:

;; *************** function i1_set_segment_shift *****************
;; Defined at:
;;		line 34 in file "../7Segments.h"
;; Parameters:    Size  Location     Type
;;  set_segment_    1    wreg     unsigned char 
;;  set_segment_    1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  set_segment_    1   10[COMMON] unsigned char 
;;  set_segment_    1   11[COMMON] char 
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
;;		i1_shift_reg_set_pin
;; This function is called by:
;;		i1_display_number
;; This function uses a non-reentrant model
;;
psect	text1404
	file	"../7Segments.h"
	line	34
	global	__size_ofi1_set_segment_shift
	__size_ofi1_set_segment_shift	equ	__end_ofi1_set_segment_shift-i1_set_segment_shift
	
i1_set_segment_shift:	
	opt	stack 4
; Regs used in i1_set_segment_shift: [wreg+status,2+status,0+pclath+cstack]
	line	36
	movwf	(i1set_segment_shift@segment_no)
	
i1l5456:	
	movlw	(07h)
	movwf	(??i1_set_segment_shift+0)+0
	movf	(??i1_set_segment_shift+0)+0,w
	movwf	(i1set_segment_shift@a)
	
i1l5458:	
	btfss	(i1set_segment_shift@a),7
	goto	u488_21
	goto	u488_20
u488_21:
	goto	i1l5462
u488_20:
	goto	i1l5474
	
i1l5460:	
	goto	i1l5474
	line	37
	
i1l1227:	
	line	39
	
i1l5462:	
	movf	(i1set_segment_shift@data),w
	movwf	(??i1_set_segment_shift+0)+0
	incf	(i1set_segment_shift@a),w
	goto	u489_24
u489_25:
	lsrf	(??i1_set_segment_shift+0)+0,f
u489_24:
	decfsz	wreg,f
	goto	u489_25
	movf	0+(??i1_set_segment_shift+0)+0,w
	andlw	01h
	movwf	(??i1_set_segment_shift+1)+0
	movf	(??i1_set_segment_shift+1)+0,w
	movwf	(?i1_shift_reg_set_pin)
	movlw	(02h)
	fcall	i1_shift_reg_set_pin
	line	40
	
i1l5464:	
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	41
	
i1l5466:	
	clrf	(?i1_shift_reg_set_pin)
	bsf	status,0
	rlf	(?i1_shift_reg_set_pin),f
	movlw	(01h)
	fcall	i1_shift_reg_set_pin
	line	42
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	43
	
i1l5468:	
	clrf	(?i1_shift_reg_set_pin)
	movlw	(01h)
	fcall	i1_shift_reg_set_pin
	line	36
	
i1l5470:	
	movlw	(-1)
	movwf	(??i1_set_segment_shift+0)+0
	movf	(??i1_set_segment_shift+0)+0,w
	addwf	(i1set_segment_shift@a),f
	
i1l5472:	
	btfss	(i1set_segment_shift@a),7
	goto	u490_21
	goto	u490_20
u490_21:
	goto	i1l5462
u490_20:
	goto	i1l5474
	
i1l1228:	
	line	48
	
i1l5474:	
	clrf	(?i1_shift_reg_set_pin)
	bsf	status,0
	rlf	(?i1_shift_reg_set_pin),f
	movf	(i1set_segment_shift@segment_no),w
	fcall	i1_shift_reg_set_pin
	line	49
	
i1l5476:	
	opt asmopt_off
movlw	19
movwf	(??i1_set_segment_shift+0)+0,f
u664_27:
decfsz	(??i1_set_segment_shift+0)+0,f
	goto	u664_27
	nop2	;nop
opt asmopt_on

	line	50
	
i1l5478:	
	clrf	(?i1_shift_reg_set_pin)
	movf	(i1set_segment_shift@segment_no),w
	fcall	i1_shift_reg_set_pin
	line	53
	
i1l1229:	
	return
	opt stack 0
GLOBAL	__end_ofi1_set_segment_shift
	__end_ofi1_set_segment_shift:
;; =============== function i1_set_segment_shift ends ============

	signat	i1_set_segment_shift,88
	global	i1_lcd_info
psect	text1405,local,class=CODE,delta=2
global __ptext1405
__ptext1405:

;; *************** function i1_lcd_info *****************
;; Defined at:
;;		line 115 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  lcd_info        1    wreg     unsigned char 
;;  lcd_info        1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  lcd_info        1   10[COMMON] unsigned char 
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_shift_reg_set_pin_lcd
;; This function is called by:
;;		i1_lcd_goto
;;		i1_lcd_yaz
;; This function uses a non-reentrant model
;;
psect	text1405
	file	"../OneWireLCD.h"
	line	115
	global	__size_ofi1_lcd_info
	__size_ofi1_lcd_info	equ	__end_ofi1_lcd_info-i1_lcd_info
	
i1_lcd_info:	
	opt	stack 2
; Regs used in i1_lcd_info: [wreg+status,2+status,0+pclath+cstack]
	movwf	(i1lcd_info@c)
	line	116
	
i1l5394:	
	movf	(i1lcd_info@data_type),w
	xorlw	02h&0ffh
	skipz
	goto	u475_21
	goto	u475_20
u475_21:
	goto	i1l5398
u475_20:
	line	117
	
i1l5396:	
	clrf	(?i1_shift_reg_set_pin_lcd)
	movlw	(01h)
	fcall	i1_shift_reg_set_pin_lcd
	goto	i1l1198
	line	118
	
i1l1197:	
	
i1l5398:	
	clrf	(?i1_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?i1_shift_reg_set_pin_lcd),f
	movlw	(01h)
	fcall	i1_shift_reg_set_pin_lcd
	
i1l1198:	
	line	120
	clrf	(?i1_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?i1_shift_reg_set_pin_lcd),f
	movlw	(02h)
	fcall	i1_shift_reg_set_pin_lcd
	line	124
	
i1l5400:	
	movf	(i1lcd_info@c),w
	andlw	0F0h
	movwf	(??i1_lcd_info+0)+0
	movf	(??i1_lcd_info+0)+0,w
	movlb 0	; select bank0
	movwf	(__temp_)
	line	125
	
i1l5402:	
	movf	(__temp_),w
	movwf	(??i1_lcd_info+0)+0
	movlw	07h
u476_25:
	lsrf	(??i1_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u476_25
	movf	0+(??i1_lcd_info+0)+0,w
	andlw	01h
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movwf	(?i1_shift_reg_set_pin_lcd)
	movlw	(06h)
	fcall	i1_shift_reg_set_pin_lcd
	line	126
	
i1l5404:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??i1_lcd_info+0)+0
	movlw	06h
u477_25:
	lsrf	(??i1_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u477_25
	movf	0+(??i1_lcd_info+0)+0,w
	andlw	01h
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movwf	(?i1_shift_reg_set_pin_lcd)
	movlw	(05h)
	fcall	i1_shift_reg_set_pin_lcd
	line	127
	
i1l5406:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??i1_lcd_info+0)+0
	movlw	05h
u478_25:
	lsrf	(??i1_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u478_25
	movf	0+(??i1_lcd_info+0)+0,w
	andlw	01h
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movwf	(?i1_shift_reg_set_pin_lcd)
	movlw	(04h)
	fcall	i1_shift_reg_set_pin_lcd
	line	128
	
i1l5408:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??i1_lcd_info+0)+0
	movlw	04h
u479_25:
	lsrf	(??i1_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u479_25
	movf	0+(??i1_lcd_info+0)+0,w
	andlw	01h
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movwf	(?i1_shift_reg_set_pin_lcd)
	movlw	(03h)
	fcall	i1_shift_reg_set_pin_lcd
	line	131
	
i1l5410:	
	opt asmopt_off
movlw	21
movwf	((??i1_lcd_info+0)+0+1),f
	movlw	198
movwf	((??i1_lcd_info+0)+0),f
u665_27:
	decfsz	((??i1_lcd_info+0)+0),f
	goto	u665_27
	decfsz	((??i1_lcd_info+0)+0+1),f
	goto	u665_27
	clrwdt
opt asmopt_on

	line	132
	
i1l5412:	
	clrf	(?i1_shift_reg_set_pin_lcd)
	movlw	(02h)
	fcall	i1_shift_reg_set_pin_lcd
	line	135
	
i1l5414:	
	opt asmopt_off
movlw	21
movwf	((??i1_lcd_info+0)+0+1),f
	movlw	198
movwf	((??i1_lcd_info+0)+0),f
u666_27:
	decfsz	((??i1_lcd_info+0)+0),f
	goto	u666_27
	decfsz	((??i1_lcd_info+0)+0+1),f
	goto	u666_27
	clrwdt
opt asmopt_on

	line	136
	
i1l5416:	
	clrf	(?i1_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?i1_shift_reg_set_pin_lcd),f
	movlw	(02h)
	fcall	i1_shift_reg_set_pin_lcd
	line	138
	
i1l5418:	
	movf	(i1lcd_info@c),w
	andlw	0Fh
	movwf	(??i1_lcd_info+0)+0
	movlw	(04h)-1
u480_25:
	lslf	(??i1_lcd_info+0)+0,f
	addlw	-1
	skipz
	goto	u480_25
	lslf	(??i1_lcd_info+0)+0,w
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movlb 0	; select bank0
	movwf	(__temp_)
	line	140
	
i1l5420:	
	movf	(__temp_),w
	movwf	(??i1_lcd_info+0)+0
	movlw	07h
u481_25:
	lsrf	(??i1_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u481_25
	movf	0+(??i1_lcd_info+0)+0,w
	andlw	01h
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movwf	(?i1_shift_reg_set_pin_lcd)
	movlw	(06h)
	fcall	i1_shift_reg_set_pin_lcd
	line	141
	
i1l5422:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??i1_lcd_info+0)+0
	movlw	06h
u482_25:
	lsrf	(??i1_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u482_25
	movf	0+(??i1_lcd_info+0)+0,w
	andlw	01h
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movwf	(?i1_shift_reg_set_pin_lcd)
	movlw	(05h)
	fcall	i1_shift_reg_set_pin_lcd
	line	142
	
i1l5424:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??i1_lcd_info+0)+0
	movlw	05h
u483_25:
	lsrf	(??i1_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u483_25
	movf	0+(??i1_lcd_info+0)+0,w
	andlw	01h
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movwf	(?i1_shift_reg_set_pin_lcd)
	movlw	(04h)
	fcall	i1_shift_reg_set_pin_lcd
	line	143
	
i1l5426:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??i1_lcd_info+0)+0
	movlw	04h
u484_25:
	lsrf	(??i1_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u484_25
	movf	0+(??i1_lcd_info+0)+0,w
	andlw	01h
	movwf	(??i1_lcd_info+1)+0
	movf	(??i1_lcd_info+1)+0,w
	movwf	(?i1_shift_reg_set_pin_lcd)
	movlw	(03h)
	fcall	i1_shift_reg_set_pin_lcd
	line	148
	
i1l5428:	
	opt asmopt_off
movlw	21
movwf	((??i1_lcd_info+0)+0+1),f
	movlw	198
movwf	((??i1_lcd_info+0)+0),f
u667_27:
	decfsz	((??i1_lcd_info+0)+0),f
	goto	u667_27
	decfsz	((??i1_lcd_info+0)+0+1),f
	goto	u667_27
	clrwdt
opt asmopt_on

	line	149
	
i1l5430:	
	clrf	(?i1_shift_reg_set_pin_lcd)
	movlw	(02h)
	fcall	i1_shift_reg_set_pin_lcd
	line	152
	
i1l5432:	
	opt asmopt_off
movlw	52
movwf	((??i1_lcd_info+0)+0+1),f
	movlw	241
movwf	((??i1_lcd_info+0)+0),f
u668_27:
	decfsz	((??i1_lcd_info+0)+0),f
	goto	u668_27
	decfsz	((??i1_lcd_info+0)+0+1),f
	goto	u668_27
	nop2
opt asmopt_on

	line	153
	
i1l1199:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_info
	__end_ofi1_lcd_info:
;; =============== function i1_lcd_info ends ============

	signat	i1_lcd_info,88
	global	i1_shift_reg_set_pin_lcd
psect	text1406,local,class=CODE,delta=2
global __ptext1406
__ptext1406:

;; *************** function i1_shift_reg_set_pin_lcd *****************
;; Defined at:
;;		line 40 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  shift_reg_se    1    wreg     unsigned char 
;;  shift_reg_se    1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  shift_reg_se    1    6[COMMON] unsigned char 
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
;;		i1_load_shift_data_lcd
;; This function is called by:
;;		i1_lcd_info
;; This function uses a non-reentrant model
;;
psect	text1406
	file	"../OneWireLCD.h"
	line	40
	global	__size_ofi1_shift_reg_set_pin_lcd
	__size_ofi1_shift_reg_set_pin_lcd	equ	__end_ofi1_shift_reg_set_pin_lcd-i1_shift_reg_set_pin_lcd
	
i1_shift_reg_set_pin_lcd:	
	opt	stack 2
; Regs used in i1_shift_reg_set_pin_lcd: [wreg+status,2+status,0+pclath+cstack]
	movwf	(i1shift_reg_set_pin_lcd@pin_number)
	line	41
	
i1l5382:	
	movf	(i1shift_reg_set_pin_lcd@value),w
	andlw	01h
	movwf	(??i1_shift_reg_set_pin_lcd+0)+0
	movf	(??i1_shift_reg_set_pin_lcd+0)+0,w
	movwf	(i1shift_reg_set_pin_lcd@value)
	line	42
	
i1l5384:	
	movlw	low(01h)
	subwf	(i1shift_reg_set_pin_lcd@pin_number),f
	line	43
	
i1l5386:	
	movf	(i1shift_reg_set_pin_lcd@value),w
	skipz
	goto	u472_20
	goto	i1l5390
u472_20:
	line	45
	
i1l5388:	
	movlw	(01h)
	movwf	(??i1_shift_reg_set_pin_lcd+0)+0
	incf	(i1shift_reg_set_pin_lcd@pin_number),w
	goto	u473_24
u473_25:
	lslf	(??i1_shift_reg_set_pin_lcd+0)+0,f
u473_24:
	decfsz	wreg,f
	goto	u473_25
	movf	0+(??i1_shift_reg_set_pin_lcd+0)+0,w
	movwf	(??i1_shift_reg_set_pin_lcd+1)+0
	movf	(??i1_shift_reg_set_pin_lcd+1)+0,w
	movlb 0	; select bank0
	iorwf	(_current_value_lcd),f
	line	46
	goto	i1l5392
	line	47
	
i1l1186:	
	line	49
	
i1l5390:	
	movlw	(01h)
	movwf	(??i1_shift_reg_set_pin_lcd+0)+0
	incf	(i1shift_reg_set_pin_lcd@pin_number),w
	goto	u474_24
u474_25:
	lslf	(??i1_shift_reg_set_pin_lcd+0)+0,f
u474_24:
	decfsz	wreg,f
	goto	u474_25
	movf	0+(??i1_shift_reg_set_pin_lcd+0)+0,w
	xorlw	0ffh
	movwf	(??i1_shift_reg_set_pin_lcd+1)+0
	movf	(??i1_shift_reg_set_pin_lcd+1)+0,w
	movlb 0	; select bank0
	andwf	(_current_value_lcd),f
	goto	i1l5392
	line	50
	
i1l1187:	
	line	52
	
i1l5392:	
	movf	(_current_value_lcd),w
	fcall	i1_load_shift_data_lcd
	line	54
	
i1l1188:	
	return
	opt stack 0
GLOBAL	__end_ofi1_shift_reg_set_pin_lcd
	__end_ofi1_shift_reg_set_pin_lcd:
;; =============== function i1_shift_reg_set_pin_lcd ends ============

	signat	i1_shift_reg_set_pin_lcd,88
	global	i1_shift_reg_set_pin
psect	text1407,local,class=CODE,delta=2
global __ptext1407
__ptext1407:

;; *************** function i1_shift_reg_set_pin *****************
;; Defined at:
;;		line 43 in file "../OneWireShiftRegister.h"
;; Parameters:    Size  Location     Type
;;  shift_reg_se    1    wreg     unsigned char 
;;  shift_reg_se    1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  shift_reg_se    1    6[COMMON] unsigned char 
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
;;		i1_load_shift_data
;; This function is called by:
;;		i1_set_segment_shift
;; This function uses a non-reentrant model
;;
psect	text1407
	file	"../OneWireShiftRegister.h"
	line	43
	global	__size_ofi1_shift_reg_set_pin
	__size_ofi1_shift_reg_set_pin	equ	__end_ofi1_shift_reg_set_pin-i1_shift_reg_set_pin
	
i1_shift_reg_set_pin:	
	opt	stack 4
; Regs used in i1_shift_reg_set_pin: [wreg+status,2+status,0+pclath+cstack]
	movwf	(i1shift_reg_set_pin@pin_number)
	line	44
	
i1l5344:	
	movf	(i1shift_reg_set_pin@value),w
	skipz
	goto	u464_20
	goto	i1l1172
u464_20:
	
i1l5346:	
	clrf	(i1shift_reg_set_pin@value)
	bsf	status,0
	rlf	(i1shift_reg_set_pin@value),f
	goto	i1l5348
	line	45
	
i1l1172:	
	clrf	(i1shift_reg_set_pin@value)
	goto	i1l5348
	
i1l1173:	
	line	46
	
i1l5348:	
	movlw	low(01h)
	subwf	(i1shift_reg_set_pin@pin_number),f
	line	47
	
i1l5350:	
	movf	(i1shift_reg_set_pin@value),w
	skipz
	goto	u465_20
	goto	i1l5354
u465_20:
	line	49
	
i1l5352:	
	movlw	(01h)
	movwf	(??i1_shift_reg_set_pin+0)+0
	incf	(i1shift_reg_set_pin@pin_number),w
	goto	u466_24
u466_25:
	lslf	(??i1_shift_reg_set_pin+0)+0,f
u466_24:
	decfsz	wreg,f
	goto	u466_25
	movf	0+(??i1_shift_reg_set_pin+0)+0,w
	movwf	(??i1_shift_reg_set_pin+1)+0
	movf	(??i1_shift_reg_set_pin+1)+0,w
	movlb 0	; select bank0
	iorwf	(_current_value),f
	line	50
	goto	i1l5356
	line	51
	
i1l1174:	
	line	53
	
i1l5354:	
	movlw	(01h)
	movwf	(??i1_shift_reg_set_pin+0)+0
	incf	(i1shift_reg_set_pin@pin_number),w
	goto	u467_24
u467_25:
	lslf	(??i1_shift_reg_set_pin+0)+0,f
u467_24:
	decfsz	wreg,f
	goto	u467_25
	movf	0+(??i1_shift_reg_set_pin+0)+0,w
	xorlw	0ffh
	movwf	(??i1_shift_reg_set_pin+1)+0
	movf	(??i1_shift_reg_set_pin+1)+0,w
	movlb 0	; select bank0
	andwf	(_current_value),f
	goto	i1l5356
	line	55
	
i1l1175:	
	line	57
	
i1l5356:	
	movf	(_current_value),w
	fcall	i1_load_shift_data
	line	59
	
i1l1176:	
	return
	opt stack 0
GLOBAL	__end_ofi1_shift_reg_set_pin
	__end_ofi1_shift_reg_set_pin:
;; =============== function i1_shift_reg_set_pin ends ============

	signat	i1_shift_reg_set_pin,88
	global	i1_load_shift_data_lcd
psect	text1408,local,class=CODE,delta=2
global __ptext1408
__ptext1408:

;; *************** function i1_load_shift_data_lcd *****************
;; Defined at:
;;		line 6 in file "../OneWireLCD.h"
;; Parameters:    Size  Location     Type
;;  load_shift_d    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  load_shift_d    1    1[COMMON] unsigned char 
;;  load_shift_d    1    2[COMMON] char 
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
;;		i1_shift_reg_set_pin_lcd
;; This function uses a non-reentrant model
;;
psect	text1408
	file	"../OneWireLCD.h"
	line	6
	global	__size_ofi1_load_shift_data_lcd
	__size_ofi1_load_shift_data_lcd	equ	__end_ofi1_load_shift_data_lcd-i1_load_shift_data_lcd
	
i1_load_shift_data_lcd:	
	opt	stack 2
; Regs used in i1_load_shift_data_lcd: [wreg+status,2+status,0]
	movwf	(i1load_shift_data_lcd@data)
	line	7
	
i1l5358:	
	movlw	(07h)
	movwf	(??i1_load_shift_data_lcd+0)+0
	movf	(??i1_load_shift_data_lcd+0)+0,w
	movwf	(i1load_shift_data_lcd@a)
	
i1l5360:	
	btfss	(i1load_shift_data_lcd@a),7
	goto	u468_21
	goto	u468_20
u468_21:
	goto	i1l5364
u468_20:
	goto	i1l1180
	
i1l5362:	
	goto	i1l1180
	line	8
	
i1l1179:	
	line	10
	
i1l5364:	
	movf	(i1load_shift_data_lcd@data),w
	movwf	(??i1_load_shift_data_lcd+0)+0
	incf	(i1load_shift_data_lcd@a),w
	goto	u469_24
u469_25:
	lsrf	(??i1_load_shift_data_lcd+0)+0,f
u469_24:
	decfsz	wreg,f
	goto	u469_25
	btfss	0+(??i1_load_shift_data_lcd+0)+0,(0)&7
	goto	u470_21
	goto	u470_20
u470_21:
	goto	i1l1181
u470_20:
	line	13
	
i1l5366:	
# 13 "../OneWireLCD.h"
banksel _PORTA ;#
	line	14
# 14 "../OneWireLCD.h"
bcf _PORTA, 2 ;#
	line	15
# 15 "../OneWireLCD.h"
nop ;#
	line	16
# 16 "../OneWireLCD.h"
nop ;#
	line	17
# 17 "../OneWireLCD.h"
bsf _PORTA, 2 ;#
psect	text1408
	line	20
	
i1l5368:	
	opt asmopt_off
movlw	19
movwf	(??i1_load_shift_data_lcd+0)+0,f
u669_27:
decfsz	(??i1_load_shift_data_lcd+0)+0,f
	goto	u669_27
	nop2	;nop
opt asmopt_on

	line	21
	goto	i1l5374
	line	22
	
i1l1181:	
	line	24
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	25
	
i1l5370:	
	opt asmopt_off
movlw	19
movwf	(??i1_load_shift_data_lcd+0)+0,f
u670_27:
decfsz	(??i1_load_shift_data_lcd+0)+0,f
	goto	u670_27
	nop2	;nop
opt asmopt_on

	line	26
	
i1l5372:	
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	27
	opt asmopt_off
movlw	39
movwf	(??i1_load_shift_data_lcd+0)+0,f
u671_27:
decfsz	(??i1_load_shift_data_lcd+0)+0,f
	goto	u671_27
	nop2	;nop
opt asmopt_on

	goto	i1l5374
	line	28
	
i1l1182:	
	line	7
	
i1l5374:	
	movlw	(-1)
	movwf	(??i1_load_shift_data_lcd+0)+0
	movf	(??i1_load_shift_data_lcd+0)+0,w
	addwf	(i1load_shift_data_lcd@a),f
	
i1l5376:	
	btfss	(i1load_shift_data_lcd@a),7
	goto	u471_21
	goto	u471_20
u471_21:
	goto	i1l5364
u471_20:
	
i1l1180:	
	line	32
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	33
	
i1l5378:	
	opt asmopt_off
movlw	159
movwf	(??i1_load_shift_data_lcd+0)+0,f
u672_27:
	nop2
decfsz	(??i1_load_shift_data_lcd+0)+0,f
	goto	u672_27
opt asmopt_on

	line	34
	
i1l5380:	
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	35
	opt asmopt_off
movlw	239
movwf	(??i1_load_shift_data_lcd+0)+0,f
u673_27:
	nop2
decfsz	(??i1_load_shift_data_lcd+0)+0,f
	goto	u673_27
	nop2	;nop
	nop2	;nop
opt asmopt_on

	line	38
	
i1l1183:	
	return
	opt stack 0
GLOBAL	__end_ofi1_load_shift_data_lcd
	__end_ofi1_load_shift_data_lcd:
;; =============== function i1_load_shift_data_lcd ends ============

	signat	i1_load_shift_data_lcd,88
	global	i1_load_shift_data
psect	text1409,local,class=CODE,delta=2
global __ptext1409
__ptext1409:

;; *************** function i1_load_shift_data *****************
;; Defined at:
;;		line 8 in file "../OneWireShiftRegister.h"
;; Parameters:    Size  Location     Type
;;  load_shift_d    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  load_shift_d    1    1[COMMON] unsigned char 
;;  load_shift_d    1    2[COMMON] char 
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
;;		i1_shift_reg_set_pin
;; This function uses a non-reentrant model
;;
psect	text1409
	file	"../OneWireShiftRegister.h"
	line	8
	global	__size_ofi1_load_shift_data
	__size_ofi1_load_shift_data	equ	__end_ofi1_load_shift_data-i1_load_shift_data
	
i1_load_shift_data:	
	opt	stack 4
; Regs used in i1_load_shift_data: [wreg+status,2+status,0]
	line	10
	movwf	(i1load_shift_data@data)
	
i1l5320:	
	movlw	(07h)
	movwf	(??i1_load_shift_data+0)+0
	movf	(??i1_load_shift_data+0)+0,w
	movwf	(i1load_shift_data@a)
	
i1l5322:	
	btfss	(i1load_shift_data@a),7
	goto	u460_21
	goto	u460_20
u460_21:
	goto	i1l5326
u460_20:
	goto	i1l1166
	
i1l5324:	
	goto	i1l1166
	line	11
	
i1l1165:	
	line	13
	
i1l5326:	
	movf	(i1load_shift_data@data),w
	movwf	(??i1_load_shift_data+0)+0
	incf	(i1load_shift_data@a),w
	goto	u461_24
u461_25:
	lsrf	(??i1_load_shift_data+0)+0,f
u461_24:
	decfsz	wreg,f
	goto	u461_25
	btfss	0+(??i1_load_shift_data+0)+0,(0)&7
	goto	u462_21
	goto	u462_20
u462_21:
	goto	i1l1167
u462_20:
	line	16
	
i1l5328:	
# 16 "../OneWireShiftRegister.h"
banksel _PORTA ;#
	line	17
# 17 "../OneWireShiftRegister.h"
bcf _PORTA, 5 ;#
	line	18
# 18 "../OneWireShiftRegister.h"
nop ;#
	line	19
# 19 "../OneWireShiftRegister.h"
nop ;#
	line	20
# 20 "../OneWireShiftRegister.h"
bsf _PORTA, 5 ;#
psect	text1409
	line	23
	
i1l5330:	
	opt asmopt_off
movlw	19
movwf	(??i1_load_shift_data+0)+0,f
u674_27:
decfsz	(??i1_load_shift_data+0)+0,f
	goto	u674_27
	nop2	;nop
opt asmopt_on

	line	24
	goto	i1l5336
	line	25
	
i1l1167:	
	line	27
	movlb 0	; select bank0
	bcf	(101/8),(101)&7
	line	28
	
i1l5332:	
	opt asmopt_off
movlw	19
movwf	(??i1_load_shift_data+0)+0,f
u675_27:
decfsz	(??i1_load_shift_data+0)+0,f
	goto	u675_27
	nop2	;nop
opt asmopt_on

	line	29
	
i1l5334:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	30
	opt asmopt_off
movlw	39
movwf	(??i1_load_shift_data+0)+0,f
u676_27:
decfsz	(??i1_load_shift_data+0)+0,f
	goto	u676_27
	nop2	;nop
opt asmopt_on

	goto	i1l5336
	line	31
	
i1l1168:	
	line	10
	
i1l5336:	
	movlw	(-1)
	movwf	(??i1_load_shift_data+0)+0
	movf	(??i1_load_shift_data+0)+0,w
	addwf	(i1load_shift_data@a),f
	
i1l5338:	
	btfss	(i1load_shift_data@a),7
	goto	u463_21
	goto	u463_20
u463_21:
	goto	i1l5326
u463_20:
	
i1l1166:	
	line	35
	movlb 0	; select bank0
	bcf	(101/8),(101)&7
	line	36
	
i1l5340:	
	opt asmopt_off
movlw	159
movwf	(??i1_load_shift_data+0)+0,f
u677_27:
	nop2
decfsz	(??i1_load_shift_data+0)+0,f
	goto	u677_27
opt asmopt_on

	line	37
	
i1l5342:	
	movlb 0	; select bank0
	bsf	(101/8),(101)&7
	line	38
	opt asmopt_off
movlw	239
movwf	(??i1_load_shift_data+0)+0,f
u678_27:
	nop2
decfsz	(??i1_load_shift_data+0)+0,f
	goto	u678_27
	nop2	;nop
	nop2	;nop
opt asmopt_on

	line	41
	
i1l1169:	
	return
	opt stack 0
GLOBAL	__end_ofi1_load_shift_data
	__end_ofi1_load_shift_data:
;; =============== function i1_load_shift_data ends ============

	signat	i1_load_shift_data,88
	global	i1___awmod
psect	text1410,local,class=CODE,delta=2
global __ptext1410
__ptext1410:

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
;;		_FNC
;;		i1_display_number
;; This function uses a non-reentrant model
;;
psect	text1410
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_ofi1___awmod
	__size_ofi1___awmod	equ	__end_ofi1___awmod-i1___awmod
	
i1___awmod:	
	opt	stack 6
; Regs used in i1___awmod: [wreg+status,2+status,0]
	line	8
	
i1l5536:	
	clrf	(i1___awmod@sign)
	line	9
	btfss	(i1___awmod@dividend+1),7
	goto	u503_21
	goto	u503_20
u503_21:
	goto	i1l5540
u503_20:
	line	10
	
i1l5538:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	line	11
	clrf	(i1___awmod@sign)
	bsf	status,0
	rlf	(i1___awmod@sign),f
	goto	i1l5540
	line	12
	
i1l2600:	
	line	13
	
i1l5540:	
	btfss	(i1___awmod@divisor+1),7
	goto	u504_21
	goto	u504_20
u504_21:
	goto	i1l5544
u504_20:
	line	14
	
i1l5542:	
	comf	(i1___awmod@divisor),f
	comf	(i1___awmod@divisor+1),f
	incf	(i1___awmod@divisor),f
	skipnz
	incf	(i1___awmod@divisor+1),f
	goto	i1l5544
	
i1l2601:	
	line	15
	
i1l5544:	
	movf	(i1___awmod@divisor+1),w
	iorwf	(i1___awmod@divisor),w
	skipnz
	goto	u505_21
	goto	u505_20
u505_21:
	goto	i1l5562
u505_20:
	line	16
	
i1l5546:	
	clrf	(i1___awmod@counter)
	bsf	status,0
	rlf	(i1___awmod@counter),f
	line	17
	goto	i1l5552
	
i1l2604:	
	line	18
	
i1l5548:	
	movlw	01h
	
u506_25:
	lslf	(i1___awmod@divisor),f
	rlf	(i1___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u506_25
	line	19
	
i1l5550:	
	movlw	(01h)
	movwf	(??i1___awmod+0)+0
	movf	(??i1___awmod+0)+0,w
	addwf	(i1___awmod@counter),f
	goto	i1l5552
	line	20
	
i1l2603:	
	line	17
	
i1l5552:	
	btfss	(i1___awmod@divisor+1),(15)&7
	goto	u507_21
	goto	u507_20
u507_21:
	goto	i1l5548
u507_20:
	goto	i1l5554
	
i1l2605:	
	goto	i1l5554
	line	21
	
i1l2606:	
	line	22
	
i1l5554:	
	movf	(i1___awmod@divisor+1),w
	subwf	(i1___awmod@dividend+1),w
	skipz
	goto	u508_25
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),w
u508_25:
	skipc
	goto	u508_21
	goto	u508_20
u508_21:
	goto	i1l5558
u508_20:
	line	23
	
i1l5556:	
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),f
	movf	(i1___awmod@divisor+1),w
	subwfb	(i1___awmod@dividend+1),f
	goto	i1l5558
	
i1l2607:	
	line	24
	
i1l5558:	
	movlw	01h
	
u509_25:
	lsrf	(i1___awmod@divisor+1),f
	rrf	(i1___awmod@divisor),f
	decfsz	wreg,f
	goto	u509_25
	line	25
	
i1l5560:	
	movlw	low(01h)
	subwf	(i1___awmod@counter),f
	btfss	status,2
	goto	u510_21
	goto	u510_20
u510_21:
	goto	i1l5554
u510_20:
	goto	i1l5562
	
i1l2608:	
	goto	i1l5562
	line	26
	
i1l2602:	
	line	27
	
i1l5562:	
	movf	(i1___awmod@sign),w
	skipz
	goto	u511_20
	goto	i1l5566
u511_20:
	line	28
	
i1l5564:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	goto	i1l5566
	
i1l2609:	
	line	29
	
i1l5566:	
	movf	(i1___awmod@dividend+1),w
	clrf	(?i1___awmod+1)
	addwf	(?i1___awmod+1)
	movf	(i1___awmod@dividend),w
	clrf	(?i1___awmod)
	addwf	(?i1___awmod)

	goto	i1l2610
	
i1l5568:	
	line	30
	
i1l2610:	
	return
	opt stack 0
GLOBAL	__end_ofi1___awmod
	__end_ofi1___awmod:
;; =============== function i1___awmod ends ============

	signat	i1___awmod,90
	global	i1___awdiv
psect	text1411,local,class=CODE,delta=2
global __ptext1411
__ptext1411:

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
psect	text1411
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_ofi1___awdiv
	__size_ofi1___awdiv	equ	__end_ofi1___awdiv-i1___awdiv
	
i1___awdiv:	
	opt	stack 6
; Regs used in i1___awdiv: [wreg+status,2+status,0]
	line	9
	
i1l5496:	
	clrf	(i1___awdiv@sign)
	line	10
	btfss	(i1___awdiv@divisor+1),7
	goto	u493_21
	goto	u493_20
u493_21:
	goto	i1l5500
u493_20:
	line	11
	
i1l5498:	
	comf	(i1___awdiv@divisor),f
	comf	(i1___awdiv@divisor+1),f
	incf	(i1___awdiv@divisor),f
	skipnz
	incf	(i1___awdiv@divisor+1),f
	line	12
	clrf	(i1___awdiv@sign)
	bsf	status,0
	rlf	(i1___awdiv@sign),f
	goto	i1l5500
	line	13
	
i1l2532:	
	line	14
	
i1l5500:	
	btfss	(i1___awdiv@dividend+1),7
	goto	u494_21
	goto	u494_20
u494_21:
	goto	i1l5506
u494_20:
	line	15
	
i1l5502:	
	comf	(i1___awdiv@dividend),f
	comf	(i1___awdiv@dividend+1),f
	incf	(i1___awdiv@dividend),f
	skipnz
	incf	(i1___awdiv@dividend+1),f
	line	16
	
i1l5504:	
	movlw	(01h)
	movwf	(??i1___awdiv+0)+0
	movf	(??i1___awdiv+0)+0,w
	xorwf	(i1___awdiv@sign),f
	goto	i1l5506
	line	17
	
i1l2533:	
	line	18
	
i1l5506:	
	clrf	(i1___awdiv@quotient)
	clrf	(i1___awdiv@quotient+1)
	line	19
	
i1l5508:	
	movf	(i1___awdiv@divisor+1),w
	iorwf	(i1___awdiv@divisor),w
	skipnz
	goto	u495_21
	goto	u495_20
u495_21:
	goto	i1l5528
u495_20:
	line	20
	
i1l5510:	
	clrf	(i1___awdiv@counter)
	bsf	status,0
	rlf	(i1___awdiv@counter),f
	line	21
	goto	i1l5516
	
i1l2536:	
	line	22
	
i1l5512:	
	movlw	01h
	
u496_25:
	lslf	(i1___awdiv@divisor),f
	rlf	(i1___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u496_25
	line	23
	
i1l5514:	
	movlw	(01h)
	movwf	(??i1___awdiv+0)+0
	movf	(??i1___awdiv+0)+0,w
	addwf	(i1___awdiv@counter),f
	goto	i1l5516
	line	24
	
i1l2535:	
	line	21
	
i1l5516:	
	btfss	(i1___awdiv@divisor+1),(15)&7
	goto	u497_21
	goto	u497_20
u497_21:
	goto	i1l5512
u497_20:
	goto	i1l5518
	
i1l2537:	
	goto	i1l5518
	line	25
	
i1l2538:	
	line	26
	
i1l5518:	
	movlw	01h
	
u498_25:
	lslf	(i1___awdiv@quotient),f
	rlf	(i1___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u498_25
	line	27
	movf	(i1___awdiv@divisor+1),w
	subwf	(i1___awdiv@dividend+1),w
	skipz
	goto	u499_25
	movf	(i1___awdiv@divisor),w
	subwf	(i1___awdiv@dividend),w
u499_25:
	skipc
	goto	u499_21
	goto	u499_20
u499_21:
	goto	i1l5524
u499_20:
	line	28
	
i1l5520:	
	movf	(i1___awdiv@divisor),w
	subwf	(i1___awdiv@dividend),f
	movf	(i1___awdiv@divisor+1),w
	subwfb	(i1___awdiv@dividend+1),f
	line	29
	
i1l5522:	
	bsf	(i1___awdiv@quotient)+(0/8),(0)&7
	goto	i1l5524
	line	30
	
i1l2539:	
	line	31
	
i1l5524:	
	movlw	01h
	
u500_25:
	lsrf	(i1___awdiv@divisor+1),f
	rrf	(i1___awdiv@divisor),f
	decfsz	wreg,f
	goto	u500_25
	line	32
	
i1l5526:	
	movlw	low(01h)
	subwf	(i1___awdiv@counter),f
	btfss	status,2
	goto	u501_21
	goto	u501_20
u501_21:
	goto	i1l5518
u501_20:
	goto	i1l5528
	
i1l2540:	
	goto	i1l5528
	line	33
	
i1l2534:	
	line	34
	
i1l5528:	
	movf	(i1___awdiv@sign),w
	skipz
	goto	u502_20
	goto	i1l5532
u502_20:
	line	35
	
i1l5530:	
	comf	(i1___awdiv@quotient),f
	comf	(i1___awdiv@quotient+1),f
	incf	(i1___awdiv@quotient),f
	skipnz
	incf	(i1___awdiv@quotient+1),f
	goto	i1l5532
	
i1l2541:	
	line	36
	
i1l5532:	
	movf	(i1___awdiv@quotient+1),w
	clrf	(?i1___awdiv+1)
	addwf	(?i1___awdiv+1)
	movf	(i1___awdiv@quotient),w
	clrf	(?i1___awdiv)
	addwf	(?i1___awdiv)

	goto	i1l2542
	
i1l5534:	
	line	37
	
i1l2542:	
	return
	opt stack 0
GLOBAL	__end_ofi1___awdiv
	__end_ofi1___awdiv:
;; =============== function i1___awdiv ends ============

	signat	i1___awdiv,90
	global	_EEPROM_WriteByte
psect	text1412,local,class=CODE,delta=2
global __ptext1412
__ptext1412:

;; *************** function _EEPROM_WriteByte *****************
;; Defined at:
;;		line 15 in file "../EEPROM.h"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;;  value           1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text1412
	file	"../EEPROM.h"
	line	15
	global	__size_of_EEPROM_WriteByte
	__size_of_EEPROM_WriteByte	equ	__end_of_EEPROM_WriteByte-_EEPROM_WriteByte
	
_EEPROM_WriteByte:	
	opt	stack 7
; Regs used in _EEPROM_WriteByte: [wreg]
	movwf	(EEPROM_WriteByte@address)
	line	16
	
i1l5046:	
	movlb 3	; select bank3
	bcf	(3247/8)^0180h,(3247)&7
	line	17
	bcf	(3246/8)^0180h,(3246)&7
	line	18
	
i1l5048:	
	movf	(EEPROM_WriteByte@value),w
	movwf	(403)^0180h	;volatile
	line	19
	movf	(EEPROM_WriteByte@address),w
	movwf	(401)^0180h	;volatile
	line	21
	
i1l5050:	
	bsf	(3242/8)^0180h,(3242)&7
	line	23
	movlw	(055h)
	movwf	(406)^0180h	;volatile
	line	24
	movlw	(0AAh)
	movwf	(406)^0180h	;volatile
	line	26
	
i1l5052:	
	bsf	(3241/8)^0180h,(3241)&7
	line	28
	goto	i1l1295
	
i1l1296:	
	
i1l1295:	
	btfsc	(3241/8)^0180h,(3241)&7
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l1295
u413_20:
	
i1l1297:	
	line	32
	movlb 0	; select bank0
	bcf	(148/8),(148)&7
	line	33
	movlb 3	; select bank3
	bcf	(3242/8)^0180h,(3242)&7
	line	34
	
i1l1298:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_WriteByte
	__end_of_EEPROM_WriteByte:
;; =============== function _EEPROM_WriteByte ends ============

	signat	_EEPROM_WriteByte,8312
	global	_UART_byte_receive
psect	text1413,local,class=CODE,delta=2
global __ptext1413
__ptext1413:

;; *************** function _UART_byte_receive *****************
;; Defined at:
;;		line 12 in file "../UART.h"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text1413
	file	"../UART.h"
	line	12
	global	__size_of_UART_byte_receive
	__size_of_UART_byte_receive	equ	__end_of_UART_byte_receive-_UART_byte_receive
	
_UART_byte_receive:	
	opt	stack 7
; Regs used in _UART_byte_receive: [wreg]
	line	13
	
i1l5028:	
	goto	i1l1286
	
i1l1287:	
	
i1l1286:	
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l1286
u412_20:
	goto	i1l5030
	
i1l1288:	
	line	14
	
i1l5030:	
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	goto	i1l1289
	
i1l5032:	
	line	16
	
i1l1289:	
	return
	opt stack 0
GLOBAL	__end_of_UART_byte_receive
	__end_of_UART_byte_receive:
;; =============== function _UART_byte_receive ends ============

	signat	_UART_byte_receive,89
	global	_UART_byte_send
psect	text1414,local,class=CODE,delta=2
global __ptext1414
__ptext1414:

;; *************** function _UART_byte_send *****************
;; Defined at:
;;		line 4 in file "../UART.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text1414
	file	"../UART.h"
	line	4
	global	__size_of_UART_byte_send
	__size_of_UART_byte_send	equ	__end_of_UART_byte_send-_UART_byte_send
	
_UART_byte_send:	
	opt	stack 7
; Regs used in _UART_byte_send: [wreg]
	movwf	(UART_byte_send@data)
	line	5
	
i1l5024:	
	goto	i1l1280
	
i1l1281:	
	
i1l1280:	
	movlb 0	; select bank0
	btfss	(140/8),(140)&7
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l1280
u411_20:
	goto	i1l5026
	
i1l1282:	
	line	6
	
i1l5026:	
	movf	(UART_byte_send@data),w
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	9
	
i1l1283:	
	return
	opt stack 0
GLOBAL	__end_of_UART_byte_send
	__end_of_UART_byte_send:
;; =============== function _UART_byte_send ends ============

	signat	_UART_byte_send,4216
	global	_EEPROM_ReadByte
psect	text1415,local,class=CODE,delta=2
global __ptext1415
__ptext1415:

;; *************** function _EEPROM_ReadByte *****************
;; Defined at:
;;		line 37 in file "../EEPROM.h"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    0[COMMON] unsigned char 
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
;;		_display_message
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text1415
	file	"../EEPROM.h"
	line	37
	global	__size_of_EEPROM_ReadByte
	__size_of_EEPROM_ReadByte	equ	__end_of_EEPROM_ReadByte-_EEPROM_ReadByte
	
_EEPROM_ReadByte:	
	opt	stack 6
; Regs used in _EEPROM_ReadByte: [wreg]
	movwf	(EEPROM_ReadByte@address)
	line	38
	
i1l4956:	
	movlb 3	; select bank3
	bcf	(3247/8)^0180h,(3247)&7
	line	39
	bcf	(3246/8)^0180h,(3246)&7
	line	40
	
i1l4958:	
	movf	(EEPROM_ReadByte@address),w
	movwf	(401)^0180h	;volatile
	line	41
	
i1l4960:	
	bsf	(3240/8)^0180h,(3240)&7
	line	42
	goto	i1l1301
	
i1l1302:	
	
i1l1301:	
	btfsc	(3240/8)^0180h,(3240)&7
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l1301
u397_20:
	
i1l1303:	
	line	43
	movlb 0	; select bank0
	bcf	(148/8),(148)&7
	line	44
	
i1l4962:	
	movlb 3	; select bank3
	movf	(403)^0180h,w	;volatile
	goto	i1l1304
	
i1l4964:	
	line	45
	
i1l1304:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_ReadByte
	__end_of_EEPROM_ReadByte:
;; =============== function _EEPROM_ReadByte ends ============

	signat	_EEPROM_ReadByte,4217
psect	text1416,local,class=CODE,delta=2
global __ptext1416
__ptext1416:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
