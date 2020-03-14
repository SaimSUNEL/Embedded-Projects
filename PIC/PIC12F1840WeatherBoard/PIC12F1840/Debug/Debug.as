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
	FNCALL	_main,_UART_init
	FNCALL	_main,_retrive_weather_situations
	FNCALL	_main,_ask_5_day_weather
	FNCALL	_main,_compareData
	FNCALL	_main,_saveToEEPROM
	FNCALL	_main,_resetBuffer
	FNCALL	_main,_ask_currency
	FNCALL	_main,_ask_current_situation
	FNCALL	_main,_show_currency_information
	FNCALL	_main,_SetHavaDurumuPin
	FNCALL	_main,_show_date_info
	FNCALL	_main,_DisplayGun
	FNCALL	_main,_DisplayAy
	FNCALL	_main,_DisplayYil
	FNCALL	_main,_EnYuksekDisplay
	FNCALL	_main,_EnDusukDisplay
	FNCALL	_main,_LoadGunInfo
	FNCALL	_main,_LoadGosterilenGunInfo
	FNCALL	_show_currency_information,_lcd_clear
	FNCALL	_show_currency_information,_show_currency_info
	FNCALL	_show_currency_info,_lcd_write
	FNCALL	_show_currency_info,_lcd_write_number
	FNCALL	_show_date_info,_lcd_clear
	FNCALL	_show_date_info,_lcd_goto
	FNCALL	_show_date_info,_lcd_write
	FNCALL	_show_date_info,___awdiv
	FNCALL	_show_date_info,_lcd_write_number
	FNCALL	_show_date_info,_EEPROM_ReadByte
	FNCALL	_show_date_info,_lcd_yaz
	FNCALL	_lcd_write_number,_itoa
	FNCALL	_lcd_write_number,_lcd_write
	FNCALL	_LCD_init,_shift_reg_set_pin_lcd
	FNCALL	_LCD_init,_lcd_info
	FNCALL	_LCD_init,_lcd_clear
	FNCALL	_lcd_write,_lcd_yaz
	FNCALL	_lcd_yaz,_lcd_info
	FNCALL	_lcd_yaz,_lcd_goto
	FNCALL	_lcd_clear,_lcd_info
	FNCALL	_lcd_clear,_lcd_goto
	FNCALL	_lcd_goto,_lcd_info
	FNCALL	_SetHavaDurumuPin,_TempLoadDigit
	FNCALL	_DisplayYil,___awdiv
	FNCALL	_DisplayYil,___awmod
	FNCALL	_DisplayYil,_TarihSetDisplay
	FNCALL	_DisplayAy,___awdiv
	FNCALL	_DisplayAy,___awmod
	FNCALL	_DisplayAy,_TarihSetDisplay
	FNCALL	_DisplayGun,___awdiv
	FNCALL	_DisplayGun,___awmod
	FNCALL	_DisplayGun,_TarihSetDisplay
	FNCALL	_LoadGosterilenGunInfo,_TempLoadDigit
	FNCALL	_LoadGunInfo,_TempLoadDigit
	FNCALL	_EnYuksekDisplay,___awdiv
	FNCALL	_EnYuksekDisplay,___awmod
	FNCALL	_EnYuksekDisplay,_TempLoadDigit
	FNCALL	_EnDusukDisplay,___awdiv
	FNCALL	_EnDusukDisplay,___awmod
	FNCALL	_EnDusukDisplay,_TempLoadDigit
	FNCALL	_lcd_info,_shift_reg_set_pin_lcd
	FNCALL	_TarihSetDisplay,_TarihRegisterSetPin
	FNCALL	_TempLoadDigit,_CenterSetPin
	FNCALL	_shift_reg_set_pin_lcd,_LoadDataCenter
	FNCALL	_TarihRegisterSetPin,_LoadDataCenter
	FNCALL	_CenterSetPin,_LoadDataCenter
	FNCALL	_ask_current_situation,_common_request_function
	FNCALL	_ask_currency,_common_request_function
	FNCALL	_ask_5_day_weather,_common_request_function
	FNCALL	_LoadDataCenter,_MainRegisterSetPin
	FNCALL	_retrive_weather_situations,_EEPROM_ReadByte
	FNCALL	_retrive_weather_situations,_UARTSendString
	FNCALL	_retrive_weather_situations,_EEPROM_WriteByte
	FNCALL	_retrive_weather_situations,_UART_byte_send
	FNCALL	_retrive_weather_situations,_UART_byte_receive
	FNCALL	_common_request_function,_UARTSendString
	FNCALL	_common_request_function,_UARTReadString
	FNCALL	_common_request_function,_loadFromEPPROM
	FNCALL	_itoa,_utoa
	FNCALL	_MainRegisterSetPin,_MainRegisterLoadData
	FNCALL	_utoa,___lwdiv
	FNCALL	_utoa,___lwmod
	FNCALL	_resetBuffer,_memset
	FNCALL	_compareData,_EEPROM_ReadByte
	FNCALL	_loadFromEPPROM,_EEPROM_ReadByte
	FNCALL	_saveToEEPROM,_EEPROM_WriteByte
	FNCALL	_UARTSendString,_UART_byte_send
	FNCALL	_UARTReadString,_UART_byte_send
	FNCALL	_UARTReadString,_UART_byte_receive
	FNROOT	_main
	global	__x
	global	__y
	global	_rakamlar
	global	_COMMAND
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"../LCD.h"
	line	41

;initializer for __x
	retlw	01h

;initializer for __y
	retlw	01h
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"../SicaklikSegment.h"
	line	7

;initializer for _rakamlar
	retlw	040h
	retlw	0F9h
	retlw	024h
	retlw	030h
	retlw	019h
	retlw	012h
	retlw	02h
	retlw	078h
	retlw	0
	retlw	010h
psect	idataBANK0
	file	"../Requests.h"
	line	10

;initializer for _COMMAND
	retlw	043h
	retlw	0Dh
	retlw	0Ah
	global	_dht11_data
	global	_time_counter
	global	_CenterData1
	global	_CenterData2
	global	_LCDData
	global	__temp_
	global	_available_byte_count
	global	_ayDisplay1
	global	_ayDisplay2
	global	_buff_index
	global	_count
	global	_current_buffer_index
	global	_current_value
	global	_endusuk1
	global	_endusuk2
	global	_enyuksek1
	global	_enyuksek2
	global	_gosterilenGun
	global	_gunData
	global	_gunDisplay1
	global	_gunDisplay2
	global	_havaRegister1
	global	_havaRegister2
	global	_havaRegister3
	global	_high_time_count
	global	_low_time_count
	global	_nem
	global	_sicaklik
	global	_tarihData
	global	_time_exceed
	global	_yilDisplay1
	global	_yilDisplay2
	global	_rakam
	global	_CURRENCY
	global	_gunler
	global	_current_buffer
	global	_bugun
	global	_number_array
	global	_CARRY
_CARRY	set	24
	global	_EEIF
_EEIF	set	148
	global	_GIE
_GIE	set	95
	global	_RA2
_RA2	set	98
	global	_RA4
_RA4	set	100
	global	_RA5
_RA5	set	101
	global	_RCIF
_RCIF	set	141
	global	_TXIF
_TXIF	set	140
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
	global	_WPUA3
_WPUA3	set	4195
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
	global    __stringtab
__stringtab:
	retlw	0
psect	strings
	
STR_7:	
	retlw	67	;'C'
	retlw	117	;'u'
	retlw	109	;'m'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	105	;'i'
	retlw	0
psect	strings
	
STR_2:	
	retlw	80	;'P'
	retlw	97	;'a'
	retlw	122	;'z'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	105	;'i'
	retlw	0
psect	strings
	
STR_4:	
	retlw	67	;'C'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	115	;'s'
	retlw	97	;'a'
	retlw	109	;'m'
	retlw	98	;'b'
	retlw	97	;'a'
	retlw	0
psect	strings
	
STR_5:	
	retlw	80	;'P'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	115	;'s'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	98	;'b'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_10:	
	retlw	68	;'D'
	retlw	111	;'o'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_12:	
	retlw	32	;' '
	retlw	65	;'A'
	retlw	85	;'U'
	retlw	68	;'D'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_11:	
	retlw	32	;' '
	retlw	69	;'E'
	retlw	85	;'U'
	retlw	82	;'R'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_1:	
	retlw	80	;'P'
	retlw	97	;'a'
	retlw	122	;'z'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	0
psect	strings
	
STR_6:	
	retlw	67	;'C'
	retlw	117	;'u'
	retlw	109	;'m'
	retlw	97	;'a'
	retlw	0
psect	strings
	
STR_3:	
	retlw	83	;'S'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	105	;'i'
	retlw	0
psect	strings
	
STR_8:	
	retlw	45	;'-'
	retlw	0
psect	strings
	
STR_9:	
	retlw	46	;'.'
	retlw	0
psect	strings
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

_time_counter:
       ds      2

_CenterData1:
       ds      1

_CenterData2:
       ds      1

_LCDData:
       ds      1

__temp_:
       ds      1

_available_byte_count:
       ds      1

_ayDisplay1:
       ds      1

_ayDisplay2:
       ds      1

_buff_index:
       ds      1

_count:
       ds      1

_current_buffer_index:
       ds      1

_current_value:
       ds      1

_endusuk1:
       ds      1

_endusuk2:
       ds      1

_enyuksek1:
       ds      1

_enyuksek2:
       ds      1

_gosterilenGun:
       ds      1

_gunData:
       ds      1

_gunDisplay1:
       ds      1

_gunDisplay2:
       ds      1

_havaRegister1:
       ds      1

_havaRegister2:
       ds      1

_havaRegister3:
       ds      1

_high_time_count:
       ds      1

_low_time_count:
       ds      1

_nem:
       ds      1

_sicaklik:
       ds      1

_tarihData:
       ds      1

_time_exceed:
       ds      1

_yilDisplay1:
       ds      1

_yilDisplay2:
       ds      1

_CURRENCY:
       ds      6

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"../LCD.h"
	line	41
__x:
       ds      1

psect	dataBANK0
	file	"../LCD.h"
__y:
       ds      1

psect	dataBANK0
	file	"../Requests.h"
	line	10
_COMMAND:
       ds      3

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_rakam:
       ds      4

_current_buffer:
       ds      50

_bugun:
       ds      11

_number_array:
       ds      5

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"../SicaklikSegment.h"
	line	7
_rakamlar:
       ds      10

psect	bssBANK2,class=BANK2,space=1
global __pbssBANK2
__pbssBANK2:
_gunler:
       ds      40

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
	movlw	02Bh
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	global __pbssBANK1
	movlw	low(__pbssBANK1)
	movwf	fsr0l
	movlw	high(__pbssBANK1)
	movwf	fsr0h
	movlw	046h
	fcall	clear_ram
; Clear objects allocated to BANK2
psect cinit,class=CODE,delta=2
	global __pbssBANK2
	movlw	low(__pbssBANK2)
	movwf	fsr0l
	movlw	high(__pbssBANK2)
	movwf	fsr0h
	movlw	028h
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
	movlw 05h
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
	movlw 0Ah
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
	global	?_lcd_yaz
?_lcd_yaz:	; 0 bytes @ 0x0
	global	?_MainRegisterLoadData
?_MainRegisterLoadData:	; 0 bytes @ 0x0
	global	??_MainRegisterLoadData
??_MainRegisterLoadData:	; 0 bytes @ 0x0
	global	?_EnDusukDisplay
?_EnDusukDisplay:	; 0 bytes @ 0x0
	global	?_EnYuksekDisplay
?_EnYuksekDisplay:	; 0 bytes @ 0x0
	global	?_LoadGunInfo
?_LoadGunInfo:	; 0 bytes @ 0x0
	global	?_LoadGosterilenGunInfo
?_LoadGosterilenGunInfo:	; 0 bytes @ 0x0
	global	?_DisplayGun
?_DisplayGun:	; 0 bytes @ 0x0
	global	?_DisplayAy
?_DisplayAy:	; 0 bytes @ 0x0
	global	?_DisplayYil
?_DisplayYil:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_LCD_init
?_LCD_init:	; 0 bytes @ 0x0
	global	?_UART_byte_send
?_UART_byte_send:	; 0 bytes @ 0x0
	global	??_UART_byte_send
??_UART_byte_send:	; 0 bytes @ 0x0
	global	??_UART_byte_receive
??_UART_byte_receive:	; 0 bytes @ 0x0
	global	?_UART_init
?_UART_init:	; 0 bytes @ 0x0
	global	??_UART_init
??_UART_init:	; 0 bytes @ 0x0
	global	?_UARTReadString
?_UARTReadString:	; 0 bytes @ 0x0
	global	?_UARTSendString
?_UARTSendString:	; 0 bytes @ 0x0
	global	?_EEPROM_WriteByte
?_EEPROM_WriteByte:	; 0 bytes @ 0x0
	global	??_EEPROM_ReadByte
??_EEPROM_ReadByte:	; 0 bytes @ 0x0
	global	?_show_date_info
?_show_date_info:	; 0 bytes @ 0x0
	global	?_show_currency_information
?_show_currency_information:	; 0 bytes @ 0x0
	global	?_resetBuffer
?_resetBuffer:	; 0 bytes @ 0x0
	global	?_ask_5_day_weather
?_ask_5_day_weather:	; 0 bytes @ 0x0
	global	?_ask_currency
?_ask_currency:	; 0 bytes @ 0x0
	global	?_ask_current_situation
?_ask_current_situation:	; 0 bytes @ 0x0
	global	?_retrive_weather_situations
?_retrive_weather_situations:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_memset
?_memset:	; 1 bytes @ 0x0
	global	?_UART_byte_receive
?_UART_byte_receive:	; 1 bytes @ 0x0
	global	?_EEPROM_ReadByte
?_EEPROM_ReadByte:	; 1 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	UART_byte_send@data
UART_byte_send@data:	; 1 bytes @ 0x0
	global	EEPROM_WriteByte@value
EEPROM_WriteByte@value:	; 1 bytes @ 0x0
	global	EEPROM_ReadByte@address
EEPROM_ReadByte@address:	; 1 bytes @ 0x0
	global	memset@c
memset@c:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_UARTReadString
??_UARTReadString:	; 0 bytes @ 0x1
	global	??_UARTSendString
??_UARTSendString:	; 0 bytes @ 0x1
	global	??_EEPROM_WriteByte
??_EEPROM_WriteByte:	; 0 bytes @ 0x1
	global	?_loadFromEPPROM
?_loadFromEPPROM:	; 0 bytes @ 0x1
	global	?_compareData
?_compareData:	; 1 bytes @ 0x1
	global	MainRegisterLoadData@data
MainRegisterLoadData@data:	; 1 bytes @ 0x1
	global	EEPROM_WriteByte@address
EEPROM_WriteByte@address:	; 1 bytes @ 0x1
	global	compareData@p
compareData@p:	; 1 bytes @ 0x1
	global	loadFromEPPROM@p
loadFromEPPROM@p:	; 2 bytes @ 0x1
	ds	1
	global	?_saveToEEPROM
?_saveToEEPROM:	; 0 bytes @ 0x2
	global	MainRegisterLoadData@a
MainRegisterLoadData@a:	; 1 bytes @ 0x2
	global	UARTSendString@p
UARTSendString@p:	; 1 bytes @ 0x2
	global	saveToEEPROM@p
saveToEEPROM@p:	; 1 bytes @ 0x2
	global	compareData@size
compareData@size:	; 1 bytes @ 0x2
	global	memset@n
memset@n:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	?_MainRegisterSetPin
?_MainRegisterSetPin:	; 0 bytes @ 0x3
	global	??_compareData
??_compareData:	; 0 bytes @ 0x3
	global	??_retrive_weather_situations
??_retrive_weather_situations:	; 0 bytes @ 0x3
	global	MainRegisterSetPin@value
MainRegisterSetPin@value:	; 1 bytes @ 0x3
	global	UARTReadString@curr
UARTReadString@curr:	; 1 bytes @ 0x3
	global	saveToEEPROM@size
saveToEEPROM@size:	; 1 bytes @ 0x3
	global	loadFromEPPROM@size
loadFromEPPROM@size:	; 1 bytes @ 0x3
	ds	1
	global	??_memset
??_memset:	; 0 bytes @ 0x4
	global	??_MainRegisterSetPin
??_MainRegisterSetPin:	; 0 bytes @ 0x4
	global	??_saveToEEPROM
??_saveToEEPROM:	; 0 bytes @ 0x4
	global	??_loadFromEPPROM
??_loadFromEPPROM:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	UARTReadString@index
UARTReadString@index:	; 1 bytes @ 0x4
	ds	1
	global	UARTReadString@data
UARTReadString@data:	; 1 bytes @ 0x5
	global	retrive_weather_situations@index
retrive_weather_situations@index:	; 1 bytes @ 0x5
	global	memset@p1
memset@p1:	; 1 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	MainRegisterSetPin@pin_number
MainRegisterSetPin@pin_number:	; 1 bytes @ 0x6
	global	saveToEEPROM@address
saveToEEPROM@address:	; 1 bytes @ 0x6
	global	compareData@address
compareData@address:	; 1 bytes @ 0x6
	global	retrive_weather_situations@received_data
retrive_weather_situations@received_data:	; 1 bytes @ 0x6
	global	memset@p
memset@p:	; 1 bytes @ 0x6
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	?_LoadDataCenter
?_LoadDataCenter:	; 0 bytes @ 0x7
	global	??_resetBuffer
??_resetBuffer:	; 0 bytes @ 0x7
	global	LoadDataCenter@center_data
LoadDataCenter@center_data:	; 1 bytes @ 0x7
	global	saveToEEPROM@i
saveToEEPROM@i:	; 1 bytes @ 0x7
	global	loadFromEPPROM@address
loadFromEPPROM@address:	; 1 bytes @ 0x7
	global	compareData@i
compareData@i:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	??_LoadDataCenter
??_LoadDataCenter:	; 0 bytes @ 0x8
	global	?_utoa
?_utoa:	; 1 bytes @ 0x8
	global	loadFromEPPROM@i
loadFromEPPROM@i:	; 1 bytes @ 0x8
	global	utoa@val
utoa@val:	; 2 bytes @ 0x8
	ds	1
	global	?_common_request_function
?_common_request_function:	; 0 bytes @ 0x9
	global	common_request_function@point
common_request_function@point:	; 2 bytes @ 0x9
	ds	1
	global	LoadDataCenter@center_no
LoadDataCenter@center_no:	; 1 bytes @ 0xA
	global	utoa@base
utoa@base:	; 2 bytes @ 0xA
	ds	1
	global	LoadDataCenter@index
LoadDataCenter@index:	; 1 bytes @ 0xB
	global	common_request_function@start
common_request_function@start:	; 1 bytes @ 0xB
	ds	1
	global	??_utoa
??_utoa:	; 0 bytes @ 0xC
	global	?_CenterSetPin
?_CenterSetPin:	; 0 bytes @ 0xC
	global	?_TarihRegisterSetPin
?_TarihRegisterSetPin:	; 0 bytes @ 0xC
	global	?_shift_reg_set_pin_lcd
?_shift_reg_set_pin_lcd:	; 0 bytes @ 0xC
	global	CenterSetPin@pin_value
CenterSetPin@pin_value:	; 1 bytes @ 0xC
	global	TarihRegisterSetPin@value
TarihRegisterSetPin@value:	; 1 bytes @ 0xC
	global	shift_reg_set_pin_lcd@pin_value
shift_reg_set_pin_lcd@pin_value:	; 1 bytes @ 0xC
	global	common_request_function@size_of
common_request_function@size_of:	; 1 bytes @ 0xC
	ds	1
	global	??_itoa
??_itoa:	; 0 bytes @ 0xD
	global	CenterSetPin@pin_number
CenterSetPin@pin_number:	; 1 bytes @ 0xD
	global	TarihRegisterSetPin@pin
TarihRegisterSetPin@pin:	; 1 bytes @ 0xD
	global	shift_reg_set_pin_lcd@pin_number
shift_reg_set_pin_lcd@pin_number:	; 1 bytes @ 0xD
	global	common_request_function@komut
common_request_function@komut:	; 1 bytes @ 0xD
	ds	1
	global	??_lcd_write_number
??_lcd_write_number:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_CenterSetPin
??_CenterSetPin:	; 0 bytes @ 0x0
	global	??_TarihRegisterSetPin
??_TarihRegisterSetPin:	; 0 bytes @ 0x0
	global	??_shift_reg_set_pin_lcd
??_shift_reg_set_pin_lcd:	; 0 bytes @ 0x0
	global	??_common_request_function
??_common_request_function:	; 0 bytes @ 0x0
	global	utoa@v
utoa@v:	; 2 bytes @ 0x0
	ds	2
	global	?_TempLoadDigit
?_TempLoadDigit:	; 0 bytes @ 0x2
	global	?_TarihSetDisplay
?_TarihSetDisplay:	; 0 bytes @ 0x2
	global	?_lcd_info
?_lcd_info:	; 0 bytes @ 0x2
	global	TempLoadDigit@value
TempLoadDigit@value:	; 1 bytes @ 0x2
	global	TarihSetDisplay@value
TarihSetDisplay@value:	; 1 bytes @ 0x2
	global	lcd_info@data_type
lcd_info@data_type:	; 1 bytes @ 0x2
	global	utoa@c
utoa@c:	; 1 bytes @ 0x2
	ds	1
	global	??_TempLoadDigit
??_TempLoadDigit:	; 0 bytes @ 0x3
	global	??_TarihSetDisplay
??_TarihSetDisplay:	; 0 bytes @ 0x3
	global	??_lcd_info
??_lcd_info:	; 0 bytes @ 0x3
	global	??_ask_5_day_weather
??_ask_5_day_weather:	; 0 bytes @ 0x3
	global	??_ask_currency
??_ask_currency:	; 0 bytes @ 0x3
	global	??_ask_current_situation
??_ask_current_situation:	; 0 bytes @ 0x3
	global	utoa@buf
utoa@buf:	; 1 bytes @ 0x3
	ds	1
	global	?_itoa
?_itoa:	; 1 bytes @ 0x4
	global	itoa@val
itoa@val:	; 2 bytes @ 0x4
	ds	1
	global	TempLoadDigit@digit_number
TempLoadDigit@digit_number:	; 1 bytes @ 0x5
	global	TarihSetDisplay@display_number
TarihSetDisplay@display_number:	; 1 bytes @ 0x5
	global	lcd_info@c
lcd_info@c:	; 1 bytes @ 0x5
	ds	1
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x6
	global	TempLoadDigit@index
TempLoadDigit@index:	; 1 bytes @ 0x6
	global	TarihSetDisplay@index
TarihSetDisplay@index:	; 1 bytes @ 0x6
	global	lcd_goto@p_2
lcd_goto@p_2:	; 1 bytes @ 0x6
	global	itoa@base
itoa@base:	; 2 bytes @ 0x6
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x7
	global	??_EnDusukDisplay
??_EnDusukDisplay:	; 0 bytes @ 0x7
	global	??_EnYuksekDisplay
??_EnYuksekDisplay:	; 0 bytes @ 0x7
	global	??_LoadGunInfo
??_LoadGunInfo:	; 0 bytes @ 0x7
	global	??_LoadGosterilenGunInfo
??_LoadGosterilenGunInfo:	; 0 bytes @ 0x7
	global	??_DisplayGun
??_DisplayGun:	; 0 bytes @ 0x7
	global	??_DisplayAy
??_DisplayAy:	; 0 bytes @ 0x7
	global	??_DisplayYil
??_DisplayYil:	; 0 bytes @ 0x7
	global	?_SetHavaDurumuPin
?_SetHavaDurumuPin:	; 0 bytes @ 0x7
	global	SetHavaDurumuPin@pin_value
SetHavaDurumuPin@pin_value:	; 1 bytes @ 0x7
	ds	1
	global	??_SetHavaDurumuPin
??_SetHavaDurumuPin:	; 0 bytes @ 0x8
	global	lcd_goto@p_1
lcd_goto@p_1:	; 1 bytes @ 0x8
	global	itoa@cp
itoa@cp:	; 1 bytes @ 0x8
	ds	1
	global	??_lcd_yaz
??_lcd_yaz:	; 0 bytes @ 0x9
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x9
	global	LoadGunInfo@gun
LoadGunInfo@gun:	; 1 bytes @ 0x9
	global	LoadGosterilenGunInfo@g
LoadGosterilenGunInfo@g:	; 1 bytes @ 0x9
	global	itoa@buf
itoa@buf:	; 1 bytes @ 0x9
	ds	1
	global	EnDusukDisplay@number
EnDusukDisplay@number:	; 1 bytes @ 0xA
	global	EnYuksekDisplay@number
EnYuksekDisplay@number:	; 1 bytes @ 0xA
	global	DisplayGun@number
