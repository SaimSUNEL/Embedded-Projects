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
	FNCALL	_main,_EEPROM_WriteByte
	FNCALL	_main,_DHT11_get_data
	FNCALL	_main,_display_number
	FNCALL	_main,_input_selection
	FNCALL	_main,_ADC_read
	FNCALL	_main,___awtoft
	FNCALL	_main,___bmul
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,___lbtoft
	FNCALL	_main,___ftdiv
	FNCALL	_main,_led_on
	FNCALL	_main,_set_bit
	FNCALL	_display_number,___awdiv
	FNCALL	_display_number,_display_digit
	FNCALL	_display_number,___awmod
	FNCALL	_led_on,_set_bit
	FNCALL	_input_selection,_set_bit
	FNCALL	_display_digit,_set_bit
	FNCALL	_set_bit,___awdiv
	FNCALL	_set_bit,_send_pin_value
	FNCALL	___awtoft,___ftpack
	FNCALL	___lbtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNROOT	_main
	FNCALL	_FNC,_EEPROM_ReadByte
	FNCALL	_FNC,i1___awmod
	FNCALL	_FNC,i1_EEPROM_WriteByte
	FNCALL	_FNC,i1_display_number
	FNCALL	i1_display_number,i1___awdiv
	FNCALL	i1_display_number,i1_display_digit
	FNCALL	i1_display_number,i1___awmod
	FNCALL	i1_display_digit,i1_set_bit
	FNCALL	i1_set_bit,i1___awdiv
	FNCALL	i1_set_bit,i1_send_pin_value
	FNCALL	intlevel1,_FNC
	global	intlevel1
	FNROOT	intlevel1
	global	_count_status
	global	_what_to_display
	global	_sensor_scalar
	global	_rakamlar
	global	_sensor_min_max
	global	_danger_sensor
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"../PIC12f1840PINExpand.c"
	line	197

;initializer for _count_status
	retlw	08h
	line	126

;initializer for _what_to_display
	retlw	05h
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	line	345

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

	line	120

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
	line	344

;initializer for _sensor_min_max
	retlw	0
	retlw	03Ch
	retlw	0
	retlw	03Ch
	retlw	0
	retlw	03Ch
	retlw	0
	retlw	03Ch
	line	347

;initializer for _danger_sensor
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	global	_dht11_data
	global	_val
	global	_count
	global	_first_pinheader_value
	global	_high_time_count
	global	_low_time_count
	global	_second_count
	global	_second_pinheader_value
	global	_timer_count
	global	_sensor_measurements
	global	_voltage
	global	_nem
	global	_sicaklik
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
	global	_ADPREF0
_ADPREF0	set	1264
	global	_ADPREF1
_ADPREF1	set	1265
	global	_CHS0
_CHS0	set	1258
	global	_CHS1
_CHS1	set	1259
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
	global	_ANSA4
_ANSA4	set	3172
	global	_CFGS
_CFGS	set	3246
	global	_EEPGD
_EEPGD	set	3247
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

_val:
       ds      2

_count:
       ds      1

_first_pinheader_value:
       ds      1

_high_time_count:
       ds      1

_low_time_count:
       ds      1

_second_count:
       ds      1

_second_pinheader_value:
       ds      1

_timer_count:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"../PIC12f1840PINExpand.c"
	line	197
_count_status:
       ds      1

psect	dataBANK0
	file	"../PIC12f1840PINExpand.c"
	line	126
_what_to_display:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_sensor_measurements:
       ds      8

_voltage:
       ds      2

_nem:
       ds      1

_sicaklik:
       ds      1

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"../PIC12f1840PINExpand.c"
	line	345
_sensor_scalar:
       ds      12

psect	dataBANK1
	file	"../PIC12f1840PINExpand.c"
	line	120
_rakamlar:
       ds      10

psect	dataBANK1
	file	"../PIC12f1840PINExpand.c"
	line	344
_sensor_min_max:
       ds      8

psect	dataBANK1
	file	"../PIC12f1840PINExpand.c"
	line	347
_danger_sensor:
       ds      4

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
	movlw	0Eh
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	global __pbssBANK1
	movlw	low(__pbssBANK1)
	movwf	fsr0l
	movlw	high(__pbssBANK1)
	movwf	fsr0h
	movlw	0Ch
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
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
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
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x0
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x0
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x1
	ds	3
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x4
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x4
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x5
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x5
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	3
	global	_main$2875
_main$2875:	; 3 bytes @ 0x9
	ds	3
	global	main@alarm
main@alarm:	; 1 bytes @ 0xC
	ds	1
	global	main@temp
main@temp:	; 1 bytes @ 0xD
	ds	1
	global	main@i_1983
main@i_1983:	; 1 bytes @ 0xE
	ds	1
	global	main@temp2
main@temp2:	; 1 bytes @ 0xF
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x10
	ds	1
	global	main@sensor_index
main@sensor_index:	; 1 bytes @ 0x11
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_EEPROM_ReadByte
??_EEPROM_ReadByte:	; 0 bytes @ 0x0
	global	?_DHT11_get_data
?_DHT11_get_data:	; 0 bytes @ 0x0
	global	?_display_number
?_display_number:	; 0 bytes @ 0x0
	global	?_FNC
?_FNC:	; 0 bytes @ 0x0
	global	?_input_selection
?_input_selection:	; 0 bytes @ 0x0
	global	?_led_on
?_led_on:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?i1_EEPROM_WriteByte
?i1_EEPROM_WriteByte:	; 0 bytes @ 0x0
	global	?i1_send_pin_value
?i1_send_pin_value:	; 0 bytes @ 0x0
	global	?i1_display_number
?i1_display_number:	; 0 bytes @ 0x0
	global	?_EEPROM_ReadByte
?_EEPROM_ReadByte:	; 1 bytes @ 0x0
	global	?i1___awdiv
?i1___awdiv:	; 2 bytes @ 0x0
	global	?i1___awmod
?i1___awmod:	; 2 bytes @ 0x0
	global	EEPROM_ReadByte@address
EEPROM_ReadByte@address:	; 1 bytes @ 0x0
	global	i1EEPROM_WriteByte@value
i1EEPROM_WriteByte@value:	; 1 bytes @ 0x0
	global	i1send_pin_value@value
i1send_pin_value@value:	; 1 bytes @ 0x0
	global	i1___awdiv@divisor
i1___awdiv@divisor:	; 2 bytes @ 0x0
	global	i1___awmod@divisor
i1___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??i1_EEPROM_WriteByte
??i1_EEPROM_WriteByte:	; 0 bytes @ 0x1
	global	??i1_send_pin_value
??i1_send_pin_value:	; 0 bytes @ 0x1
	global	i1EEPROM_WriteByte@address
i1EEPROM_WriteByte@address:	; 1 bytes @ 0x1
	ds	1
	global	i1send_pin_value@segment_number
i1send_pin_value@segment_number:	; 1 bytes @ 0x2
	global	i1___awdiv@dividend
i1___awdiv@dividend:	; 2 bytes @ 0x2
	global	i1___awmod@dividend
i1___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	i1send_pin_value@index
i1send_pin_value@index:	; 1 bytes @ 0x3
	ds	1
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
	global	?i1_set_bit
?i1_set_bit:	; 0 bytes @ 0x9
	global	i1set_bit@val
i1set_bit@val:	; 1 bytes @ 0x9
	ds	1
	global	??i1_set_bit
??i1_set_bit:	; 0 bytes @ 0xA
	ds	2
	global	i1set_bit@bit_number
i1set_bit@bit_number:	; 1 bytes @ 0xC
	ds	1
	global	?i1_display_digit
?i1_display_digit:	; 0 bytes @ 0xD
	global	i1display_digit@value
i1display_digit@value:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??i1_display_digit
??i1_display_digit:	; 0 bytes @ 0x0
	ds	2
	global	i1display_digit@temp
i1display_digit@temp:	; 1 bytes @ 0x2
	ds	1
	global	i1display_digit@segment_number
i1display_digit@segment_number:	; 1 bytes @ 0x3
	ds	1
	global	i1display_digit@index
i1display_digit@index:	; 1 bytes @ 0x4
	ds	1
	global	??i1_display_number
??i1_display_number:	; 0 bytes @ 0x5
	ds	3
	global	i1display_number@number
i1display_number@number:	; 1 bytes @ 0x8
	ds	1
	global	??_FNC
??_FNC:	; 0 bytes @ 0x9
	ds	3
	global	?_EEPROM_WriteByte
?_EEPROM_WriteByte:	; 0 bytes @ 0xC
	global	??_DHT11_get_data
??_DHT11_get_data:	; 0 bytes @ 0xC
	global	?_send_pin_value
?_send_pin_value:	; 0 bytes @ 0xC
	global	?___bmul
?___bmul:	; 1 bytes @ 0xC
	global	?_ADC_read
?_ADC_read:	; 2 bytes @ 0xC
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0xC
	global	?___awmod
?___awmod:	; 2 bytes @ 0xC
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0xC
	global	EEPROM_WriteByte@value
EEPROM_WriteByte@value:	; 1 bytes @ 0xC
	global	send_pin_value@value
send_pin_value@value:	; 1 bytes @ 0xC
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0xC
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0xC
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0xC
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0xC
	ds	1
	global	??_EEPROM_WriteByte
??_EEPROM_WriteByte:	; 0 bytes @ 0xD
	global	??_send_pin_value
??_send_pin_value:	; 0 bytes @ 0xD
	global	??___bmul
??___bmul:	; 0 bytes @ 0xD
	global	EEPROM_WriteByte@address
EEPROM_WriteByte@address:	; 1 bytes @ 0xD
	ds	1
	global	??_ADC_read
??_ADC_read:	; 0 bytes @ 0xE
	global	DHT11_get_data@a
DHT11_get_data@a:	; 1 bytes @ 0xE
	global	send_pin_value@segment_number
send_pin_value@segment_number:	; 1 bytes @ 0xE
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0xE
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0xE
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0xE
	ds	1
	global	DHT11_get_data@byte_index
DHT11_get_data@byte_index:	; 1 bytes @ 0xF
	global	send_pin_value@index
send_pin_value@index:	; 1 bytes @ 0xF
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0xF
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0xF
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x10
	global	??___awmod
??___awmod:	; 0 bytes @ 0x10
	global	DHT11_get_data@bit_index
DHT11_get_data@bit_index:	; 1 bytes @ 0x10
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x10
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x11
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x11
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x11
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x12
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x12
	global	ADC_read@val
ADC_read@val:	; 2 bytes @ 0x12
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x13
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x14
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x14
	ds	1
	global	?_set_bit
?_set_bit:	; 0 bytes @ 0x15
	global	set_bit@val
set_bit@val:	; 1 bytes @ 0x15
	ds	1
	global	??_set_bit
??_set_bit:	; 0 bytes @ 0x16
	ds	2
	global	??___fttol
??___fttol:	; 0 bytes @ 0x18
	global	set_bit@bit_number
set_bit@bit_number:	; 1 bytes @ 0x18
	ds	1
	global	?_display_digit
?_display_digit:	; 0 bytes @ 0x19
	global	??_input_selection
??_input_selection:	; 0 bytes @ 0x19
	global	??_led_on
??_led_on:	; 0 bytes @ 0x19
	global	display_digit@value
display_digit@value:	; 1 bytes @ 0x19
	ds	1
	global	??_display_digit
??_display_digit:	; 0 bytes @ 0x1A
	global	input_selection@number
input_selection@number:	; 1 bytes @ 0x1A
	ds	1
	global	led_on@led
led_on@led:	; 1 bytes @ 0x1B
	ds	1
	global	display_digit@temp
display_digit@temp:	; 1 bytes @ 0x1C
	global	led_on@index
led_on@index:	; 1 bytes @ 0x1C
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x1C
	ds	1
	global	display_digit@segment_number
display_digit@segment_number:	; 1 bytes @ 0x1D
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x1D
	ds	1
	global	display_digit@index
display_digit@index:	; 1 bytes @ 0x1E
	ds	1
	global	??_display_number
??_display_number:	; 0 bytes @ 0x1F
	ds	2
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x21
	ds	1
	global	?___lbtoft
?___lbtoft:	; 3 bytes @ 0x22
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x22
	global	display_number@number
display_number@number:	; 1 bytes @ 0x22
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x22
	ds	3
	global	??___lbtoft
??___lbtoft:	; 0 bytes @ 0x25
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0x25
	ds	2
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0x27
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x28
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x28
	ds	1
	global	___lbtoft@c
___lbtoft@c:	; 1 bytes @ 0x29
	ds	1
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x2A
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x2A
	ds	1
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x2B
	ds	2
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x2D
	ds	1
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x2E
	ds	2
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x30
	ds	4