DisplayGun@number:	; 1 bytes @ 0xA
	global	DisplayAy@number
DisplayAy@number:	; 1 bytes @ 0xA
	global	DisplayYil@number
DisplayYil@number:	; 1 bytes @ 0xA
	global	SetHavaDurumuPin@pin_number
SetHavaDurumuPin@pin_number:	; 1 bytes @ 0xA
	global	lcd_yaz@data
lcd_yaz@data:	; 1 bytes @ 0xA
	ds	1
	global	?_lcd_write
?_lcd_write:	; 0 bytes @ 0xB
	global	??_LCD_init
??_LCD_init:	; 0 bytes @ 0xB
	global	lcd_write@s
lcd_write@s:	; 2 bytes @ 0xB
	ds	2
	global	??_lcd_write
??_lcd_write:	; 0 bytes @ 0xD
	ds	2
	global	?_lcd_write_number
?_lcd_write_number:	; 0 bytes @ 0xF
	global	lcd_write_number@number
lcd_write_number@number:	; 2 bytes @ 0xF
	ds	2
	global	??_show_date_info
??_show_date_info:	; 0 bytes @ 0x11
	global	?_show_currency_info
?_show_currency_info:	; 0 bytes @ 0x11
	global	show_currency_info@value
show_currency_info@value:	; 1 bytes @ 0x11
	ds	1
	global	??_show_currency_info
??_show_currency_info:	; 0 bytes @ 0x12
	ds	2
	global	show_currency_info@cur
show_currency_info@cur:	; 1 bytes @ 0x14
	ds	1
	global	??_show_currency_information
??_show_currency_information:	; 0 bytes @ 0x15
	global	show_date_info@temp_count
show_date_info@temp_count:	; 1 bytes @ 0x15
	ds	1
	global	show_date_info@p
show_date_info@p:	; 1 bytes @ 0x16
	ds	1
	global	show_date_info@day
show_date_info@day:	; 1 bytes @ 0x17
	ds	1
	global	show_date_info@l
show_date_info@l:	; 1 bytes @ 0x18
	ds	1
	global	show_date_info@k
show_date_info@k:	; 1 bytes @ 0x19
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1A
	ds	3
	global	main@prev_phrase
main@prev_phrase:	; 1 bytes @ 0x1D
	ds	1
	global	main@k
main@k:	; 1 bytes @ 0x1E
	ds	1
	global	main@temporary
main@temporary:	; 1 bytes @ 0x1F
	ds	1
;;Data sizes: Strings 77, constant 0, data 15, bss 153, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     32      80
;; BANK1           80      0      80
;; BANK2           80      0      40

;;
;; Pointer list with targets:

;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?_utoa	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; ?_memset	PTR void  size(1) Largest target is 50
;;		 -> current_buffer(BANK1[50]), 
;;
;; ?_itoa	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; memset@p1	PTR void  size(1) Largest target is 50
;;		 -> current_buffer(BANK1[50]), 
;;
;; memset@p	PTR unsigned char  size(1) Largest target is 50
;;		 -> current_buffer(BANK1[50]), 
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
;; main@temporary	PTR char  size(1) Largest target is 40
;;		 -> gunler(BANK2[40]), 
;;
;; common_request_function@point	PTR unsigned char  size(2) Largest target is 40
;;		 -> bugun(BANK1[11]), gunler(BANK2[40]), CURRENCY(BANK0[6]), 
;;
;; sp__memset	PTR void  size(1) Largest target is 50
;;		 -> current_buffer(BANK1[50]), 
;;
;; compareData@p	PTR unsigned char  size(1) Largest target is 50
;;		 -> current_buffer(BANK1[50]), 
;;
;; loadFromEPPROM@p	PTR unsigned char  size(2) Largest target is 40
;;		 -> bugun(BANK1[11]), gunler(BANK2[40]), CURRENCY(BANK0[6]), 
;;
;; saveToEEPROM@p	PTR unsigned char  size(1) Largest target is 50
;;		 -> current_buffer(BANK1[50]), 
;;
;; show_currency_info@value	PTR unsigned char  size(1) Largest target is 6
;;		 -> CURRENCY(BANK0[6]), 
;;
;; show_currency_info@cur	PTR unsigned char  size(1) Largest target is 7
;;		 -> STR_12(CODE[6]), STR_11(CODE[6]), STR_10(CODE[7]), 
;;
;; show_date_info@day	PTR char  size(1) Largest target is 40
;;		 -> gunler(BANK2[40]), 
;;
;; show_date_info@p	PTR const unsigned char  size(1) Largest target is 10
;;		 -> STR_7(CODE[10]), STR_6(CODE[5]), STR_5(CODE[9]), STR_4(CODE[9]), 
;;		 -> STR_3(CODE[5]), STR_2(CODE[10]), STR_1(CODE[6]), 
;;
;; UARTSendString@p	PTR unsigned char  size(1) Largest target is 3
;;		 -> COMMAND(BANK0[3]), 
;;
;; UARTReadString@curr	PTR unsigned char  size(1) Largest target is 50
;;		 -> current_buffer(BANK1[50]), 
;;
;; sp__itoa	PTR unsigned char  size(1) Largest target is 5
;;		 -> number_array(BANK1[5]), 
;;
;; lcd_write@s	PTR const unsigned char  size(2) Largest target is 10
;;		 -> STR_12(CODE[6]), STR_11(CODE[6]), STR_10(CODE[7]), STR_9(CODE[2]), 
;;		 -> STR_8(CODE[2]), STR_7(CODE[10]), STR_6(CODE[5]), STR_5(CODE[9]), 
;;		 -> STR_4(CODE[9]), STR_3(CODE[5]), STR_2(CODE[10]), STR_1(CODE[6]), 
;;		 -> number_array(BANK1[5]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _lcd_write_number->_itoa
;;   _LCD_init->_shift_reg_set_pin_lcd
;;   _lcd_info->_shift_reg_set_pin_lcd
;;   _TarihSetDisplay->_TarihRegisterSetPin
;;   _TempLoadDigit->_CenterSetPin
;;   _shift_reg_set_pin_lcd->_LoadDataCenter
;;   _TarihRegisterSetPin->_LoadDataCenter
;;   _CenterSetPin->_LoadDataCenter
;;   _ask_current_situation->_common_request_function
;;   _ask_currency->_common_request_function
;;   _ask_5_day_weather->_common_request_function
;;   _LoadDataCenter->_MainRegisterSetPin
;;   _retrive_weather_situations->_UARTSendString
;;   _common_request_function->_loadFromEPPROM
;;   _itoa->_utoa
;;   _MainRegisterSetPin->_MainRegisterLoadData
;;   _utoa->___lwdiv
;;   _resetBuffer->_memset
;;   _compareData->_EEPROM_ReadByte
;;   _loadFromEPPROM->_EEPROM_ReadByte
;;   _saveToEEPROM->_EEPROM_WriteByte
;;   _UARTSendString->_UART_byte_send
;;   _UARTReadString->_UART_byte_send
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_show_date_info
;;   _show_currency_information->_show_currency_info
;;   _show_currency_info->_lcd_write_number
;;   _show_date_info->_lcd_write_number
;;   _lcd_write_number->_lcd_write
;;   _LCD_init->_lcd_clear
;;   _lcd_write->_lcd_yaz
;;   _lcd_yaz->_lcd_goto
;;   _lcd_clear->_lcd_goto
;;   _lcd_goto->_lcd_info
;;   _SetHavaDurumuPin->_TempLoadDigit
;;   _DisplayYil->_TarihSetDisplay
;;   _DisplayAy->_TarihSetDisplay
;;   _DisplayGun->_TarihSetDisplay
;;   _LoadGosterilenGunInfo->_TempLoadDigit
;;   _LoadGunInfo->_TempLoadDigit
;;   _EnYuksekDisplay->_TempLoadDigit
;;   _EnDusukDisplay->_TempLoadDigit
;;   _lcd_info->_shift_reg_set_pin_lcd
;;   _TarihSetDisplay->_TarihRegisterSetPin
;;   _TempLoadDigit->_CenterSetPin
;;   _ask_current_situation->_common_request_function
;;   _ask_currency->_common_request_function
;;   _ask_5_day_weather->_common_request_function
;;   _itoa->_utoa
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
;; (0) _main                                                 6     6      0   22543
;;                                             26 BANK0      6     6      0
;;                           _LCD_init
;;                          _UART_init
;;         _retrive_weather_situations
;;                  _ask_5_day_weather
;;                        _compareData
;;                       _saveToEEPROM
;;                        _resetBuffer
;;                       _ask_currency
;;              _ask_current_situation
;;          _show_currency_information
;;                   _SetHavaDurumuPin
;;                     _show_date_info
;;                         _DisplayGun
;;                          _DisplayAy
;;                         _DisplayYil
;;                    _EnYuksekDisplay
;;                     _EnDusukDisplay
;;                        _LoadGunInfo
;;              _LoadGosterilenGunInfo
;; ---------------------------------------------------------------------------------
;; (1) _show_currency_information                            1     1      0    3869
;;                                             21 BANK0      1     1      0
;;                          _lcd_clear
;;                 _show_currency_info
;; ---------------------------------------------------------------------------------
;; (2) _show_currency_info                                   4     3      1    2915
;;                                             17 BANK0      4     3      1
;;                          _lcd_write
;;                   _lcd_write_number
;; ---------------------------------------------------------------------------------
;; (1) _show_date_info                                       9     9      0    6006
;;                                             17 BANK0      9     9      0
;;                          _lcd_clear
;;                           _lcd_goto
;;                          _lcd_write
;;                            ___awdiv
;;                   _lcd_write_number
;;                    _EEPROM_ReadByte
;;                            _lcd_yaz
;; ---------------------------------------------------------------------------------
;; (2) _lcd_write_number                                     2     0      2    1828
;;                                             15 BANK0      2     0      2
;;                               _itoa
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _LCD_init                                             2     2      0    1732
;;                                             11 BANK0      2     2      0
;;              _shift_reg_set_pin_lcd
;;                           _lcd_info
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write                                            4     2      2    1021
;;                                             11 BANK0      4     2      2
;;                            _lcd_yaz
;; ---------------------------------------------------------------------------------
;; (2) _lcd_yaz                                              2     2      0     976
;;                                              9 BANK0      2     2      0
;;                           _lcd_info
;;                           _lcd_goto
;; ---------------------------------------------------------------------------------
;; (2) _lcd_clear                                            2     2      0     954
;;                                              9 BANK0      2     2      0
;;                           _lcd_info
;;                           _lcd_goto
;; ---------------------------------------------------------------------------------
;; (3) _lcd_goto                                             3     2      1     532
;;                                              6 BANK0      3     2      1
;;                           _lcd_info
;; ---------------------------------------------------------------------------------
;; (1) _SetHavaDurumuPin                                     4     3      1     864
;;                                              7 BANK0      4     3      1
;;                      _TempLoadDigit
;; ---------------------------------------------------------------------------------
;; (1) _DisplayYil                                           4     4      0    1130
;;                                              7 BANK0      4     4      0
;;                            ___awdiv
;;                            ___awmod
;;                    _TarihSetDisplay
;; ---------------------------------------------------------------------------------
;; (1) _DisplayAy                                            4     4      0    1130
;;                                              7 BANK0      4     4      0
;;                            ___awdiv
;;                            ___awmod
;;                    _TarihSetDisplay
;; ---------------------------------------------------------------------------------
;; (1) _DisplayGun                                           4     4      0    1130
;;                                              7 BANK0      4     4      0
;;                            ___awdiv
;;                            ___awmod
;;                    _TarihSetDisplay
;; ---------------------------------------------------------------------------------
;; (1) _LoadGosterilenGunInfo                                3     3      0     600
;;                                              7 BANK0      3     3      0
;;                      _TempLoadDigit
;; ---------------------------------------------------------------------------------
;; (1) _LoadGunInfo                                          3     3      0     600
;;                                              7 BANK0      3     3      0
;;                      _TempLoadDigit
;; ---------------------------------------------------------------------------------
;; (1) _EnYuksekDisplay                                      4     4      0    1218
;;                                              7 BANK0      4     4      0
;;                            ___awdiv
;;                            ___awmod
;;                      _TempLoadDigit
;; ---------------------------------------------------------------------------------
;; (1) _EnDusukDisplay                                       4     4      0    1218
;;                                              7 BANK0      4     4      0
;;                            ___awdiv
;;                            ___awmod
;;                      _TempLoadDigit
;; ---------------------------------------------------------------------------------
;; (4) _lcd_info                                             4     3      1     422
;;                                              2 BANK0      4     3      1
;;              _shift_reg_set_pin_lcd
;; ---------------------------------------------------------------------------------
;; (2) _TarihSetDisplay                                      5     4      1     490
;;                                              2 BANK0      5     4      1
;;                _TarihRegisterSetPin
;; ---------------------------------------------------------------------------------
;; (2) _TempLoadDigit                                        5     4      1     578
;;                                              2 BANK0      5     4      1
;;                       _CenterSetPin
;; ---------------------------------------------------------------------------------
;; (5) _shift_reg_set_pin_lcd                                4     3      1     356
;;                                             12 COMMON     2     1      1
;;                                              0 BANK0      2     2      0
;;                     _LoadDataCenter
;; ---------------------------------------------------------------------------------
;; (3) _TarihRegisterSetPin                                  4     3      1     356
;;                                             12 COMMON     2     1      1
;;                                              0 BANK0      2     2      0
;;                     _LoadDataCenter
;; ---------------------------------------------------------------------------------
;; (3) _CenterSetPin                                         4     3      1     444
;;                                             12 COMMON     2     1      1
;;                                              0 BANK0      2     2      0
;;                     _LoadDataCenter
;; ---------------------------------------------------------------------------------
;; (1) _ask_current_situation                                2     2      0     633
;;                                              3 BANK0      2     2      0
;;            _common_request_function
;; ---------------------------------------------------------------------------------
;; (1) _ask_currency                                         2     2      0     633
;;                                              3 BANK0      2     2      0
;;            _common_request_function
;; ---------------------------------------------------------------------------------
;; (1) _ask_5_day_weather                                    1     1      0     633
;;                                              3 BANK0      1     1      0
;;            _common_request_function
;; ---------------------------------------------------------------------------------
;; (4) _LoadDataCenter                                       5     4      1     290
;;                                              7 COMMON     5     4      1
;;                 _MainRegisterSetPin
;; ---------------------------------------------------------------------------------
;; (1) _retrive_weather_situations                           4     4      0     268
;;                                              3 COMMON     4     4      0
;;                    _EEPROM_ReadByte
;;                     _UARTSendString
;;                   _EEPROM_WriteByte
;;                     _UART_byte_send
;;                  _UART_byte_receive
;; ---------------------------------------------------------------------------------
;; (2) _common_request_function                              8     4      4     633
;;                                              9 COMMON     5     1      4
;;                                              0 BANK0      3     3      0
;;                     _UARTSendString
;;                     _UARTReadString
;;                     _loadFromEPPROM
;; ---------------------------------------------------------------------------------
;; (3) _itoa                                                 7     3      4     785
;;                                             13 COMMON     1     1      0
;;                                              4 BANK0      6     2      4
;;                               _utoa
;; ---------------------------------------------------------------------------------
;; (5) _MainRegisterSetPin                                   4     3      1     156
;;                                              3 COMMON     4     3      1
;;               _MainRegisterLoadData
;; ---------------------------------------------------------------------------------
;; (4) _utoa                                                 9     5      4     622
;;                                              8 COMMON     5     1      4
;;                                              0 BANK0      4     4      0
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (1) _resetBuffer                                          3     3      0      96
;;                                              7 COMMON     3     3      0
;;                             _memset
;; ---------------------------------------------------------------------------------
;; (1) _compareData                                          7     5      2     156
;;                                              1 COMMON     7     5      2
;;                    _EEPROM_ReadByte
;; ---------------------------------------------------------------------------------
;; (3) _loadFromEPPROM                                       8     5      3     156
;;                                              1 COMMON     8     5      3
;;                    _EEPROM_ReadByte
;; ---------------------------------------------------------------------------------
;; (1) _saveToEEPROM                                         6     4      2     178
;;                                              2 COMMON     6     4      2
;;                   _EEPROM_WriteByte
;; ---------------------------------------------------------------------------------
;; (3) _UARTSendString                                       2     2      0      89
;;                                              1 COMMON     2     2      0
;;                     _UART_byte_send
;; ---------------------------------------------------------------------------------
;; (3) _UARTReadString                                       5     5      0     202
;;                                              1 COMMON     5     5      0
;;                     _UART_byte_send
;;                  _UART_byte_receive
;; ---------------------------------------------------------------------------------
;; (6) _MainRegisterLoadData                                 3     3      0      90
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (5) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (5) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (2) _memset                                               7     3      4      96
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) _EEPROM_ReadByte                                      1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _EEPROM_WriteByte                                     2     1      1      44
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _UART_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _UART_byte_receive                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _UART_byte_send                                       1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _LCD_init
;;     _shift_reg_set_pin_lcd
;;       _LoadDataCenter
;;         _MainRegisterSetPin
;;           _MainRegisterLoadData
;;     _lcd_info
;;       _shift_reg_set_pin_lcd
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
;;     _lcd_clear
;;       _lcd_info
;;         _shift_reg_set_pin_lcd
;;           _LoadDataCenter
;;             _MainRegisterSetPin
;;               _MainRegisterLoadData
;;       _lcd_goto
;;         _lcd_info
;;           _shift_reg_set_pin_lcd
;;             _LoadDataCenter
;;               _MainRegisterSetPin
;;                 _MainRegisterLoadData
;;   _UART_init
;;   _retrive_weather_situations
;;     _EEPROM_ReadByte
;;     _UARTSendString
;;       _UART_byte_send
;;     _EEPROM_WriteByte
;;     _UART_byte_send
;;     _UART_byte_receive
;;   _ask_5_day_weather
;;     _common_request_function
;;       _UARTSendString
;;         _UART_byte_send
;;       _UARTReadString
;;         _UART_byte_send
;;         _UART_byte_receive
;;       _loadFromEPPROM
;;         _EEPROM_ReadByte
;;   _compareData
;;     _EEPROM_ReadByte
;;   _saveToEEPROM
;;     _EEPROM_WriteByte
;;   _resetBuffer
;;     _memset
;;   _ask_currency
;;     _common_request_function
;;       _UARTSendString
;;         _UART_byte_send
;;       _UARTReadString
;;         _UART_byte_send
;;         _UART_byte_receive
;;       _loadFromEPPROM
;;         _EEPROM_ReadByte
;;   _ask_current_situation
;;     _common_request_function
;;       _UARTSendString
;;         _UART_byte_send
;;       _UARTReadString
;;         _UART_byte_send
;;         _UART_byte_receive
;;       _loadFromEPPROM
;;         _EEPROM_ReadByte
;;   _show_currency_information
;;     _lcd_clear
;;       _lcd_info
;;         _shift_reg_set_pin_lcd
;;           _LoadDataCenter
;;             _MainRegisterSetPin
;;               _MainRegisterLoadData
;;       _lcd_goto
;;         _lcd_info
;;           _shift_reg_set_pin_lcd
;;             _LoadDataCenter
;;               _MainRegisterSetPin
;;                 _MainRegisterLoadData
;;     _show_currency_info
;;       _lcd_write
;;         _lcd_yaz
;;           _lcd_info
;;             _shift_reg_set_pin_lcd
;;               _LoadDataCenter
;;                 _MainRegisterSetPin
;;                   _MainRegisterLoadData
;;           _lcd_goto
;;             _lcd_info
;;               _shift_reg_set_pin_lcd
;;                 _LoadDataCenter
;;                   _MainRegisterSetPin
;;                     _MainRegisterLoadData
;;       _lcd_write_number
;;         _itoa
;;           _utoa
;;             ___lwdiv
;;             ___lwmod
;;         _lcd_write
;;           _lcd_yaz
;;             _lcd_info
;;               _shift_reg_set_pin_lcd
;;                 _LoadDataCenter
;;                   _MainRegisterSetPin
;;                     _MainRegisterLoadData
;;             _lcd_goto
;;               _lcd_info
;;                 _shift_reg_set_pin_lcd
;;                   _LoadDataCenter
;;                     _MainRegisterSetPin
;;                       _MainRegisterLoadData
;;   _SetHavaDurumuPin
;;     _TempLoadDigit
;;       _CenterSetPin
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
;;   _show_date_info
;;     _lcd_clear
;;       _lcd_info
;;         _shift_reg_set_pin_lcd
;;           _LoadDataCenter
;;             _MainRegisterSetPin
;;               _MainRegisterLoadData
;;       _lcd_goto
;;         _lcd_info
;;           _shift_reg_set_pin_lcd
;;             _LoadDataCenter
;;               _MainRegisterSetPin
;;                 _MainRegisterLoadData
;;     _lcd_goto
;;       _lcd_info
;;         _shift_reg_set_pin_lcd
;;           _LoadDataCenter
;;             _MainRegisterSetPin
;;               _MainRegisterLoadData
;;     _lcd_write
;;       _lcd_yaz
;;         _lcd_info
;;           _shift_reg_set_pin_lcd
;;             _LoadDataCenter
;;               _MainRegisterSetPin
;;                 _MainRegisterLoadData
;;         _lcd_goto
;;           _lcd_info
;;             _shift_reg_set_pin_lcd
;;               _LoadDataCenter
;;                 _MainRegisterSetPin
;;                   _MainRegisterLoadData
;;     ___awdiv
;;     _lcd_write_number
;;       _itoa
;;         _utoa
;;           ___lwdiv
;;           ___lwmod
;;       _lcd_write
;;         _lcd_yaz
;;           _lcd_info
;;             _shift_reg_set_pin_lcd
;;               _LoadDataCenter
;;                 _MainRegisterSetPin
;;                   _MainRegisterLoadData
;;           _lcd_goto
;;             _lcd_info
;;               _shift_reg_set_pin_lcd
;;                 _LoadDataCenter
;;                   _MainRegisterSetPin
;;                     _MainRegisterLoadData
;;     _EEPROM_ReadByte
;;     _lcd_yaz
;;       _lcd_info
;;         _shift_reg_set_pin_lcd
;;           _LoadDataCenter
;;             _MainRegisterSetPin
;;               _MainRegisterLoadData
;;       _lcd_goto
;;         _lcd_info
;;           _shift_reg_set_pin_lcd
;;             _LoadDataCenter
;;               _MainRegisterSetPin
;;                 _MainRegisterLoadData
;;   _DisplayGun
;;     ___awdiv
;;     ___awmod
;;     _TarihSetDisplay
;;       _TarihRegisterSetPin
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
;;   _DisplayAy
;;     ___awdiv
;;     ___awmod
;;     _TarihSetDisplay
;;       _TarihRegisterSetPin
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
;;   _DisplayYil
;;     ___awdiv
;;     ___awmod
;;     _TarihSetDisplay
;;       _TarihRegisterSetPin
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
;;   _EnYuksekDisplay
;;     ___awdiv
;;     ___awmod
;;     _TempLoadDigit
;;       _CenterSetPin
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
;;   _EnDusukDisplay
;;     ___awdiv
;;     ___awmod
;;     _TempLoadDigit
;;       _CenterSetPin
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
;;   _LoadGunInfo
;;     _TempLoadDigit
;;       _CenterSetPin
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
;;   _LoadGosterilenGunInfo
;;     _TempLoadDigit
;;       _CenterSetPin
;;         _LoadDataCenter
;;           _MainRegisterSetPin
;;             _MainRegisterLoadData
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
;;STACK                0      0       B       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      D6       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50     20      50       6      100.0%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               50      0      50       8      100.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITBANK2            50      0       0       9        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BANK2               50      0      28      10       50.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;DATA                 0      0      E1      11        0.0%
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
;;		line 28 in file "../PIC12f1840Weather.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1   30[BANK0 ] unsigned char 
;;  temporary       1   31[BANK0 ] PTR char 
;;		 -> gunler(40), 
;;  prev_phrase     1   29[BANK0 ] unsigned char 
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
;;      Locals:         0       3       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:   11
;; This function calls:
;;		_LCD_init
;;		_UART_init
;;		_retrive_weather_situations
;;		_ask_5_day_weather
;;		_compareData
;;		_saveToEEPROM
;;		_resetBuffer
;;		_ask_currency
;;		_ask_current_situation
;;		_show_currency_information
;;		_SetHavaDurumuPin
;;		_show_date_info
;;		_DisplayGun
;;		_DisplayAy
;;		_DisplayYil
;;		_EnYuksekDisplay
;;		_EnDusukDisplay
;;		_LoadGunInfo
;;		_LoadGosterilenGunInfo
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../PIC12f1840Weather.c"
	line	28
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [allreg]
	line	30
	
l5746:	
	movlb 1	; select bank1
	bsf	(1225/8)^080h,(1225)&7
	line	31
	bcf	(1224/8)^080h,(1224)&7
	line	34
	bsf	(1230/8)^080h,(1230)&7
	line	35
	bsf	(1229/8)^080h,(1229)&7
	line	37
	bcf	(1228/8)^080h,(1228)&7
	line	38
	bsf	(1227/8)^080h,(1227)&7
	line	39
	
l5748:	
	movlb 3	; select bank3
	clrf	(396)^0180h	;volatile
	line	44
	
l5750:	
	movlb 1	; select bank1
	bsf	(1123/8)^080h,(1123)&7
	line	47
	
l5752:	
	bcf	(1120/8)^080h,(1120)&7
	line	48
	
l5754:	
	bcf	(1125/8)^080h,(1125)&7
	line	50
	
l5756:	
	bcf	(1122/8)^080h,(1122)&7
	line	51
	
l5758:	
	bcf	(1124/8)^080h,(1124)&7
	line	55
	
l5760:	
	opt asmopt_off
movlw	26
	movlb 0	; select bank0
movwf	((??_main+0)+0+1),f
	movlw	248
movwf	((??_main+0)+0),f
u4827:
	decfsz	((??_main+0)+0),f
	goto	u4827
	decfsz	((??_main+0)+0+1),f
	goto	u4827
	clrwdt
opt asmopt_on

	line	56
	
l5762:	
	fcall	_LCD_init
	line	57
	
l5764:	
	fcall	_UART_init
	line	58
	
l5766:	
	opt asmopt_off
movlw  2
	movlb 0	; select bank0
movwf	((??_main+0)+0+2),f
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u4837:
	decfsz	((??_main+0)+0),f
	goto	u4837
	decfsz	((??_main+0)+0+1),f
	goto	u4837
	decfsz	((??_main+0)+0+2),f
	goto	u4837
	clrwdt
opt asmopt_on

	line	61
	
l5768:	
	fcall	_retrive_weather_situations
	line	62
	
l5770:	
	opt asmopt_off
movlw	130
	movlb 0	; select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u4847:
	decfsz	((??_main+0)+0),f
	goto	u4847
	decfsz	((??_main+0)+0+1),f
	goto	u4847
	nop2
opt asmopt_on

	line	64
	
l5772:	
	fcall	_ask_5_day_weather
	line	66
	
l5774:	
	movlb 0	; select bank0
	movf	(_time_exceed),f
	skipz
	goto	u4731
	goto	u4730
u4731:
	goto	l5780
u4730:
	line	68
	
l5776:	
	movlw	(_current_buffer)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_compareData)
	movlw	(028h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_compareData)+01h
	movlw	(0)
	fcall	_compareData
	iorlw	0
	skipz
	goto	u4741
	goto	u4740
u4741:
	goto	l1441
u4740:
	line	69
	
l5778:	
	movlw	(_current_buffer)&0ffh
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_saveToEEPROM)
	movlw	(028h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_saveToEEPROM)+01h
	movlw	(0)
	fcall	_saveToEEPROM
	
l1441:	
	line	71
	fcall	_resetBuffer
	goto	l5780
	line	72
	
l1440:	
	line	73
	
l5780:	
	opt asmopt_off
movlw	130
	movlb 0	; select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u4857:
	decfsz	((??_main+0)+0),f
	goto	u4857
	decfsz	((??_main+0)+0+1),f
	goto	u4857
	nop2
opt asmopt_on

	line	77
	
l5782:	
	fcall	_ask_currency
	line	79
	
l5784:	
	movlb 0	; select bank0
	movf	(_time_exceed),f
	skipz
	goto	u4751
	goto	u4750
u4751:
	goto	l5790
u4750:
	line	81
	
l5786:	
	movlw	(_current_buffer)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_compareData)
	movlw	(06h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_compareData)+01h
	movlw	(033h)
	fcall	_compareData
	iorlw	0
	skipz
	goto	u4761
	goto	u4760
u4761:
	goto	l1443
u4760:
	line	82
	
l5788:	
	movlw	(_current_buffer)&0ffh
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_saveToEEPROM)
	movlw	(06h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_saveToEEPROM)+01h
	movlw	(033h)
	fcall	_saveToEEPROM
	
l1443:	
	line	83
	fcall	_resetBuffer
	goto	l5790
	line	84
	
l1442:	
	line	85
	
l5790:	
	opt asmopt_off
movlw	130
	movlb 0	; select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u4867:
	decfsz	((??_main+0)+0),f
	goto	u4867
	decfsz	((??_main+0)+0+1),f
	goto	u4867
	nop2
opt asmopt_on

	line	86
	
l5792:	
	fcall	_ask_current_situation
	line	88
	
l5794:	
	movlb 0	; select bank0
	movf	(_time_exceed),f
	skipz
	goto	u4771
	goto	u4770
u4771:
	goto	l5800
u4770:
	line	90
	
l5796:	
	movlw	(_current_buffer)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_compareData)
	movlw	(0Bh)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_compareData)+01h
	movlw	(028h)
	fcall	_compareData
	iorlw	0
	skipz
	goto	u4781
	goto	u4780
u4781:
	goto	l1445
u4780:
	line	91
	
l5798:	
	movlw	(_current_buffer)&0ffh
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_saveToEEPROM)
	movlw	(0Bh)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_saveToEEPROM)+01h
	movlw	(028h)
	fcall	_saveToEEPROM
	
l1445:	
	line	92
	fcall	_resetBuffer
	goto	l5800
	line	93
	
l1444:	
	line	94
	
l5800:	
	opt asmopt_off
movlw	130
	movlb 0	; select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u4877:
	decfsz	((??_main+0)+0),f
	goto	u4877
	decfsz	((??_main+0)+0+1),f
	goto	u4877
	nop2
opt asmopt_on

	line	96
	
l5802:	
	movlb 0	; select bank0
	clrf	(main@prev_phrase)
	goto	l5804
	line	98
	
l1446:	
	line	100
	
l5804:	
	fcall	_show_currency_information
	line	102
	
l5806:	
	movlb 0	; select bank0
	clrf	(main@k)
	
l5808:	
	movlw	(05h)
	subwf	(main@k),w
	skipc
	goto	u4791
	goto	u4790
u4791:
	goto	l5812
u4790:
	goto	l5804
	
l5810:	
	goto	l5804
	line	103
	
l1447:	
	line	104
	
l5812:	
	movf	(main@k),w
	movwf	(??_main+0)+0
	movlw	(03h)-1
u4805:
	lslf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u4805
	lslf	(??_main+0)+0,w
	addlw	_gunler&0ffh
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	(main@temporary)
	line	105
	
l5814:	
	clrf	(?_SetHavaDurumuPin)
	movf	(main@prev_phrase),w
	fcall	_SetHavaDurumuPin
	line	106
	
l5816:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	fcall	_show_date_info
	line	107
	
l5818:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	addlw	01h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	fcall	_DisplayGun
	line	108
	
l5820:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	addlw	02h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	fcall	_DisplayAy
	line	109
	
l5822:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	addlw	03h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	fcall	_DisplayYil
	line	110
	
l5824:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	addlw	05h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	fcall	_EnYuksekDisplay
	line	111
	
l5826:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	addlw	04h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	fcall	_EnDusukDisplay
	line	112
	
l5828:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	fcall	_LoadGunInfo
	line	113
	
l5830:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	addlw	07h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	fcall	_LoadGosterilenGunInfo
	line	114
	
l5832:	
	movlb 0	; select bank0
	clrf	(?_SetHavaDurumuPin)
	bsf	status,0
	rlf	(?_SetHavaDurumuPin),f
	movf	(main@temporary),w
	addlw	06h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	fcall	_SetHavaDurumuPin
	line	115
	
l5834:	
	movlb 0	; select bank0
	movf	(main@temporary),w
	addlw	06h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@prev_phrase)
	line	116
	
l5836:	
	opt asmopt_off
movlw  16
movwf	((??_main+0)+0+2),f
movlw	57
movwf	((??_main+0)+0+1),f
	movlw	27
movwf	((??_main+0)+0),f
u4887:
	decfsz	((??_main+0)+0),f
	goto	u4887
	decfsz	((??_main+0)+0+1),f
	goto	u4887
	decfsz	((??_main+0)+0+2),f
	goto	u4887
	nop2
opt asmopt_on

	line	102
	
l5838:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@k),f
	
l5840:	
	movlw	(05h)
	subwf	(main@k),w
	skipc
	goto	u4811
	goto	u4810
u4811:
	goto	l5812
u4810:
	goto	l5804
	
l1448:	
	goto	l5804
	line	118
	
l1449:	
	line	98
	goto	l5804
	
l1450:	
	line	121
	
l1451:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_show_currency_information
psect	text1360,local,class=CODE,delta=2
global __ptext1360
__ptext1360:

;; *************** function _show_currency_information *****************
;; Defined at:
;;		line 107 in file "../HAVASTRUCTURE.h"
;; Parameters:    Size  Location     Type
;;		None
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
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   10
;; This function calls:
;;		_lcd_clear
;;		_show_currency_info
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1360
	file	"../HAVASTRUCTURE.h"
	line	107
	global	__size_of_show_currency_information
	__size_of_show_currency_information	equ	__end_of_show_currency_information-_show_currency_information
	
_show_currency_information:	
	opt	stack 5
; Regs used in _show_currency_information: [wreg-status,0+pclath+cstack]
	line	108
	
l5588:	
	fcall	_lcd_clear
	line	109
	
l5590:	
	movlw	(_CURRENCY)&0ffh
	movlb 0	; select bank0
	movwf	(??_show_currency_information+0)+0
	movf	(??_show_currency_information+0)+0,w
	movwf	(?_show_currency_info)
	movlw	(STR_10|8000h)&0ffh
	fcall	_show_currency_info
	line	110
	
l5592:	
	movlw	(_CURRENCY+02h)&0ffh
	movlb 0	; select bank0
	movwf	(??_show_currency_information+0)+0
	movf	(??_show_currency_information+0)+0,w
	movwf	(?_show_currency_info)
	movlw	(STR_11|8000h)&0ffh
	fcall	_show_currency_info
	line	111
	
l5594:	
	movlw	(_CURRENCY+04h)&0ffh
	movlb 0	; select bank0
	movwf	(??_show_currency_information+0)+0
	movf	(??_show_currency_information+0)+0,w
	movwf	(?_show_currency_info)
	movlw	(STR_12|8000h)&0ffh
	fcall	_show_currency_info
	line	113
	
l1358:	
	return
	opt stack 0
GLOBAL	__end_of_show_currency_information
	__end_of_show_currency_information:
;; =============== function _show_currency_information ends ============

	signat	_show_currency_information,88
	global	_show_currency_info
psect	text1361,local,class=CODE,delta=2
global __ptext1361
__ptext1361:

;; *************** function _show_currency_info *****************
;; Defined at:
;;		line 98 in file "../HAVASTRUCTURE.h"
;; Parameters:    Size  Location     Type
;;  cur             1    wreg     PTR unsigned char 
;;		 -> STR_12(6), STR_11(6), STR_10(7), 
;;  value           1   17[BANK0 ] PTR unsigned char 
;;		 -> CURRENCY(6), 
;; Auto vars:     Size  Location     Type
;;  cur             1   20[BANK0 ] PTR unsigned char 
;;		 -> STR_12(6), STR_11(6), STR_10(7), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
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
;;		_lcd_write
;;		_lcd_write_number
;; This function is called by:
;;		_show_currency_information
;; This function uses a non-reentrant model
;;
psect	text1361
	file	"../HAVASTRUCTURE.h"
	line	98
	global	__size_of_show_currency_info
	__size_of_show_currency_info	equ	__end_of_show_currency_info-_show_currency_info
	
_show_currency_info:	
	opt	stack 5
; Regs used in _show_currency_info: [wreg-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(show_currency_info@cur)
	line	99
	
l5582:	
	movf	(show_currency_info@cur),w
	movwf	(?_lcd_write)
	movlw	high(__stringtab)|80h
	movwf	(?_lcd_write+1)
	fcall	_lcd_write
	line	100
	
l5584:	
	movlb 0	; select bank0
	movf	(show_currency_info@value),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??_show_currency_info+0)+0
	clrf	(??_show_currency_info+0)+0+1
	movf	0+(??_show_currency_info+0)+0,w
	movwf	(?_lcd_write_number)
	movf	1+(??_show_currency_info+0)+0,w
	movwf	(?_lcd_write_number+1)
	fcall	_lcd_write_number
	line	101
	
l5586:	
	movlw	low(STR_9|8000h)
	movlb 0	; select bank0
	movwf	(?_lcd_write)
	movlw	high(STR_9|8000h)
	movwf	(?_lcd_write+1)
	fcall	_lcd_write
	line	102
	movlb 0	; select bank0
	movf	(show_currency_info@value),w
	addlw	01h
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(??_show_currency_info+0)+0
	clrf	(??_show_currency_info+0)+0+1
	movf	0+(??_show_currency_info+0)+0,w
	movwf	(?_lcd_write_number)
	movf	1+(??_show_currency_info+0)+0,w
	movwf	(?_lcd_write_number+1)
	fcall	_lcd_write_number
	line	104
	
l1355:	
	return
	opt stack 0
GLOBAL	__end_of_show_currency_info
	__end_of_show_currency_info:
;; =============== function _show_currency_info ends ============

	signat	_show_currency_info,8312
	global	_show_date_info
psect	text1362,local,class=CODE,delta=2
global __ptext1362
__ptext1362:

;; *************** function _show_date_info *****************
;; Defined at:
;;		line 34 in file "../HAVASTRUCTURE.h"
;; Parameters:    Size  Location     Type
;;  day             1    wreg     PTR char 
;;		 -> gunler(40), 
;; Auto vars:     Size  Location     Type
;;  day             1   23[BANK0 ] PTR char 
;;		 -> gunler(40), 
;;  k               1   25[BANK0 ] char 
;;  l               1   24[BANK0 ] char 
;;  p               1   22[BANK0 ] PTR const unsigned char 
;;		 -> STR_7(10), STR_6(5), STR_5(9), STR_4(9), 
;;		 -> STR_3(5), STR_2(10), STR_1(6), 
;;  temp_count      1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       5       0       0
;;      Temps:          0       4       0       0
;;      Totals:         0       9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_lcd_clear
;;		_lcd_goto
;;		_lcd_write
;;		___awdiv
;;		_lcd_write_number
;;		_EEPROM_ReadByte
;;		_lcd_yaz
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1362
	file	"../HAVASTRUCTURE.h"
	line	34
	global	__size_of_show_date_info
	__size_of_show_date_info	equ	__end_of_show_date_info-_show_date_info
	
_show_date_info:	
	opt	stack 6
; Regs used in _show_date_info: [wreg-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(show_date_info@day)
	line	35
	
l5502:	
	fcall	_lcd_clear
	line	36
	movlb 0	; select bank0
	clrf	(?_lcd_goto)
	bsf	status,0
	rlf	(?_lcd_goto),f
	movlw	(01h)
	fcall	_lcd_goto
	line	38
	goto	l5520
	line	40
	
l1331:	
	line	41
	
l5504:	
	movlw	(STR_1|8000h)&0ffh
	movlb 0	; select bank0
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@p)
	line	42
	goto	l5522
	line	43
	
l1333:	
	line	44
	
l5506:	
	movlw	(STR_2|8000h)&0ffh
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@p)
	line	45
	goto	l5522
	line	47
	
l1334:	
	line	48
	
l5508:	
	movlw	(STR_3|8000h)&0ffh
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@p)
	line	49
	goto	l5522
	line	50
	
l1335:	
	line	51
	
l5510:	
	movlw	(STR_4|8000h)&0ffh
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@p)
	line	52
	goto	l5522
	line	53
	
l1336:	
	line	54
	
l5512:	
	movlw	(STR_5|8000h)&0ffh
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@p)
	line	55
	goto	l5522
	line	56
	
l1337:	
	line	57
	
l5514:	
	movlw	(STR_6|8000h)&0ffh
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@p)
	line	58
	goto	l5522
	line	59
	
l1338:	
	line	60
	
l5516:	
	movlw	(STR_7|8000h)&0ffh
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@p)
	line	61
	goto	l5522
	line	62
	
l5518:	
	goto	l5522
	line	38
	
l1330:	
	
l5520:	
	movlb 0	; select bank0
	movf	(show_date_info@day),w
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           20     6 (fixed)
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable            11     4 (fixed)
; spacedrange           19     6 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr0l
	movlw	7
	subwf	fsr0l,w
skipnc
goto l5522
movlp high(S5862)
	lslf fsr0l,w
	addlw low(S5862)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5862:
	ljmp	l5504
	ljmp	l5506
	ljmp	l5508
	ljmp	l5510
	ljmp	l5512
	ljmp	l5514
	ljmp	l5516
psect	text1362

	line	62
	
l1332:	
	line	63
	
l5522:	
	movf	(show_date_info@p),w
	movwf	(?_lcd_write)
	movlw	high(__stringtab)|80h
	movwf	(?_lcd_write+1)
	fcall	_lcd_write
	line	64
	
l5524:	
	movlb 0	; select bank0
	clrf	(show_date_info@k)
	line	65
	
l5526:	
	movf	(show_date_info@day),w
	addlw	04h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@k)
	line	66
	
l5528:	
	movf	(show_date_info@day),w
	addlw	05h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@l)
	line	68
	
l5530:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(show_date_info@k),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	((1+(?___awdiv))),w
	iorwf	((0+(?___awdiv))),w
	skipz
	goto	u4541
	goto	u4540
u4541:
	goto	l5534
u4540:
	
l5532:	
	movlb 0	; select bank0
	clrf	(show_date_info@temp_count)
	bsf	status,0
	rlf	(show_date_info@temp_count),f
	goto	l5536
	line	69
	
l1339:	
	
l5534:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@temp_count)
	goto	l5536
	
l1340:	
	line	71
	
l5536:	
	btfss	(show_date_info@k),7
	goto	u4551
	goto	u4550
u4551:
	goto	l5540
u4550:
	
l5538:	
	movlw	(01h)
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	addwf	(show_date_info@temp_count),f
	goto	l5540
	
l1341:	
	line	73
	
l5540:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(show_date_info@l),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	((1+(?___awdiv))),w
	iorwf	((0+(?___awdiv))),w
	skipz
	goto	u4561
	goto	u4560
u4561:
	goto	l5544
u4560:
	
l5542:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	addwf	(show_date_info@temp_count),f
	goto	l5546
	line	74
	
l1342:	
	
l5544:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	addwf	(show_date_info@temp_count),f
	goto	l5546
	
l1343:	
	line	76
	
l5546:	
	btfss	(show_date_info@l),7
	goto	u4571
	goto	u4570
u4571:
	goto	l5550
u4570:
	
l5548:	
	movlw	(01h)
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	addwf	(show_date_info@temp_count),f
	goto	l5550
	
l1344:	
	line	78
	
l5550:	
	decf	(show_date_info@temp_count),w
	xorlw	0ffh
	addlw	010h
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(?_lcd_goto)
	movlw	(01h)
	fcall	_lcd_goto
	line	79
	
l5552:	
	movlb 0	; select bank0
	movf	(show_date_info@k),w
	movwf	(?_lcd_write_number)
	clrf	(?_lcd_write_number+1)
	btfsc	(?_lcd_write_number),7
	decf	(?_lcd_write_number+1),f
	fcall	_lcd_write_number
	line	80
	
l5554:	
	movlw	low(STR_8|8000h)
	movlb 0	; select bank0
	movwf	(?_lcd_write)
	movlw	high(STR_8|8000h)
	movwf	(?_lcd_write+1)
	fcall	_lcd_write
	line	81
	
l5556:	
	movlb 0	; select bank0
	movf	(show_date_info@l),w
	movwf	(?_lcd_write_number)
	clrf	(?_lcd_write_number+1)
	btfsc	(?_lcd_write_number),7
	decf	(?_lcd_write_number+1),f
	fcall	_lcd_write_number
	line	83
	
l5558:	
	movlb 0	; select bank0
	clrf	(?_lcd_goto)
	bsf	status,0
	rlf	(?_lcd_goto),f
	movlw	(02h)
	fcall	_lcd_goto
	line	84
	
l5560:	
	movlw	(039h)
	movlb 0	; select bank0
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@k)
	line	85
	goto	l5564
	
l1346:	
	
l5562:	
	movlw	(01h)
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	addwf	(show_date_info@k),f
	goto	l5564
	
l1345:	
	
l5564:	
	movf	(show_date_info@day),w
	addlw	06h
	movwf	fsr1l
	movlw 1	; select bank2/3
	movwf fsr1h	
	
	movf	indf1,w
	movwf	(??_show_date_info+0)+0
	clrf	(??_show_date_info+0)+0+1
	btfsc	(??_show_date_info+0)+0,7
	decf	(??_show_date_info+0)+0+1,f
	movf	(show_date_info@k),w
	fcall	_EEPROM_ReadByte
	movlb 0	; select bank0
	movwf	(??_show_date_info+2)+0
	clrf	(??_show_date_info+2)+0+1
	movf	1+(??_show_date_info+0)+0,w
	xorwf	1+(??_show_date_info+2)+0,w
	skipz
	goto	u4585
	movf	0+(??_show_date_info+0)+0,w
	xorwf	0+(??_show_date_info+2)+0,w
u4585:

	skipz
	goto	u4581
	goto	u4580
u4581:
	goto	l5562
u4580:
	goto	l5566
	
l1347:	
	line	86
	
l5566:	
	movlw	(01h)
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	addwf	(show_date_info@k),f
	goto	l5568
	line	87
	
l1348:	
	line	89
	
l5568:	
	movlb 0	; select bank0
	movf	(show_date_info@k),w
	fcall	_EEPROM_ReadByte
	movlb 0	; select bank0
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	movwf	(show_date_info@l)
	
l5570:	
	movlw	(01h)
	movwf	(??_show_date_info+0)+0
	movf	(??_show_date_info+0)+0,w
	addwf	(show_date_info@k),f
	line	90
	
l5572:	
	movf	(show_date_info@l),f
	skipz
	goto	u4591
	goto	u4590
u4591:
	goto	l5576
u4590:
	goto	l1352
	
l5574:	
	goto	l1352
	
l1349:	
	line	91
	
l5576:	
	movf	(show_date_info@l),w
	fcall	_lcd_yaz
	goto	l5568
	line	92
	
l1351:	
	line	87
	goto	l5568
	
l1350:	
	line	95
	
l1352:	
	return
	opt stack 0
GLOBAL	__end_of_show_date_info
	__end_of_show_date_info:
;; =============== function _show_date_info ends ============

	signat	_show_date_info,4216
	global	_lcd_write_number
psect	text1363,local,class=CODE,delta=2
global __ptext1363
__ptext1363:

;; *************** function _lcd_write_number *****************
;; Defined at:
;;		line 173 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  number          2   15[BANK0 ] int 
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
;;      Params:         0       2       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_itoa
;;		_lcd_write
;; This function is called by:
;;		_show_date_info
;;		_show_currency_info
;; This function uses a non-reentrant model
;;
psect	text1363
	file	"../LCD.h"
	line	173
	global	__size_of_lcd_write_number
	__size_of_lcd_write_number	equ	__end_of_lcd_write_number-_lcd_write_number
	
_lcd_write_number:	
	opt	stack 6
; Regs used in _lcd_write_number: [wreg-status,0+pclath+cstack]
	line	174
	
l5498:	
	movlb 0	; select bank0
	movf	(lcd_write_number@number+1),w
	clrf	(?_itoa+1)
	addwf	(?_itoa+1)
	movf	(lcd_write_number@number),w
	clrf	(?_itoa)
	addwf	(?_itoa)

	movlw	low(0Ah)
	movwf	0+(?_itoa)+02h
	movlw	high(0Ah)
	movwf	(0+(?_itoa)+02h)+1
	movlw	(_number_array)&0ffh
	fcall	_itoa
	line	175
	
l5500:	
	movlw	(_number_array&0ffh)
	movlb 0	; select bank0
	movwf	(?_lcd_write)
	movlw	0x1/2
	movwf	(?_lcd_write+1)
	fcall	_lcd_write
	line	176
	
l1285:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_number
	__end_of_lcd_write_number:
;; =============== function _lcd_write_number ends ============

	signat	_lcd_write_number,4216
	global	_LCD_init
psect	text1364,local,class=CODE,delta=2
global __ptext1364
__ptext1364:

;; *************** function _LCD_init *****************
;; Defined at:
;;		line 125 in file "../LCD.h"
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_shift_reg_set_pin_lcd
;;		_lcd_info
;;		_lcd_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1364
	file	"../LCD.h"
	line	125
	global	__size_of_LCD_init
	__size_of_LCD_init	equ	__end_of_LCD_init-_LCD_init
	