;;Data sizes: Strings 0, constant 0, data 36, bss 26, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     52      68
;; BANK1           80     18      64
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?i1___awdiv	int  size(1) Largest target is 0
;;
;; ?i1___awmod	int  size(1) Largest target is 0
;;
;; ?___lbtoft	float  size(1) Largest target is 0
;;
;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;
;; ?_ADC_read	int  size(1) Largest target is 0
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
;;   i1_display_digit->i1_set_bit
;;   i1_set_bit->i1___awdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___ftdiv
;;   _display_number->_display_digit
;;   _led_on->_set_bit
;;   _input_selection->_set_bit
;;   _display_digit->_set_bit
;;   _set_bit->___awdiv
;;   ___awtoft->___fttol
;;   ___lbtoft->___fttol
;;   ___ftmul->___awtoft
;;   ___ftdiv->___lbtoft
;;   ___fttol->___ftpack
;;
;; Critical Paths under _FNC in BANK0
;;
;;   _FNC->i1_display_number
;;   i1_display_number->i1_display_digit
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->___ftmul
;;   _main->___ftdiv
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
;; (0) _main                                                12    12      0    7095
;;                                              6 BANK1     12    12      0
;;                   _EEPROM_WriteByte
;;                     _DHT11_get_data
;;                     _display_number
;;                    _input_selection
;;                           _ADC_read
;;                           ___awtoft
;;                             ___bmul
;;                            ___ftmul
;;                            ___fttol
;;                           ___lbtoft
;;                            ___ftdiv
;;                             _led_on
;;                            _set_bit
;; ---------------------------------------------------------------------------------
;; (1) _display_number                                       4     4      0    1431
;;                                             31 BANK0      4     4      0
;;                            ___awdiv
;;                      _display_digit
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (1) _led_on                                               4     4      0     700
;;                                             25 BANK0      4     4      0
;;                            _set_bit
;; ---------------------------------------------------------------------------------
;; (1) _input_selection                                      2     2      0     654
;;                                             25 BANK0      2     2      0
;;                            _set_bit
;; ---------------------------------------------------------------------------------
;; (2) _display_digit                                        6     5      1     791
;;                                             25 BANK0      6     5      1
;;                            _set_bit
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _set_bit                                              4     3      1     610
;;                                             21 BANK0      4     3      1
;;                            ___awdiv
;;                     _send_pin_value
;; ---------------------------------------------------------------------------------
;; (1) ___awtoft                                             6     3      3     445
;;                                             34 BANK0      6     3      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___lbtoft                                             8     5      3     343
;;                                             34 BANK0      8     5      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftmul                                             16    10      6     800
;;                                             40 BANK0     10     4      6
;;                                              0 BANK1      6     6      0
;;                           ___ftpack
;;                           ___awtoft (ARG)
;;                             ___bmul (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftdiv                                             16    10      6     732
;;                                             42 BANK0     10     4      6
;;                                              0 BANK1      6     6      0
;;                           ___ftpack
;;                           ___awtoft (ARG)
;;                           ___lbtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _send_pin_value                                       4     3      1     112
;;                                             12 BANK0      4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _DHT11_get_data                                       5     5      0     204
;;                                             12 BANK0      5     5      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                             12 BANK0      7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                             12 BANK0      9     5      4
;; ---------------------------------------------------------------------------------
;; (1) ___fttol                                             14    10      4     252
;;                                             20 BANK0     14    10      4
;;                           ___ftpack (ARG)
;;                             ___bmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     312
;;                                             12 BANK0      8     3      5
;; ---------------------------------------------------------------------------------
;; (1) ___bmul                                               4     3      1      68
;;                                             12 BANK0      4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _ADC_read                                             8     6      2      23
;;                                             12 BANK0      8     6      2
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_WriteByte                                     2     1      1      44
;;                                             12 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _FNC                                                  3     3      0    5826
;;                                              9 BANK0      3     3      0
;;                    _EEPROM_ReadByte
;;                          i1___awmod
;;                 i1_EEPROM_WriteByte
;;                   i1_display_number
;; ---------------------------------------------------------------------------------
;; (6) i1_display_number                                     4     4      0    4689
;;                                              5 BANK0      4     4      0
;;                          i1___awdiv
;;                    i1_display_digit
;;                          i1___awmod
;; ---------------------------------------------------------------------------------
;; (7) i1_display_digit                                      6     5      1    2597
;;                                             13 COMMON     1     0      1
;;                                              0 BANK0      5     5      0
;;                          i1_set_bit
;;                          i1___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (8) i1_set_bit                                            4     3      1    2003
;;                                              9 COMMON     4     3      1
;;                          i1___awdiv
;;                   i1_send_pin_value
;; ---------------------------------------------------------------------------------
;; (9) i1_send_pin_value                                     4     3      1     369
;;                                              0 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (7) i1___awmod                                            7     3      4     969
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (9) i1___awdiv                                            9     5      4     977
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (6) i1_EEPROM_WriteByte                                   2     1      1     146
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (6) _EEPROM_ReadByte                                      1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 9
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _EEPROM_WriteByte
;;   _DHT11_get_data
;;   _display_number
;;     ___awdiv
;;     _display_digit
;;       _set_bit
;;         ___awdiv
;;         _send_pin_value
;;       ___awmod (ARG)
;;     ___awmod
;;   _input_selection
;;     _set_bit
;;       ___awdiv
;;       _send_pin_value
;;   _ADC_read
;;   ___awtoft
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___bmul (ARG)
;;   ___bmul
;;   ___ftmul
;;     ___ftpack
;;     ___awtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___bmul (ARG)
;;     ___bmul (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___bmul (ARG)
;;   ___fttol
;;     ___ftpack (ARG)
;;     ___bmul (ARG)
;;   ___lbtoft
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___bmul (ARG)
;;   ___ftdiv
;;     ___ftpack
;;     ___awtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___bmul (ARG)
;;     ___lbtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___bmul (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___bmul (ARG)
;;   _led_on
;;     _set_bit
;;       ___awdiv
;;       _send_pin_value
;;   _set_bit
;;     ___awdiv
;;     _send_pin_value
;;
;; _FNC (ROOT)
;;   _EEPROM_ReadByte
;;   i1___awmod
;;   i1_EEPROM_WriteByte
;;   i1_display_number
;;     i1___awdiv
;;     i1_display_digit
;;       i1_set_bit
;;         i1___awdiv
;;         i1_send_pin_value
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
;;STACK                0      0       E       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      92       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50     34      44       6       85.0%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50     12      40       8       80.0%
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
;;DATA                 0      0      A0      11        0.0%
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
;;		line 350 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   16[BANK1 ] unsigned char 
;;  temp2           1   15[BANK1 ] unsigned char 
;;  temp            1   13[BANK1 ] unsigned char 
;;  i               1   14[BANK1 ] unsigned char 
;;  sensor_index    1   17[BANK1 ] unsigned char 
;;  alarm           1   12[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       9       0
;;      Temps:          0       0       3       0
;;      Totals:         0       0      12       0
;;Total ram usage:       12 bytes
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_EEPROM_WriteByte
;;		_DHT11_get_data
;;		_display_number
;;		_input_selection
;;		_ADC_read
;;		___awtoft
;;		___bmul
;;		___ftmul
;;		___fttol
;;		___lbtoft
;;		___ftdiv
;;		_led_on
;;		_set_bit
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC12f1840PINExpand.c"
	line	350
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+fsr1l-status,0+btemp+1+pclath+cstack]
	line	352
	
l5917:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	353
	
l5919:	
	movlb 1	; select bank1
	bcf	(1231/8)^080h,(1231)&7
	line	355
	
l5921:	
	bsf	(1230/8)^080h,(1230)&7
	line	356
	
l5923:	
	bsf	(1229/8)^080h,(1229)&7
	line	357
	
l5925:	
	bsf	(1228/8)^080h,(1228)&7
	line	358
	
l5927:	
	bsf	(1227/8)^080h,(1227)&7
	line	360
	
l5929:	
	bsf	(1225/8)^080h,(1225)&7
	line	361
	
l5931:	
	bcf	(1224/8)^080h,(1224)&7
	line	362
	
l5933:	
	bcf	(1120/8)^080h,(1120)&7
	line	363
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	366
	
l5935:	
	movlb 1	; select bank1
	bsf	(1123/8)^080h,(1123)&7
	line	367
	
l5937:	
	bsf	(1125/8)^080h,(1125)&7
	line	369
	
l5939:	
	bcf	(1120/8)^080h,(1120)&7
	line	370
	
l5941:	
	bcf	(1121/8)^080h,(1121)&7
	line	371
	
l5943:	
	bcf	(1122/8)^080h,(1122)&7
	line	372
	
l5945:	
	bsf	(1124/8)^080h,(1124)&7
	line	374
	movlb 7	; select bank7
	clrf	(914)^0380h	;volatile
	line	375
	clrf	(913)^0380h	;volatile
	line	377
	
l5947:	
	bsf	(7307/8)^0380h,(7307)&7
	line	378
	
l5949:	
	bsf	(91/8),(91)&7
	line	379
	
l5951:	
	bcf	(88/8),(88)&7
	line	380
	
l5953:	
	bcf	(7325/8)^0380h,(7325)&7
	line	383
	movlb 0	; select bank0
	clrf	(23)	;volatile
	line	384
	clrf	(22)	;volatile
	line	388
	
l5955:	
	bcf	(199/8),(199)&7
	line	389
	
l5957:	
	bcf	(198/8),(198)&7
	line	393
	
l5959:	
	bsf	(197/8),(197)&7
	line	394
	
l5961:	
	bcf	(196/8),(196)&7
	line	398
	
l5963:	
	bcf	(192/8),(192)&7
	line	399
	
l5965:	
	movlw	low(03CAFh)
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	400
	
l5967:	
	bcf	(136/8),(136)&7
	line	401
	
l5969:	
	movlb 1	; select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	402
	
l5971:	
	bsf	(94/8),(94)&7
	line	403
	
l5973:	
	bsf	(95/8),(95)&7
	line	405
	
l5975:	
	bcf	(1265/8)^080h,(1265)&7
	line	406
	
l5977:	
	bcf	(1264/8)^080h,(1264)&7
	line	408
	
l5979:	
	bsf	(1270/8)^080h,(1270)&7
	line	409
	
l5981:	
	bsf	(1269/8)^080h,(1269)&7
	line	410
	
l5983:	
	bcf	(1268/8)^080h,(1268)&7
	line	412
	
l5985:	
	movlb 3	; select bank3
	bsf	(3172/8)^0180h,(3172)&7
	line	414
	
l5987:	
	movlb 1	; select bank1
	bsf	(1259/8)^080h,(1259)&7
	line	415
	
l5989:	
	bsf	(1258/8)^080h,(1258)&7
	line	417
	
l5991:	
	bsf	(1271/8)^080h,(1271)&7
	line	419
	
l5993:	
	opt asmopt_off
movlw  6
movwf	((??_main+0)^080h+0+2),f
movlw	19
movwf	((??_main+0)^080h+0+1),f
	movlw	177
movwf	((??_main+0)^080h+0),f
u6427:
	decfsz	((??_main+0)^080h+0),f
	goto	u6427
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6427
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6427
	nop2
opt asmopt_on

	line	420
	
l5995:	
	movlb 7	; select bank7
	bsf	(7307/8)^0380h,(7307)&7
	line	421
	
l5997:	
	bsf	(91/8),(91)&7
	line	422
	
l5999:	
	bcf	(88/8),(88)&7
	line	424
	
l6001:	
	movlb 1	; select bank1
	bsf	(1256/8)^080h,(1256)&7
	line	427
	
l6003:	
	movlw	(053h)
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movlb 0	; select bank0
	movwf	(?_EEPROM_WriteByte)
	movlw	(05h)
	fcall	_EEPROM_WriteByte
	line	429
	
l6005:	
	fcall	_DHT11_get_data
	line	430
	
l6007:	
	opt asmopt_off
movlw  3
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	8
movwf	((??_main+0)^080h+0+1),f
	movlw	120
movwf	((??_main+0)^080h+0),f
u6437:
	decfsz	((??_main+0)^080h+0),f
	goto	u6437
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6437
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6437
opt asmopt_on

	goto	l6009
	line	432
	
l1224:	
	line	435
	
l6009:	
	movlb 0	; select bank0
	movf	(_count_status),w
	xorlw	08h&0ffh
	skipz
	goto	u6291
	goto	u6290
u6291:
	goto	l6009
u6290:
	line	438
	
l6011:	
	fcall	_DHT11_get_data
	line	440
	
l6013:	
	movlw	(02h)
	movlb 1	; select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movlb 0	; select bank0
	movwf	(_what_to_display)
	line	441
	
l6015:	
	movlb 1	; select bank1
	movf	(_sicaklik)^080h,w
	fcall	_display_number
	line	442
	opt asmopt_off
movlw  21
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	75
movwf	((??_main+0)^080h+0+1),f
	movlw	209
movwf	((??_main+0)^080h+0),f
u6447:
	decfsz	((??_main+0)^080h+0),f
	goto	u6447
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6447
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6447
	clrwdt
opt asmopt_on

	line	443
	movlw	(03h)
	movlb 1	; select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movlb 0	; select bank0
	movwf	(_what_to_display)
	line	444
	
l6017:	
	movlb 1	; select bank1
	movf	(_nem)^080h,w
	fcall	_display_number
	line	446
	
l6019:	
	opt asmopt_off
movlw  21
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	75
movwf	((??_main+0)^080h+0+1),f
	movlw	209
movwf	((??_main+0)^080h+0),f
u6457:
	decfsz	((??_main+0)^080h+0),f
	goto	u6457
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6457
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6457
	clrwdt
opt asmopt_on

	line	450
	
l6021:	
	movlb 1	; select bank1
	clrf	(main@sensor_index)^080h
	
l6023:	
	movlw	(04h)
	subwf	(main@sensor_index)^080h,w
	skipc
	goto	u6301
	goto	u6300
u6301:
	goto	l1226
u6300:
	goto	l1227
	
l6025:	
	goto	l1227
	line	451
	
l1226:	
	line	452
	clrf	(main@temp)^080h
	clrf	(main@temp2)^080h
	line	453
	
l6027:	
	movlw	(01h)
	movwf	(??_main+0)^080h+0
	movf	(main@sensor_index)^080h,w
	addlw	04h
	incf	wreg,f
	goto	u6314
u6315:
	lslf	(??_main+0)^080h+0,f
u6314:
	decfsz	wreg,f
	goto	u6315
	movf	0+(??_main+0)^080h+0,w
	movwf	(??_main+1)^080h+0
	movf	(??_main+1)^080h+0,w
	iorwf	(main@temp)^080h,f
	line	454
	
l6029:	
	movf	(main@sensor_index)^080h,w
	fcall	_input_selection
	line	455
	
l6031:	
	opt asmopt_off
movlw	156
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+1),f
	movlw	215
movwf	((??_main+0)^080h+0),f
u6467:
	decfsz	((??_main+0)^080h+0),f
	goto	u6467
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6467
opt asmopt_on

	line	456
	
l6033:	
	fcall	_ADC_read
	movlb 0	; select bank0
	movf	(1+(?_ADC_read)),w
	movlb 1	; select bank1
	clrf	(_voltage+1)^080h
	addwf	(_voltage+1)^080h
	movlb 0	; select bank0
	movf	(0+(?_ADC_read)),w
	movlb 1	; select bank1
	clrf	(_voltage)^080h
	addwf	(_voltage)^080h

	line	457
	
l6035:	
	movf	(_voltage+1)^080h,w
	movlb 0	; select bank0
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movlb 1	; select bank1
	movf	(_voltage)^080h,w
	movlb 0	; select bank0
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	movlb 0	; select bank0
	movf	(0+(?___awtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___awtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___awtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	(03h)
	movlb 1	; select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movlb 0	; select bank0
	movwf	(?___bmul)
	movlb 1	; select bank1
	movf	(main@sensor_index)^080h,w
	fcall	___bmul
	addlw	_sensor_scalar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movlb 0	; select bank0
	movwf	(?___ftmul)
	moviw	[1]fsr1
	movwf	(?___ftmul+1)
	moviw	[2]fsr1
	movwf	(?___ftmul+2)
	fcall	___ftmul
	movlb 0	; select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movlb 0	; select bank0
	movf	1+(((0+(?___fttol)))),w
	movlb 1	; select bank1
	clrf	(_voltage+1)^080h
	addwf	(_voltage+1)^080h
	movlb 0	; select bank0
	movf	0+(((0+(?___fttol)))),w
	movlb 1	; select bank1
	clrf	(_voltage)^080h
	addwf	(_voltage)^080h

	line	458
	
l6037:	
	movf	(main@sensor_index)^080h,w
	addwf	wreg,w
	addlw	_sensor_measurements&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_voltage)^080h,w
	movwi	[0]fsr1
	movf	(_voltage+1)^080h,w
	movwi	[1]fsr1
	line	459
	
l6039:	
	movlw	(05h)
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movlb 0	; select bank0
	movwf	(_what_to_display)
	line	460
	
l6041:	
	movlb 1	; select bank1
	movf	(_voltage)^080h,w
	fcall	_display_number
	line	461
	
l6043:	
	movlb 1	; select bank1
	movf	(main@sensor_index)^080h,w
	addwf	wreg,w
	addlw	_sensor_min_max&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	decf	indf1,w
	xorlw	0ffh
	addwf	(_voltage)^080h,w
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@temp2)^080h
	line	462
	
l6045:	
	movf	(main@sensor_index)^080h,w
	addwf	wreg,w
	addlw	_sensor_min_max&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??_main+0)^080h+0
	clrf	(??_main+0)^080h+0+1
	comf	(??_main+0)^080h+0,f
	comf	(??_main+0)^080h+1,f
	incf	(??_main+0)^080h+0,f
	skipnz
	incf	(??_main+0)^080h+1,f
	setc
	rlf	(main@sensor_index)^080h,w
	addlw	_sensor_min_max&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	addwf	0+(??_main+0)^080h+0,w
	movlb 0	; select bank0
	movwf	(?___awtoft)
	movlb 1	; select bank1
	movf	1+(??_main+0)^080h+0,w
	skipnc
	incf	1+(??_main+0)^080h+0,w
	movlb 0	; select bank0
	movwf	((?___awtoft))+1
	fcall	___awtoft
	movlb 0	; select bank0
	movf	(0+(?___awtoft)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___awtoft)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___awtoft)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x80
	movwf	(?___ftdiv+1)
	movlw	0x40
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	movlb 0	; select bank0
	movf	(0+(?___ftdiv)),w
	movlb 1	; select bank1
	movwf	(_main$2875)^080h
	movlb 0	; select bank0
	movf	(1+(?___ftdiv)),w
	movlb 1	; select bank1
	movwf	(_main$2875+1)^080h
	movlb 0	; select bank0
	movf	(2+(?___ftdiv)),w
	movlb 1	; select bank1
	movwf	(_main$2875+2)^080h
	
l6047:	
	movf	(main@temp2)^080h,w
	fcall	___lbtoft
	movlb 0	; select bank0
	movf	(0+(?___lbtoft)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___lbtoft)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___lbtoft)),w
	movwf	2+(?___ftdiv)+03h
	movlb 1	; select bank1
	movf	(_main$2875)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftdiv)
	movlb 1	; select bank1
	movf	(_main$2875+1)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftdiv+1)
	movlb 1	; select bank1
	movf	(_main$2875+2)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	movlb 0	; select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(?___fttol)
	movf	(1+(?___ftdiv)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movlb 0	; select bank0
	movf	0+(((0+(?___fttol)))),w
	movlb 1	; select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@temp2)^080h
	line	463
	
l6049:	
	clrf	(main@i)^080h
	
l6051:	
	movlw	(04h)
	subwf	(main@i)^080h,w
	skipc
	goto	u6321
	goto	u6320
u6321:
	goto	l6055
u6320:
	goto	l6061
	
l6053:	
	goto	l6061
	line	464
	
l1228:	
	line	465
	