_LCD_init:	
	opt	stack 8
; Regs used in _LCD_init: [wreg+status,2+status,0+pclath+cstack]
	line	126
	
l5484:	
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(01h)
	fcall	_shift_reg_set_pin_lcd
	line	128
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	131
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(02h)
	fcall	_lcd_info
	line	132
	
l5486:	
	opt asmopt_off
movlw	13
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	251
movwf	((??_LCD_init+0)+0),f
u4897:
	decfsz	((??_LCD_init+0)+0),f
	goto	u4897
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u4897
	nop2
opt asmopt_on

	line	133
	
l5488:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(028h)
	fcall	_lcd_info
	line	134
	opt asmopt_off
movlw	13
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	251
movwf	((??_LCD_init+0)+0),f
u4907:
	decfsz	((??_LCD_init+0)+0),f
	goto	u4907
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u4907
	nop2
opt asmopt_on

	line	136
	
l5490:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(06h)
	fcall	_lcd_info
	line	138
	
l5492:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(0Ch)
	fcall	_lcd_info
	line	140
	
l5494:	
	fcall	_lcd_clear
	line	142
	
l5496:	
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(??_LCD_init+0)+0
	movf	(??_LCD_init+0)+0,w
	movwf	(?_lcd_info)
	movlw	(080h)
	fcall	_lcd_info
	line	143
	opt asmopt_off
movlw	13
	movlb 0	; select bank0
movwf	((??_LCD_init+0)+0+1),f
	movlw	251
movwf	((??_LCD_init+0)+0),f
u4917:
	decfsz	((??_LCD_init+0)+0),f
	goto	u4917
	decfsz	((??_LCD_init+0)+0+1),f
	goto	u4917
	nop2
opt asmopt_on

	line	145
	
l1277:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_init
	__end_of_LCD_init:
;; =============== function _LCD_init ends ============

	signat	_LCD_init,88
	global	_lcd_write
psect	text1365,local,class=CODE,delta=2
global __ptext1365
__ptext1365:

;; *************** function _lcd_write *****************
;; Defined at:
;;		line 106 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  s               2   11[BANK0 ] PTR const unsigned char 
;;		 -> STR_12(6), STR_11(6), STR_10(7), STR_9(2), 
;;		 -> STR_8(2), STR_7(10), STR_6(5), STR_5(9), 
;;		 -> STR_4(9), STR_3(5), STR_2(10), STR_1(6), 
;;		 -> number_array(5), 
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_lcd_yaz
;; This function is called by:
;;		_lcd_write_number
;;		_show_date_info
;;		_show_currency_info
;; This function uses a non-reentrant model
;;
psect	text1365
	file	"../LCD.h"
	line	106
	global	__size_of_lcd_write
	__size_of_lcd_write	equ	__end_of_lcd_write-_lcd_write
	
_lcd_write:	
	opt	stack 6
; Regs used in _lcd_write: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	107
	
l5472:	
	opt asmopt_off
movlw	249
	movlb 0	; select bank0
movwf	(??_lcd_write+0)+0,f
u4927:
	clrwdt
decfsz	(??_lcd_write+0)+0,f
	goto	u4927
	nop2	;nop
	clrwdt
opt asmopt_on

	line	108
	goto	l5480
	
l1267:	
	
l5474:	
	movlb 0	; select bank0
	movf	(lcd_write@s),w
	movwf	fsr0l
	movf	((lcd_write@s+1)),w
	movwf	fsr0h
	movf	indf0,w ;code access
	fcall	_lcd_yaz
	
l5476:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(lcd_write@s),f
	movlw	high(01h)
	addwfc	(lcd_write@s+1),f
	
l5478:	
	opt asmopt_off
movlw	249
movwf	(??_lcd_write+0)+0,f
u4937:
	clrwdt
decfsz	(??_lcd_write+0)+0,f
	goto	u4937
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l5480
	
l1266:	
	
l5480:	
	movlb 0	; select bank0
	movf	(lcd_write@s),w
	movwf	fsr0l
	movf	((lcd_write@s+1)),w
	movwf	fsr0h
	movf	indf0,w ;code access
	iorlw	0
	skipz
	goto	u4531
	goto	u4530
u4531:
	goto	l5474
u4530:
	goto	l5482
	
l1268:	
	line	109
	
l5482:	
	opt asmopt_off
movlw	4
movwf	((??_lcd_write+0)+0+1),f
	movlw	228
movwf	((??_lcd_write+0)+0),f
u4947:
	decfsz	((??_lcd_write+0)+0),f
	goto	u4947
	decfsz	((??_lcd_write+0)+0+1),f
	goto	u4947
	clrwdt
opt asmopt_on

	line	110
	
l1269:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write
	__end_of_lcd_write:
;; =============== function _lcd_write ends ============

	signat	_lcd_write,4216
	global	_lcd_yaz
psect	text1366,local,class=CODE,delta=2
global __ptext1366
__ptext1366:

;; *************** function _lcd_yaz *****************
;; Defined at:
;;		line 152 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   10[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_lcd_info
;;		_lcd_goto
;; This function is called by:
;;		_lcd_write
;;		_show_date_info
;; This function uses a non-reentrant model
;;
psect	text1366
	file	"../LCD.h"
	line	152
	global	__size_of_lcd_yaz
	__size_of_lcd_yaz	equ	__end_of_lcd_yaz-_lcd_yaz
	
_lcd_yaz:	
	opt	stack 8
; Regs used in _lcd_yaz: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(lcd_yaz@data)
	line	153
	
l5458:	
	clrf	(?_lcd_info)
	bsf	status,0
	rlf	(?_lcd_info),f
	movf	(lcd_yaz@data),w
	fcall	_lcd_info
	line	154
	
l5460:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_lcd_yaz+0)+0
	movf	(??_lcd_yaz+0)+0,w
	addwf	(__x),f
	line	155
	
l5462:	
	movf	(__x),w
	xorlw	011h&0ffh
	skipz
	goto	u4511
	goto	u4510
u4511:
	goto	l1282
u4510:
	line	157
	
l5464:	
	clrf	(__x)
	bsf	status,0
	rlf	(__x),f
	line	158
	
l5466:	
	movlw	(01h)
	movwf	(??_lcd_yaz+0)+0
	movf	(??_lcd_yaz+0)+0,w
	addwf	(__y),f
	line	159
	movf	(__y),w
	xorlw	03h&0ffh
	skipz
	goto	u4521
	goto	u4520
u4521:
	goto	l5470
u4520:
	line	161
	
l5468:	
	clrf	(__y)
	bsf	status,0
	rlf	(__y),f
	goto	l5470
	line	162
	
l1281:	
	line	164
	
l5470:	
	movf	(__x),w
	movwf	(??_lcd_yaz+0)+0
	movf	(??_lcd_yaz+0)+0,w
	movwf	(?_lcd_goto)
	movf	(__y),w
	fcall	_lcd_goto
	goto	l1282
	line	167
	
l1280:	
	line	169
	
l1282:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_yaz
	__end_of_lcd_yaz:
;; =============== function _lcd_yaz ends ============

	signat	_lcd_yaz,4216
	global	_lcd_clear
psect	text1367,local,class=CODE,delta=2
global __ptext1367
__ptext1367:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 97 in file "../LCD.h"
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_lcd_info
;;		_lcd_goto
;; This function is called by:
;;		_LCD_init
;;		_show_date_info
;;		_show_currency_information
;; This function uses a non-reentrant model
;;
psect	text1367
	file	"../LCD.h"
	line	97
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 8
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	99
	
l5450:	
	movlb 0	; select bank0
	clrf	(__y)
	bsf	status,0
	rlf	(__y),f
	clrf	(__x)
	bsf	status,0
	rlf	(__x),f
	line	100
	
l5452:	
	movlw	(02h)
	movwf	(??_lcd_clear+0)+0
	movf	(??_lcd_clear+0)+0,w
	movwf	(?_lcd_info)
	movlw	(01h)
	fcall	_lcd_info
	line	101
	
l5454:	
	opt asmopt_off
movlw	3
	movlb 0	; select bank0
movwf	((??_lcd_clear+0)+0+1),f
	movlw	151
movwf	((??_lcd_clear+0)+0),f
u4957:
	decfsz	((??_lcd_clear+0)+0),f
	goto	u4957
	decfsz	((??_lcd_clear+0)+0+1),f
	goto	u4957
	nop2
opt asmopt_on

	line	102
	
l5456:	
	movlb 0	; select bank0
	movf	(__x),w
	movwf	(??_lcd_clear+0)+0
	movf	(??_lcd_clear+0)+0,w
	movwf	(?_lcd_goto)
	movf	(__y),w
	fcall	_lcd_goto
	line	103
	
l1263:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_goto
psect	text1368,local,class=CODE,delta=2
global __ptext1368
__ptext1368:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 112 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  p_1             1    wreg     unsigned char 
;;  p_2             1    6[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  p_1             1    8[BANK0 ] unsigned char 
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
;;      Temps:          0       1       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_info
;; This function is called by:
;;		_lcd_clear
;;		_lcd_yaz
;;		_show_date_info
;; This function uses a non-reentrant model
;;
psect	text1368
	file	"../LCD.h"
	line	112
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 8
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(lcd_goto@p_1)
	line	113
	
l5442:	
	movf	(lcd_goto@p_1),w
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(__y)
	line	114
	movf	(lcd_goto@p_2),w
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(__x)
	line	115
	movf	(lcd_goto@p_1),w
	xorlw	01h&0ffh
	skipz
	goto	u4501
	goto	u4500
u4501:
	goto	l5446
u4500:
	line	116
	
l5444:	
	movlw	(02h)
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(?_lcd_info)
	movf	(lcd_goto@p_2),w
	addlw	0FFh
	andlw	0Fh
	addlw	080h
	fcall	_lcd_info
	line	117
	goto	l5448
	
l1272:	
	line	118
	
l5446:	
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
	goto	l5448
	line	119
	
l1273:	
	line	120
	
l5448:	
	opt asmopt_off
movlw	249
	movlb 0	; select bank0
movwf	(??_lcd_goto+0)+0,f
u4967:
	clrwdt
decfsz	(??_lcd_goto+0)+0,f
	goto	u4967
	nop2	;nop
	clrwdt
opt asmopt_on

	line	121
	
l1274:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,8312
	global	_SetHavaDurumuPin
psect	text1369,local,class=CODE,delta=2
global __ptext1369
__ptext1369:

;; *************** function _SetHavaDurumuPin *****************
;; Defined at:
;;		line 8 in file "../HAVADURUMU.h"
;; Parameters:    Size  Location     Type
;;  pin_number      1    wreg     unsigned char 
;;  pin_value       1    7[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  pin_number      1   10[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_TempLoadDigit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1369
	file	"../HAVADURUMU.h"
	line	8
	global	__size_of_SetHavaDurumuPin
	__size_of_SetHavaDurumuPin	equ	__end_of_SetHavaDurumuPin-_SetHavaDurumuPin
	
_SetHavaDurumuPin:	
	opt	stack 10
; Regs used in _SetHavaDurumuPin: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(SetHavaDurumuPin@pin_number)
	line	9
	
l5410:	
	movlw	(08h)
	subwf	(SetHavaDurumuPin@pin_number),w
	skipnc
	goto	u4371
	goto	u4370
u4371:
	goto	l5420
u4370:
	line	11
	
l5412:	
	movf	(SetHavaDurumuPin@pin_value),w
	skipz
	goto	u4380
	goto	l5416
u4380:
	line	13
	
l5414:	
	movlw	(01h)
	movwf	(??_SetHavaDurumuPin+0)+0
	incf	(SetHavaDurumuPin@pin_number),w
	goto	u4394
u4395:
	lslf	(??_SetHavaDurumuPin+0)+0,f
u4394:
	decfsz	wreg,f
	goto	u4395
	movf	0+(??_SetHavaDurumuPin+0)+0,w
	movwf	(??_SetHavaDurumuPin+1)+0
	movf	(??_SetHavaDurumuPin+1)+0,w
	movwf	(_havaRegister1)
	line	14
	goto	l5418
	line	15
	
l1240:	
	
l5416:	
	movlw	(01h)
	movwf	(??_SetHavaDurumuPin+0)+0
	incf	(SetHavaDurumuPin@pin_number),w
	goto	u4404
u4405:
	lslf	(??_SetHavaDurumuPin+0)+0,f
u4404:
	decfsz	wreg,f
	goto	u4405
	movf	0+(??_SetHavaDurumuPin+0)+0,w
	xorlw	0ffh
	movwf	(??_SetHavaDurumuPin+1)+0
	movf	(??_SetHavaDurumuPin+1)+0,w
	andwf	(_havaRegister1),f
	goto	l5418
	
l1241:	
	line	16
	
l5418:	
	movf	(_havaRegister1),w
	movwf	(??_SetHavaDurumuPin+0)+0
	movf	(??_SetHavaDurumuPin+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(08h)
	fcall	_TempLoadDigit
	line	17
	goto	l1250
	line	18
	
l1239:	
	
l5420:	
	movlw	(08h)
	movlb 0	; select bank0
	subwf	(SetHavaDurumuPin@pin_number),w
	skipc
	goto	u4411
	goto	u4410
u4411:
	goto	l5432
u4410:
	
l5422:	
	movlw	(010h)
	subwf	(SetHavaDurumuPin@pin_number),w
	skipnc
	goto	u4421
	goto	u4420
u4421:
	goto	l5432
u4420:
	line	20
	
l5424:	
	movf	(SetHavaDurumuPin@pin_value),w
	skipz
	goto	u4430
	goto	l5428
u4430:
	line	22
	
l5426:	
	movlw	(01h)
	movwf	(??_SetHavaDurumuPin+0)+0
	movf	(SetHavaDurumuPin@pin_number),w
	addlw	-8
	incf	wreg,f
	goto	u4444
u4445:
	lslf	(??_SetHavaDurumuPin+0)+0,f
u4444:
	decfsz	wreg,f
	goto	u4445
	movf	0+(??_SetHavaDurumuPin+0)+0,w
	movwf	(??_SetHavaDurumuPin+1)+0
	movf	(??_SetHavaDurumuPin+1)+0,w
	movwf	(_havaRegister2)
	line	24
	goto	l5430
	line	25
	
l1244:	
	line	26
	
l5428:	
	movlw	(01h)
	movwf	(??_SetHavaDurumuPin+0)+0
	movf	(SetHavaDurumuPin@pin_number),w
	addlw	-8
	incf	wreg,f
	goto	u4454
u4455:
	lslf	(??_SetHavaDurumuPin+0)+0,f
u4454:
	decfsz	wreg,f
	goto	u4455
	movf	0+(??_SetHavaDurumuPin+0)+0,w
	xorlw	0ffh
	movwf	(??_SetHavaDurumuPin+1)+0
	movf	(??_SetHavaDurumuPin+1)+0,w
	andwf	(_havaRegister2),f
	goto	l5430
	
l1245:	
	line	28
	
l5430:	
	movf	(_havaRegister2),w
	movwf	(??_SetHavaDurumuPin+0)+0
	movf	(??_SetHavaDurumuPin+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(09h)
	fcall	_TempLoadDigit
	line	30
	goto	l1250
	line	31
	
l1243:	
	
l5432:	
	movlw	(010h)
	movlb 0	; select bank0
	subwf	(SetHavaDurumuPin@pin_number),w
	skipc
	goto	u4461
	goto	u4460
u4461:
	goto	l1250
u4460:
	line	33
	
l5434:	
	movf	(SetHavaDurumuPin@pin_value),w
	skipz
	goto	u4470
	goto	l5438
u4470:
	line	34
	
l5436:	
	movlw	(01h)
	movwf	(??_SetHavaDurumuPin+0)+0
	movf	(SetHavaDurumuPin@pin_number),w
	addlw	-16
	incf	wreg,f
	goto	u4484
u4485:
	lslf	(??_SetHavaDurumuPin+0)+0,f
u4484:
	decfsz	wreg,f
	goto	u4485
	movf	0+(??_SetHavaDurumuPin+0)+0,w
	movwf	(??_SetHavaDurumuPin+1)+0
	movf	(??_SetHavaDurumuPin+1)+0,w
	movwf	(_havaRegister3)
	goto	l5440
	line	35
	
l1248:	
	
l5438:	
	movlw	(01h)
	movwf	(??_SetHavaDurumuPin+0)+0
	movf	(SetHavaDurumuPin@pin_number),w
	addlw	-16
	incf	wreg,f
	goto	u4494
u4495:
	lslf	(??_SetHavaDurumuPin+0)+0,f
u4494:
	decfsz	wreg,f
	goto	u4495
	movf	0+(??_SetHavaDurumuPin+0)+0,w
	xorlw	0ffh
	movwf	(??_SetHavaDurumuPin+1)+0
	movf	(??_SetHavaDurumuPin+1)+0,w
	andwf	(_havaRegister3),f
	goto	l5440
	
l1249:	
	line	37
	
l5440:	
	movf	(_havaRegister3),w
	movwf	(??_SetHavaDurumuPin+0)+0
	movf	(??_SetHavaDurumuPin+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(0Ah)
	fcall	_TempLoadDigit
	goto	l1250
	line	39
	
l1247:	
	goto	l1250
	line	42
	
l1246:	
	goto	l1250
	
l1242:	
	
l1250:	
	return
	opt stack 0
GLOBAL	__end_of_SetHavaDurumuPin
	__end_of_SetHavaDurumuPin:
;; =============== function _SetHavaDurumuPin ends ============

	signat	_SetHavaDurumuPin,8312
	global	_DisplayYil
psect	text1370,local,class=CODE,delta=2
global __ptext1370
__ptext1370:

;; *************** function _DisplayYil *****************
;; Defined at:
;;		line 66 in file "../TARIH.h"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   10[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___awdiv
;;		___awmod
;;		_TarihSetDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1370
	file	"../TARIH.h"
	line	66
	global	__size_of_DisplayYil
	__size_of_DisplayYil	equ	__end_of_DisplayYil-_DisplayYil
	
_DisplayYil:	
	opt	stack 10
; Regs used in _DisplayYil: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(DisplayYil@number)
	line	67
	
l5404:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DisplayYil@number),w
	movwf	(??_DisplayYil+0)+0
	clrf	(??_DisplayYil+0)+0+1
	movf	0+(??_DisplayYil+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DisplayYil+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_DisplayYil+2)+0
	movf	(??_DisplayYil+2)+0,w
	movwf	(_yilDisplay1)
	line	68
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(DisplayYil@number),w
	movwf	(??_DisplayYil+0)+0
	clrf	(??_DisplayYil+0)+0+1
	movf	0+(??_DisplayYil+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_DisplayYil+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_DisplayYil+2)+0
	movf	(??_DisplayYil+2)+0,w
	movwf	(_yilDisplay2)
	line	69
	
l5406:	
	movf	(_yilDisplay1),w
	movwf	(??_DisplayYil+0)+0
	movf	(??_DisplayYil+0)+0,w
	movwf	(?_TarihSetDisplay)
	movlw	(06h)
	fcall	_TarihSetDisplay
	line	70
	
l5408:	
	movlb 0	; select bank0
	movf	(_yilDisplay2),w
	movwf	(??_DisplayYil+0)+0
	movf	(??_DisplayYil+0)+0,w
	movwf	(?_TarihSetDisplay)
	movlw	(07h)
	fcall	_TarihSetDisplay
	line	72
	
l1236:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayYil
	__end_of_DisplayYil:
;; =============== function _DisplayYil ends ============

	signat	_DisplayYil,4216
	global	_DisplayAy
psect	text1371,local,class=CODE,delta=2
global __ptext1371
__ptext1371:

;; *************** function _DisplayAy *****************
;; Defined at:
;;		line 57 in file "../TARIH.h"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   10[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___awdiv
;;		___awmod
;;		_TarihSetDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1371
	file	"../TARIH.h"
	line	57
	global	__size_of_DisplayAy
	__size_of_DisplayAy	equ	__end_of_DisplayAy-_DisplayAy
	
_DisplayAy:	
	opt	stack 10
; Regs used in _DisplayAy: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(DisplayAy@number)
	line	58
	
l5398:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DisplayAy@number),w
	movwf	(??_DisplayAy+0)+0
	clrf	(??_DisplayAy+0)+0+1
	movf	0+(??_DisplayAy+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DisplayAy+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_DisplayAy+2)+0
	movf	(??_DisplayAy+2)+0,w
	movwf	(_ayDisplay1)
	line	59
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(DisplayAy@number),w
	movwf	(??_DisplayAy+0)+0
	clrf	(??_DisplayAy+0)+0+1
	movf	0+(??_DisplayAy+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_DisplayAy+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_DisplayAy+2)+0
	movf	(??_DisplayAy+2)+0,w
	movwf	(_ayDisplay2)
	line	60
	
l5400:	
	movf	(_ayDisplay1),w
	movwf	(??_DisplayAy+0)+0
	movf	(??_DisplayAy+0)+0,w
	movwf	(?_TarihSetDisplay)
	movlw	(04h)
	fcall	_TarihSetDisplay
	line	61
	
l5402:	
	movlb 0	; select bank0
	movf	(_ayDisplay2),w
	movwf	(??_DisplayAy+0)+0
	movf	(??_DisplayAy+0)+0,w
	movwf	(?_TarihSetDisplay)
	movlw	(05h)
	fcall	_TarihSetDisplay
	line	63
	
l1233:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayAy
	__end_of_DisplayAy:
;; =============== function _DisplayAy ends ============

	signat	_DisplayAy,4216
	global	_DisplayGun
psect	text1372,local,class=CODE,delta=2
global __ptext1372
__ptext1372:

;; *************** function _DisplayGun *****************
;; Defined at:
;;		line 48 in file "../TARIH.h"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   10[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___awdiv
;;		___awmod
;;		_TarihSetDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1372
	file	"../TARIH.h"
	line	48
	global	__size_of_DisplayGun
	__size_of_DisplayGun	equ	__end_of_DisplayGun-_DisplayGun
	
_DisplayGun:	
	opt	stack 10
; Regs used in _DisplayGun: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(DisplayGun@number)
	line	49
	
l5392:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DisplayGun@number),w
	movwf	(??_DisplayGun+0)+0
	clrf	(??_DisplayGun+0)+0+1
	movf	0+(??_DisplayGun+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DisplayGun+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_DisplayGun+2)+0
	movf	(??_DisplayGun+2)+0,w
	movwf	(_gunDisplay1)
	line	50
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(DisplayGun@number),w
	movwf	(??_DisplayGun+0)+0
	clrf	(??_DisplayGun+0)+0+1
	movf	0+(??_DisplayGun+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_DisplayGun+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_DisplayGun+2)+0
	movf	(??_DisplayGun+2)+0,w
	movwf	(_gunDisplay2)
	line	51
	
l5394:	
	movf	(_gunDisplay1),w
	movwf	(??_DisplayGun+0)+0
	movf	(??_DisplayGun+0)+0,w
	movwf	(?_TarihSetDisplay)
	movlw	(02h)
	fcall	_TarihSetDisplay
	line	52
	
l5396:	
	movlb 0	; select bank0
	movf	(_gunDisplay2),w
	movwf	(??_DisplayGun+0)+0
	movf	(??_DisplayGun+0)+0,w
	movwf	(?_TarihSetDisplay)
	movlw	(03h)
	fcall	_TarihSetDisplay
	line	54
	
l1230:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayGun
	__end_of_DisplayGun:
;; =============== function _DisplayGun ends ============

	signat	_DisplayGun,4216
	global	_LoadGosterilenGunInfo
psect	text1373,local,class=CODE,delta=2
global __ptext1373
__ptext1373:

;; *************** function _LoadGosterilenGunInfo *****************
;; Defined at:
;;		line 29 in file "../GUN.h"
;; Parameters:    Size  Location     Type
;;  g               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  g               1    9[BANK0 ] unsigned char 
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
;;      Temps:          0       2       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_TempLoadDigit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1373
	file	"../GUN.h"
	line	29
	global	__size_of_LoadGosterilenGunInfo
	__size_of_LoadGosterilenGunInfo	equ	__end_of_LoadGosterilenGunInfo-_LoadGosterilenGunInfo
	
_LoadGosterilenGunInfo:	
	opt	stack 10
; Regs used in _LoadGosterilenGunInfo: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(LoadGosterilenGunInfo@g)
	line	30
	
l5388:	
	movlw	(01h)
	movwf	(??_LoadGosterilenGunInfo+0)+0
	incf	(LoadGosterilenGunInfo@g),w
	goto	u4364
u4365:
	lslf	(??_LoadGosterilenGunInfo+0)+0,f
u4364:
	decfsz	wreg,f
	goto	u4365
	movf	0+(??_LoadGosterilenGunInfo+0)+0,w
	movwf	(??_LoadGosterilenGunInfo+1)+0
	movf	(??_LoadGosterilenGunInfo+1)+0,w
	movwf	(_gosterilenGun)
	line	31
	
l5390:	
	movf	(_gosterilenGun),w
	movwf	(??_LoadGosterilenGunInfo+0)+0
	movf	(??_LoadGosterilenGunInfo+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(02h)
	fcall	_TempLoadDigit
	line	34
	
l1217:	
	return
	opt stack 0
GLOBAL	__end_of_LoadGosterilenGunInfo
	__end_of_LoadGosterilenGunInfo:
;; =============== function _LoadGosterilenGunInfo ends ============

	signat	_LoadGosterilenGunInfo,4216
	global	_LoadGunInfo
psect	text1374,local,class=CODE,delta=2
global __ptext1374
__ptext1374:

;; *************** function _LoadGunInfo *****************
;; Defined at:
;;		line 22 in file "../GUN.h"
;; Parameters:    Size  Location     Type
;;  gun             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  gun             1    9[BANK0 ] unsigned char 
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
;;      Temps:          0       2       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_TempLoadDigit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1374
	file	"../GUN.h"
	line	22
	global	__size_of_LoadGunInfo
	__size_of_LoadGunInfo	equ	__end_of_LoadGunInfo-_LoadGunInfo
	
_LoadGunInfo:	
	opt	stack 10
; Regs used in _LoadGunInfo: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(LoadGunInfo@gun)
	line	23
	
l5384:	
	movlw	(01h)
	movwf	(??_LoadGunInfo+0)+0
	incf	(LoadGunInfo@gun),w
	goto	u4354
u4355:
	lslf	(??_LoadGunInfo+0)+0,f
u4354:
	decfsz	wreg,f
	goto	u4355
	movf	0+(??_LoadGunInfo+0)+0,w
	movwf	(??_LoadGunInfo+1)+0
	movf	(??_LoadGunInfo+1)+0,w
	movwf	(_gunData)
	line	24
	
l5386:	
	movf	(_gunData),w
	movwf	(??_LoadGunInfo+0)+0
	movf	(??_LoadGunInfo+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(03h)
	fcall	_TempLoadDigit
	line	26
	
l1214:	
	return
	opt stack 0
GLOBAL	__end_of_LoadGunInfo
	__end_of_LoadGunInfo:
;; =============== function _LoadGunInfo ends ============

	signat	_LoadGunInfo,4216
	global	_EnYuksekDisplay
psect	text1375,local,class=CODE,delta=2
global __ptext1375
__ptext1375:

;; *************** function _EnYuksekDisplay *****************
;; Defined at:
;;		line 39 in file "../SicaklikSegment.h"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   10[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___awdiv
;;		___awmod
;;		_TempLoadDigit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1375
	file	"../SicaklikSegment.h"
	line	39
	global	__size_of_EnYuksekDisplay
	__size_of_EnYuksekDisplay	equ	__end_of_EnYuksekDisplay-_EnYuksekDisplay
	
_EnYuksekDisplay:	
	opt	stack 10
; Regs used in _EnYuksekDisplay: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(EnYuksekDisplay@number)
	line	40
	
l5378:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(EnYuksekDisplay@number),w
	movwf	(??_EnYuksekDisplay+0)+0
	clrf	(??_EnYuksekDisplay+0)+0+1
	movf	0+(??_EnYuksekDisplay+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_EnYuksekDisplay+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_EnYuksekDisplay+2)+0
	movf	(??_EnYuksekDisplay+2)+0,w
	movwf	(_enyuksek1)
	line	41
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(EnYuksekDisplay@number),w
	movwf	(??_EnYuksekDisplay+0)+0
	clrf	(??_EnYuksekDisplay+0)+0+1
	movf	0+(??_EnYuksekDisplay+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_EnYuksekDisplay+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_EnYuksekDisplay+2)+0
	movf	(??_EnYuksekDisplay+2)+0,w
	movwf	(_enyuksek2)
	line	44
	
l5380:	
	movf	(_enyuksek1),w
	movwf	(??_EnYuksekDisplay+0)+0
	movf	(??_EnYuksekDisplay+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(06h)
	fcall	_TempLoadDigit
	line	45
	
l5382:	
	movlb 0	; select bank0
	movf	(_enyuksek2),w
	movwf	(??_EnYuksekDisplay+0)+0
	movf	(??_EnYuksekDisplay+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(07h)
	fcall	_TempLoadDigit
	line	46
	
l1211:	
	return
	opt stack 0
GLOBAL	__end_of_EnYuksekDisplay
	__end_of_EnYuksekDisplay:
;; =============== function _EnYuksekDisplay ends ============

	signat	_EnYuksekDisplay,4216
	global	_EnDusukDisplay
psect	text1376,local,class=CODE,delta=2
global __ptext1376
__ptext1376:

;; *************** function _EnDusukDisplay *****************
;; Defined at:
;;		line 30 in file "../SicaklikSegment.h"
;; Parameters:    Size  Location     Type
;;  number          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  number          1   10[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___awdiv
;;		___awmod
;;		_TempLoadDigit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1376
	file	"../SicaklikSegment.h"
	line	30
	global	__size_of_EnDusukDisplay
	__size_of_EnDusukDisplay	equ	__end_of_EnDusukDisplay-_EnDusukDisplay
	
_EnDusukDisplay:	
	opt	stack 10
; Regs used in _EnDusukDisplay: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(EnDusukDisplay@number)
	line	31
	
l5372:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(EnDusukDisplay@number),w
	movwf	(??_EnDusukDisplay+0)+0
	clrf	(??_EnDusukDisplay+0)+0+1
	movf	0+(??_EnDusukDisplay+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_EnDusukDisplay+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_EnDusukDisplay+2)+0
	movf	(??_EnDusukDisplay+2)+0,w
	movwf	(_endusuk1)
	line	32
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(EnDusukDisplay@number),w
	movwf	(??_EnDusukDisplay+0)+0
	clrf	(??_EnDusukDisplay+0)+0+1
	movf	0+(??_EnDusukDisplay+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_EnDusukDisplay+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	_rakamlar&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 0	; select bank0
	movwf	(??_EnDusukDisplay+2)+0
	movf	(??_EnDusukDisplay+2)+0,w
	movwf	(_endusuk2)
	line	35
	
l5374:	
	movf	(_endusuk1),w
	movwf	(??_EnDusukDisplay+0)+0
	movf	(??_EnDusukDisplay+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(04h)
	fcall	_TempLoadDigit
	line	36
	
l5376:	
	movlb 0	; select bank0
	movf	(_endusuk2),w
	movwf	(??_EnDusukDisplay+0)+0
	movf	(??_EnDusukDisplay+0)+0,w
	movwf	(?_TempLoadDigit)
	movlw	(05h)
	fcall	_TempLoadDigit
	line	37
	
l1208:	
	return
	opt stack 0
GLOBAL	__end_of_EnDusukDisplay
	__end_of_EnDusukDisplay:
;; =============== function _EnDusukDisplay ends ============

	signat	_EnDusukDisplay,4216
	global	_lcd_info
psect	text1377,local,class=CODE,delta=2
global __ptext1377
__ptext1377:

;; *************** function _lcd_info *****************
;; Defined at:
;;		line 56 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;;  data_type       1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    5[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_shift_reg_set_pin_lcd
;; This function is called by:
;;		_lcd_clear
;;		_lcd_goto
;;		_LCD_init
;;		_lcd_yaz
;; This function uses a non-reentrant model
;;
psect	text1377
	file	"../LCD.h"
	line	56
	global	__size_of_lcd_info
	__size_of_lcd_info	equ	__end_of_lcd_info-_lcd_info
	
_lcd_info:	
	opt	stack 8
; Regs used in _lcd_info: [wreg+status,2+status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(lcd_info@c)
	line	57
	
l5332:	
	movf	(lcd_info@data_type),w
	xorlw	02h&0ffh
	skipz
	goto	u4251
	goto	u4250
u4251:
	goto	l5336
u4250:
	line	58
	
l5334:	
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(01h)
	fcall	_shift_reg_set_pin_lcd
	goto	l1259
	line	59
	
l1258:	
	
l5336:	
	clrf	(?_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?_shift_reg_set_pin_lcd),f
	movlw	(01h)
	fcall	_shift_reg_set_pin_lcd
	
l1259:	
	line	61
	clrf	(?_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?_shift_reg_set_pin_lcd),f
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	65
	
l5338:	
	movlb 0	; select bank0
	movf	(lcd_info@c),w
	andlw	0F0h
	movwf	(??_lcd_info+0)+0
	movf	(??_lcd_info+0)+0,w
	movwf	(__temp_)
	line	66
	
l5340:	
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	07h
u4265:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u4265
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(06h)
	fcall	_shift_reg_set_pin_lcd
	line	67
	
l5342:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	06h
u4275:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u4275
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(05h)
	fcall	_shift_reg_set_pin_lcd
	line	68
	
l5344:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	05h
u4285:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u4285
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(04h)
	fcall	_shift_reg_set_pin_lcd
	line	69
	
l5346:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	04h
u4295:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u4295
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(03h)
	fcall	_shift_reg_set_pin_lcd
	line	72
	
l5348:	
	opt asmopt_off
movlw	6
	movlb 0	; select bank0
movwf	((??_lcd_info+0)+0+1),f
	movlw	48
movwf	((??_lcd_info+0)+0),f
u4977:
	decfsz	((??_lcd_info+0)+0),f
	goto	u4977
	decfsz	((??_lcd_info+0)+0+1),f
	goto	u4977
	clrwdt
opt asmopt_on

	line	73
	
l5350:	
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	76
	
l5352:	
	opt asmopt_off
movlw	6
	movlb 0	; select bank0
movwf	((??_lcd_info+0)+0+1),f
	movlw	48
movwf	((??_lcd_info+0)+0),f
u4987:
	decfsz	((??_lcd_info+0)+0),f
	goto	u4987
	decfsz	((??_lcd_info+0)+0+1),f
	goto	u4987
	clrwdt
opt asmopt_on

	line	77
	
l5354:	
	clrf	(?_shift_reg_set_pin_lcd)
	bsf	status,0
	rlf	(?_shift_reg_set_pin_lcd),f
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	79
	
l5356:	
	movlb 0	; select bank0
	movf	(lcd_info@c),w
	andlw	0Fh
	movwf	(??_lcd_info+0)+0
	movlw	(04h)-1
u4305:
	lslf	(??_lcd_info+0)+0,f
	addlw	-1
	skipz
	goto	u4305
	lslf	(??_lcd_info+0)+0,w
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(__temp_)
	line	81
	
l5358:	
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	07h
u4315:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u4315
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(06h)
	fcall	_shift_reg_set_pin_lcd
	line	82
	
l5360:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	06h
u4325:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u4325
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(05h)
	fcall	_shift_reg_set_pin_lcd
	line	83
	
l5362:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	05h
u4335:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u4335
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(04h)
	fcall	_shift_reg_set_pin_lcd
	line	84
	
l5364:	
	movlb 0	; select bank0
	movf	(__temp_),w
	movwf	(??_lcd_info+0)+0
	movlw	04h
u4345:
	lsrf	(??_lcd_info+0)+0,f
	decfsz	wreg,f
	goto	u4345
	movf	0+(??_lcd_info+0)+0,w
	andlw	01h
	movwf	(??_lcd_info+1)+0
	movf	(??_lcd_info+1)+0,w
	movwf	(?_shift_reg_set_pin_lcd)
	movlw	(03h)
	fcall	_shift_reg_set_pin_lcd
	line	89
	
l5366:	
	opt asmopt_off
movlw	6
	movlb 0	; select bank0
movwf	((??_lcd_info+0)+0+1),f
	movlw	48
movwf	((??_lcd_info+0)+0),f
u4997:
	decfsz	((??_lcd_info+0)+0),f
	goto	u4997
	decfsz	((??_lcd_info+0)+0+1),f
	goto	u4997
	clrwdt
opt asmopt_on

	line	90
	
l5368:	
	clrf	(?_shift_reg_set_pin_lcd)
	movlw	(02h)
	fcall	_shift_reg_set_pin_lcd
	line	93
	
l5370:	
	opt asmopt_off
movlw	13
	movlb 0	; select bank0
movwf	((??_lcd_info+0)+0+1),f
	movlw	251
movwf	((??_lcd_info+0)+0),f
u5007:
	decfsz	((??_lcd_info+0)+0),f
	goto	u5007
	decfsz	((??_lcd_info+0)+0+1),f
	goto	u5007
	nop2
opt asmopt_on

	line	94
	
l1260:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_info
	__end_of_lcd_info:
;; =============== function _lcd_info ends ============

	signat	_lcd_info,8312
	global	_TarihSetDisplay
psect	text1378,local,class=CODE,delta=2
global __ptext1378
__ptext1378:

;; *************** function _TarihSetDisplay *****************
;; Defined at:
;;		line 28 in file "../TARIH.h"
;; Parameters:    Size  Location     Type
;;  display_numb    1    wreg     unsigned char 
;;  value           1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  display_numb    1    5[BANK0 ] unsigned char 
;;  index           1    6[BANK0 ] char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_TarihRegisterSetPin
;; This function is called by:
;;		_DisplayGun
;;		_DisplayAy
;;		_DisplayYil
;; This function uses a non-reentrant model
;;
psect	text1378
	file	"../TARIH.h"
	line	28
	global	__size_of_TarihSetDisplay
	__size_of_TarihSetDisplay	equ	__end_of_TarihSetDisplay-_TarihSetDisplay
	
_TarihSetDisplay:	
	opt	stack 10
; Regs used in _TarihSetDisplay: [wreg+status,2+status,0+pclath+cstack]
	line	30
	movlb 0	; select bank0
	movwf	(TarihSetDisplay@display_number)
	
l5306:	
	movlw	(07h)
	movwf	(??_TarihSetDisplay+0)+0
	movf	(??_TarihSetDisplay+0)+0,w
	movwf	(TarihSetDisplay@index)
	
l5308:	
	btfss	(TarihSetDisplay@index),7
	goto	u4221
	goto	u4220
u4221:
	goto	l5312
u4220:
	goto	l5326
	
l5310:	
	goto	l5326
	line	31
	
l1225:	
	line	32
	
l5312:	
	movf	(TarihSetDisplay@value),w
	movwf	(??_TarihSetDisplay+0)+0
	incf	(TarihSetDisplay@index),w
	goto	u4234
u4235:
	lsrf	(??_TarihSetDisplay+0)+0,f
u4234:
	decfsz	wreg,f
	goto	u4235
	movf	0+(??_TarihSetDisplay+0)+0,w
	andlw	01h
	movwf	(??_TarihSetDisplay+1)+0
	movf	(??_TarihSetDisplay+1)+0,w
	movwf	(?_TarihRegisterSetPin)
	movlw	(01h)
	fcall	_TarihRegisterSetPin
	line	33
	
l5314:	
	opt asmopt_off
movlw	16
	movlb 0	; select bank0
movwf	(??_TarihSetDisplay+0)+0,f
u5017:
decfsz	(??_TarihSetDisplay+0)+0,f
	goto	u5017
	clrwdt
opt asmopt_on

	line	34
	
l5316:	
	clrf	(?_TarihRegisterSetPin)
	bsf	status,0
	rlf	(?_TarihRegisterSetPin),f
	movlw	(0)
	fcall	_TarihRegisterSetPin
	line	35
	opt asmopt_off
movlw	9
	movlb 0	; select bank0
movwf	(??_TarihSetDisplay+0)+0,f
u5027:
decfsz	(??_TarihSetDisplay+0)+0,f
	goto	u5027
	nop2	;nop
opt asmopt_on

	line	36
	
l5318:	
	clrf	(?_TarihRegisterSetPin)
	movlw	(0)
	fcall	_TarihRegisterSetPin
	line	37
	
l5320:	
	opt asmopt_off
movlw	6
	movlb 0	; select bank0
movwf	(??_TarihSetDisplay+0)+0,f
u5037:
decfsz	(??_TarihSetDisplay+0)+0,f
	goto	u5037
	clrwdt
opt asmopt_on

	line	30
	
l5322:	
	movlw	(-1)
	movlb 0	; select bank0
	movwf	(??_TarihSetDisplay+0)+0
	movf	(??_TarihSetDisplay+0)+0,w
	addwf	(TarihSetDisplay@index),f
	
l5324:	
	btfss	(TarihSetDisplay@index),7
	goto	u4241
	goto	u4240
u4241:
	goto	l5312
u4240:
	goto	l5326
	
l1226:	
	line	39
	
l5326:	
	clrf	(?_TarihRegisterSetPin)
	bsf	status,0
	rlf	(?_TarihRegisterSetPin),f
	movf	(TarihSetDisplay@display_number),w
	fcall	_TarihRegisterSetPin
	line	40
	
l5328:	
	opt asmopt_off
movlw	33
	movlb 0	; select bank0
movwf	(??_TarihSetDisplay+0)+0,f
u5047:
decfsz	(??_TarihSetDisplay+0)+0,f
	goto	u5047
opt asmopt_on

	line	41
	
l5330:	
	clrf	(?_TarihRegisterSetPin)
	movlb 0	; select bank0
	movf	(TarihSetDisplay@display_number),w
	fcall	_TarihRegisterSetPin
	line	42
	opt asmopt_off
movlw	49
	movlb 0	; select bank0
movwf	(??_TarihSetDisplay+0)+0,f
u5057:
decfsz	(??_TarihSetDisplay+0)+0,f
	goto	u5057
	nop2	;nop
opt asmopt_on

	line	45
	
l1227:	
	return
	opt stack 0
GLOBAL	__end_of_TarihSetDisplay
	__end_of_TarihSetDisplay:
;; =============== function _TarihSetDisplay ends ============

	signat	_TarihSetDisplay,8312
	global	_TempLoadDigit
psect	text1379,local,class=CODE,delta=2
global __ptext1379
__ptext1379:

;; *************** function _TempLoadDigit *****************
;; Defined at:
;;		line 11 in file "../SicaklikSegment.h"
;; Parameters:    Size  Location     Type
;;  digit_number    1    wreg     unsigned char 
;;  value           1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  digit_number    1    5[BANK0 ] unsigned char 
;;  index           1    6[BANK0 ] char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_CenterSetPin
;; This function is called by:
;;		_EnDusukDisplay
;;		_EnYuksekDisplay
;;		_LoadGunInfo
;;		_LoadGosterilenGunInfo
;;		_SetHavaDurumuPin
;; This function uses a non-reentrant model
;;
psect	text1379
	file	"../SicaklikSegment.h"
	line	11
	global	__size_of_TempLoadDigit
	__size_of_TempLoadDigit	equ	__end_of_TempLoadDigit-_TempLoadDigit
	
_TempLoadDigit:	
	opt	stack 10
; Regs used in _TempLoadDigit: [wreg+status,2+status,0+pclath+cstack]
	line	13
	movlb 0	; select bank0
	movwf	(TempLoadDigit@digit_number)
	
l5282:	
	movlw	(07h)
	movwf	(??_TempLoadDigit+0)+0
	movf	(??_TempLoadDigit+0)+0,w
	movwf	(TempLoadDigit@index)
	
l5284:	
	btfss	(TempLoadDigit@index),7
	goto	u4191
	goto	u4190
u4191:
	goto	l5288
u4190:
	goto	l5300
	
l5286:	
	goto	l5300
	line	14
	
l1203:	
	line	15
	
l5288:	
	movf	(TempLoadDigit@value),w
	movwf	(??_TempLoadDigit+0)+0
	incf	(TempLoadDigit@index),w
	goto	u4204
u4205:
	lsrf	(??_TempLoadDigit+0)+0,f
u4204:
	decfsz	wreg,f
	goto	u4205
	movf	0+(??_TempLoadDigit+0)+0,w
	andlw	01h
	movwf	(??_TempLoadDigit+1)+0
	movf	(??_TempLoadDigit+1)+0,w
	movwf	(?_CenterSetPin)
	movlw	(01h)
	fcall	_CenterSetPin
	line	16
	
l5290:	
	opt asmopt_off
movlw	16
	movlb 0	; select bank0
movwf	(??_TempLoadDigit+0)+0,f
u5067:
decfsz	(??_TempLoadDigit+0)+0,f
	goto	u5067
	clrwdt
opt asmopt_on

	line	17
	
l5292:	
	clrf	(?_CenterSetPin)
	bsf	status,0
	rlf	(?_CenterSetPin),f
	movlw	(0)
	fcall	_CenterSetPin
	line	18
	opt asmopt_off
movlw	6
	movlb 0	; select bank0
movwf	(??_TempLoadDigit+0)+0,f
u5077:
decfsz	(??_TempLoadDigit+0)+0,f
	goto	u5077
	clrwdt
opt asmopt_on

	line	19
	
l5294:	
	clrf	(?_CenterSetPin)
	movlw	(0)
	fcall	_CenterSetPin
	line	13
	
l5296:	
	movlw	(-1)
	movlb 0	; select bank0
	movwf	(??_TempLoadDigit+0)+0
	movf	(??_TempLoadDigit+0)+0,w
	addwf	(TempLoadDigit@index),f
	
l5298:	
	btfss	(TempLoadDigit@index),7
	goto	u4211
	goto	u4210
u4211:
	goto	l5288
u4210:
	goto	l5300
	
l1204:	
	line	21
	
l5300:	
	clrf	(?_CenterSetPin)
	bsf	status,0
	rlf	(?_CenterSetPin),f
	movf	(TempLoadDigit@digit_number),w
	fcall	_CenterSetPin
	line	22
	
l5302:	
	opt asmopt_off
movlw	16
	movlb 0	; select bank0
movwf	(??_TempLoadDigit+0)+0,f
u5087:
decfsz	(??_TempLoadDigit+0)+0,f
	goto	u5087
	clrwdt
opt asmopt_on

	line	23
	
l5304:	
	clrf	(?_CenterSetPin)
	movlb 0	; select bank0
	movf	(TempLoadDigit@digit_number),w
	fcall	_CenterSetPin
	line	25
	opt asmopt_off
movlw	66
	movlb 0	; select bank0
movwf	(??_TempLoadDigit+0)+0,f
u5097:
decfsz	(??_TempLoadDigit+0)+0,f
	goto	u5097
	clrwdt
opt asmopt_on

	line	27
	
l1205:	
	return
	opt stack 0
GLOBAL	__end_of_TempLoadDigit
	__end_of_TempLoadDigit:
;; =============== function _TempLoadDigit ends ============

	signat	_TempLoadDigit,8312
	global	_shift_reg_set_pin_lcd
psect	text1380,local,class=CODE,delta=2
global __ptext1380
__ptext1380:

;; *************** function _shift_reg_set_pin_lcd *****************
;; Defined at:
;;		line 7 in file "../LCD.h"
;; Parameters:    Size  Location     Type
;;  pin_number      1    wreg     unsigned char 
;;  pin_value       1   12[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  pin_number      1   13[COMMON] unsigned char 
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
;;      Temps:          0       2       0       0
;;      Totals:         2       2       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LoadDataCenter
;; This function is called by:
;;		_lcd_info
;;		_LCD_init
;; This function uses a non-reentrant model
;;
psect	text1380
	file	"../LCD.h"
	line	7
	global	__size_of_shift_reg_set_pin_lcd
	__size_of_shift_reg_set_pin_lcd	equ	__end_of_shift_reg_set_pin_lcd-_shift_reg_set_pin_lcd
	
_shift_reg_set_pin_lcd:	
	opt	stack 8
; Regs used in _shift_reg_set_pin_lcd: [wreg+status,2+status,0+pclath+cstack]
	line	9
	movwf	(shift_reg_set_pin_lcd@pin_number)
	
l5274:	
	movf	(shift_reg_set_pin_lcd@pin_value),w
	skipz
	goto	u4160
	goto	l5278
u4160:
	line	11
	
l5276:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_shift_reg_set_pin_lcd+0)+0
	incf	(shift_reg_set_pin_lcd@pin_number),w
	goto	u4174
u4175:
	lslf	(??_shift_reg_set_pin_lcd+0)+0,f
u4174:
	decfsz	wreg,f
	goto	u4175
	movf	0+(??_shift_reg_set_pin_lcd+0)+0,w
	movwf	(??_shift_reg_set_pin_lcd+1)+0
	movf	(??_shift_reg_set_pin_lcd+1)+0,w
	iorwf	(_LCDData),f
	line	12
	goto	l5280
	line	13
	
l1253:	
	
l5278:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_shift_reg_set_pin_lcd+0)+0
	incf	(shift_reg_set_pin_lcd@pin_number),w
	goto	u4184
u4185:
	lslf	(??_shift_reg_set_pin_lcd+0)+0,f
u4184:
	decfsz	wreg,f
	goto	u4185
	movf	0+(??_shift_reg_set_pin_lcd+0)+0,w
	xorlw	0ffh
	movwf	(??_shift_reg_set_pin_lcd+1)+0
	movf	(??_shift_reg_set_pin_lcd+1)+0,w
	andwf	(_LCDData),f
	goto	l5280
	
l1254:	
	line	15
	
l5280:	
	movf	(_LCDData),w
	movwf	(??_shift_reg_set_pin_lcd+0)+0
	movf	(??_shift_reg_set_pin_lcd+0)+0,w
	movwf	(?_LoadDataCenter)
	movlw	(07h)
	fcall	_LoadDataCenter
	line	17
	
l1255:	
	return
	opt stack 0
GLOBAL	__end_of_shift_reg_set_pin_lcd
	__end_of_shift_reg_set_pin_lcd:
;; =============== function _shift_reg_set_pin_lcd ends ============

	signat	_shift_reg_set_pin_lcd,8312
	global	_TarihRegisterSetPin
psect	text1381,local,class=CODE,delta=2
global __ptext1381
__ptext1381:

;; *************** function _TarihRegisterSetPin *****************
;; Defined at:
;;		line 17 in file "../TARIH.h"
;; Parameters:    Size  Location     Type
;;  pin             1    wreg     unsigned char 
;;  value           1   12[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  pin             1   13[COMMON] unsigned char 
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
;;      Temps:          0       2       0       0
;;      Totals:         2       2       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LoadDataCenter
;; This function is called by:
;;		_TarihSetDisplay
;; This function uses a non-reentrant model
;;
psect	text1381
	file	"../TARIH.h"
	global	__size_of_TarihRegisterSetPin
	__size_of_TarihRegisterSetPin	equ	__end_of_TarihRegisterSetPin-_TarihRegisterSetPin
	
_TarihRegisterSetPin:	
	opt	stack 10
; Regs used in _TarihRegisterSetPin: [wreg+status,2+status,0+pclath+cstack]
	movwf	(TarihRegisterSetPin@pin)
	line	18
	
l5266:	
	movf	(TarihRegisterSetPin@value),w
	skipz
	goto	u4130
	goto	l5270
u4130:
	line	19
	
l5268:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_TarihRegisterSetPin+0)+0
	incf	(TarihRegisterSetPin@pin),w
	goto	u4144
u4145:
	lslf	(??_TarihRegisterSetPin+0)+0,f
u4144:
	decfsz	wreg,f
	goto	u4145
	movf	0+(??_TarihRegisterSetPin+0)+0,w
	movwf	(??_TarihRegisterSetPin+1)+0
	movf	(??_TarihRegisterSetPin+1)+0,w
	iorwf	(_tarihData),f
	goto	l5272
	line	20
	
l1220:	
	line	21
	
l5270:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_TarihRegisterSetPin+0)+0
	incf	(TarihRegisterSetPin@pin),w
	goto	u4154
u4155:
	lslf	(??_TarihRegisterSetPin+0)+0,f
u4154:
	decfsz	wreg,f
	goto	u4155
	movf	0+(??_TarihRegisterSetPin+0)+0,w
	xorlw	0ffh
	movwf	(??_TarihRegisterSetPin+1)+0
	movf	(??_TarihRegisterSetPin+1)+0,w
	andwf	(_tarihData),f
	goto	l5272
	
l1221:	
	line	23
	
l5272:	
	movf	(_tarihData),w
	movwf	(??_TarihRegisterSetPin+0)+0
	movf	(??_TarihRegisterSetPin+0)+0,w
	movwf	(?_LoadDataCenter)
	movlw	(03h)
	fcall	_LoadDataCenter
	line	24
	
l1222:	
	return
	opt stack 0
GLOBAL	__end_of_TarihRegisterSetPin
	__end_of_TarihRegisterSetPin:
;; =============== function _TarihRegisterSetPin ends ============

	signat	_TarihRegisterSetPin,8312
	global	_CenterSetPin
psect	text1382,local,class=CODE,delta=2
global __ptext1382
__ptext1382:

;; *************** function _CenterSetPin *****************
;; Defined at:
;;		line 31 in file "../CenterRegister.h"
;; Parameters:    Size  Location     Type
;;  pin_number      1    wreg     unsigned char 
;;  pin_value       1   12[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  pin_number      1   13[COMMON] unsigned char 
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
;;      Temps:          0       2       0       0
;;      Totals:         2       2       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LoadDataCenter
;; This function is called by:
;;		_TempLoadDigit
;;		_choose_input_pin
;; This function uses a non-reentrant model
;;
psect	text1382
	file	"../CenterRegister.h"
	line	31
	global	__size_of_CenterSetPin
	__size_of_CenterSetPin	equ	__end_of_CenterSetPin-_CenterSetPin
	
_CenterSetPin:	
	opt	stack 10
; Regs used in _CenterSetPin: [wreg+status,2+status,0+pclath+cstack]
	movwf	(CenterSetPin@pin_number)
	line	32
	
l5248:	
	movlw	(08h)
	subwf	(CenterSetPin@pin_number),w
	skipc
	goto	u4061
	goto	u4060
u4061:
	goto	l5258
u4060:
	line	34
	
l5250:	
	movf	(CenterSetPin@pin_value),w
	skipz
	goto	u4070
	goto	l5254
u4070:
	line	36
	
l5252:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_CenterSetPin+0)+0
	movf	(CenterSetPin@pin_number),w
	addlw	-8
	incf	wreg,f
	goto	u4084
u4085:
	lslf	(??_CenterSetPin+0)+0,f
u4084:
	decfsz	wreg,f
	goto	u4085
	movf	0+(??_CenterSetPin+0)+0,w
	movwf	(??_CenterSetPin+1)+0
	movf	(??_CenterSetPin+1)+0,w
	iorwf	(_CenterData2),f
	line	37
	goto	l5256
	line	38
	
l1195:	
	
l5254:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_CenterSetPin+0)+0
	movf	(CenterSetPin@pin_number),w
	addlw	-8
	incf	wreg,f
	goto	u4094
u4095:
	lslf	(??_CenterSetPin+0)+0,f
u4094:
	decfsz	wreg,f
	goto	u4095
	movf	0+(??_CenterSetPin+0)+0,w
	xorlw	0ffh
	movwf	(??_CenterSetPin+1)+0
	movf	(??_CenterSetPin+1)+0,w
	andwf	(_CenterData2),f
	goto	l5256
	
l1196:	
	line	40
	
l5256:	
	movf	(_CenterData2),w
	movwf	(??_CenterSetPin+0)+0
	movf	(??_CenterSetPin+0)+0,w
	movwf	(?_LoadDataCenter)
	movlw	(05h)
	fcall	_LoadDataCenter
	line	42
	goto	l1200
	line	43
	
l1194:	
	line	45
	
l5258:	
	movf	(CenterSetPin@pin_value),w
	skipz
	goto	u4100
	goto	l5262
u4100:
	line	46
	
l5260:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_CenterSetPin+0)+0
	incf	(CenterSetPin@pin_number),w
	goto	u4114
u4115:
	lslf	(??_CenterSetPin+0)+0,f
u4114:
	decfsz	wreg,f
	goto	u4115
	movf	0+(??_CenterSetPin+0)+0,w
	movwf	(??_CenterSetPin+1)+0
	movf	(??_CenterSetPin+1)+0,w
	iorwf	(_CenterData1),f
	goto	l5264
	line	47
	
l1198:	
	
l5262:	
	movlw	(01h)
	movlb 0	; select bank0
	movwf	(??_CenterSetPin+0)+0
	incf	(CenterSetPin@pin_number),w
	goto	u4124
u4125:
	lslf	(??_CenterSetPin+0)+0,f
u4124:
	decfsz	wreg,f
	goto	u4125
	movf	0+(??_CenterSetPin+0)+0,w
	xorlw	0ffh
	movwf	(??_CenterSetPin+1)+0
	movf	(??_CenterSetPin+1)+0,w
	andwf	(_CenterData1),f
	goto	l5264
	
l1199:	
	line	48
	
l5264:	
	movf	(_CenterData1),w
	movwf	(??_CenterSetPin+0)+0
	movf	(??_CenterSetPin+0)+0,w
	movwf	(?_LoadDataCenter)
	movlw	(04h)
	fcall	_LoadDataCenter
	goto	l1200
	line	50
	
l1197:	
	line	53
	
l1200:	
	return
	opt stack 0
GLOBAL	__end_of_CenterSetPin
	__end_of_CenterSetPin:
;; =============== function _CenterSetPin ends ============

	signat	_CenterSetPin,8312
	global	_ask_current_situation
psect	text1383,local,class=CODE,delta=2
global __ptext1383
__ptext1383:

;; *************** function _ask_current_situation *****************
;; Defined at:
;;		line 90 in file "../Requests.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_common_request_function
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1383
	file	"../Requests.h"
	line	90
	global	__size_of_ask_current_situation
	__size_of_ask_current_situation	equ	__end_of_ask_current_situation-_ask_current_situation
	
_ask_current_situation:	
	opt	stack 12
; Regs used in _ask_current_situation: [wreg+fsr1l-status,0+btemp+1+pclath+cstack]
	line	91
	
l5744:	
	movlw	(_bugun&0ffh)
	movwf	(?_common_request_function)
	movlw	0x1/2
	movwf	(?_common_request_function+1)
	movlw	(028h)
	movlb 0	; select bank0
	movwf	(??_ask_current_situation+0)+0
	movf	(??_ask_current_situation+0)+0,w
	movwf	0+(?_common_request_function)+02h
	movlw	(0Bh)
	movwf	(??_ask_current_situation+1)+0
	movf	(??_ask_current_situation+1)+0,w
	movwf	0+(?_common_request_function)+03h
	movlw	(053h)
	fcall	_common_request_function
	line	93
	
l1401:	
	return
	opt stack 0
GLOBAL	__end_of_ask_current_situation
	__end_of_ask_current_situation:
;; =============== function _ask_current_situation ends ============

	signat	_ask_current_situation,88
	global	_ask_currency
psect	text1384,local,class=CODE,delta=2
global __ptext1384
__ptext1384:

;; *************** function _ask_currency *****************
;; Defined at:
;;		line 81 in file "../Requests.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_common_request_function
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1384
	file	"../Requests.h"
	line	81
	global	__size_of_ask_currency
	__size_of_ask_currency	equ	__end_of_ask_currency-_ask_currency
	
_ask_currency:	
	opt	stack 12
; Regs used in _ask_currency: [wreg+fsr1l-status,0+btemp+1+pclath+cstack]
	line	82
	
l5742:	
	movlw	(_CURRENCY&0ffh)
	movwf	(?_common_request_function)
	movlw	0x0/2
	movwf	(?_common_request_function+1)
	movlw	(033h)
	movlb 0	; select bank0
	movwf	(??_ask_currency+0)+0
	movf	(??_ask_currency+0)+0,w
	movwf	0+(?_common_request_function)+02h
	movlw	(06h)
	movwf	(??_ask_currency+1)+0
	movf	(??_ask_currency+1)+0,w
	movwf	0+(?_common_request_function)+03h
	movlw	(04Dh)
	fcall	_common_request_function
	line	84
	
l1398:	
	return
	opt stack 0
GLOBAL	__end_of_ask_currency
	__end_of_ask_currency:
;; =============== function _ask_currency ends ============

	signat	_ask_currency,88
	global	_ask_5_day_weather
psect	text1385,local,class=CODE,delta=2
global __ptext1385
__ptext1385:

;; *************** function _ask_5_day_weather *****************
;; Defined at:
;;		line 71 in file "../Requests.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_common_request_function
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1385
	file	"../Requests.h"
	line	71
	global	__size_of_ask_5_day_weather
	__size_of_ask_5_day_weather	equ	__end_of_ask_5_day_weather-_ask_5_day_weather
	
_ask_5_day_weather:	
	opt	stack 12
; Regs used in _ask_5_day_weather: [wreg+fsr1l-status,0+btemp+1+pclath+cstack]
	line	73
	
l5740:	
	movlw	(_gunler&0ffh)
	movwf	(?_common_request_function)
	movlw	0x2/2
	movwf	(?_common_request_function+1)
	clrf	0+(?_common_request_function)+02h
	movlw	(028h)
	movlb 0	; select bank0
	movwf	(??_ask_5_day_weather+0)+0
	movf	(??_ask_5_day_weather+0)+0,w
	movwf	0+(?_common_request_function)+03h
	movlw	(043h)
	fcall	_common_request_function
	line	78
	
l1395:	
	return
	opt stack 0
GLOBAL	__end_of_ask_5_day_weather
	__end_of_ask_5_day_weather:
;; =============== function _ask_5_day_weather ends ============

	signat	_ask_5_day_weather,88
	global	_LoadDataCenter
psect	text1386,local,class=CODE,delta=2
global __ptext1386
__ptext1386:

;; *************** function _LoadDataCenter *****************
;; Defined at:
;;		line 12 in file "../CenterRegister.h"
;; Parameters:    Size  Location     Type
;;  center_no       1    wreg     unsigned char 
;;  center_data     1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  center_no       1   10[COMMON] unsigned char 
;;  index           1   11[COMMON] char 
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
;;		_MainRegisterSetPin
;; This function is called by:
;;		_CenterSetPin
;;		_TarihRegisterSetPin
;;		_shift_reg_set_pin_lcd
;; This function uses a non-reentrant model
;;
psect	text1386
	file	"../CenterRegister.h"
	line	12
	global	__size_of_LoadDataCenter
	__size_of_LoadDataCenter	equ	__end_of_LoadDataCenter-_LoadDataCenter
	
_LoadDataCenter:	
	opt	stack 10
; Regs used in _LoadDataCenter: [wreg+status,2+status,0+pclath+cstack]
	line	14
	movwf	(LoadDataCenter@center_no)
	
l5216:	
	movlw	(07h)
	movwf	(??_LoadDataCenter+0)+0
	movf	(??_LoadDataCenter+0)+0,w
	movwf	(LoadDataCenter@index)
	
l5218:	
	btfss	(LoadDataCenter@index),7
	goto	u4031
	goto	u4030
u4031:
	goto	l5222
u4030:
	goto	l5236
	
l5220:	
	goto	l5236
	line	15
	
l1189:	
	line	16
	
l5222:	
	movf	(LoadDataCenter@center_data),w
	movwf	(??_LoadDataCenter+0)+0
	incf	(LoadDataCenter@index),w
	goto	u4044
u4045:
	lsrf	(??_LoadDataCenter+0)+0,f
u4044:
	decfsz	wreg,f
	goto	u4045
	movf	0+(??_LoadDataCenter+0)+0,w
	andlw	01h
	movwf	(??_LoadDataCenter+1)+0
	movf	(??_LoadDataCenter+1)+0,w
	movwf	(?_MainRegisterSetPin)
	movlw	(02h)
	fcall	_MainRegisterSetPin
	line	17
	
l5224:	
	opt asmopt_off
movlw	16
movwf	(??_LoadDataCenter+0)+0,f
u5107:
decfsz	(??_LoadDataCenter+0)+0,f
	goto	u5107
	clrwdt
opt asmopt_on

	line	18
	
l5226:	
	clrf	(?_MainRegisterSetPin)
	bsf	status,0
	rlf	(?_MainRegisterSetPin),f
	movlw	(01h)
	fcall	_MainRegisterSetPin
	line	19
	opt asmopt_off
movlw	9
movwf	(??_LoadDataCenter+0)+0,f
u5117:
decfsz	(??_LoadDataCenter+0)+0,f
	goto	u5117
	nop2	;nop
opt asmopt_on

	line	20
	
l5228:	
	clrf	(?_MainRegisterSetPin)
	movlw	(01h)
	fcall	_MainRegisterSetPin
	line	21
	
l5230:	
	opt asmopt_off
movlw	6
movwf	(??_LoadDataCenter+0)+0,f
u5127:
decfsz	(??_LoadDataCenter+0)+0,f
	goto	u5127
	clrwdt
opt asmopt_on

	line	14
	
l5232:	
	movlw	(-1)
	movwf	(??_LoadDataCenter+0)+0
	movf	(??_LoadDataCenter+0)+0,w
	addwf	(LoadDataCenter@index),f
	
l5234:	
	btfss	(LoadDataCenter@index),7
	goto	u4051
	goto	u4050
u4051:
	goto	l5222
u4050:
	goto	l5236
	
l1190:	
	line	23
	
l5236:	
	clrf	(?_MainRegisterSetPin)
	bsf	status,0
	rlf	(?_MainRegisterSetPin),f
	movf	(LoadDataCenter@center_no),w
	fcall	_MainRegisterSetPin
	line	24
	
l5238:	
	opt asmopt_off
movlw	16
movwf	(??_LoadDataCenter+0)+0,f
u5137:
decfsz	(??_LoadDataCenter+0)+0,f
	goto	u5137
	clrwdt
opt asmopt_on

	line	25
	
l5240:	
	clrf	(?_MainRegisterSetPin)
	movf	(LoadDataCenter@center_no),w
	fcall	_MainRegisterSetPin
	line	26
	opt asmopt_off
movlw	16
movwf	(??_LoadDataCenter+0)+0,f
u5147:
decfsz	(??_LoadDataCenter+0)+0,f
	goto	u5147
	clrwdt
opt asmopt_on

	line	27
	
l1191:	
	return
	opt stack 0
GLOBAL	__end_of_LoadDataCenter
	__end_of_LoadDataCenter:
;; =============== function _LoadDataCenter ends ============

	signat	_LoadDataCenter,8312
	global	_retrive_weather_situations
psect	text1387,local,class=CODE,delta=2
global __ptext1387
__ptext1387:

;; *************** function _retrive_weather_situations *****************
;; Defined at:
;;		line 98 in file "../Requests.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  received_dat    1    6[COMMON] unsigned char 
;;  index           1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_EEPROM_ReadByte
;;		_UARTSendString
;;		_EEPROM_WriteByte
;;		_UART_byte_send
;;		_UART_byte_receive
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1387
	file	"../Requests.h"
	line	98
	global	__size_of_retrive_weather_situations
	__size_of_retrive_weather_situations	equ	__end_of_retrive_weather_situations-_retrive_weather_situations
	
_retrive_weather_situations:	
	opt	stack 13
; Regs used in _retrive_weather_situations: [wreg+fsr1l-status,0+btemp+1+pclath+cstack]
	line	99
	
l5186:	
	movlb 0	; select bank0
	clrf	(_time_counter)
	clrf	(_time_counter+1)
	line	100
	
l5188:	
	clrf	(_time_exceed)
	line	101
	
l5190:	
	movlw	(039h)
	fcall	_EEPROM_ReadByte
	iorlw	0
	skipz
	goto	u3991
	goto	u3990
u3991:
	goto	l5194
u3990:
	goto	l1405
	
l5192:	
	goto	l1405
	
l1404:	
	line	102
	
l5194:	
	movlw	(04Ch)
	movwf	(??_retrive_weather_situations+0)+0
	movf	(??_retrive_weather_situations+0)+0,w
	movlb 0	; select bank0
	movwf	(_COMMAND)
	line	104
	
l5196:	
	movlw	(_COMMAND)&0ffh
	fcall	_UARTSendString
	line	105
	goto	l1406
	
l1407:	
	
l5198:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(_time_counter),f
	movlw	high(01h)
	addwfc	(_time_counter+1),f
	line	106
	opt asmopt_off
movlw	249
movwf	(??_retrive_weather_situations+0)+0,f
u5157:
	clrwdt
decfsz	(??_retrive_weather_situations+0)+0,f
	goto	u5157
	nop2	;nop
	clrwdt
opt asmopt_on

	line	107
	
l5200:	
	movlb 0	; select bank0
	movf	(_time_counter+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4005
	movlw	low(03E8h)
	subwf	(_time_counter),w
u4005:

	skipc
	goto	u4001
	goto	u4000
u4001:
	goto	l1406
u4000:
	goto	l1405
	line	108
	
l5202:	
	goto	l1405
	line	109
	
l1408:	
	line	110
	
l1406:	
	line	105
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u4011
	goto	u4010
u4011:
	goto	l5198
u4010:
	
l1409:	
	line	114
	clrf	(retrive_weather_situations@index)
	line	115
	goto	l5212
	
l1411:	
	line	117
	
l5204:	
	movf	(retrive_weather_situations@received_data),w
	movwf	(??_retrive_weather_situations+0)+0
	movf	(??_retrive_weather_situations+0)+0,w
	movwf	(?_EEPROM_WriteByte)
	movf	(retrive_weather_situations@index),w
	addlw	039h
	fcall	_EEPROM_WriteByte
	line	118
	
l5206:	
	opt asmopt_off
movlw	3
movwf	((??_retrive_weather_situations+0)+0+1),f
	movlw	151
movwf	((??_retrive_weather_situations+0)+0),f
u5167:
	decfsz	((??_retrive_weather_situations+0)+0),f
	goto	u5167
	decfsz	((??_retrive_weather_situations+0)+0+1),f
	goto	u5167
	nop2
opt asmopt_on

	line	119
	
l5208:	
	movf	(retrive_weather_situations@received_data),w
	fcall	_UART_byte_send
	line	120
	opt asmopt_off
movlw	3
movwf	((??_retrive_weather_situations+0)+0+1),f
	movlw	151
movwf	((??_retrive_weather_situations+0)+0),f
u5177:
	decfsz	((??_retrive_weather_situations+0)+0),f
	goto	u5177
	decfsz	((??_retrive_weather_situations+0)+0+1),f
	goto	u5177
	nop2
opt asmopt_on

	line	121
	
l5210:	
	movlw	(01h)
	movwf	(??_retrive_weather_situations+0)+0
	movf	(??_retrive_weather_situations+0)+0,w
	addwf	(retrive_weather_situations@index),f
	goto	l5212
	line	122
	
l1410:	
	line	115
	
l5212:	
	fcall	_UART_byte_receive
	movwf	(??_retrive_weather_situations+0)+0
	movf	(??_retrive_weather_situations+0)+0,w
	movwf	(retrive_weather_situations@received_data)
	movf	((retrive_weather_situations@received_data)),w
	xorlw	023h&0ffh
	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l5204
u4020:
	goto	l5214
	
l1412:	
	line	123
	
l5214:	
	movf	(retrive_weather_situations@received_data),w
	fcall	_UART_byte_send
	line	126
	
l1405:	
	return
	opt stack 0
GLOBAL	__end_of_retrive_weather_situations
	__end_of_retrive_weather_situations:
;; =============== function _retrive_weather_situations ends ============

	signat	_retrive_weather_situations,88
	global	_common_request_function
psect	text1388,local,class=CODE,delta=2
global __ptext1388
__ptext1388:

;; *************** function _common_request_function *****************
;; Defined at:
;;		line 29 in file "../Requests.h"
;; Parameters:    Size  Location     Type
;;  komut           1    wreg     unsigned char 
;;  point           2    9[COMMON] PTR unsigned char 
;;		 -> bugun(11), gunler(40), CURRENCY(6), 
;;  start           1   11[COMMON] unsigned char 
;;  size_of         1   12[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  komut           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       3       0       0
;;      Totals:         5       3       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_UARTSendString
;;		_UARTReadString
;;		_loadFromEPPROM
;; This function is called by:
;;		_ask_5_day_weather
;;		_ask_currency
;;		_ask_current_situation
;; This function uses a non-reentrant model
;;
psect	text1388
	file	"../Requests.h"
	line	29
	global	__size_of_common_request_function
	__size_of_common_request_function	equ	__end_of_common_request_function-_common_request_function
	
_common_request_function:	
	opt	stack 12
; Regs used in _common_request_function: [wreg+fsr1l-status,0+btemp+1+pclath+cstack]
	movwf	(common_request_function@komut)
	line	30
	
l5712:	
	movlb 0	; select bank0
	clrf	(_time_counter)
	clrf	(_time_counter+1)
	line	31
	
l5714:	
	clrf	(_time_exceed)
	line	33
	
l5716:	
	movf	(common_request_function@komut),w
	movwf	(??_common_request_function+0)+0
	movf	(??_common_request_function+0)+0,w
	movwf	(_COMMAND)
	line	35
	
l5718:	
	movlw	(_COMMAND)&0ffh
	fcall	_UARTSendString
	line	38
	goto	l1383
	
l1384:	
	
l5720:	
	movlw	low(01h)
	movlb 0	; select bank0
	addwf	(_time_counter),f
	movlw	high(01h)
	addwfc	(_time_counter+1),f
	line	39
	opt asmopt_off
movlw	249
movwf	(??_common_request_function+0)+0,f
u5187:
	clrwdt
decfsz	(??_common_request_function+0)+0,f
	goto	u5187
	nop2	;nop
	clrwdt
opt asmopt_on

	line	40
	
l5722:	
	movlb 0	; select bank0
	movf	(_time_counter+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4695
	movlw	low(03E8h)
	subwf	(_time_counter),w
u4695:

	skipc
	goto	u4691
	goto	u4690
u4691:
	goto	l1383
u4690:
	line	42
	
l5724:	
	movlb 0	; select bank0
	clrf	(_time_exceed)
	bsf	status,0
	rlf	(_time_exceed),f
	line	43
	goto	l5726
	line	44
	
l1385:	
	line	45
	
l1383:	
	line	38
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u4701
	goto	u4700
u4701:
	goto	l5720
u4700:
	goto	l5726
	
l1386:	
	line	47
	
l5726:	
	movf	(_time_exceed),f
	skipz
	goto	u4711
	goto	u4710
u4711:
	goto	l5738
u4710:
	line	49
	
l5728:	
	fcall	_UARTReadString
	line	50
	
l5730:	
	movlb 0	; select bank0
	clrf	(_buff_index)
	line	52
	goto	l5736
	line	53
	
l1389:	
	line	54
	
l5732:	
	movf	(_buff_index),w
	addlw	_current_buffer&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	addlw	0D0h
	movwf	(??_common_request_function+0)+0
	movf	(_buff_index),w
	addwf	(common_request_function@point),w
	movwf	(??_common_request_function+1)+0
	movf	(common_request_function@point+1),w
	skipnc
	incf	wreg,f
	movwf	1+(??_common_request_function+1)+0
	movf	0+(??_common_request_function+1)+0,w
	movwf	fsr1l
	movf	1+(??_common_request_function+1)+0,w
	movwf	fsr1h

	movf	(??_common_request_function+0)+0,w
	movwf	indf1
	line	52
	
l5734:	
	movlw	(01h)
	movwf	(??_common_request_function+0)+0
	movf	(??_common_request_function+0)+0,w
	addwf	(_buff_index),f
	goto	l5736
	
l1388:	
	
l5736:	
	movf	(common_request_function@size_of),w
	subwf	(_buff_index),w
	skipc
	goto	u4721
	goto	u4720
u4721:
	goto	l5732
u4720:
	goto	l1392
	
l1390:	
	line	56
	goto	l1392
	line	57
	
l1387:	
	line	59
	
l5738:	
	movf	(common_request_function@point+1),w
	clrf	(?_loadFromEPPROM+1)
	addwf	(?_loadFromEPPROM+1)
	movf	(common_request_function@point),w
	clrf	(?_loadFromEPPROM)
	addwf	(?_loadFromEPPROM)

	movf	(common_request_function@size_of),w
	movwf	(??_common_request_function+0)+0
	movf	(??_common_request_function+0)+0,w
	movwf	0+(?_loadFromEPPROM)+02h
	movf	(common_request_function@start),w
	fcall	_loadFromEPPROM
	goto	l1392
	line	61
	
l1391:	
	line	67
	
l1392:	
	return
	opt stack 0
GLOBAL	__end_of_common_request_function
	__end_of_common_request_function:
;; =============== function _common_request_function ends ============

	signat	_common_request_function,16504
	global	_itoa
psect	text1389,local,class=CODE,delta=2
global __ptext1389
__ptext1389:

;; *************** function _itoa *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> number_array(5), 
;;  val             2    4[BANK0 ] int 
;;  base            2    6[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  buf             1    9[BANK0 ] PTR unsigned char 
;;		 -> number_array(5), 
;;  cp              1    8[BANK0 ] PTR unsigned char 
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
;;      Temps:          1       0       0       0
;;      Totals:         1       6       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_utoa
;; This function is called by:
;;		_lcd_write_number
;; This function uses a non-reentrant model
;;
psect	text1389
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
	line	5
	global	__size_of_itoa
	__size_of_itoa	equ	__end_of_itoa-_itoa
	
_itoa:	
	opt	stack 11
; Regs used in _itoa: [wreg+fsr1l-status,0+pclath+cstack]
	movlb 0	; select bank0
	movwf	(itoa@buf)
	line	6
	
l5144:	
	movf	(itoa@buf),w
	movwf	(??_itoa+0)+0
	movf	(??_itoa+0)+0,w
	movwf	(itoa@cp)
	line	8
	
l5146:	
	btfss	(itoa@val+1),7
	goto	u3941
	goto	u3940
u3941:
	goto	l5154
u3940:
	line	9
	
l5148:	
	movlw	(02Dh)
	movwf	(??_itoa+0)+0
	movf	(itoa@buf),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_itoa+0)+0,w
	movwf	indf1
	
l5150:	
	movlw	(01h)
	movwf	(??_itoa+0)+0
	movf	(??_itoa+0)+0,w
	addwf	(itoa@buf),f
	line	10
	
l5152:	
	comf	(itoa@val),f
	comf	(itoa@val+1),f
	incf	(itoa@val),f
	skipnz
	incf	(itoa@val+1),f
	goto	l5154
	line	11
	
l2472:	
	line	12
	
l5154:	
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
	goto	l2473
	line	13
	
l5156:	
	line	14
;	Return value of _itoa is never used
	
l2473:	
	return
	opt stack 0
GLOBAL	__end_of_itoa
	__end_of_itoa:
;; =============== function _itoa ends ============

	signat	_itoa,12409
	global	_MainRegisterSetPin
psect	text1390,local,class=CODE,delta=2
global __ptext1390
__ptext1390:

;; *************** function _MainRegisterSetPin *****************
;; Defined at:
;;		line 35 in file "../MainRegister.h"
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
;;		_LoadDataCenter
;; This function uses a non-reentrant model
;;
psect	text1390
	file	"../MainRegister.h"
	line	35
	global	__size_of_MainRegisterSetPin
	__size_of_MainRegisterSetPin	equ	__end_of_MainRegisterSetPin-_MainRegisterSetPin
	
_MainRegisterSetPin:	
	opt	stack 10
; Regs used in _MainRegisterSetPin: [wreg+status,2+status,0+pclath+cstack]
	line	38
	movwf	(MainRegisterSetPin@pin_number)
	
l5134:	
	movf	(MainRegisterSetPin@value),w
	skipz
	goto	u3910
	goto	l5138
u3910:
	line	40
	
l5136:	
	movlw	(01h)
	movwf	(??_MainRegisterSetPin+0)+0
	incf	(MainRegisterSetPin@pin_number),w
	goto	u3924
u3925:
	lslf	(??_MainRegisterSetPin+0)+0,f
u3924:
	decfsz	wreg,f
	goto	u3925
	movf	0+(??_MainRegisterSetPin+0)+0,w
	movwf	(??_MainRegisterSetPin+1)+0
	movf	(??_MainRegisterSetPin+1)+0,w
	movlb 0	; select bank0
	iorwf	(_current_value),f
	line	41
	goto	l5140
	line	42
	
l1184:	
	line	44
	
l5138:	
	movlw	(01h)
	movwf	(??_MainRegisterSetPin+0)+0
	incf	(MainRegisterSetPin@pin_number),w
	goto	u3934
u3935:
	lslf	(??_MainRegisterSetPin+0)+0,f
u3934:
	decfsz	wreg,f
	goto	u3935
	movf	0+(??_MainRegisterSetPin+0)+0,w
	xorlw	0ffh
	movwf	(??_MainRegisterSetPin+1)+0
	movf	(??_MainRegisterSetPin+1)+0,w
	movlb 0	; select bank0
	andwf	(_current_value),f
	goto	l5140
	line	46
	
l1185:	
	line	48
	
l5140:	
	movf	(_current_value),w
	fcall	_MainRegisterLoadData
	line	49
	
l5142:	
	opt asmopt_off
movlw	66
movwf	(??_MainRegisterSetPin+0)+0,f
u5197:
decfsz	(??_MainRegisterSetPin+0)+0,f
	goto	u5197
	clrwdt
opt asmopt_on

	line	50
	
l1186:	
	return
	opt stack 0
GLOBAL	__end_of_MainRegisterSetPin
	__end_of_MainRegisterSetPin:
;; =============== function _MainRegisterSetPin ends ============

	signat	_MainRegisterSetPin,8312
	global	_utoa
psect	text1391,local,class=CODE,delta=2
global __ptext1391
__ptext1391:

;; *************** function _utoa *****************
;; Defined at:
;;		line 18 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> number_array(5), 
;;  val             2    8[COMMON] unsigned int 
;;  base            2   10[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  buf             1    3[BANK0 ] PTR unsigned char 
;;		 -> number_array(5), 
;;  v               2    0[BANK0 ] unsigned int 
;;  c               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          1       0       0       0
;;      Totals:         5       4       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_itoa
;; This function uses a non-reentrant model
;;
psect	text1391
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\itoa.c"
	line	18
	global	__size_of_utoa
	__size_of_utoa	equ	__end_of_utoa-_utoa
	
_utoa:	
	opt	stack 11
; Regs used in _utoa: [wreg+fsr1l-status,0+pclath+cstack]
	line	22
	movlb 0	; select bank0
	movwf	(utoa@buf)
	
l5108:	
	movf	(utoa@val+1),w
	clrf	(utoa@v+1)
	addwf	(utoa@v+1)
	movf	(utoa@val),w
	clrf	(utoa@v)
	addwf	(utoa@v)

	goto	l5110
	line	23
	
l2476:	
	line	24
	
l5110:	
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
	movf	(1+(?___lwdiv)),w
	movlb 0	; select bank0
	clrf	(utoa@v+1)
	addwf	(utoa@v+1)
	movf	(0+(?___lwdiv)),w
	clrf	(utoa@v)
	addwf	(utoa@v)

	line	25
	
l5112:	
	movlw	(01h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@buf),f
	line	26
	
l5114:	
	movf	((utoa@v+1)),w
	iorwf	((utoa@v)),w
	skipz
	goto	u3881
	goto	u3880
u3881:
	goto	l5110
u3880:
	goto	l5116
	
l2477:	
	line	27
	
l5116:	
	movf	(utoa@buf),w
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	
l5118:	
	movlw	low(01h)
	subwf	(utoa@buf),f
	goto	l5120
	line	28
	
l2478:	
	line	29
	
l5120:	
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
	movf	(0+(?___lwmod)),w
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	movlb 0	; select bank0
	movwf	(utoa@c)
	line	30
	
l5122:	
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
	movf	(1+(?___lwdiv)),w
	clrf	(utoa@val+1)
	addwf	(utoa@val+1)
	movf	(0+(?___lwdiv)),w
	clrf	(utoa@val)
	addwf	(utoa@val)

	line	31
	
l5124:	
	movlw	(0Ah)
	movlb 0	; select bank0
	subwf	(utoa@c),w
	skipc
	goto	u3891
	goto	u3890
u3891:
	goto	l2479
u3890:
	line	32
	
l5126:	
	movlw	(07h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@c),f
	
l2479:	
	line	33
	movlw	(030h)
	movwf	(??_utoa+0)+0
	movf	(??_utoa+0)+0,w
	addwf	(utoa@c),f
	line	34
	
l5128:	
	movf	(utoa@c),w
	movwf	(??_utoa+0)+0
	movf	(utoa@buf),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_utoa+0)+0,w
	movwf	indf1
	
l5130:	
	movlw	low(01h)
	subwf	(utoa@buf),f
	line	35
	
l5132:	
	movf	((utoa@val+1)),w
	iorwf	((utoa@val)),w
	skipz
	goto	u3901
	goto	u3900
u3901:
	goto	l5120
u3900:
	goto	l2481
	
l2480:	
	line	37
;	Return value of _utoa is never used
	
l2481:	
	return
	opt stack 0
GLOBAL	__end_of_utoa
	__end_of_utoa:
;; =============== function _utoa ends ============

	signat	_utoa,12409
	global	_resetBuffer
psect	text1392,local,class=CODE,delta=2
global __ptext1392
__ptext1392:

;; *************** function _resetBuffer *****************
;; Defined at:
;;		line 16 in file "../Requests.h"
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
;;      Temps:          3       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_memset
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1392
	file	"../Requests.h"
	line	16
	global	__size_of_resetBuffer
	__size_of_resetBuffer	equ	__end_of_resetBuffer-_resetBuffer
	
_resetBuffer:	
	opt	stack 14
; Regs used in _resetBuffer: [wreg+fsr1l-status,0+pclath+cstack]
	line	18
	
l5100:	
	movlw	low(0)
	movwf	(?_memset)
	movlw	high(0)
	movwf	((?_memset))+1
	movlw	low(032h)
	movwf	0+(?_memset)+02h
	movlw	high(032h)
	movwf	(0+(?_memset)+02h)+1
	movlw	(_current_buffer)&0ffh
	fcall	_memset
	line	19
	
l5102:	
	movlb 0	; select bank0
	clrf	(_current_buffer_index)
	line	20
	
l5104:	
	clrf	(_available_byte_count)
	line	21
	
l5106:	
	opt asmopt_off
movlw  2
movwf	((??_resetBuffer+0)+0+2),f
movlw	4
movwf	((??_resetBuffer+0)+0+1),f
	movlw	186
movwf	((??_resetBuffer+0)+0),f
u5207:
	decfsz	((??_resetBuffer+0)+0),f
	goto	u5207
	decfsz	((??_resetBuffer+0)+0+1),f
	goto	u5207
	decfsz	((??_resetBuffer+0)+0+2),f
	goto	u5207
	clrwdt
opt asmopt_on

	line	22
	
l1380:	
	return
	opt stack 0
GLOBAL	__end_of_resetBuffer
	__end_of_resetBuffer:
;; =============== function _resetBuffer ends ============

	signat	_resetBuffer,88
	global	_compareData
psect	text1393,local,class=CODE,delta=2
global __ptext1393
__ptext1393:

;; *************** function _compareData *****************
;; Defined at:
;;		line 142 in file "../HAVASTRUCTURE.h"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;;  p               1    1[COMMON] PTR unsigned char 
;;		 -> current_buffer(50), 
;;  size            1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    6[COMMON] unsigned char 
;;  i               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_EEPROM_ReadByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1393
	file	"../HAVASTRUCTURE.h"
	line	142
	global	__size_of_compareData
	__size_of_compareData	equ	__end_of_compareData-_compareData
	
_compareData:	
	opt	stack 14
; Regs used in _compareData: [wreg+fsr1l-status,0+pclath+cstack]
	movwf	(compareData@address)
	line	143
	
l5084:	
	clrf	(compareData@i)
	line	144
	goto	l5094
	line	145
	
l1374:	
	line	146
	
l5086:	
	movf	(compareData@i),w
	addwf	(compareData@p),w
	movwf	(??_compareData+0)+0
	movf	0+(??_compareData+0)+0,w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	addlw	low(-48)
	movwf	(??_compareData+1)+0
	movlw	high(-48)
	skipnc
	movlw	(high(-48)+1)&0ffh
	movwf	((??_compareData+1)+0)+1
	movf	(compareData@address),w
	addwf	(compareData@i),w
	fcall	_EEPROM_ReadByte
	xorwf	0+(??_compareData+1)+0,w
	iorwf	1+(??_compareData+1)+0,w
	skipnz
	goto	u3861
	goto	u3860
u3861:
	goto	l5092
u3860:
	line	147
	
l5088:	
	movlw	(0)
	goto	l1376
	
l5090:	
	goto	l1376
	
l1375:	
	line	144
	
l5092:	
	movlw	(01h)
	movwf	(??_compareData+0)+0
	movf	(??_compareData+0)+0,w
	addwf	(compareData@i),f
	goto	l5094
	
l1373:	
	
l5094:	
	movf	(compareData@size),w
	subwf	(compareData@i),w
	skipc
	goto	u3871
	goto	u3870
u3871:
	goto	l5086
u3870:
	goto	l5096
	
l1377:	
	line	150
	
l5096:	
	movlw	(01h)
	goto	l1376
	
l5098:	
	line	151
	
l1376:	
	return
	opt stack 0
GLOBAL	__end_of_compareData
	__end_of_compareData:
;; =============== function _compareData ends ============

	signat	_compareData,12409
	global	_loadFromEPPROM
psect	text1394,local,class=CODE,delta=2
global __ptext1394
__ptext1394:

;; *************** function _loadFromEPPROM *****************
;; Defined at:
;;		line 131 in file "../HAVASTRUCTURE.h"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;;  p               2    1[COMMON] PTR unsigned char 
;;		 -> bugun(11), gunler(40), CURRENCY(6), 
;;  size            1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    7[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         3       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_EEPROM_ReadByte
;; This function is called by:
;;		_common_request_function
;; This function uses a non-reentrant model
;;
psect	text1394
	file	"../HAVASTRUCTURE.h"
	line	131
	global	__size_of_loadFromEPPROM
	__size_of_loadFromEPPROM	equ	__end_of_loadFromEPPROM-_loadFromEPPROM
	
_loadFromEPPROM:	
	opt	stack 12
; Regs used in _loadFromEPPROM: [wreg+fsr1l-status,0+pclath+cstack]
	movwf	(loadFromEPPROM@address)
	line	132
	
l5074:	
	clrf	(loadFromEPPROM@i)
	line	133
	goto	l5082
	line	134
	
l1368:	
	line	135
	
l5076:	
	movf	(loadFromEPPROM@address),w
	addwf	(loadFromEPPROM@i),w
	fcall	_EEPROM_ReadByte
	movwf	(??_loadFromEPPROM+0)+0
	movf	(loadFromEPPROM@i),w
	addwf	(loadFromEPPROM@p),w
	movwf	(??_loadFromEPPROM+1)+0
	movf	(loadFromEPPROM@p+1),w
	skipnc
	incf	wreg,f
	movwf	1+(??_loadFromEPPROM+1)+0
	movf	0+(??_loadFromEPPROM+1)+0,w
	movwf	fsr1l
	movf	1+(??_loadFromEPPROM+1)+0,w
	movwf	fsr1h

	movf	(??_loadFromEPPROM+0)+0,w
	movwf	indf1
	line	136
	
l5078:	
	opt asmopt_off
movlw	3
movwf	((??_loadFromEPPROM+0)+0+1),f
	movlw	151
movwf	((??_loadFromEPPROM+0)+0),f
u5217:
	decfsz	((??_loadFromEPPROM+0)+0),f
	goto	u5217
	decfsz	((??_loadFromEPPROM+0)+0+1),f
	goto	u5217
	nop2
opt asmopt_on

	line	133
	
l5080:	
	movlw	(01h)
	movwf	(??_loadFromEPPROM+0)+0
	movf	(??_loadFromEPPROM+0)+0,w
	addwf	(loadFromEPPROM@i),f
	goto	l5082
	
l1367:	
	
l5082:	
	movf	(loadFromEPPROM@size),w
	subwf	(loadFromEPPROM@i),w
	skipc
	goto	u3851
	goto	u3850
u3851:
	goto	l5076
u3850:
	goto	l1370
	
l1369:	
	line	140
	
l1370:	
	return
	opt stack 0
GLOBAL	__end_of_loadFromEPPROM
	__end_of_loadFromEPPROM:
;; =============== function _loadFromEPPROM ends ============

	signat	_loadFromEPPROM,12408
	global	_saveToEEPROM
psect	text1395,local,class=CODE,delta=2
global __ptext1395
__ptext1395:

;; *************** function _saveToEEPROM *****************
;; Defined at:
;;		line 121 in file "../HAVASTRUCTURE.h"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;;  p               1    2[COMMON] PTR unsigned char 
;;		 -> current_buffer(50), 
;;  size            1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    6[COMMON] unsigned char 
;;  i               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_EEPROM_WriteByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1395
	file	"../HAVASTRUCTURE.h"
	line	121
	global	__size_of_saveToEEPROM
	__size_of_saveToEEPROM	equ	__end_of_saveToEEPROM-_saveToEEPROM
	
_saveToEEPROM:	
	opt	stack 14
; Regs used in _saveToEEPROM: [wreg+fsr1l-status,0+pclath+cstack]
	movwf	(saveToEEPROM@address)
	line	122
	
l5064:	
	clrf	(saveToEEPROM@i)
	line	123
	goto	l5072
	line	124
	
l1362:	
	line	125
	
l5066:	
	movf	(saveToEEPROM@i),w
	addwf	(saveToEEPROM@p),w
	movwf	(??_saveToEEPROM+0)+0
	movf	0+(??_saveToEEPROM+0)+0,w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	addlw	0D0h
	movwf	(??_saveToEEPROM+1)+0
	movf	(??_saveToEEPROM+1)+0,w
	movwf	(?_EEPROM_WriteByte)
	movf	(saveToEEPROM@address),w
	addwf	(saveToEEPROM@i),w
	fcall	_EEPROM_WriteByte
	line	126
	
l5068:	
	opt asmopt_off
movlw	3
movwf	((??_saveToEEPROM+0)+0+1),f
	movlw	151
movwf	((??_saveToEEPROM+0)+0),f
u5227:
	decfsz	((??_saveToEEPROM+0)+0),f
	goto	u5227
	decfsz	((??_saveToEEPROM+0)+0+1),f
	goto	u5227
	nop2
opt asmopt_on

	line	123
	
l5070:	
	movlw	(01h)
	movwf	(??_saveToEEPROM+0)+0
	movf	(??_saveToEEPROM+0)+0,w
	addwf	(saveToEEPROM@i),f
	goto	l5072
	
l1361:	
	
l5072:	
	movf	(saveToEEPROM@size),w
	subwf	(saveToEEPROM@i),w
	skipc
	goto	u3841
	goto	u3840
u3841:
	goto	l5066
u3840:
	goto	l1364
	
l1363:	
	line	129
	
l1364:	
	return
	opt stack 0
GLOBAL	__end_of_saveToEEPROM
	__end_of_saveToEEPROM:
;; =============== function _saveToEEPROM ends ============

	signat	_saveToEEPROM,12408
	global	_UARTSendString
psect	text1396,local,class=CODE,delta=2
global __ptext1396
__ptext1396:

;; *************** function _UARTSendString *****************
;; Defined at:
;;		line 85 in file "../UART.h"
;; Parameters:    Size  Location     Type
;;  p               1    wreg     PTR unsigned char 
;;		 -> COMMAND(3), 
;; Auto vars:     Size  Location     Type
;;  p               1    2[COMMON] PTR unsigned char 
;;		 -> COMMAND(3), 
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
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_UART_byte_send
;; This function is called by:
;;		_common_request_function
;;		_retrive_weather_situations
;; This function uses a non-reentrant model
;;
psect	text1396
	file	"../UART.h"
	line	85
	global	__size_of_UARTSendString
	__size_of_UARTSendString	equ	__end_of_UARTSendString-_UARTSendString
	
_UARTSendString:	
	opt	stack 12
; Regs used in _UARTSendString: [wreg+fsr1l-status,0+pclath+cstack]
	movwf	(UARTSendString@p)
	line	86
	
l5052:	
	goto	l5060
	
l1310:	
	line	88
	
l5054:	
	movf	(UARTSendString@p),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	fcall	_UART_byte_send
	line	89
	
l5056:	
	opt asmopt_off
movlw	249
movwf	(??_UARTSendString+0)+0,f
u5237:
	clrwdt
decfsz	(??_UARTSendString+0)+0,f
	goto	u5237
	nop2	;nop
	clrwdt
opt asmopt_on

	line	90
	
l5058:	
	movlw	(01h)
	movwf	(??_UARTSendString+0)+0
	movf	(??_UARTSendString+0)+0,w
	addwf	(UARTSendString@p),f
	goto	l5060
	line	92
	
l1309:	
	line	86
	
l5060:	
	movf	(UARTSendString@p),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorlw	0Ah&0ffh
	skipz
	goto	u3831
	goto	u3830
u3831:
	goto	l5054
u3830:
	goto	l5062
	
l1311:	
	line	93
	
l5062:	
	movf	(UARTSendString@p),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	fcall	_UART_byte_send
	line	98
	
l1312:	
	return
	opt stack 0
GLOBAL	__end_of_UARTSendString
	__end_of_UARTSendString:
;; =============== function _UARTSendString ends ============

	signat	_UARTSendString,4216
	global	_UARTReadString
psect	text1397,local,class=CODE,delta=2
global __ptext1397
__ptext1397:

;; *************** function _UARTReadString *****************
;; Defined at:
;;		line 53 in file "../UART.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  data            1    5[COMMON] unsigned char 
;;  index           1    4[COMMON] unsigned char 
;;  curr            1    3[COMMON] PTR unsigned char 
;;		 -> current_buffer(50), 
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
;;      Locals:         3       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_UART_byte_send
;;		_UART_byte_receive
;; This function is called by:
;;		_common_request_function
;; This function uses a non-reentrant model
;;
psect	text1397
	file	"../UART.h"
	line	53
	global	__size_of_UARTReadString
	__size_of_UARTReadString	equ	__end_of_UARTReadString-_UARTReadString
	
_UARTReadString:	
	opt	stack 12
; Regs used in _UARTReadString: [wreg+fsr1l-status,0+pclath+cstack]
	line	54
	
l5030:	
	movlw	(_current_buffer)&0ffh
	movwf	(??_UARTReadString+0)+0
	movf	(??_UARTReadString+0)+0,w
	movwf	(UARTReadString@curr)
	line	55
	
l5032:	
	clrf	(UARTReadString@index)
	line	57
	goto	l5044
	
l1304:	
	line	59
	
l5034:	
	movf	(UARTReadString@data),w
	movwf	(??_UARTReadString+0)+0
	movf	(UARTReadString@index),w
	addwf	(UARTReadString@curr),w
	movwf	(??_UARTReadString+1)+0
	movf	0+(??_UARTReadString+1)+0,w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_UARTReadString+0)+0,w
	movwf	indf1
	line	60
	
l5036:	
	movlw	(01h)
	movwf	(??_UARTReadString+0)+0
	movf	(??_UARTReadString+0)+0,w
	addwf	(UARTReadString@index),f
	line	61
	
l5038:	
	opt asmopt_off
movlw	3
movwf	((??_UARTReadString+0)+0+1),f
	movlw	151
movwf	((??_UARTReadString+0)+0),f
u5247:
	decfsz	((??_UARTReadString+0)+0),f
	goto	u5247
	decfsz	((??_UARTReadString+0)+0+1),f
	goto	u5247
	nop2
opt asmopt_on

	line	63
	
l5040:	
	movf	(UARTReadString@data),w
	fcall	_UART_byte_send
	line	64
	
l5042:	
	opt asmopt_off
movlw	3
movwf	((??_UARTReadString+0)+0+1),f
	movlw	151
movwf	((??_UARTReadString+0)+0),f
u5257:
	decfsz	((??_UARTReadString+0)+0),f
	goto	u5257
	decfsz	((??_UARTReadString+0)+0+1),f
	goto	u5257
	nop2
opt asmopt_on

	goto	l5044
	line	65
	
l1303:	
	line	57
	
l5044:	
	fcall	_UART_byte_receive
	movwf	(??_UARTReadString+0)+0
	movf	(??_UARTReadString+0)+0,w
	movwf	(UARTReadString@data)
	movf	((UARTReadString@data)),w
	xorlw	0Ah&0ffh
	skipz
	goto	u3821
	goto	u3820
u3821:
	goto	l5034
u3820:
	goto	l5046
	
l1305:	
	line	66
	
l5046:	
	movf	(UARTReadString@data),w
	movwf	(??_UARTReadString+0)+0
	movf	(UARTReadString@index),w
	addwf	(UARTReadString@curr),w
	movwf	(??_UARTReadString+1)+0
	movf	0+(??_UARTReadString+1)+0,w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_UARTReadString+0)+0,w
	movwf	indf1
	line	67
	
l5048:	
	movf	(UARTReadString@data),w
	fcall	_UART_byte_send
	line	68
	
l5050:	
	opt asmopt_off
movlw	3
movwf	((??_UARTReadString+0)+0+1),f
	movlw	151
movwf	((??_UARTReadString+0)+0),f
u5267:
	decfsz	((??_UARTReadString+0)+0),f
	goto	u5267
	decfsz	((??_UARTReadString+0)+0+1),f
	goto	u5267
	nop2
opt asmopt_on

	line	72
	
l1306:	
	return
	opt stack 0
GLOBAL	__end_of_UARTReadString
	__end_of_UARTReadString:
;; =============== function _UARTReadString ends ============

	signat	_UARTReadString,88
	global	_MainRegisterLoadData
psect	text1398,local,class=CODE,delta=2
global __ptext1398
__ptext1398:

;; *************** function _MainRegisterLoadData *****************
;; Defined at:
;;		line 16 in file "../MainRegister.h"
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
psect	text1398
	file	"../MainRegister.h"
	line	16
	global	__size_of_MainRegisterLoadData
	__size_of_MainRegisterLoadData	equ	__end_of_MainRegisterLoadData-_MainRegisterLoadData
	
_MainRegisterLoadData:	
	opt	stack 10
; Regs used in _MainRegisterLoadData: [wreg+status,2+status,0]
	line	18
	movwf	(MainRegisterLoadData@data)
	
l5010:	
	movlw	(07h)
	movwf	(??_MainRegisterLoadData+0)+0
	movf	(??_MainRegisterLoadData+0)+0,w
	movwf	(MainRegisterLoadData@a)
	
l5012:	
	btfss	(MainRegisterLoadData@a),7
	goto	u3771
	goto	u3770
u3771:
	goto	l5016
u3770:
	goto	l1180
	
l5014:	
	goto	l1180
	line	19
	
l1179:	
	line	20
	
l5016:	
	movf	(MainRegisterLoadData@data),w
	movwf	(??_MainRegisterLoadData+0)+0
	incf	(MainRegisterLoadData@a),w
	goto	u3784
u3785:
	lsrf	(??_MainRegisterLoadData+0)+0,f
u3784:
	decfsz	wreg,f
	goto	u3785
	btfsc	0+(??_MainRegisterLoadData+0)+0,0
	goto	u3791
	goto	u3790
	
u3791:
	movlb 0	; select bank0
	bsf	(100/8),(100)&7
	goto	u3804
u3790:
	movlb 0	; select bank0
	bcf	(100/8),(100)&7
u3804:
	line	21
	
l5018:	
	bsf	(101/8),(101)&7
	line	22
	
l5020:	
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	clrwdt
	opt asmopt_on

	line	23
	
l5022:	
	movlb 0	; select bank0
	bcf	(101/8),(101)&7
	line	24
	
l5024:	
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	clrwdt
	opt asmopt_on

	line	18
	movlw	(-1)
	movwf	(??_MainRegisterLoadData+0)+0
	movf	(??_MainRegisterLoadData+0)+0,w
	addwf	(MainRegisterLoadData@a),f
	
l5026:	
	btfss	(MainRegisterLoadData@a),7
	goto	u3811
	goto	u3810
u3811:
	goto	l5016
u3810:
	
l1180:	
	line	26
	movlb 0	; select bank0
	bsf	(98/8),(98)&7
	line	27
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	clrwdt
	opt asmopt_on

	line	28
	movlb 0	; select bank0
	bcf	(98/8),(98)&7
	line	29
	
l5028:	
	opt asmopt_off
movlw	3
movwf	(??_MainRegisterLoadData+0)+0,f
u5277:
decfsz	(??_MainRegisterLoadData+0)+0,f
	goto	u5277
opt asmopt_on

	line	32
	
l1181:	
	return
	opt stack 0
GLOBAL	__end_of_MainRegisterLoadData
	__end_of_MainRegisterLoadData:
;; =============== function _MainRegisterLoadData ends ============

	signat	_MainRegisterLoadData,4216
	global	___awmod
psect	text1399,local,class=CODE,delta=2
global __ptext1399
__ptext1399:

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
;;		_EnDusukDisplay
;;		_EnYuksekDisplay
;;		_DisplayGun
;;		_DisplayAy
;;		_DisplayYil
;; This function uses a non-reentrant model
;;
psect	text1399
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 14
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l4976:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u3681
	goto	u3680
u3681:
	goto	l4980
u3680:
	line	10
	
l4978:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l4980
	line	12
	
l2704:	
	line	13
	
l4980:	
	btfss	(___awmod@divisor+1),7
	goto	u3691
	goto	u3690
u3691:
	goto	l4984
u3690:
	line	14
	
l4982:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l4984
	
l2705:	
	line	15
	
l4984:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u3701
	goto	u3700
u3701:
	goto	l5002
u3700:
	line	16
	
l4986:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l4992
	
l2708:	
	line	18
	
l4988:	
	movlw	01h
	
u3715:
	lslf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	decfsz	wreg,f
	goto	u3715
	line	19
	
l4990:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l4992
	line	20
	
l2707:	
	line	17
	
l4992:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u3721
	goto	u3720
u3721:
	goto	l4988
u3720:
	goto	l4994
	
l2709:	
	goto	l4994
	line	21
	
l2710:	
	line	22
	
l4994:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u3735
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u3735:
	skipc
	goto	u3731
	goto	u3730
u3731:
	goto	l4998
u3730:
	line	23
	
l4996:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	subwfb	(___awmod@dividend+1),f
	goto	l4998
	
l2711:	
	line	24
	
l4998:	
	movlw	01h
	
u3745:
	lsrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	decfsz	wreg,f
	goto	u3745
	line	25
	
l5000:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u3751
	goto	u3750
u3751:
	goto	l4994
u3750:
	goto	l5002
	
l2712:	
	goto	l5002
	line	26
	
l2706:	
	line	27
	
l5002:	
	movf	(___awmod@sign),w
	skipz
	goto	u3760
	goto	l5006
u3760:
	line	28
	
l5004:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l5006
	
l2713:	
	line	29
	
l5006:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l2714
	
l5008:	
	line	30
	
l2714:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text1400,local,class=CODE,delta=2
global __ptext1400
__ptext1400:

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
;;		_EnDusukDisplay
;;		_EnYuksekDisplay
;;		_DisplayGun
;;		_DisplayAy
;;		_DisplayYil
;;		_show_date_info
;; This function uses a non-reentrant model
;;
psect	text1400
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 14
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l4936:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u3581
	goto	u3580
u3581:
	goto	l4940
u3580:
	line	11
	
l4938:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l4940
	line	13
	
l2636:	
	line	14
	
l4940:	
	btfss	(___awdiv@dividend+1),7
	goto	u3591
	goto	u3590
u3591:
	goto	l4946
u3590:
	line	15
	
l4942:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4944:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l4946
	line	17
	
l2637:	
	line	18
	
l4946:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l4948:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u3601
	goto	u3600
u3601:
	goto	l4968
u3600:
	line	20
	
l4950:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l4956
	
l2640:	
	line	22
	
l4952:	
	movlw	01h
	
u3615:
	lslf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	decfsz	wreg,f
	goto	u3615
	line	23
	
l4954:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l4956
	line	24
	
l2639:	
	line	21
	
l4956:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u3621
	goto	u3620
u3621:
	goto	l4952
u3620:
	goto	l4958
	
l2641:	
	goto	l4958
	line	25
	
l2642:	
	line	26
	
l4958:	
	movlw	01h
	
u3635:
	lslf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	decfsz	wreg,f
	goto	u3635
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u3645
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u3645:
	skipc
	goto	u3641
	goto	u3640
u3641:
	goto	l4964
u3640:
	line	28
	
l4960:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	subwfb	(___awdiv@dividend+1),f
	line	29
	
l4962:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l4964
	line	30
	
l2643:	
	line	31
	
l4964:	
	movlw	01h
	
u3655:
	lsrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	decfsz	wreg,f
	goto	u3655
	line	32
	
l4966:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u3661
	goto	u3660
u3661:
	goto	l4958
u3660:
	goto	l4968
	
l2644:	
	goto	l4968
	line	33
	
l2638:	
	line	34
	
l4968:	
	movf	(___awdiv@sign),w
	skipz
	goto	u3670
	goto	l4972
u3670:
	line	35
	
l4970:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l4972
	
l2645:	
	line	36
	
l4972:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2646
	
l4974:	
	line	37
	
l2646:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text1401,local,class=CODE,delta=2
global __ptext1401
__ptext1401:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_utoa
;; This function uses a non-reentrant model
;;
psect	text1401
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 11
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l4914:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u3521
	goto	u3520
u3521:
	goto	l4932
u3520:
	line	9
	
l4916:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l4922
	
l2514:	
	line	11
	
l4918:	
	movlw	01h
	
u3535:
	lslf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	decfsz	wreg,f
	goto	u3535
	line	12
	
l4920:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l4922
	line	13
	
l2513:	
	line	10
	
l4922:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u3541
	goto	u3540
u3541:
	goto	l4918
u3540:
	goto	l4924
	
l2515:	
	goto	l4924
	line	14
	
l2516:	
	line	15
	
l4924:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u3555
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u3555:
	skipc
	goto	u3551
	goto	u3550
u3551:
	goto	l4928
u3550:
	line	16
	
l4926:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	subwfb	(___lwmod@dividend+1),f
	goto	l4928
	
l2517:	
	line	17
	
l4928:	
	movlw	01h
	
u3565:
	lsrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	decfsz	wreg,f
	goto	u3565
	line	18
	
l4930:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u3571
	goto	u3570
u3571:
	goto	l4924
u3570:
	goto	l4932
	
l2518:	
	goto	l4932
	line	19
	
l2512:	
	line	20
	
l4932:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l2519
	
l4934:	
	line	21
	
l2519:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1402,local,class=CODE,delta=2
global __ptext1402
__ptext1402:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_utoa
;; This function uses a non-reentrant model
;;
psect	text1402
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 11
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l4888:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l4890:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u3451
	goto	u3450
u3451:
	goto	l4910
u3450:
	line	11
	
l4892:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l4898
	
l2504:	
	line	13
	
l4894:	
	movlw	01h
	
u3465:
	lslf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	decfsz	wreg,f
	goto	u3465
	line	14
	
l4896:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l4898
	line	15
	
l2503:	
	line	12
	
l4898:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u3471
	goto	u3470
u3471:
	goto	l4894
u3470:
	goto	l4900
	
l2505:	
	goto	l4900
	line	16
	
l2506:	
	line	17
	
l4900:	
	movlw	01h
	
u3485:
	lslf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	decfsz	wreg,f
	goto	u3485
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u3495
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u3495:
	skipc
	goto	u3491
	goto	u3490
u3491:
	goto	l4906
u3490:
	line	19
	
l4902:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	subwfb	(___lwdiv@dividend+1),f
	line	20
	
l4904:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l4906
	line	21
	
l2507:	
	line	22
	
l4906:	
	movlw	01h
	
u3505:
	lsrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	decfsz	wreg,f
	goto	u3505
	line	23
	
l4908:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u3511
	goto	u3510
u3511:
	goto	l4900
u3510:
	goto	l4910
	
l2508:	
	goto	l4910
	line	24
	
l2502:	
	line	25
	
l4910:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l2509
	
l4912:	
	line	26
	
l2509:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_memset
psect	text1403,local,class=CODE,delta=2
global __ptext1403
__ptext1403:

;; *************** function _memset *****************
;; Defined at:
;;		line 10 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\memset.c"
;; Parameters:    Size  Location     Type
;;  p1              1    wreg     PTR void 
;;		 -> current_buffer(50), 
;;  c               2    0[COMMON] int 
;;  n               2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  p1              1    5[COMMON] PTR void 
;;		 -> current_buffer(50), 
;;  p               1    6[COMMON] PTR unsigned char 
;;		 -> current_buffer(50), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
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
;;		_resetBuffer
;; This function uses a non-reentrant model
;;
psect	text1403
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\memset.c"
	line	10
	global	__size_of_memset
	__size_of_memset	equ	__end_of_memset-_memset
	
_memset:	
	opt	stack 14
; Regs used in _memset: [wreg+fsr1l-status,0]
	line	18
	movwf	(memset@p1)
	
l4828:	
	movf	(memset@p1),w
	movwf	(??_memset+0)+0
	movf	(??_memset+0)+0,w
	movwf	(memset@p)
	line	19
	goto	l4834
	
l2485:	
	line	20
	
l4830:	
	movf	(memset@c),w
	movwf	(??_memset+0)+0
	movf	(memset@p),w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(??_memset+0)+0,w
	movwf	indf1
	
l4832:	
	movlw	(01h)
	movwf	(??_memset+0)+0
	movf	(??_memset+0)+0,w
	addwf	(memset@p),f
	goto	l4834
	
l2484:	
	line	19
	
l4834:	
	movlw	low(01h)
	subwf	(memset@n),f
	movlw	high(01h)
	subwfb	(memset@n+1),f
	movlw	high(0FFFFh)
	xorwf	((memset@n+1)),w
	skipz
	goto	u3315
	movlw	low(0FFFFh)
	xorwf	((memset@n)),w
u3315:

	skipz
	goto	u3311
	goto	u3310
u3311:
	goto	l4830
u3310:
	goto	l2487
	
l2486:	
	line	22
;	Return value of _memset is never used
	
l2487:	
	return
	opt stack 0
GLOBAL	__end_of_memset
	__end_of_memset:
;; =============== function _memset ends ============

	signat	_memset,12409
	global	_EEPROM_ReadByte
psect	text1404,local,class=CODE,delta=2
global __ptext1404
__ptext1404:

;; *************** function _EEPROM_ReadByte *****************
;; Defined at:
;;		line 34 in file "../EEPROM.h"
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
;;		_show_date_info
;;		_loadFromEPPROM
;;		_compareData
;;		_retrive_weather_situations
;; This function uses a non-reentrant model
;;
psect	text1404
	file	"../EEPROM.h"
	line	34
	global	__size_of_EEPROM_ReadByte
	__size_of_EEPROM_ReadByte	equ	__end_of_EEPROM_ReadByte-_EEPROM_ReadByte
	
_EEPROM_ReadByte:	
	opt	stack 14
; Regs used in _EEPROM_ReadByte: [wreg]
	movwf	(EEPROM_ReadByte@address)
	line	35
	
l4818:	
	movlb 3	; select bank3
	bcf	(3247/8)^0180h,(3247)&7
	line	36
	bcf	(3246/8)^0180h,(3246)&7
	line	37
	
l4820:	
	movf	(EEPROM_ReadByte@address),w
	movwf	(401)^0180h	;volatile
	line	38
	
l4822:	
	bsf	(3240/8)^0180h,(3240)&7
	line	39
	goto	l1324
	
l1325:	
	
l1324:	
	btfsc	(3240/8)^0180h,(3240)&7
	goto	u3301
	goto	u3300
u3301:
	goto	l1324
u3300:
	
l1326:	
	line	40
	movlb 0	; select bank0
	bcf	(148/8),(148)&7
	line	41
	
l4824:	
	movlb 3	; select bank3
	movf	(403)^0180h,w	;volatile
	goto	l1327
	
l4826:	
	line	42
	
l1327:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_ReadByte
	__end_of_EEPROM_ReadByte:
;; =============== function _EEPROM_ReadByte ends ============

	signat	_EEPROM_ReadByte,4217
	global	_EEPROM_WriteByte
psect	text1405,local,class=CODE,delta=2
global __ptext1405
__ptext1405:

;; *************** function _EEPROM_WriteByte *****************
;; Defined at:
;;		line 12 in file "../EEPROM.h"
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
;;		_saveToEEPROM
;;		_retrive_weather_situations
;; This function uses a non-reentrant model
;;
psect	text1405
	file	"../EEPROM.h"
	line	12
	global	__size_of_EEPROM_WriteByte
	__size_of_EEPROM_WriteByte	equ	__end_of_EEPROM_WriteByte-_EEPROM_WriteByte
	
_EEPROM_WriteByte:	
	opt	stack 14
; Regs used in _EEPROM_WriteByte: [wreg]
	movwf	(EEPROM_WriteByte@address)
	line	13
	
l4810:	
	movlb 3	; select bank3
	bcf	(3247/8)^0180h,(3247)&7
	line	14
	bcf	(3246/8)^0180h,(3246)&7
	line	15
	
l4812:	
	movf	(EEPROM_WriteByte@value),w
	movwf	(403)^0180h	;volatile
	line	16
	movf	(EEPROM_WriteByte@address),w
	movwf	(401)^0180h	;volatile
	line	18
	
l4814:	
	bsf	(3242/8)^0180h,(3242)&7
	line	20
	movlw	(055h)
	movwf	(406)^0180h	;volatile
	line	21
	movlw	(0AAh)
	movwf	(406)^0180h	;volatile
	line	23
	
l4816:	
	bsf	(3241/8)^0180h,(3241)&7
	line	25
	goto	l1318
	
l1319:	
	
l1318:	
	btfsc	(3241/8)^0180h,(3241)&7
	goto	u3291
	goto	u3290
u3291:
	goto	l1318
u3290:
	
l1320:	
	line	29
	movlb 0	; select bank0
	bcf	(148/8),(148)&7
	line	30
	movlb 3	; select bank3
	bcf	(3242/8)^0180h,(3242)&7
	line	31
	
l1321:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_WriteByte
	__end_of_EEPROM_WriteByte:
;; =============== function _EEPROM_WriteByte ends ============

	signat	_EEPROM_WriteByte,8312
	global	_UART_init
psect	text1406,local,class=CODE,delta=2
global __ptext1406
__ptext1406:

;; *************** function _UART_init *****************
;; Defined at:
;;		line 22 in file "../UART.h"
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
psect	text1406
	file	"../UART.h"
	line	22
	global	__size_of_UART_init
	__size_of_UART_init	equ	__end_of_UART_init-_UART_init
	
_UART_init:	
	opt	stack 15
; Regs used in _UART_init: [wreg]
	line	24
	
l4796:	
	movlb 3	; select bank3
	bcf	(3169/8)^0180h,(3169)&7
	line	25
	movlb 1	; select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	27
	movlb 3	; select bank3
	bcf	(3168/8)^0180h,(3168)&7
	line	28
	movlb 1	; select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	31
	movlb 3	; select bank3
	bcf	(3316/8)^0180h,(3316)&7
	line	33
	bsf	(3314/8)^0180h,(3314)&7
	line	34
	bcf	(3323/8)^0180h,(3323)&7
	line	35
	
l4798:	
	movlw	(019h)
	movwf	(411)^0180h	;volatile
	line	37
	
l4800:	
	bsf	(3308/8)^0180h,(3308)&7
	line	39
	
l4802:	
	bsf	(3311/8)^0180h,(3311)&7
	line	40
	
l4804:	
	bsf	(3317/8)^0180h,(3317)&7
	line	43
	
l4806:	
	movlb 1	; select bank1
	bcf	(1165/8)^080h,(1165)&7
	line	44
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	line	49
	
l1300:	
	return
	opt stack 0
GLOBAL	__end_of_UART_init
	__end_of_UART_init:
;; =============== function _UART_init ends ============

	signat	_UART_init,88
	global	_UART_byte_receive
psect	text1407,local,class=CODE,delta=2
global __ptext1407
__ptext1407:

;; *************** function _UART_byte_receive *****************
;; Defined at:
;;		line 13 in file "../UART.h"
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
;;		_UARTReadString
;;		_retrive_weather_situations
;; This function uses a non-reentrant model
;;
psect	text1407
	file	"../UART.h"
	line	13
	global	__size_of_UART_byte_receive
	__size_of_UART_byte_receive	equ	__end_of_UART_byte_receive-_UART_byte_receive
	
_UART_byte_receive:	
	opt	stack 12
; Regs used in _UART_byte_receive: [wreg]
	line	14
	
l4790:	
	goto	l1294
	
l1295:	
	
l1294:	
	movlb 0	; select bank0
	btfss	(141/8),(141)&7
	goto	u3271
	goto	u3270
u3271:
	goto	l1294
u3270:
	goto	l4792
	
l1296:	
	line	15
	
l4792:	
	movlb 3	; select bank3
	movf	(409)^0180h,w	;volatile
	goto	l1297
	
l4794:	
	line	17
	
l1297:	
	return
	opt stack 0
GLOBAL	__end_of_UART_byte_receive
	__end_of_UART_byte_receive:
;; =============== function _UART_byte_receive ends ============

	signat	_UART_byte_receive,89
	global	_UART_byte_send
psect	text1408,local,class=CODE,delta=2
global __ptext1408
__ptext1408:

;; *************** function _UART_byte_send *****************
;; Defined at:
;;		line 5 in file "../UART.h"
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
;;		_UARTReadString
;;		_UARTSendString
;;		_retrive_weather_situations
;; This function uses a non-reentrant model
;;
psect	text1408
	file	"../UART.h"
	line	5
	global	__size_of_UART_byte_send
	__size_of_UART_byte_send	equ	__end_of_UART_byte_send-_UART_byte_send
	
_UART_byte_send:	
	opt	stack 12
; Regs used in _UART_byte_send: [wreg]
	movwf	(UART_byte_send@data)
	line	6
	
l4786:	
	goto	l1288
	
l1289:	
	
l1288:	
	movlb 0	; select bank0
	btfss	(140/8),(140)&7
	goto	u3261
	goto	u3260
u3261:
	goto	l1288
u3260:
	goto	l4788
	
l1290:	
	line	7
	
l4788:	
	movf	(UART_byte_send@data),w
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	10
	
l1291:	
	return
	opt stack 0
GLOBAL	__end_of_UART_byte_send
	__end_of_UART_byte_send:
;; =============== function _UART_byte_send ends ============

	signat	_UART_byte_send,4216
psect	text1409,local,class=CODE,delta=2
global __ptext1409
__ptext1409:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