l6055:	
	movf	(main@temp2)^080h,w
	subwf	(main@i)^080h,w
	skipnc
	goto	u6331
	goto	u6330
u6331:
	goto	l1230
u6330:
	
l6057:	
	movlw	(01h)
	movwf	(??_main+0)^080h+0
	incf	(main@i)^080h,w
	goto	u6344
u6345:
	lslf	(??_main+0)^080h+0,f
u6344:
	decfsz	wreg,f
	goto	u6345
	movf	0+(??_main+0)^080h+0,w
	movwf	(??_main+1)^080h+0
	movf	(??_main+1)^080h+0,w
	iorwf	(main@temp)^080h,f
	
l1230:	
	line	463
	movlw	(01h)
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	addwf	(main@i)^080h,f
	
l6059:	
	movlw	(04h)
	subwf	(main@i)^080h,w
	skipc
	goto	u6351
	goto	u6350
u6351:
	goto	l6055
u6350:
	goto	l6061
	
l1229:	
	line	468
	
l6061:	
	movlw	(03h)
	subwf	(main@temp2)^080h,w
	skipc
	goto	u6361
	goto	u6360
u6361:
	goto	l6065
u6360:
	line	469
	
l6063:	
	movf	(main@sensor_index)^080h,w
	addlw	_danger_sensor&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	bsf	status,0
	rlf	indf1,f
	goto	l6067
	line	470
	
l1231:	
	line	471
	
l6065:	
	movlw	(05h)
	movwf	(??_main+0)^080h+0
	movf	(main@sensor_index)^080h,w
	addlw	_danger_sensor&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_main+0)^080h+0,w
	movwf	indf1
	goto	l6067
	
l1232:	
	line	473
	
l6067:	
	movf	(main@temp)^080h,w
	fcall	_led_on
	line	474
	
l6069:	
	opt asmopt_off
movlw  41
	movlb 1	; select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	150
movwf	((??_main+0)^080h+0+1),f
	movlw	166
movwf	((??_main+0)^080h+0),f
u6477:
	decfsz	((??_main+0)^080h+0),f
	goto	u6477
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6477
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6477
opt asmopt_on

	line	450
	
l6071:	
	movlw	(01h)
	movlb 1	; select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	addwf	(main@sensor_index)^080h,f
	
l6073:	
	movlw	(04h)
	subwf	(main@sensor_index)^080h,w
	skipc
	goto	u6371
	goto	u6370
u6371:
	goto	l1226
u6370:
	
l1227:	
	line	476
	clrf	(main@alarm)^080h
	line	477
	clrf	(main@i_1983)^080h
	
l6075:	
	movlw	(04h)
	subwf	(main@i_1983)^080h,w
	skipc
	goto	u6381
	goto	u6380
u6381:
	goto	l6079
u6380:
	goto	l6085
	
l6077:	
	goto	l6085
	line	478
	
l1233:	
	line	479
	
l6079:	
	movf	(main@i_1983)^080h,w
	addlw	_danger_sensor&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	01h&0ffh
	skipz
	goto	u6391
	goto	u6390
u6391:
	goto	l6083
u6390:
	line	480
	
l6081:	
	clrf	(main@alarm)^080h
	bsf	status,0
	rlf	(main@alarm)^080h,f
	goto	l6083
	
l1235:	
	line	477
	
l6083:	
	movlw	(01h)
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	addwf	(main@i_1983)^080h,f
	movlw	(04h)
	subwf	(main@i_1983)^080h,w
	skipc
	goto	u6401
	goto	u6400
u6401:
	goto	l6079
u6400:
	goto	l6085
	
l1234:	
	line	482
	
l6085:	
	movf	(main@alarm)^080h,w
	xorlw	01h&0ffh
	skipz
	goto	u6411
	goto	u6410
u6411:
	goto	l6089
u6410:
	line	484
	
l6087:	
	movlb 0	; select bank0
	clrf	(?_set_bit)
	bsf	status,0
	rlf	(?_set_bit),f
	movlw	(06h)
	fcall	_set_bit
	line	485
	goto	l1237
	line	486
	
l1236:	
	line	487
	
l6089:	
	movlb 0	; select bank0
	clrf	(?_set_bit)
	movlw	(06h)
	fcall	_set_bit
	
l1237:	
	line	488
	movlw	(0)
	fcall	_led_on
	goto	l6009
	line	489
	
l1225:	
	goto	l6009
	line	493
	
l1238:	
	line	432
	goto	l6009
	
l1239:	
	line	495
	
l1240:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_display_number
psect	text957,local,class=CODE,delta=2
global __ptext957
__ptext957:

;; *************** function _display_number *****************
;; Defined at:
;;		line 187 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   34[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    8
;; This function calls:
;;		___awdiv
;;		_display_digit
;;		___awmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text957
	file	"../PIC12f1840PINExpand.c"
	line	187
	global	__size_of_display_number
	__size_of_display_number	equ	__end_of_display_number-_display_number
	
_display_number:	
	opt	stack 7
; Regs used in _display_number: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(display_number@number)
	line	188
	
l5455:	
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
	line	190
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
	line	191
	
l1183:	
	return
	opt stack 0
GLOBAL	__end_of_display_number
	__end_of_display_number:
;; =============== function _display_number ends ============

	signat	_display_number,4216
	global	_led_on
psect	text958,local,class=CODE,delta=2
global __ptext958
__ptext958:

;; *************** function _led_on *****************
;; Defined at:
;;		line 302 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  led             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  led             1   27[BANK0 ] unsigned char 
;;  index           1   28[BANK0 ] unsigned char 
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
;;      Locals:         0       2       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_set_bit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text958
	file	"../PIC12f1840PINExpand.c"
	line	302
	global	__size_of_led_on
	__size_of_led_on	equ	__end_of_led_on-_led_on
	
_led_on:	
	opt	stack 8
; Regs used in _led_on: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(led_on@led)
	line	303
	
l5433:	
	clrf	(led_on@index)
	
l5435:	
	movlw	(08h)
	subwf	(led_on@index),w
	skipc
	goto	u5511
	goto	u5510
u5511:
	goto	l5439
u5510:
	goto	l5449
	
l5437:	
	goto	l5449
	line	304
	
l1213:	
	line	305
	
l5439:	
	movf	(led_on@led),w
	movwf	(??_led_on+0)+0
	decf	(led_on@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u5524
u5525:
	lsrf	(??_led_on+0)+0,f
u5524:
	decfsz	wreg,f
	goto	u5525
	movf	0+(??_led_on+0)+0,w
	andlw	01h
	movwf	(??_led_on+1)+0
	movf	(??_led_on+1)+0,w
	movwf	(?_set_bit)
	movlw	(01h)
	fcall	_set_bit
	line	307
	movlb 0	; select bank0
	clrf	(?_set_bit)
	bsf	status,0
	rlf	(?_set_bit),f
	movlw	(0)
	fcall	_set_bit
	line	309
	
l5441:	
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_led_on+0)+0,f
u6487:
decfsz	(??_led_on+0)+0,f
	goto	u6487
opt asmopt_on

	line	310
	
l5443:	
	movlb 0	; select bank0
	clrf	(?_set_bit)
	movlw	(0)
	fcall	_set_bit
	line	312
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_led_on+0)+0,f
u6497:
decfsz	(??_led_on+0)+0,f
	goto	u6497
opt asmopt_on

	line	303
	
l5445:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_led_on+0)+0
	movf	(??_led_on+0)+0,w
	addwf	(led_on@index),f
	
l5447:	
	movlw	(08h)
	subwf	(led_on@index),w
	skipc
	goto	u5531
	goto	u5530
u5531:
	goto	l5439
u5530:
	goto	l5449
	
l1214:	
	line	318
	
l5449:	
	clrf	(?_set_bit)
	bsf	status,0
	rlf	(?_set_bit),f
	movlw	(07h)
	fcall	_set_bit
	line	320
	
l5451:	
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_led_on+0)+0,f
u6507:
decfsz	(??_led_on+0)+0,f
	goto	u6507
opt asmopt_on

	line	321
	
l5453:	
	movlb 0	; select bank0
	clrf	(?_set_bit)
	movlw	(07h)
	fcall	_set_bit
	line	323
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_led_on+0)+0,f
u6517:
decfsz	(??_led_on+0)+0,f
	goto	u6517
opt asmopt_on

	line	326
	
l1215:	
	return
	opt stack 0
GLOBAL	__end_of_led_on
	__end_of_led_on:
;; =============== function _led_on ends ============

	signat	_led_on,4216
	global	_input_selection
psect	text959,local,class=CODE,delta=2
global __ptext959
__ptext959:

;; *************** function _input_selection *****************
;; Defined at:
;;		line 293 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   26[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_set_bit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text959
	file	"../PIC12f1840PINExpand.c"
	line	293
	global	__size_of_input_selection
	__size_of_input_selection	equ	__end_of_input_selection-_input_selection
	
_input_selection:	
	opt	stack 8
; Regs used in _input_selection: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(input_selection@number)
	line	294
	
l5431:	
	movf	(input_selection@number),w
	andlw	01h
	movwf	(??_input_selection+0)+0
	movf	(??_input_selection+0)+0,w
	movwf	(?_set_bit)
	movlw	(04h)
	fcall	_set_bit
	line	295
	movlb 0	; select bank0
	movf	(input_selection@number),w
	lsrf	wreg,f
	andlw	01h
	movwf	(??_input_selection+0)+0
	movf	(??_input_selection+0)+0,w
	movwf	(?_set_bit)
	movlw	(05h)
	fcall	_set_bit
	line	299
	
l1210:	
	return
	opt stack 0
GLOBAL	__end_of_input_selection
	__end_of_input_selection:
;; =============== function _input_selection ends ============

	signat	_input_selection,4216
	global	_display_digit
psect	text960,local,class=CODE,delta=2
global __ptext960
__ptext960:

;; *************** function _display_digit *****************
;; Defined at:
;;		line 129 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  segment_numb    1    wreg     unsigned char 
;;  value           1   25[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  segment_numb    1   29[BANK0 ] unsigned char 
;;  index           1   30[BANK0 ] unsigned char 
;;  temp            1   28[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_set_bit
;; This function is called by:
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text960
	file	"../PIC12f1840PINExpand.c"
	line	129
	global	__size_of_display_digit
	__size_of_display_digit	equ	__end_of_display_digit-_display_digit
	
_display_digit:	
	opt	stack 7
; Regs used in _display_digit: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(display_digit@segment_number)
	line	130
	
l5389:	
	movf	(display_digit@value),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??_display_digit+0)+0
	movf	(??_display_digit+0)+0,w
	movwf	(display_digit@temp)
	line	131
	
l5391:	
	movf	(_what_to_display),w
	xorlw	02h&0ffh
	skipz
	goto	u5431
	goto	u5430
u5431:
	goto	l5397
u5430:
	line	133
	
l5393:	
	movf	(display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u5441
	goto	u5440
u5441:
	goto	l1173
u5440:
	line	135
	
l5395:	
	bsf	(display_digit@temp)+(7/8),(7)&7
	goto	l1173
	line	136
	
l1172:	
	line	138
	goto	l1173
	line	139
	
l1171:	
	
l5397:	
	movf	(_what_to_display),w
	xorlw	03h&0ffh
	skipz
	goto	u5451
	goto	u5450
u5451:
	goto	l1173
u5450:
	line	141
	
l5399:	
	movf	(display_digit@segment_number),w
	xorlw	02h&0ffh
	skipz
	goto	u5461
	goto	u5460
u5461:
	goto	l1173
u5460:
	line	143
	
l5401:	
	bsf	(display_digit@temp)+(7/8),(7)&7
	goto	l1173
	line	144
	
l1175:	
	goto	l1173
	line	146
	
l1174:	
	line	149
	
l1173:	
	clrf	(display_digit@index)
	
l5403:	
	movlw	(08h)
	subwf	(display_digit@index),w
	skipc
	goto	u5471
	goto	u5470
u5471:
	goto	l5407
u5470:
	goto	l5417
	
l5405:	
	goto	l5417
	line	150
	
l1176:	
	line	151
	
l5407:	
	movf	(display_digit@temp),w
	movwf	(??_display_digit+0)+0
	decf	(display_digit@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u5484
u5485:
	lsrf	(??_display_digit+0)+0,f
u5484:
	decfsz	wreg,f
	goto	u5485
	movf	0+(??_display_digit+0)+0,w
	andlw	01h
	movwf	(??_display_digit+1)+0
	movf	(??_display_digit+1)+0,w
	movwf	(?_set_bit)
	movlw	(01h)
	fcall	_set_bit
	line	153
	movlb 0	; select bank0
	clrf	(?_set_bit)
	bsf	status,0
	rlf	(?_set_bit),f
	movlw	(0)
	fcall	_set_bit
	line	155
	
l5409:	
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_display_digit+0)+0,f
u6527:
decfsz	(??_display_digit+0)+0,f
	goto	u6527
opt asmopt_on

	line	156
	
l5411:	
	movlb 0	; select bank0
	clrf	(?_set_bit)
	movlw	(0)
	fcall	_set_bit
	line	158
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_display_digit+0)+0,f
u6537:
decfsz	(??_display_digit+0)+0,f
	goto	u6537
opt asmopt_on

	line	149
	
l5413:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_display_digit+0)+0
	movf	(??_display_digit+0)+0,w
	addwf	(display_digit@index),f
	
l5415:	
	movlw	(08h)
	subwf	(display_digit@index),w
	skipc
	goto	u5491
	goto	u5490
u5491:
	goto	l5407
u5490:
	goto	l5417
	
l1177:	
	line	163
	
l5417:	
	movf	(display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u5501
	goto	u5500
u5501:
	goto	l5425
u5500:
	line	165
	
l5419:	
	clrf	(?_set_bit)
	bsf	status,0
	rlf	(?_set_bit),f
	movlw	(02h)
	fcall	_set_bit
	line	167
	
l5421:	
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_display_digit+0)+0,f
u6547:
decfsz	(??_display_digit+0)+0,f
	goto	u6547
opt asmopt_on

	line	168
	
l5423:	
	movlb 0	; select bank0
	clrf	(?_set_bit)
	movlw	(02h)
	fcall	_set_bit
	line	170
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_display_digit+0)+0,f
u6557:
decfsz	(??_display_digit+0)+0,f
	goto	u6557
opt asmopt_on

	line	171
	goto	l1180
	line	172
	
l1178:	
	line	174
	
l5425:	
	movlb 0	; select bank0
	clrf	(?_set_bit)
	bsf	status,0
	rlf	(?_set_bit),f
	movlw	(03h)
	fcall	_set_bit
	line	176
	
l5427:	
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_display_digit+0)+0,f
u6567:
decfsz	(??_display_digit+0)+0,f
	goto	u6567
opt asmopt_on

	line	177
	
l5429:	
	movlb 0	; select bank0
	clrf	(?_set_bit)
	movlw	(03h)
	fcall	_set_bit
	line	179
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??_display_digit+0)+0,f
u6577:
decfsz	(??_display_digit+0)+0,f
	goto	u6577
opt asmopt_on

	goto	l1180
	line	180
	
l1179:	
	line	183
	
l1180:	
	return
	opt stack 0
GLOBAL	__end_of_display_digit
	__end_of_display_digit:
;; =============== function _display_digit ends ============

	signat	_display_digit,8312
	global	_set_bit
psect	text961,local,class=CODE,delta=2
global __ptext961
__ptext961:

;; *************** function _set_bit *****************
;; Defined at:
;;		line 259 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  bit_number      1    wreg     unsigned char 
;;  val             1   21[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  bit_number      1   24[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___awdiv
;;		_send_pin_value
;; This function is called by:
;;		_display_digit
;;		_input_selection
;;		_led_on
;;		_main
;; This function uses a non-reentrant model
;;
psect	text961
	file	"../PIC12f1840PINExpand.c"
	line	259
	global	__size_of_set_bit
	__size_of_set_bit	equ	__end_of_set_bit-_set_bit
	
_set_bit:	
	opt	stack 9
; Regs used in _set_bit: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(set_bit@bit_number)
	line	260
	
l5363:	
	movlw	low(08h)
	movwf	(?___awdiv)
	movlw	high(08h)
	movwf	((?___awdiv))+1
	movf	(set_bit@bit_number),w
	movwf	(??_set_bit+0)+0
	clrf	(??_set_bit+0)+0+1
	movf	0+(??_set_bit+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_set_bit+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movlb 0	; select bank0
	movf	((1+(?___awdiv))),w
	iorwf	((0+(?___awdiv))),w
	skipz
	goto	u5341
	goto	u5340
u5341:
	goto	l5377
u5340:
	line	262
	
l5365:	
	movf	(set_bit@val),w
	xorlw	01h&0ffh
	skipz
	goto	u5351
	goto	u5350
u5351:
	goto	l5371
u5350:
	line	264
	
l5367:	
	movlw	(01h)
	movwf	(??_set_bit+0)+0
	incf	(set_bit@bit_number),w
	goto	u5364
u5365:
	lslf	(??_set_bit+0)+0,f
u5364:
	decfsz	wreg,f
	goto	u5365
	movf	0+(??_set_bit+0)+0,w
	movwf	(??_set_bit+1)+0
	movf	(??_set_bit+1)+0,w
	iorwf	(_first_pinheader_value),f
	line	265
	
l5369:	
	movf	(_first_pinheader_value),w
	movwf	(??_set_bit+0)+0
	movf	(??_set_bit+0)+0,w
	movwf	(?_send_pin_value)
	movlw	(01h)
	fcall	_send_pin_value
	line	266
	goto	l1207
	line	267
	
l1200:	
	
l5371:	
	movlb 0	; select bank0
	movf	(set_bit@val),f
	skipz
	goto	u5371
	goto	u5370
u5371:
	goto	l1207
u5370:
	line	269
	
l5373:	
	movlw	(01h)
	movwf	(??_set_bit+0)+0
	incf	(set_bit@bit_number),w
	goto	u5384
u5385:
	lslf	(??_set_bit+0)+0,f
u5384:
	decfsz	wreg,f
	goto	u5385
	movf	0+(??_set_bit+0)+0,w
	xorlw	0ffh
	andwf	(_first_pinheader_value),w
	movwf	(??_set_bit+1)+0
	movf	(??_set_bit+1)+0,w
	movwf	(_first_pinheader_value)
	line	270
	
l5375:	
	movf	(_first_pinheader_value),w
	movwf	(??_set_bit+0)+0
	movf	(??_set_bit+0)+0,w
	movwf	(?_send_pin_value)
	movlw	(01h)
	fcall	_send_pin_value
	goto	l1207
	line	272
	
l1202:	
	goto	l1207
	line	273
	
l1201:	
	goto	l1207
	line	274
	
l1199:	
	line	276
	
l5377:	
	movlb 0	; select bank0
	movf	(set_bit@val),w
	xorlw	01h&0ffh
	skipz
	goto	u5391
	goto	u5390
u5391:
	goto	l5383
u5390:
	line	278
	
l5379:	
	movlw	(01h)
	movwf	(??_set_bit+0)+0
	movf	(set_bit@bit_number),w
	andlw	07h
	incf	wreg,f
	goto	u5404
u5405:
	lslf	(??_set_bit+0)+0,f
u5404:
	decfsz	wreg,f
	goto	u5405
	movf	0+(??_set_bit+0)+0,w
	movwf	(??_set_bit+1)+0
	movf	(??_set_bit+1)+0,w
	iorwf	(_second_pinheader_value),f
	line	279
	
l5381:	
	movf	(_second_pinheader_value),w
	movwf	(??_set_bit+0)+0
	movf	(??_set_bit+0)+0,w
	movwf	(?_send_pin_value)
	movlw	(02h)
	fcall	_send_pin_value
	line	280
	goto	l1207
	line	281
	
l1204:	
	
l5383:	
	movlb 0	; select bank0
	movf	(set_bit@val),f
	skipz
	goto	u5411
	goto	u5410
u5411:
	goto	l1207
u5410:
	line	283
	
l5385:	
	movlw	(01h)
	movwf	(??_set_bit+0)+0
	movf	(set_bit@bit_number),w
	andlw	07h
	incf	wreg,f
	goto	u5424
u5425:
	lslf	(??_set_bit+0)+0,f
u5424:
	decfsz	wreg,f
	goto	u5425
	movf	0+(??_set_bit+0)+0,w
	xorlw	0ffh
	andwf	(_second_pinheader_value),w
	movwf	(??_set_bit+1)+0
	movf	(??_set_bit+1)+0,w
	movwf	(_second_pinheader_value)
	line	284
	
l5387:	
	movf	(_second_pinheader_value),w
	movwf	(??_set_bit+0)+0
	movf	(??_set_bit+0)+0,w
	movwf	(?_send_pin_value)
	movlw	(02h)
	fcall	_send_pin_value
	goto	l1207
	line	286
	
l1206:	
	goto	l1207
	line	288
	
l1205:	
	goto	l1207
	
l1203:	
	line	290
	
l1207:	
	return
	opt stack 0
GLOBAL	__end_of_set_bit
	__end_of_set_bit:
;; =============== function _set_bit ends ============

	signat	_set_bit,8312
	global	___awtoft
psect	text962,local,class=CODE,delta=2
global __ptext962
__ptext962:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   34[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   39[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   34[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       3       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text962
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 9
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l5909:	
	movlb 0	; select bank0
	clrf	(___awtoft@sign)
	line	37
	btfss	(___awtoft@c+1),7
	goto	u6281
	goto	u6280
u6281:
	goto	l5913
u6280:
	line	38
	
l5911:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	clrf	(___awtoft@sign)
	bsf	status,0
	rlf	(___awtoft@sign),f
	goto	l5913
	line	40
	
l2401:	
	line	41
	
l5913:	
	movf	(___awtoft@c),w
	movwf	(?___ftpack)
	movf	(___awtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___awtoft+0)+0
	movf	(??___awtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___awtoft@sign),w
	movwf	(??___awtoft+1)+0
	movf	(??___awtoft+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movlb 0	; select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	goto	l2402
	
l5915:	
	line	42
	
l2402:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___lbtoft
psect	text963,local,class=CODE,delta=2
global __ptext963
__ptext963:

;; *************** function ___lbtoft *****************
;; Defined at:
;;		line 28 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lbtoft.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   41[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   34[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       3       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       4       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text963
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lbtoft.c"
	line	28
	global	__size_of___lbtoft
	__size_of___lbtoft	equ	__end_of___lbtoft-___lbtoft
	
___lbtoft:	
	opt	stack 9
; Regs used in ___lbtoft: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(___lbtoft@c)
	line	29
	
l5905:	
	movf	(___lbtoft@c),w
	movwf	((??___lbtoft+0)+0)
	clrf	((??___lbtoft+0)+0+1)
	clrf	((??___lbtoft+0)+0+2)
	movf	0+(??___lbtoft+0)+0,w
	movwf	(?___ftpack)
	movf	1+(??___lbtoft+0)+0,w
	movwf	(?___ftpack+1)
	movf	2+(??___lbtoft+0)+0,w
	movwf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lbtoft+3)+0
	movf	(??___lbtoft+3)+0,w
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movlb 0	; select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___lbtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lbtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lbtoft+2)
	goto	l2390
	
l5907:	
	line	30
	
l2390:	
	return
	opt stack 0
GLOBAL	__end_of___lbtoft
	__end_of___lbtoft:
;; =============== function ___lbtoft ends ============

	signat	___lbtoft,4219
	global	___ftmul
psect	text964,local,class=CODE,delta=2
global __ptext964
__ptext964:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   40[BANK0 ] float 
;;  f2              3   43[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3    1[BANK1 ] unsigned um
;;  sign            1    5[BANK1 ] unsigned char 
;;  cntr            1    4[BANK1 ] unsigned char 
;;  exp             1    0[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   40[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       6       0       0
;;      Locals:         0       0       6       0
;;      Temps:          0       4       0       0
;;      Totals:         0      10       6       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text964
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 9
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l5855:	
	movlb 0	; select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movlb 1	; select bank1
	movwf	(___ftmul@exp)^080h
	movf	((___ftmul@exp)^080h),f
	skipz
	goto	u6161
	goto	u6160
u6161:
	goto	l5861
u6160:
	line	57
	
l5857:	
	movlw	0x0
	movlb 0	; select bank0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l2364
	
l5859:	
	goto	l2364
	
l2363:	
	line	58
	
l5861:	
	movlb 0	; select bank0
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movlb 1	; select bank1
	movwf	(___ftmul@sign)^080h
	movf	((___ftmul@sign)^080h),f
	skipz
	goto	u6171
	goto	u6170
u6171:
	goto	l5867
u6170:
	line	59
	
l5863:	
	movlw	0x0
	movlb 0	; select bank0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l2364
	
l5865:	
	goto	l2364
	
l2365:	
	line	60
	
l5867:	
	movlb 1	; select bank1
	movf	(___ftmul@sign)^080h,w
	addlw	07Bh
	movlb 0	; select bank0
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movlb 1	; select bank1
	addwf	(___ftmul@exp)^080h,f
	line	61
	movlb 0	; select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u6185:
	lsrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u6180:
	decfsz	wreg,f
	goto	u6185
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movlb 1	; select bank1
	movwf	(___ftmul@sign)^080h
	line	62
	movlb 0	; select bank0
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u6195:
	lsrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u6190:
	decfsz	wreg,f
	goto	u6195
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movlb 1	; select bank1
	xorwf	(___ftmul@sign)^080h,f
	line	63
	movlw	(080h)
	movlb 0	; select bank0
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movlb 1	; select bank1
	andwf	(___ftmul@sign)^080h,f
	line	64
	
l5869:	
	movlb 0	; select bank0
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l5871:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l5873:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l5875:	
	movlw	0
	movlb 1	; select bank1
	movwf	(___ftmul@f3_as_product)^080h
	movlw	0
	movwf	(___ftmul@f3_as_product+1)^080h
	movlw	0
	movwf	(___ftmul@f3_as_product+2)^080h
	line	69
	
l5877:	
	movlw	(07h)
	movlb 0	; select bank0
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movlb 1	; select bank1
	movwf	(___ftmul@cntr)^080h
	goto	l5879
	line	70
	
l2366:	
	line	71
	
l5879:	
	movlb 0	; select bank0
	btfss	(___ftmul@f1),(0)&7
	goto	u6201
	goto	u6200
u6201:
	goto	l5883
u6200:
	line	72
	
l5881:	
	movf	(___ftmul@f2),w
	movlb 1	; select bank1
	addwf	(___ftmul@f3_as_product)^080h,f
	movlb 0	; select bank0
	movf	(___ftmul@f2+1),w
	movlb 1	; select bank1
	addwfc	(___ftmul@f3_as_product+1)^080h,f
	movlb 0	; select bank0
	movf	(___ftmul@f2+2),w
	movlb 1	; select bank1
	addwfc	(___ftmul@f3_as_product+2)^080h,f
	goto	l5883
	
l2367:	
	line	73
	
l5883:	
	movlw	01h
u6215:
	movlb 0	; select bank0
	lsrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	decfsz	wreg,f
	goto	u6215

	line	74
	
l5885:	
	movlw	01h
u6225:
	lslf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	decfsz	wreg,f
	goto	u6225
	line	75
	
l5887:	
	movlw	low(01h)
	movlb 1	; select bank1
	subwf	(___ftmul@cntr)^080h,f
	btfss	status,2
	goto	u6231
	goto	u6230
u6231:
	goto	l5879
u6230:
	goto	l5889
	
l2368:	
	line	76
	
l5889:	
	movlw	(09h)
	movlb 0	; select bank0
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movlb 1	; select bank1
	movwf	(___ftmul@cntr)^080h
	goto	l5891
	line	77
	
l2369:	
	line	78
	
l5891:	
	movlb 0	; select bank0
	btfss	(___ftmul@f1),(0)&7
	goto	u6241
	goto	u6240
u6241:
	goto	l5895
u6240:
	line	79
	
l5893:	
	movf	(___ftmul@f2),w
	movlb 1	; select bank1
	addwf	(___ftmul@f3_as_product)^080h,f
	movlb 0	; select bank0
	movf	(___ftmul@f2+1),w
	movlb 1	; select bank1
	addwfc	(___ftmul@f3_as_product+1)^080h,f
	movlb 0	; select bank0
	movf	(___ftmul@f2+2),w
	movlb 1	; select bank1
	addwfc	(___ftmul@f3_as_product+2)^080h,f
	goto	l5895
	
l2370:	
	line	80
	
l5895:	
	movlw	01h
u6255:
	movlb 0	; select bank0
	lsrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	decfsz	wreg,f
	goto	u6255

	line	81
	
l5897:	
	movlw	01h
u6265:
	movlb 1	; select bank1
	lsrf	(___ftmul@f3_as_product+2)^080h,f
	rrf	(___ftmul@f3_as_product+1)^080h,f
	rrf	(___ftmul@f3_as_product)^080h,f
	decfsz	wreg,f
	goto	u6265

	line	82
	
l5899:	
	movlw	low(01h)
	subwf	(___ftmul@cntr)^080h,f
	btfss	status,2
	goto	u6271
	goto	u6270
u6271:
	goto	l5891
u6270:
	goto	l5901
	
l2371:	
	line	83
	
l5901:	
	movf	(___ftmul@f3_as_product)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftpack)
	movlb 1	; select bank1
	movf	(___ftmul@f3_as_product+1)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftpack+1)
	movlb 1	; select bank1
	movf	(___ftmul@f3_as_product+2)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftpack+2)
	movlb 1	; select bank1
	movf	(___ftmul@exp)^080h,w
	movlb 0	; select bank0
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movlb 1	; select bank1
	movf	(___ftmul@sign)^080h,w
	movlb 0	; select bank0
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movlb 0	; select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	l2364
	
l5903:	
	line	84
	
l2364:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text965,local,class=CODE,delta=2
global __ptext965
__ptext965:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   42[BANK0 ] float 
;;  f1              3   45[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3    1[BANK1 ] float 
;;  sign            1    5[BANK1 ] unsigned char 
;;  exp             1    4[BANK1 ] unsigned char 
;;  cntr            1    0[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   42[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       6       0       0
;;      Locals:         0       0       6       0
;;      Temps:          0       4       0       0
;;      Totals:         0      10       6       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text965
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 9
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l5813:	
	movlb 0	; select bank0
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movlb 1	; select bank1
	movwf	(___ftdiv@exp)^080h
	movf	((___ftdiv@exp)^080h),f
	skipz
	goto	u6081
	goto	u6080
u6081:
	goto	l5819
u6080:
	line	56
	
l5815:	
	movlw	0x0
	movlb 0	; select bank0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l2354
	
l5817:	
	goto	l2354
	
l2353:	
	line	57
	
l5819:	
	movlb 0	; select bank0
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movlb 1	; select bank1
	movwf	(___ftdiv@sign)^080h
	movf	((___ftdiv@sign)^080h),f
	skipz
	goto	u6091
	goto	u6090
u6091:
	goto	l5825
u6090:
	line	58
	
l5821:	
	movlw	0x0
	movlb 0	; select bank0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l2354
	
l5823:	
	goto	l2354
	
l2355:	
	line	59
	
l5825:	
	movlw	0
	movlb 1	; select bank1
	movwf	(___ftdiv@f3)^080h
	movlw	0
	movwf	(___ftdiv@f3+1)^080h
	movlw	0
	movwf	(___ftdiv@f3+2)^080h
	line	60
	
l5827:	
	movlw	(089h)
	addwf	(___ftdiv@sign)^080h,w
	movlb 0	; select bank0
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	movlb 1	; select bank1
	subwf	(___ftdiv@exp)^080h,f
	line	61
	
l5829:	
	movlb 0	; select bank0
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u6105:
	lsrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u6100:
	decfsz	wreg,f
	goto	u6105
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movlb 1	; select bank1
	movwf	(___ftdiv@sign)^080h
	line	62
	
l5831:	
	movlb 0	; select bank0
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u6115:
	lsrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u6110:
	decfsz	wreg,f
	goto	u6115
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movlb 1	; select bank1
	xorwf	(___ftdiv@sign)^080h,f
	line	63
	
l5833:	
	movlw	(080h)
	movlb 0	; select bank0
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movlb 1	; select bank1
	andwf	(___ftdiv@sign)^080h,f
	line	64
	
l5835:	
	movlb 0	; select bank0
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l5837:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	movlw	(018h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movlb 1	; select bank1
	movwf	(___ftdiv@cntr)^080h
	goto	l5839
	line	69
	
l2356:	
	line	70
	
l5839:	
	movlw	01h
u6125:
	lslf	(___ftdiv@f3)^080h,f
	rlf	(___ftdiv@f3+1)^080h,f
	rlf	(___ftdiv@f3+2)^080h,f
	decfsz	wreg,f
	goto	u6125
	line	71
	
l5841:	
	movlb 0	; select bank0
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u6135
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u6135
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u6135:
	skipc
	goto	u6131
	goto	u6130
u6131:
	goto	l5847
u6130:
	line	72
	
l5843:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	subwfb	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	subwfb	(___ftdiv@f1+2),f
	line	73
	
l5845:	
	movlb 1	; select bank1
	bsf	(___ftdiv@f3)^080h+(0/8),(0)&7
	goto	l5847
	line	74
	
l2357:	
	line	75
	
l5847:	
	movlw	01h
u6145:
	movlb 0	; select bank0
	lslf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	decfsz	wreg,f
	goto	u6145
	line	76
	
l5849:	
	movlw	low(01h)
	movlb 1	; select bank1
	subwf	(___ftdiv@cntr)^080h,f
	btfss	status,2
	goto	u6151
	goto	u6150
u6151:
	goto	l5839
u6150:
	goto	l5851
	
l2358:	
	line	77
	
l5851:	
	movf	(___ftdiv@f3)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftpack)
	movlb 1	; select bank1
	movf	(___ftdiv@f3+1)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftpack+1)
	movlb 1	; select bank1
	movf	(___ftdiv@f3+2)^080h,w
	movlb 0	; select bank0
	movwf	(?___ftpack+2)
	movlb 1	; select bank1
	movf	(___ftdiv@exp)^080h,w
	movlb 0	; select bank0
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	0+(?___ftpack)+03h
	movlb 1	; select bank1
	movf	(___ftdiv@sign)^080h,w
	movlb 0	; select bank0
	movwf	(??___ftdiv+1)+0
	movf	(??___ftdiv+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movlb 0	; select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	goto	l2354
	
l5853:	
	line	78
	
l2354:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	_send_pin_value
psect	text966,local,class=CODE,delta=2
global __ptext966
__ptext966:

;; *************** function _send_pin_value *****************
;; Defined at:
;;		line 77 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  segment_numb    1    wreg     unsigned char 
;;  value           1   12[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  segment_numb    1   14[BANK0 ] unsigned char 
;;  index           1   15[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_set_bit
;; This function uses a non-reentrant model
;;
psect	text966
	file	"../PIC12f1840PINExpand.c"
	line	77
	global	__size_of_send_pin_value
	__size_of_send_pin_value	equ	__end_of_send_pin_value-_send_pin_value
	
_send_pin_value:	
	opt	stack 9
; Regs used in _send_pin_value: [wreg+status,2+status,0]
	line	81
	movlb 0	; select bank0
	movwf	(send_pin_value@segment_number)
	
l5229:	
	clrf	(send_pin_value@index)
	
l5231:	
	movlw	(08h)
	subwf	(send_pin_value@index),w
	skipc
	goto	u5071
	goto	u5070
u5071:
	goto	l5235
u5070:
	goto	l5247
	
l5233:	
	goto	l5247
	line	82
	
l1164:	
	line	83
	
l5235:	
	movf	(send_pin_value@value),w
	movwf	(??_send_pin_value+0)+0
	decf	(send_pin_value@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u5084
u5085:
	lsrf	(??_send_pin_value+0)+0,f
u5084:
	decfsz	wreg,f
	goto	u5085
	btfsc	0+(??_send_pin_value+0)+0,0
	goto	u5091
	goto	u5090
	
u5091:
	movlb 0	; select bank0
	bsf	(97/8),(97)&7
	goto	u5104
u5090:
	movlb 0	; select bank0
	bcf	(97/8),(97)&7
u5104:
	line	85
	
l5237:	
	bsf	(96/8),(96)&7
	line	87
	
l5239:	
	opt asmopt_off
movlw	133
movwf	(??_send_pin_value+0)+0,f
u6587:
decfsz	(??_send_pin_value+0)+0,f
	goto	u6587
opt asmopt_on

	line	88
	
l5241:	
	movlb 0	; select bank0
	bcf	(96/8),(96)&7
	line	90
	
l5243:	
	opt asmopt_off
movlw	133
movwf	(??_send_pin_value+0)+0,f
u6597:
decfsz	(??_send_pin_value+0)+0,f
	goto	u6597
opt asmopt_on

	line	81
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_send_pin_value+0)+0
	movf	(??_send_pin_value+0)+0,w
	addwf	(send_pin_value@index),f
	
l5245:	
	movlw	(08h)
	subwf	(send_pin_value@index),w
	skipc
	goto	u5111
	goto	u5110
u5111:
	goto	l5235
u5110:
	goto	l5247
	
l1165:	
	line	95
	
l5247:	
	movf	(send_pin_value@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u5121
	goto	u5120
u5121:
	goto	l1166
u5120:
	line	97
	
l5249:	
	bsf	(98/8),(98)&7
	line	99
	
l5251:	
	opt asmopt_off
movlw	133
movwf	(??_send_pin_value+0)+0,f
u6607:
decfsz	(??_send_pin_value+0)+0,f
	goto	u6607
opt asmopt_on

	line	100
	
l5253:	
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	102
	opt asmopt_off
movlw	133
movwf	(??_send_pin_value+0)+0,f
u6617:
decfsz	(??_send_pin_value+0)+0,f
	goto	u6617
opt asmopt_on

	line	103
	goto	l1168
	line	104
	
l1166:	
	line	106
	bsf	(100/8),(100)&7
	line	108
	
l5255:	
	opt asmopt_off
movlw	133
movwf	(??_send_pin_value+0)+0,f
u6627:
decfsz	(??_send_pin_value+0)+0,f
	goto	u6627
opt asmopt_on

	line	109
	
l5257:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	111
	opt asmopt_off
movlw	133
movwf	(??_send_pin_value+0)+0,f
u6637:
decfsz	(??_send_pin_value+0)+0,f
	goto	u6637
opt asmopt_on

	goto	l1168
	line	112
	
l1167:	
	line	115
	
l1168:	
	return
	opt stack 0
GLOBAL	__end_of_send_pin_value
	__end_of_send_pin_value:
;; =============== function _send_pin_value ends ============

	signat	_send_pin_value,8312
	global	_DHT11_get_data
psect	text967,local,class=CODE,delta=2
global __ptext967
__ptext967:

;; *************** function _DHT11_get_data *****************
;; Defined at:
;;		line 29 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  bit_index       1   16[BANK0 ] char 
;;  byte_index      1   15[BANK0 ] unsigned char 
;;  a               1   14[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text967
	file	"../PIC12f1840PINExpand.c"
	line	29
	global	__size_of_DHT11_get_data
	__size_of_DHT11_get_data	equ	__end_of_DHT11_get_data-_DHT11_get_data
	
_DHT11_get_data:	
	opt	stack 10
; Regs used in _DHT11_get_data: [wreg+fsr1l-status,0]
	line	30
	
l5177:	
	movlb 0	; select bank0
	clrf	(DHT11_get_data@a)
	
l5179:	
	movlw	(05h)
	subwf	(DHT11_get_data@a),w
	skipc
	goto	u4941
	goto	u4940
u4941:
	goto	l5183
u4940:
	goto	l1140
	
l5181:	
	goto	l1140
	
l1139:	
	
l5183:	
	movf	(DHT11_get_data@a),w
	addlw	_dht11_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l5185:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@a),f
	
l5187:	
	movlw	(05h)
	subwf	(DHT11_get_data@a),w
	skipc
	goto	u4951
	goto	u4950
u4951:
	goto	l5183
u4950:
	
l1140:	
	line	32
	bcf	(101/8),(101)&7
	line	33
	movlb 1	; select bank1
	bcf	(1125/8)^080h,(1125)&7
	line	34
	
l5189:	
	opt asmopt_off
movlw	104
	movlb 0	; select bank0
movwf	((??_DHT11_get_data+0)+0+1),f
	movlw	228
movwf	((??_DHT11_get_data+0)+0),f
u6647:
	decfsz	((??_DHT11_get_data+0)+0),f
	goto	u6647
	decfsz	((??_DHT11_get_data+0)+0+1),f
	goto	u6647
	clrwdt
opt asmopt_on

	line	35
	
l5191:	
	movlb 1	; select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	36
	opt asmopt_off
movlw	26
	movlb 0	; select bank0
movwf	(??_DHT11_get_data+0)+0,f
u6657:
decfsz	(??_DHT11_get_data+0)+0,f
	goto	u6657
	clrwdt
opt asmopt_on

	line	37
	goto	l1141
	
l1142:	
	
l1141:	
	movlb 0	; select bank0
	btfsc	(101/8),(101)&7
	goto	u4961
	goto	u4960
u4961:
	goto	l1141
u4960:
	goto	l1144
	
l1143:	
	line	39
	goto	l1144
	
l1145:	
	
l1144:	
	btfss	(101/8),(101)&7
	goto	u4971
	goto	u4970
u4971:
	goto	l1144
u4970:
	goto	l1147
	
l1146:	
	line	40
	goto	l1147
	
l1148:	
	
l1147:	
	btfsc	(101/8),(101)&7
	goto	u4981
	goto	u4980
u4981:
	goto	l1147
u4980:
	
l1149:	
	line	42
	clrf	(DHT11_get_data@byte_index)
	
l5193:	
	movlw	(05h)
	subwf	(DHT11_get_data@byte_index),w
	skipc
	goto	u4991
	goto	u4990
u4991:
	goto	l5197
u4990:
	goto	l5227
	
l5195:	
	goto	l5227
	line	43
	
l1150:	
	line	45
	
l5197:	
	movlw	(07h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	movwf	(DHT11_get_data@bit_index)
	
l5199:	
	btfss	(DHT11_get_data@bit_index),7
	goto	u5001
	goto	u5000
u5001:
	goto	l5205
u5000:
	goto	l5223
	
l5201:	
	goto	l5223
	line	46
	
l1152:	
	line	47
	goto	l5205
	
l1155:	
	
l5203:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(_low_time_count),f
	goto	l5205
	
l1154:	
	
l5205:	
	btfss	(101/8),(101)&7
	goto	u5011
	goto	u5010
u5011:
	goto	l5203
u5010:
	goto	l5209
	
l1156:	
	line	48
	goto	l5209
	
l1158:	
	
l5207:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(_high_time_count),f
	goto	l5209
	
l1157:	
	
l5209:	
	btfsc	(101/8),(101)&7
	goto	u5021
	goto	u5020
u5021:
	goto	l5207
u5020:
	goto	l5211
	
l1159:	
	line	49
	
l5211:	
	movf	(_high_time_count),w
	subwf	(_low_time_count),w
	skipnc
	goto	u5031
	goto	u5030
u5031:
	goto	l5215
u5030:
	line	51
	
l5213:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	incf	(DHT11_get_data@bit_index),w
	goto	u5044
u5045:
	lslf	(??_DHT11_get_data+0)+0,f
u5044:
	decfsz	wreg,f
	goto	u5045
	movf	0+(??_DHT11_get_data+0)+0,w
	movwf	(??_DHT11_get_data+1)+0
	movf	(DHT11_get_data@byte_index),w
	addlw	_dht11_data&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_DHT11_get_data+1)+0,w
	iorwf	indf1,f
	goto	l5215
	line	52
	
l1160:	
	line	54
	
l5215:	
	clrf	(_low_time_count)
	line	55
	
l5217:	
	clrf	(_high_time_count)
	line	45
	
l5219:	
	movlw	(-1)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@bit_index),f
	
l5221:	
	btfss	(DHT11_get_data@bit_index),7
	goto	u5051
	goto	u5050
u5051:
	goto	l5205
u5050:
	goto	l5223
	
l1153:	
	line	42
	
l5223:	
	movlw	(01h)
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	addwf	(DHT11_get_data@byte_index),f
	
l5225:	
	movlw	(05h)
	subwf	(DHT11_get_data@byte_index),w
	skipc
	goto	u5061
	goto	u5060
u5061:
	goto	l5197
u5060:
	goto	l5227
	
l1151:	
	line	62
	
l5227:	
	movf	0+(_dht11_data)+02h,w
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	movlb 1	; select bank1
	movwf	(_sicaklik)^080h
	line	63
	movlb 0	; select bank0
	movf	(_dht11_data),w
	movwf	(??_DHT11_get_data+0)+0
	movf	(??_DHT11_get_data+0)+0,w
	movlb 1	; select bank1
	movwf	(_nem)^080h
	line	68
	
l1161:	
	return
	opt stack 0
GLOBAL	__end_of_DHT11_get_data
	__end_of_DHT11_get_data:
;; =============== function _DHT11_get_data ends ============

	signat	_DHT11_get_data,88
	global	___awmod
psect	text968,local,class=CODE,delta=2
global __ptext968
__ptext968:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   12[BANK0 ] int 
;;  dividend        2   14[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   18[BANK0 ] unsigned char 
;;  counter         1   17[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   12[BANK0 ] int 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display_number
;; This function uses a non-reentrant model
;;
psect	text968
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 9
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l4915:	
	movlb 0	; select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4361
	goto	u4360
u4361:
	goto	l4919
u4360:
	line	10
	
l4917:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l4919
	line	12
	
l2473:	
	line	13
	
l4919:	
	btfss	(___awmod@divisor+1),7
	goto	u4371
	goto	u4370
u4371:
	goto	l4923
u4370:
	line	14
	
l4921:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l4923
	
l2474:	
	line	15
	
l4923:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4381
	goto	u4380
u4381:
	goto	l4941
u4380:
	line	16
	
l4925:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l4931
	
l2477:	
	line	18
	
l4927:	
	movlw	01h
	
u4395:
	lslf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u4395
	line	19
	
l4929:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l4931
	line	20
	
l2476:	
	line	17
	
l4931:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4401
	goto	u4400
u4401:
	goto	l4927
u4400:
	goto	l4933
	
l2478:	
	goto	l4933
	line	21
	
l2479:	
	line	22
	
l4933:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4415
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4415:
	skipc
	goto	u4411
	goto	u4410
u4411:
	goto	l4937
u4410:
	line	23
	
l4935:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	subwfb	(___awmod@dividend+1),f
	goto	l4937
	
l2480:	
	line	24
	
l4937:	
	movlw	01h
	
u4425:
	lsrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	decfsz	wreg,f
	goto	u4425
	line	25
	
l4939:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4431
	goto	u4430
u4431:
	goto	l4933
u4430:
	goto	l4941
	
l2481:	
	goto	l4941
	line	26
	
l2475:	
	line	27
	
l4941:	
	movf	(___awmod@sign),w
	skipz
	goto	u4440
	goto	l4945
u4440:
	line	28
	
l4943:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l4945
	
l2482:	
	line	29
	
l4945:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l2483
	
l4947:	
	line	30
	
l2483:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text969,local,class=CODE,delta=2
global __ptext969
__ptext969:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   12[BANK0 ] int 
;;  dividend        2   14[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   19[BANK0 ] int 
;;  sign            1   18[BANK0 ] unsigned char 
;;  counter         1   17[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   12[BANK0 ] int 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display_number
;;		_set_bit
;; This function uses a non-reentrant model
;;
psect	text969
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 9
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l4875:	
	movlb 0	; select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u4261
	goto	u4260
u4261:
	goto	l4879
u4260:
	line	11
	
l4877:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l4879
	line	13
	
l2405:	
	line	14
	
l4879:	
	btfss	(___awdiv@dividend+1),7
	goto	u4271
	goto	u4270
u4271:
	goto	l4885
u4270:
	line	15
	
l4881:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4883:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l4885
	line	17
	
l2406:	
	line	18
	
l4885:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l4887:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u4281
	goto	u4280
u4281:
	goto	l4907
u4280:
	line	20
	
l4889:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l4895
	
l2409:	
	line	22
	
l4891:	
	movlw	01h
	
u4295:
	lslf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u4295
	line	23
	
l4893:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l4895
	line	24
	
l2408:	
	line	21
	
l4895:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u4301
	goto	u4300
u4301:
	goto	l4891
u4300:
	goto	l4897
	
l2410:	
	goto	l4897
	line	25
	
l2411:	
	line	26
	
l4897:	
	movlw	01h
	
u4315:
	lslf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u4315
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u4325
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u4325:
	skipc
	goto	u4321
	goto	u4320
u4321:
	goto	l4903
u4320:
	line	28
	
l4899:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	subwfb	(___awdiv@dividend+1),f
	line	29
	
l4901:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l4903
	line	30
	
l2412:	
	line	31
	
l4903:	
	movlw	01h
	
u4335:
	lsrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	decfsz	wreg,f
	goto	u4335
	line	32
	
l4905:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u4341
	goto	u4340
u4341:
	goto	l4897
u4340:
	goto	l4907
	
l2413:	
	goto	l4907
	line	33
	
l2407:	
	line	34
	
l4907:	
	movf	(___awdiv@sign),w
	skipz
	goto	u4350
	goto	l4911
u4350:
	line	35
	
l4909:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l4911
	
l2414:	
	line	36
	
l4911:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2415
	
l4913:	
	line	37
	
l2415:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___fttol
psect	text970,local,class=CODE,delta=2
global __ptext970
__ptext970:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3   20[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   29[BANK0 ] unsigned long 
;;  exp1            1   33[BANK0 ] unsigned char 
;;  sign1           1   28[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   20[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       6       0       0
;;      Temps:          0       4       0       0
;;      Totals:         0      14       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text970
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 10
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l4819:	
	movlb 0	; select bank0
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u4151
	goto	u4150
u4151:
	goto	l4825
u4150:
	line	50
	
l4821:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2375
	
l4823:	
	goto	l2375
	
l2374:	
	line	51
	
l4825:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u4165:
	lsrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u4160:
	decfsz	wreg,f
	goto	u4165
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l4827:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l4829:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l4831:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l4833:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l4835:	
	btfss	(___fttol@exp1),7
	goto	u4171
	goto	u4170
u4171:
	goto	l4845
u4170:
	line	57
	
l4837:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u4181
	goto	u4180
u4181:
	goto	l4843
u4180:
	line	58
	
l4839:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2375
	
l4841:	
	goto	l2375
	
l2377:	
	goto	l4843
	line	59
	
l2378:	
	line	60
	
l4843:	
	movlw	01h
u4195:
	lsrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	decfsz	wreg,f
	goto	u4195

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u4201
	goto	u4200
u4201:
	goto	l4843
u4200:
	goto	l4855
	
l2379:	
	line	62
	goto	l4855
	
l2376:	
	line	63
	
l4845:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u4211
	goto	u4210
u4211:
	goto	l4853
u4210:
	line	64
	
l4847:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2375
	
l4849:	
	goto	l2375
	
l2381:	
	line	65
	goto	l4853
	
l2383:	
	line	66
	
l4851:	
	movlw	01h
u4225:
	lslf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	wreg,f
	goto	u4225
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l4853
	line	68
	
l2382:	
	line	65
	
l4853:	
	movf	(___fttol@exp1),f
	skipz
	goto	u4231
	goto	u4230
u4231:
	goto	l4851
u4230:
	goto	l4855
	
l2384:	
	goto	l4855
	line	69
	
l2380:	
	line	70
	
l4855:	
	movf	(___fttol@sign1),w
	skipz
	goto	u4240
	goto	l4859
u4240:
	line	71
	
l4857:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	goto	l4859
	
l2385:	
	line	72
	
l4859:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l2375
	
l4861:	
	line	73
	
l2375:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text971,local,class=CODE,delta=2
global __ptext971
__ptext971:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3   12[BANK0 ] unsigned um
;;  exp             1   15[BANK0 ] unsigned char 
;;  sign            1   16[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   12[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       5       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftdiv
;;		___ftmul
;;		___lbtoft
;;		___awtoft
;;		___ftadd
;;		___abtoft
;;		___lwtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text971
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 9
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l5719:	
	movlb 0	; select bank0
	movf	(___ftpack@exp),w
	skipz
	goto	u5900
	goto	l5723
u5900:
	
l5721:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u5911
	goto	u5910
u5911:
	goto	l5729
u5910:
	goto	l5723
	
l2599:	
	line	65
	
l5723:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l2600
	
l5725:	
	goto	l2600
	
l2597:	
	line	66
	goto	l5729
	
l2602:	
	line	67
	
l5727:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u5925:
	lsrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	decfsz	wreg,f
	goto	u5925

	goto	l5729
	line	69
	
l2601:	
	line	66
	
l5729:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u5931
	goto	u5930
u5931:
	goto	l5727
u5930:
	goto	l2604
	
l2603:	
	line	70
	goto	l2604
	
l2605:	
	line	71
	
l5731:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l5733:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l5735:	
	movlw	01h
u5945:
	lsrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	decfsz	wreg,f
	goto	u5945

	line	74
	
l2604:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u5951
	goto	u5950
u5951:
	goto	l5731
u5950:
	goto	l5739
	
l2606:	
	line	75
	goto	l5739
	
l2608:	
	line	76
	
l5737:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u5965:
	lslf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	decfsz	wreg,f
	goto	u5965
	goto	l5739
	line	78
	
l2607:	
	line	75
	
l5739:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u5971
	goto	u5970
u5971:
	goto	l5737
u5970:
	
l2609:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u5981
	goto	u5980
u5981:
	goto	l2610
u5980:
	line	80
	
l5741:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l2610:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l5743:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u5995:
	lslf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u5990:
	decfsz	wreg,f
	goto	u5995
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l5745:	
	movf	(___ftpack@sign),w
	skipz
	goto	u6000
	goto	l2611
u6000:
	line	84
	
l5747:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l2611:	
	line	85
	line	86
	
l2600:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___bmul
psect	text972,local,class=CODE,delta=2
global __ptext972
__ptext972:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1   12[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1   15[BANK0 ] unsigned char 
;;  product         1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text972
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 10
; Regs used in ___bmul: [wreg+status,2+status,0]
	movlb 0	; select bank0
	movwf	(___bmul@multiplier)
	line	4
	
l4685:	
	clrf	(___bmul@product)
	goto	l4687
	line	6
	
l2259:	
	line	7
	
l4687:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u3751
	goto	u3750
u3751:
	goto	l4691
u3750:
	line	8
	
l4689:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l4691
	
l2260:	
	line	9
	
l4691:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l4693:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l4695:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u3761
	goto	u3760
u3761:
	goto	l4687
u3760:
	goto	l4697
	
l2261:	
	line	12
	
l4697:	
	movf	(___bmul@product),w
	goto	l2262
	
l4699:	
	line	13
	
l2262:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_ADC_read
psect	text973,local,class=CODE,delta=2
global __ptext973
__ptext973:

;; *************** function _ADC_read *****************
;; Defined at:
;;		line 331 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  val             2   18[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2   12[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       4       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text973
	file	"../PIC12f1840PINExpand.c"
	line	331
	global	__size_of_ADC_read
	__size_of_ADC_read	equ	__end_of_ADC_read-_ADC_read
	
_ADC_read:	
	opt	stack 10
; Regs used in _ADC_read: [wreg+status,2+status,0+btemp+1]
	line	333
	
l4675:	
	movlb 1	; select bank1
	bsf	(1257/8)^080h,(1257)&7
	line	334
	goto	l1218
	
l1219:	
	
l1218:	
	btfsc	(1257/8)^080h,(1257)&7
	goto	u3741
	goto	u3740
u3741:
	goto	l1218
u3740:
	goto	l4677
	
l1220:	
	line	336
	
l4677:	
	movf	(155)^080h,w	;volatile
	movlb 0	; select bank0
	movwf	(??_ADC_read+0)+0
	clrf	(??_ADC_read+0)+0+1
	movlb 1	; select bank1
	movf	(156)^080h,w	;volatile
	movlb 0	; select bank0
	movwf	(??_ADC_read+2)+0
	clrf	(??_ADC_read+2)+0+1
	movf	(??_ADC_read+2)+0,w
	movwf	(??_ADC_read+2)+1
	clrf	(??_ADC_read+2)+0
	movf	0+(??_ADC_read+0)+0,w
	iorwf	0+(??_ADC_read+2)+0,w
	movwf	(ADC_read@val)
	movf	1+(??_ADC_read+0)+0,w
	iorwf	1+(??_ADC_read+2)+0,w
	movwf	1+(ADC_read@val)
	line	337
	
l4679:	
	bcf	(142/8),(142)&7
	line	338
	
l4681:	
	movf	(ADC_read@val+1),w
	clrf	(?_ADC_read+1)
	addwf	(?_ADC_read+1)
	movf	(ADC_read@val),w
	clrf	(?_ADC_read)
	addwf	(?_ADC_read)

	goto	l1221
	
l4683:	
	line	339
	
l1221:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_read
	__end_of_ADC_read:
;; =============== function _ADC_read ends ============

	signat	_ADC_read,90
	global	_EEPROM_WriteByte
psect	text974,local,class=CODE,delta=2
global __ptext974
__ptext974:

;; *************** function _EEPROM_WriteByte *****************
;; Defined at:
;;		line 3 in file "../EEPROM.h"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;;  value           1   12[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text974
	file	"../EEPROM.h"
	line	3
	global	__size_of_EEPROM_WriteByte
	__size_of_EEPROM_WriteByte	equ	__end_of_EEPROM_WriteByte-_EEPROM_WriteByte
	
_EEPROM_WriteByte:	
	opt	stack 10
; Regs used in _EEPROM_WriteByte: [wreg]
	movlb 0	; select bank0
	movwf	(EEPROM_WriteByte@address)
	line	4
	
l4607:	
	movlb 3	; select bank3
	bcf	(3247/8)^0180h,(3247)&7
	line	5
	bcf	(3246/8)^0180h,(3246)&7
	line	6
	
l4609:	
	movlb 0	; select bank0
	movf	(EEPROM_WriteByte@value),w
	movlb 3	; select bank3
	movwf	(403)^0180h	;volatile
	line	7
	movlb 0	; select bank0
	movf	(EEPROM_WriteByte@address),w
	movlb 3	; select bank3
	movwf	(401)^0180h	;volatile
	line	9
	
l4611:	
	bsf	(3242/8)^0180h,(3242)&7
	line	11
	movlw	(055h)
	movwf	(406)^0180h	;volatile
	line	12
	movlw	(0AAh)
	movwf	(406)^0180h	;volatile
	line	14
	
l4613:	
	bsf	(3241/8)^0180h,(3241)&7
	line	16
	goto	l1127
	
l1128:	
	
l1127:	
	btfsc	(3241/8)^0180h,(3241)&7
	goto	u3641
	goto	u3640
u3641:
	goto	l1127
u3640:
	
l1129:	
	line	20
	movlb 0	; select bank0
	bcf	(148/8),(148)&7
	line	21
	movlb 3	; select bank3
	bcf	(3242/8)^0180h,(3242)&7
	line	22
	
l1130:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_WriteByte
	__end_of_EEPROM_WriteByte:
;; =============== function _EEPROM_WriteByte ends ============

	signat	_EEPROM_WriteByte,8312
	global	_FNC
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:

;; *************** function _FNC *****************
;; Defined at:
;;		line 201 in file "../PIC12f1840PINExpand.c"
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
;;      Temps:          0       3       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_EEPROM_ReadByte
;;		i1___awmod
;;		i1_EEPROM_WriteByte
;;		i1_display_number
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"../PIC12f1840PINExpand.c"
	line	201
	global	__size_of_FNC
	__size_of_FNC	equ	__end_of_FNC-_FNC
	
_FNC:	
	opt	stack 7
; Regs used in _FNC: [wreg+fsr1l-status,0+pclath+cstack]
psect	intentry
	pagesel	$
	movlb 0	; select bank0
	movf	btemp+1,w
	movwf	(??_FNC+2)
	line	202
	
i1l4625:	
	btfss	(136/8),(136)&7
	goto	u366_21
	goto	u366_20
u366_21:
	goto	i1l1186
u366_20:
	line	204
	
i1l4627:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_timer_count),f
	line	205
	
i1l4629:	
	movf	(_timer_count),w
	xorlw	014h&0ffh
	skipz
	goto	u367_21
	goto	u367_20
u367_21:
	goto	i1l4653
u367_20:
	line	208
	
i1l4631:	
	clrf	(_timer_count)
	line	209
	
i1l4633:	
	movf	(_second_count),f
	skipz
	goto	u368_21
	goto	u368_20
u368_21:
	goto	i1l4637
u368_20:
	line	211
	
i1l4635:	
	movlw	(064h)
	fcall	_EEPROM_ReadByte
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_second_count)
	goto	i1l4637
	line	213
	
i1l1188:	
	line	215
	
i1l4637:	
	movlw	(01h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	addwf	(_second_count),f
	line	216
	
i1l4639:	
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
	goto	u369_21
	goto	u369_20
u369_21:
	goto	i1l4643
u369_20:
	line	217
	
i1l4641:	
	movlb 0	; select bank0
	movf	(_second_count),w
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(?i1_EEPROM_WriteByte)
	movlw	(064h)
	fcall	i1_EEPROM_WriteByte
	goto	i1l4643
	
i1l1189:	
	line	218
	
i1l4643:	
	movlb 0	; select bank0
	movf	(_second_count),w
	xorlw	063h&0ffh
	skipz
	goto	u370_21
	goto	u370_20
u370_21:
	goto	i1l4651
u370_20:
	line	220
	
i1l4645:	
	clrf	(?i1_EEPROM_WriteByte)
	movlw	(064h)
	fcall	i1_EEPROM_WriteByte
	line	221
	
i1l4647:	
	movlb 0	; select bank0
	bcf	(192/8),(192)&7
	line	222
	
i1l4649:	
	movlw	(08h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	goto	i1l4651
	line	223
	
i1l1190:	
	line	224
	
i1l4651:	
	movf	(_second_count),w
	fcall	i1_display_number
	goto	i1l4653
	line	225
	
i1l1187:	
	line	227
	
i1l4653:	
	movlb 0	; select bank0
	bcf	(136/8),(136)&7
	line	228
	goto	i1l1196
	line	229
	
i1l1186:	
	line	231
	btfss	(88/8),(88)&7
	goto	u371_21
	goto	u371_20
u371_21:
	goto	i1l1196
u371_20:
	line	233
	
i1l4655:	
	movf	(_count_status),w
	xorlw	08h&0ffh
	skipz
	goto	u372_21
	goto	u372_20
u372_21:
	goto	i1l4663
u372_20:
	line	235
	
i1l4657:	
	movlw	(09h)
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	line	236
	movlw	low(03CAFh)
	movwf	(22)	;volatile
	movlw	high(03CAFh)
	movwf	((22))+1	;volatile
	line	237
	
i1l4659:	
	clrf	(_second_count)
	line	238
	
i1l4661:	
	bsf	(192/8),(192)&7
	line	239
	goto	i1l4671
	line	240
	
i1l1193:	
	
i1l4663:	
	movf	(_count_status),w
	xorlw	09h&0ffh
	skipz
	goto	u373_21
	goto	u373_20
u373_21:
	goto	i1l4671
u373_20:
	line	242
	
i1l4665:	
	clrf	(?i1_EEPROM_WriteByte)
	movlw	(064h)
	fcall	i1_EEPROM_WriteByte
	line	244
	
i1l4667:	
	movlw	(08h)
	movlb 0	; select bank0
	movwf	(??_FNC+0)+0
	movf	(??_FNC+0)+0,w
	movwf	(_count_status)
	line	245
	
i1l4669:	
	bcf	(192/8),(192)&7
	goto	i1l4671
	line	247
	
i1l1195:	
	goto	i1l4671
	line	249
	
i1l1194:	
	
i1l4671:	
	bcf	(88/8),(88)&7
	line	250
	
i1l4673:	
	movlb 7	; select bank7
	bcf	(7325/8)^0380h,(7325)&7
	goto	i1l1196
	line	251
	
i1l1192:	
	goto	i1l1196
	line	253
	
i1l1191:	
	
i1l1196:	
	movlb 0	; select bank0
	movf	(??_FNC+2),w
	movwf	btemp+1
	retfie
	opt stack 0
GLOBAL	__end_of_FNC
	__end_of_FNC:
;; =============== function _FNC ends ============

	signat	_FNC,88
	global	i1_display_number
psect	text976,local,class=CODE,delta=2
global __ptext976
__ptext976:

;; *************** function i1_display_number *****************
;; Defined at:
;;		line 187 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  display_numb    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  display_numb    1    8[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		i1___awdiv
;;		i1_display_digit
;;		i1___awmod
;; This function is called by:
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text976
	file	"../PIC12f1840PINExpand.c"
	line	187
	global	__size_ofi1_display_number
	__size_ofi1_display_number	equ	__end_ofi1_display_number-i1_display_number
	
i1_display_number:	
	opt	stack 7
; Regs used in i1_display_number: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(i1display_number@number)
	line	188
	
i1l5075:	
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
	line	190
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
	line	191
	
i1l1183:	
	return
	opt stack 0
GLOBAL	__end_ofi1_display_number
	__end_ofi1_display_number:
;; =============== function i1_display_number ends ============

	signat	i1_display_number,88
	global	i1_display_digit
psect	text977,local,class=CODE,delta=2
global __ptext977
__ptext977:

;; *************** function i1_display_digit *****************
;; Defined at:
;;		line 129 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  display_digi    1    wreg     unsigned char 
;;  display_digi    1   13[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  display_digi    1    3[BANK0 ] unsigned char 
;;  display_digi    1    4[BANK0 ] unsigned char 
;;  display_digi    1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       2       0       0
;;      Totals:         1       5       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_set_bit
;; This function is called by:
;;		i1_display_number
;; This function uses a non-reentrant model
;;
psect	text977
	file	"../PIC12f1840PINExpand.c"
	line	129
	global	__size_ofi1_display_digit
	__size_ofi1_display_digit	equ	__end_ofi1_display_digit-i1_display_digit
	
i1_display_digit:	
	opt	stack 7
; Regs used in i1_display_digit: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(i1display_digit@segment_number)
	line	130
	
i1l5033:	
	movf	(i1display_digit@value),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??i1_display_digit+0)+0
	movf	(??i1_display_digit+0)+0,w
	movwf	(i1display_digit@temp)
	line	131
	
i1l5035:	
	movf	(_what_to_display),w
	xorlw	02h&0ffh
	skipz
	goto	u458_21
	goto	u458_20
u458_21:
	goto	i1l5041
u458_20:
	line	133
	
i1l5037:	
	movf	(i1display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u459_21
	goto	u459_20
u459_21:
	goto	i1l1173
u459_20:
	line	135
	
i1l5039:	
	bsf	(i1display_digit@temp)+(7/8),(7)&7
	goto	i1l1173
	line	136
	
i1l1172:	
	line	138
	goto	i1l1173
	line	139
	
i1l1171:	
	
i1l5041:	
	movf	(_what_to_display),w
	xorlw	03h&0ffh
	skipz
	goto	u460_21
	goto	u460_20
u460_21:
	goto	i1l1173
u460_20:
	line	141
	
i1l5043:	
	movf	(i1display_digit@segment_number),w
	xorlw	02h&0ffh
	skipz
	goto	u461_21
	goto	u461_20
u461_21:
	goto	i1l1173
u461_20:
	line	143
	
i1l5045:	
	bsf	(i1display_digit@temp)+(7/8),(7)&7
	goto	i1l1173
	line	144
	
i1l1175:	
	goto	i1l1173
	line	146
	
i1l1174:	
	line	149
	
i1l1173:	
	clrf	(i1display_digit@index)
	
i1l5047:	
	movlw	(08h)
	subwf	(i1display_digit@index),w
	skipc
	goto	u462_21
	goto	u462_20
u462_21:
	goto	i1l5051
u462_20:
	goto	i1l5061
	
i1l5049:	
	goto	i1l5061
	line	150
	
i1l1176:	
	line	151
	
i1l5051:	
	movf	(i1display_digit@temp),w
	movwf	(??i1_display_digit+0)+0
	decf	(i1display_digit@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u463_24
u463_25:
	lsrf	(??i1_display_digit+0)+0,f
u463_24:
	decfsz	wreg,f
	goto	u463_25
	movf	0+(??i1_display_digit+0)+0,w
	andlw	01h
	movwf	(??i1_display_digit+1)+0
	movf	(??i1_display_digit+1)+0,w
	movwf	(?i1_set_bit)
	movlw	(01h)
	fcall	i1_set_bit
	line	153
	clrf	(?i1_set_bit)
	bsf	status,0
	rlf	(?i1_set_bit),f
	movlw	(0)
	fcall	i1_set_bit
	line	155
	
i1l5053:	
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??i1_display_digit+0)+0,f
u666_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u666_27
opt asmopt_on

	line	156
	
i1l5055:	
	clrf	(?i1_set_bit)
	movlw	(0)
	fcall	i1_set_bit
	line	158
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??i1_display_digit+0)+0,f
u667_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u667_27
opt asmopt_on

	line	149
	
i1l5057:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??i1_display_digit+0)+0
	movf	(??i1_display_digit+0)+0,w
	addwf	(i1display_digit@index),f
	
i1l5059:	
	movlw	(08h)
	subwf	(i1display_digit@index),w
	skipc
	goto	u464_21
	goto	u464_20
u464_21:
	goto	i1l5051
u464_20:
	goto	i1l5061
	
i1l1177:	
	line	163
	
i1l5061:	
	movf	(i1display_digit@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u465_21
	goto	u465_20
u465_21:
	goto	i1l5069
u465_20:
	line	165
	
i1l5063:	
	clrf	(?i1_set_bit)
	bsf	status,0
	rlf	(?i1_set_bit),f
	movlw	(02h)
	fcall	i1_set_bit
	line	167
	
i1l5065:	
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??i1_display_digit+0)+0,f
u668_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u668_27
opt asmopt_on

	line	168
	
i1l5067:	
	clrf	(?i1_set_bit)
	movlw	(02h)
	fcall	i1_set_bit
	line	170
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??i1_display_digit+0)+0,f
u669_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u669_27
opt asmopt_on

	line	171
	goto	i1l1180
	line	172
	
i1l1178:	
	line	174
	
i1l5069:	
	clrf	(?i1_set_bit)
	bsf	status,0
	rlf	(?i1_set_bit),f
	movlw	(03h)
	fcall	i1_set_bit
	line	176
	
i1l5071:	
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??i1_display_digit+0)+0,f
u670_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u670_27
opt asmopt_on

	line	177
	
i1l5073:	
	clrf	(?i1_set_bit)
	movlw	(03h)
	fcall	i1_set_bit
	line	179
	opt asmopt_off
movlw	133
	movlb 0	; select bank0
movwf	(??i1_display_digit+0)+0,f
u671_27:
decfsz	(??i1_display_digit+0)+0,f
	goto	u671_27
opt asmopt_on

	goto	i1l1180
	line	180
	
i1l1179:	
	line	183
	
i1l1180:	
	return
	opt stack 0
GLOBAL	__end_ofi1_display_digit
	__end_ofi1_display_digit:
;; =============== function i1_display_digit ends ============

	signat	i1_display_digit,88
	global	i1_set_bit
psect	text978,local,class=CODE,delta=2
global __ptext978
__ptext978:

;; *************** function i1_set_bit *****************
;; Defined at:
;;		line 259 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  set_bit         1    wreg     unsigned char 
;;  set_bit         1    9[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  set_bit         1   12[COMMON] unsigned char 
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
;;		i1___awdiv
;;		i1_send_pin_value
;; This function is called by:
;;		i1_display_digit
;; This function uses a non-reentrant model
;;
psect	text978
	file	"../PIC12f1840PINExpand.c"
	line	259
	global	__size_ofi1_set_bit
	__size_ofi1_set_bit	equ	__end_ofi1_set_bit-i1_set_bit
	
i1_set_bit:	
	opt	stack 7
; Regs used in i1_set_bit: [wreg+status,2+status,0+pclath+cstack]
	movwf	(i1set_bit@bit_number)
	line	260
	
i1l5077:	
	movlw	low(08h)
	movwf	(?i1___awdiv)
	movlw	high(08h)
	movwf	((?i1___awdiv))+1
	movf	(i1set_bit@bit_number),w
	movwf	(??i1_set_bit+0)+0
	clrf	(??i1_set_bit+0)+0+1
	movf	0+(??i1_set_bit+0)+0,w
	movwf	0+(?i1___awdiv)+02h
	movf	1+(??i1_set_bit+0)+0,w
	movwf	1+(?i1___awdiv)+02h
	fcall	i1___awdiv
	movf	((1+(?i1___awdiv))),w
	iorwf	((0+(?i1___awdiv))),w
	skipz
	goto	u466_21
	goto	u466_20
u466_21:
	goto	i1l5091
u466_20:
	line	262
	
i1l5079:	
	movf	(i1set_bit@val),w
	xorlw	01h&0ffh
	skipz
	goto	u467_21
	goto	u467_20
u467_21:
	goto	i1l5085
u467_20:
	line	264
	
i1l5081:	
	movlw	(01h)
	movwf	(??i1_set_bit+0)+0
	incf	(i1set_bit@bit_number),w
	goto	u468_24
u468_25:
	lslf	(??i1_set_bit+0)+0,f
u468_24:
	decfsz	wreg,f
	goto	u468_25
	movf	0+(??i1_set_bit+0)+0,w
	movwf	(??i1_set_bit+1)+0
	movf	(??i1_set_bit+1)+0,w
	movlb 0	; select bank0
	iorwf	(_first_pinheader_value),f
	line	265
	
i1l5083:	
	movf	(_first_pinheader_value),w
	movwf	(??i1_set_bit+0)+0
	movf	(??i1_set_bit+0)+0,w
	movwf	(?i1_send_pin_value)
	movlw	(01h)
	fcall	i1_send_pin_value
	line	266
	goto	i1l1207
	line	267
	
i1l1200:	
	
i1l5085:	
	movf	(i1set_bit@val),f
	skipz
	goto	u469_21
	goto	u469_20
u469_21:
	goto	i1l1207
u469_20:
	line	269
	
i1l5087:	
	movlw	(01h)
	movwf	(??i1_set_bit+0)+0
	incf	(i1set_bit@bit_number),w
	goto	u470_24
u470_25:
	lslf	(??i1_set_bit+0)+0,f
u470_24:
	decfsz	wreg,f
	goto	u470_25
	movf	0+(??i1_set_bit+0)+0,w
	xorlw	0ffh
	movlb 0	; select bank0
	andwf	(_first_pinheader_value),w
	movwf	(??i1_set_bit+1)+0
	movf	(??i1_set_bit+1)+0,w
	movwf	(_first_pinheader_value)
	line	270
	
i1l5089:	
	movf	(_first_pinheader_value),w
	movwf	(??i1_set_bit+0)+0
	movf	(??i1_set_bit+0)+0,w
	movwf	(?i1_send_pin_value)
	movlw	(01h)
	fcall	i1_send_pin_value
	goto	i1l1207
	line	272
	
i1l1202:	
	goto	i1l1207
	line	273
	
i1l1201:	
	goto	i1l1207
	line	274
	
i1l1199:	
	line	276
	
i1l5091:	
	movf	(i1set_bit@val),w
	xorlw	01h&0ffh
	skipz
	goto	u471_21
	goto	u471_20
u471_21:
	goto	i1l5097
u471_20:
	line	278
	
i1l5093:	
	movlw	(01h)
	movwf	(??i1_set_bit+0)+0
	movf	(i1set_bit@bit_number),w
	andlw	07h
	incf	wreg,f
	goto	u472_24
u472_25:
	lslf	(??i1_set_bit+0)+0,f
u472_24:
	decfsz	wreg,f
	goto	u472_25
	movf	0+(??i1_set_bit+0)+0,w
	movwf	(??i1_set_bit+1)+0
	movf	(??i1_set_bit+1)+0,w
	movlb 0	; select bank0
	iorwf	(_second_pinheader_value),f
	line	279
	
i1l5095:	
	movf	(_second_pinheader_value),w
	movwf	(??i1_set_bit+0)+0
	movf	(??i1_set_bit+0)+0,w
	movwf	(?i1_send_pin_value)
	movlw	(02h)
	fcall	i1_send_pin_value
	line	280
	goto	i1l1207
	line	281
	
i1l1204:	
	
i1l5097:	
	movf	(i1set_bit@val),f
	skipz
	goto	u473_21
	goto	u473_20
u473_21:
	goto	i1l1207
u473_20:
	line	283
	
i1l5099:	
	movlw	(01h)
	movwf	(??i1_set_bit+0)+0
	movf	(i1set_bit@bit_number),w
	andlw	07h
	incf	wreg,f
	goto	u474_24
u474_25:
	lslf	(??i1_set_bit+0)+0,f
u474_24:
	decfsz	wreg,f
	goto	u474_25
	movf	0+(??i1_set_bit+0)+0,w
	xorlw	0ffh
	movlb 0	; select bank0
	andwf	(_second_pinheader_value),w
	movwf	(??i1_set_bit+1)+0
	movf	(??i1_set_bit+1)+0,w
	movwf	(_second_pinheader_value)
	line	284
	
i1l5101:	
	movf	(_second_pinheader_value),w
	movwf	(??i1_set_bit+0)+0
	movf	(??i1_set_bit+0)+0,w
	movwf	(?i1_send_pin_value)
	movlw	(02h)
	fcall	i1_send_pin_value
	goto	i1l1207
	line	286
	
i1l1206:	
	goto	i1l1207
	line	288
	
i1l1205:	
	goto	i1l1207
	
i1l1203:	
	line	290
	
i1l1207:	
	return
	opt stack 0
GLOBAL	__end_ofi1_set_bit
	__end_ofi1_set_bit:
;; =============== function i1_set_bit ends ============

	signat	i1_set_bit,88
	global	i1_send_pin_value
psect	text979,local,class=CODE,delta=2
global __ptext979
__ptext979:

;; *************** function i1_send_pin_value *****************
;; Defined at:
;;		line 77 in file "../PIC12f1840PINExpand.c"
;; Parameters:    Size  Location     Type
;;  send_pin_val    1    wreg     unsigned char 
;;  send_pin_val    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  send_pin_val    1    2[COMMON] unsigned char 
;;  send_pin_val    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_set_bit
;; This function uses a non-reentrant model
;;
psect	text979
	file	"../PIC12f1840PINExpand.c"
	line	77
	global	__size_ofi1_send_pin_value
	__size_ofi1_send_pin_value	equ	__end_ofi1_send_pin_value-i1_send_pin_value
	
i1_send_pin_value:	
	opt	stack 7
; Regs used in i1_send_pin_value: [wreg+status,2+status,0]
	line	81
	movwf	(i1send_pin_value@segment_number)
	
i1l5003:	
	clrf	(i1send_pin_value@index)
	
i1l5005:	
	movlw	(08h)
	subwf	(i1send_pin_value@index),w
	skipc
	goto	u452_21
	goto	u452_20
u452_21:
	goto	i1l5009
u452_20:
	goto	i1l5021
	
i1l5007:	
	goto	i1l5021
	line	82
	
i1l1164:	
	line	83
	
i1l5009:	
	movf	(i1send_pin_value@value),w
	movwf	(??i1_send_pin_value+0)+0
	decf	(i1send_pin_value@index),w
	xorlw	0ffh
	addlw	07h
	incf	wreg,f
	goto	u453_24
u453_25:
	lsrf	(??i1_send_pin_value+0)+0,f
u453_24:
	decfsz	wreg,f
	goto	u453_25
	btfsc	0+(??i1_send_pin_value+0)+0,0
	goto	u454_21
	goto	u454_20
	
u454_21:
	movlb 0	; select bank0
	bsf	(97/8),(97)&7
	goto	u455_24
u454_20:
	movlb 0	; select bank0
	bcf	(97/8),(97)&7
u455_24:
	line	85
	
i1l5011:	
	bsf	(96/8),(96)&7
	line	87
	
i1l5013:	
	opt asmopt_off
movlw	133
movwf	(??i1_send_pin_value+0)+0,f
u672_27:
decfsz	(??i1_send_pin_value+0)+0,f
	goto	u672_27
opt asmopt_on

	line	88
	
i1l5015:	
	movlb 0	; select bank0
	bcf	(96/8),(96)&7
	line	90
	
i1l5017:	
	opt asmopt_off
movlw	133
movwf	(??i1_send_pin_value+0)+0,f
u673_27:
decfsz	(??i1_send_pin_value+0)+0,f
	goto	u673_27
opt asmopt_on

	line	81
	movlw	(01h)
	movwf	(??i1_send_pin_value+0)+0
	movf	(??i1_send_pin_value+0)+0,w
	addwf	(i1send_pin_value@index),f
	
i1l5019:	
	movlw	(08h)
	subwf	(i1send_pin_value@index),w
	skipc
	goto	u456_21
	goto	u456_20
u456_21:
	goto	i1l5009
u456_20:
	goto	i1l5021
	
i1l1165:	
	line	95
	
i1l5021:	
	movf	(i1send_pin_value@segment_number),w
	xorlw	01h&0ffh
	skipz
	goto	u457_21
	goto	u457_20
u457_21:
	goto	i1l1166
u457_20:
	line	97
	
i1l5023:	
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	99
	
i1l5025:	
	opt asmopt_off
movlw	133
movwf	(??i1_send_pin_value+0)+0,f
u674_27:
decfsz	(??i1_send_pin_value+0)+0,f
	goto	u674_27
opt asmopt_on

	line	100
	
i1l5027:	
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	102
	opt asmopt_off
movlw	133
movwf	(??i1_send_pin_value+0)+0,f
u675_27:
decfsz	(??i1_send_pin_value+0)+0,f
	goto	u675_27
opt asmopt_on

	line	103
	goto	i1l1168
	line	104
	
i1l1166:	
	line	106
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	line	108
	
i1l5029:	
	opt asmopt_off
movlw	133
movwf	(??i1_send_pin_value+0)+0,f
u676_27:
decfsz	(??i1_send_pin_value+0)+0,f
	goto	u676_27
opt asmopt_on

	line	109
	
i1l5031:	
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
	line	111
	opt asmopt_off
movlw	133
movwf	(??i1_send_pin_value+0)+0,f
u677_27:
decfsz	(??i1_send_pin_value+0)+0,f
	goto	u677_27
opt asmopt_on

	goto	i1l1168
	line	112
	
i1l1167:	
	line	115
	
i1l1168:	
	return
	opt stack 0
GLOBAL	__end_ofi1_send_pin_value
	__end_ofi1_send_pin_value:
;; =============== function i1_send_pin_value ends ============

	signat	i1_send_pin_value,88
	global	i1___awmod
psect	text980,local,class=CODE,delta=2
global __ptext980
__ptext980:

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
psect	text980
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_ofi1___awmod
	__size_ofi1___awmod	equ	__end_ofi1___awmod-i1___awmod
	
i1___awmod:	
	opt	stack 9
; Regs used in i1___awmod: [wreg+status,2+status,0]
	line	8
	
i1l5143:	
	clrf	(i1___awmod@sign)
	line	9
	btfss	(i1___awmod@dividend+1),7
	goto	u485_21
	goto	u485_20
u485_21:
	goto	i1l5147
u485_20:
	line	10
	
i1l5145:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	line	11
	clrf	(i1___awmod@sign)
	bsf	status,0
	rlf	(i1___awmod@sign),f
	goto	i1l5147
	line	12
	
i1l2473:	
	line	13
	
i1l5147:	
	btfss	(i1___awmod@divisor+1),7
	goto	u486_21
	goto	u486_20
u486_21:
	goto	i1l5151
u486_20:
	line	14
	
i1l5149:	
	comf	(i1___awmod@divisor),f
	comf	(i1___awmod@divisor+1),f
	incf	(i1___awmod@divisor),f
	skipnz
	incf	(i1___awmod@divisor+1),f
	goto	i1l5151
	
i1l2474:	
	line	15
	
i1l5151:	
	movf	(i1___awmod@divisor+1),w
	iorwf	(i1___awmod@divisor),w
	skipnz
	goto	u487_21
	goto	u487_20
u487_21:
	goto	i1l5169
u487_20:
	line	16
	
i1l5153:	
	clrf	(i1___awmod@counter)
	bsf	status,0
	rlf	(i1___awmod@counter),f
	line	17
	goto	i1l5159
	
i1l2477:	
	line	18
	
i1l5155:	
	movlw	01h
	
u488_25:
	lslf	(i1___awmod@divisor),f
	rlf	(i1___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u488_25
	line	19
	
i1l5157:	
	movlw	(01h)
	movwf	(??i1___awmod+0)+0
	movf	(??i1___awmod+0)+0,w
	addwf	(i1___awmod@counter),f
	goto	i1l5159
	line	20
	
i1l2476:	
	line	17
	
i1l5159:	
	btfss	(i1___awmod@divisor+1),(15)&7
	goto	u489_21
	goto	u489_20
u489_21:
	goto	i1l5155
u489_20:
	goto	i1l5161
	
i1l2478:	
	goto	i1l5161
	line	21
	
i1l2479:	
	line	22
	
i1l5161:	
	movf	(i1___awmod@divisor+1),w
	subwf	(i1___awmod@dividend+1),w
	skipz
	goto	u490_25
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),w
u490_25:
	skipc
	goto	u490_21
	goto	u490_20
u490_21:
	goto	i1l5165
u490_20:
	line	23
	
i1l5163:	
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),f
	movf	(i1___awmod@divisor+1),w
	subwfb	(i1___awmod@dividend+1),f
	goto	i1l5165
	
i1l2480:	
	line	24
	
i1l5165:	
	movlw	01h
	
u491_25:
	lsrf	(i1___awmod@divisor+1),f
	rrf	(i1___awmod@divisor),f
	decfsz	wreg,f
	goto	u491_25
	line	25
	
i1l5167:	
	movlw	low(01h)
	subwf	(i1___awmod@counter),f
	btfss	status,2
	goto	u492_21
	goto	u492_20
u492_21:
	goto	i1l5161
u492_20:
	goto	i1l5169
	
i1l2481:	
	goto	i1l5169
	line	26
	
i1l2475:	
	line	27
	
i1l5169:	
	movf	(i1___awmod@sign),w
	skipz
	goto	u493_20
	goto	i1l5173
u493_20:
	line	28
	
i1l5171:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	goto	i1l5173
	
i1l2482:	
	line	29
	
i1l5173:	
	movf	(i1___awmod@dividend+1),w
	clrf	(?i1___awmod+1)
	addwf	(?i1___awmod+1)
	movf	(i1___awmod@dividend),w
	clrf	(?i1___awmod)
	addwf	(?i1___awmod)

	goto	i1l2483
	
i1l5175:	
	line	30
	
i1l2483:	
	return
	opt stack 0
GLOBAL	__end_ofi1___awmod
	__end_ofi1___awmod:
;; =============== function i1___awmod ends ============

	signat	i1___awmod,90
	global	i1___awdiv
psect	text981,local,class=CODE,delta=2
global __ptext981
__ptext981:

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
;;		i1_set_bit
;; This function uses a non-reentrant model
;;
psect	text981
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_ofi1___awdiv
	__size_ofi1___awdiv	equ	__end_ofi1___awdiv-i1___awdiv
	
i1___awdiv:	
	opt	stack 7
; Regs used in i1___awdiv: [wreg+status,2+status,0]
	line	9
	
i1l5103:	
	clrf	(i1___awdiv@sign)
	line	10
	btfss	(i1___awdiv@divisor+1),7
	goto	u475_21
	goto	u475_20
u475_21:
	goto	i1l5107
u475_20:
	line	11
	
i1l5105:	
	comf	(i1___awdiv@divisor),f
	comf	(i1___awdiv@divisor+1),f
	incf	(i1___awdiv@divisor),f
	skipnz
	incf	(i1___awdiv@divisor+1),f
	line	12
	clrf	(i1___awdiv@sign)
	bsf	status,0
	rlf	(i1___awdiv@sign),f
	goto	i1l5107
	line	13
	
i1l2405:	
	line	14
	
i1l5107:	
	btfss	(i1___awdiv@dividend+1),7
	goto	u476_21
	goto	u476_20
u476_21:
	goto	i1l5113
u476_20:
	line	15
	
i1l5109:	
	comf	(i1___awdiv@dividend),f
	comf	(i1___awdiv@dividend+1),f
	incf	(i1___awdiv@dividend),f
	skipnz
	incf	(i1___awdiv@dividend+1),f
	line	16
	
i1l5111:	
	movlw	(01h)
	movwf	(??i1___awdiv+0)+0
	movf	(??i1___awdiv+0)+0,w
	xorwf	(i1___awdiv@sign),f
	goto	i1l5113
	line	17
	
i1l2406:	
	line	18
	
i1l5113:	
	clrf	(i1___awdiv@quotient)
	clrf	(i1___awdiv@quotient+1)
	line	19
	
i1l5115:	
	movf	(i1___awdiv@divisor+1),w
	iorwf	(i1___awdiv@divisor),w
	skipnz
	goto	u477_21
	goto	u477_20
u477_21:
	goto	i1l5135
u477_20:
	line	20
	
i1l5117:	
	clrf	(i1___awdiv@counter)
	bsf	status,0
	rlf	(i1___awdiv@counter),f
	line	21
	goto	i1l5123
	
i1l2409:	
	line	22
	
i1l5119:	
	movlw	01h
	
u478_25:
	lslf	(i1___awdiv@divisor),f
	rlf	(i1___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u478_25
	line	23
	
i1l5121:	
	movlw	(01h)
	movwf	(??i1___awdiv+0)+0
	movf	(??i1___awdiv+0)+0,w
	addwf	(i1___awdiv@counter),f
	goto	i1l5123
	line	24
	
i1l2408:	
	line	21
	
i1l5123:	
	btfss	(i1___awdiv@divisor+1),(15)&7
	goto	u479_21
	goto	u479_20
u479_21:
	goto	i1l5119
u479_20:
	goto	i1l5125
	
i1l2410:	
	goto	i1l5125
	line	25
	
i1l2411:	
	line	26
	
i1l5125:	
	movlw	01h
	
u480_25:
	lslf	(i1___awdiv@quotient),f
	rlf	(i1___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u480_25
	line	27
	movf	(i1___awdiv@divisor+1),w
	subwf	(i1___awdiv@dividend+1),w
	skipz
	goto	u481_25
	movf	(i1___awdiv@divisor),w
	subwf	(i1___awdiv@dividend),w
u481_25:
	skipc
	goto	u481_21
	goto	u481_20
u481_21:
	goto	i1l5131
u481_20:
	line	28
	
i1l5127:	
	movf	(i1___awdiv@divisor),w
	subwf	(i1___awdiv@dividend),f
	movf	(i1___awdiv@divisor+1),w
	subwfb	(i1___awdiv@dividend+1),f
	line	29
	
i1l5129:	
	bsf	(i1___awdiv@quotient)+(0/8),(0)&7
	goto	i1l5131
	line	30
	
i1l2412:	
	line	31
	
i1l5131:	
	movlw	01h
	
u482_25:
	lsrf	(i1___awdiv@divisor+1),f
	rrf	(i1___awdiv@divisor),f
	decfsz	wreg,f
	goto	u482_25
	line	32
	
i1l5133:	
	movlw	low(01h)
	subwf	(i1___awdiv@counter),f
	btfss	status,2
	goto	u483_21
	goto	u483_20
u483_21:
	goto	i1l5125
u483_20:
	goto	i1l5135
	
i1l2413:	
	goto	i1l5135
	line	33
	
i1l2407:	
	line	34
	
i1l5135:	
	movf	(i1___awdiv@sign),w
	skipz
	goto	u484_20
	goto	i1l5139
u484_20:
	line	35
	
i1l5137:	
	comf	(i1___awdiv@quotient),f
	comf	(i1___awdiv@quotient+1),f
	incf	(i1___awdiv@quotient),f
	skipnz
	incf	(i1___awdiv@quotient+1),f
	goto	i1l5139
	
i1l2414:	
	line	36
	
i1l5139:	
	movf	(i1___awdiv@quotient+1),w
	clrf	(?i1___awdiv+1)
	addwf	(?i1___awdiv+1)
	movf	(i1___awdiv@quotient),w
	clrf	(?i1___awdiv)
	addwf	(?i1___awdiv)

	goto	i1l2415
	
i1l5141:	
	line	37
	
i1l2415:	
	return
	opt stack 0
GLOBAL	__end_ofi1___awdiv
	__end_ofi1___awdiv:
;; =============== function i1___awdiv ends ============

	signat	i1___awdiv,90
	global	i1_EEPROM_WriteByte
psect	text982,local,class=CODE,delta=2
global __ptext982
__ptext982:

;; *************** function i1_EEPROM_WriteByte *****************
;; Defined at:
;;		line 3 in file "../EEPROM.h"
;; Parameters:    Size  Location     Type
;;  EEPROM_Write    1    wreg     unsigned char 
;;  EEPROM_Write    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEPROM_Write    1    1[COMMON] unsigned char 
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
psect	text982
	file	"../EEPROM.h"
	line	3
	global	__size_ofi1_EEPROM_WriteByte
	__size_ofi1_EEPROM_WriteByte	equ	__end_ofi1_EEPROM_WriteByte-i1_EEPROM_WriteByte
	
i1_EEPROM_WriteByte:	
	opt	stack 10
; Regs used in i1_EEPROM_WriteByte: [wreg]
	movwf	(i1EEPROM_WriteByte@address)
	line	4
	
i1l4995:	
	movlb 3	; select bank3
	bcf	(3247/8)^0180h,(3247)&7
	line	5
	bcf	(3246/8)^0180h,(3246)&7
	line	6
	
i1l4997:	
	movf	(i1EEPROM_WriteByte@value),w
	movwf	(403)^0180h	;volatile
	line	7
	movf	(i1EEPROM_WriteByte@address),w
	movwf	(401)^0180h	;volatile
	line	9
	
i1l4999:	
	bsf	(3242/8)^0180h,(3242)&7
	line	11
	movlw	(055h)
	movwf	(406)^0180h	;volatile
	line	12
	movlw	(0AAh)
	movwf	(406)^0180h	;volatile
	line	14
	
i1l5001:	
	bsf	(3241/8)^0180h,(3241)&7
	line	16
	goto	i1l1127
	
i1l1128:	
	
i1l1127:	
	btfsc	(3241/8)^0180h,(3241)&7
	goto	u451_21
	goto	u451_20
u451_21:
	goto	i1l1127
u451_20:
	
i1l1129:	
	line	20
	movlb 0	; select bank0
	bcf	(148/8),(148)&7
	line	21
	movlb 3	; select bank3
	bcf	(3242/8)^0180h,(3242)&7
	line	22
	
i1l1130:	
	return
	opt stack 0
GLOBAL	__end_ofi1_EEPROM_WriteByte
	__end_ofi1_EEPROM_WriteByte:
;; =============== function i1_EEPROM_WriteByte ends ============

	signat	i1_EEPROM_WriteByte,88
	global	_EEPROM_ReadByte
psect	text983,local,class=CODE,delta=2
global __ptext983
__ptext983:

;; *************** function _EEPROM_ReadByte *****************
;; Defined at:
;;		line 25 in file "../EEPROM.h"
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
;;		_FNC
;; This function uses a non-reentrant model
;;
psect	text983
	file	"../EEPROM.h"
	line	25
	global	__size_of_EEPROM_ReadByte
	__size_of_EEPROM_ReadByte	equ	__end_of_EEPROM_ReadByte-_EEPROM_ReadByte
	
_EEPROM_ReadByte:	
	opt	stack 10
; Regs used in _EEPROM_ReadByte: [wreg]
	movwf	(EEPROM_ReadByte@address)
	line	26
	
i1l4615:	
	movlb 3	; select bank3
	bcf	(3247/8)^0180h,(3247)&7
	line	27
	bcf	(3246/8)^0180h,(3246)&7
	line	28
	
i1l4617:	
	movf	(EEPROM_ReadByte@address),w
	movwf	(401)^0180h	;volatile
	line	29
	
i1l4619:	
	bsf	(3240/8)^0180h,(3240)&7
	line	30
	goto	i1l1133
	
i1l1134:	
	
i1l1133:	
	btfsc	(3240/8)^0180h,(3240)&7
	goto	u365_21
	goto	u365_20
u365_21:
	goto	i1l1133
u365_20:
	
i1l1135:	
	line	31
	movlb 0	; select bank0
	bcf	(148/8),(148)&7
	line	32
	
i1l4621:	
	movlb 3	; select bank3
	movf	(403)^0180h,w	;volatile
	goto	i1l1136
	
i1l4623:	
	line	33
	
i1l1136:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_ReadByte
	__end_of_EEPROM_ReadByte:
;; =============== function _EEPROM_ReadByte ends ============

	signat	_EEPROM_ReadByte,4217
psect	text984,local,class=CODE,delta=2
global __ptext984
__ptext984:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
