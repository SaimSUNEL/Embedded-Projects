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
	FNCALL	_main,_seri_portu_ayarla
	FNCALL	_main,_I2C_Master_ayarla
	FNCALL	_main,_seri_porta_veri_gonder
	FNCALL	_main,_DS1307_saniye_ayarla
	FNCALL	_main,_DS1307_dakika_ayarla
	FNCALL	_main,_DS1307_saat_ayarla
	FNCALL	_main,_DS1307_gun_ayarla
	FNCALL	_main,_DS1307_ay_ayarla
	FNCALL	_main,_DS1307_yil_ayarla
	FNCALL	_main,_DS1307_dakika
	FNCALL	_main,_DS1307_saat
	FNCALL	_main,_DS1307_gun
	FNCALL	_main,_DS1307_ay
	FNCALL	_main,_DS1307_yil
	FNCALL	_main,_DS1307_saniye
	FNCALL	_DS1307_yil_ayarla,_I2C_Start
	FNCALL	_DS1307_yil_ayarla,_I2C_gonder
	FNCALL	_DS1307_yil_ayarla,___awdiv
	FNCALL	_DS1307_yil_ayarla,___bmul
	FNCALL	_DS1307_yil_ayarla,_I2C_Stop
	FNCALL	_DS1307_ay_ayarla,_I2C_Start
	FNCALL	_DS1307_ay_ayarla,_I2C_gonder
	FNCALL	_DS1307_ay_ayarla,___awdiv
	FNCALL	_DS1307_ay_ayarla,___bmul
	FNCALL	_DS1307_ay_ayarla,_I2C_Stop
	FNCALL	_DS1307_gun_ayarla,_I2C_Start
	FNCALL	_DS1307_gun_ayarla,_I2C_gonder
	FNCALL	_DS1307_gun_ayarla,___awdiv
	FNCALL	_DS1307_gun_ayarla,___bmul
	FNCALL	_DS1307_gun_ayarla,_I2C_Stop
	FNCALL	_DS1307_saniye_ayarla,_I2C_Start
	FNCALL	_DS1307_saniye_ayarla,_I2C_gonder
	FNCALL	_DS1307_saniye_ayarla,___awdiv
	FNCALL	_DS1307_saniye_ayarla,___bmul
	FNCALL	_DS1307_saniye_ayarla,_I2C_Stop
	FNCALL	_DS1307_saat_ayarla,_I2C_Start
	FNCALL	_DS1307_saat_ayarla,_I2C_gonder
	FNCALL	_DS1307_saat_ayarla,___awdiv
	FNCALL	_DS1307_saat_ayarla,___bmul
	FNCALL	_DS1307_saat_ayarla,_I2C_Stop
	FNCALL	_DS1307_dakika_ayarla,_I2C_Start
	FNCALL	_DS1307_dakika_ayarla,_I2C_gonder
	FNCALL	_DS1307_dakika_ayarla,___awdiv
	FNCALL	_DS1307_dakika_ayarla,___bmul
	FNCALL	_DS1307_dakika_ayarla,_I2C_Stop
	FNCALL	_DS1307_yil,_I2C_Start
	FNCALL	_DS1307_yil,_I2C_gonder
	FNCALL	_DS1307_yil,_I2C_Stop
	FNCALL	_DS1307_yil,_I2C_oku
	FNCALL	_DS1307_yil,___bmul
	FNCALL	_DS1307_yil,_Send_NACK
	FNCALL	_DS1307_gun,_I2C_Start
	FNCALL	_DS1307_gun,_I2C_gonder
	FNCALL	_DS1307_gun,_I2C_Stop
	FNCALL	_DS1307_gun,_I2C_oku
	FNCALL	_DS1307_gun,___bmul
	FNCALL	_DS1307_gun,_Send_NACK
	FNCALL	_DS1307_ay,_I2C_Start
	FNCALL	_DS1307_ay,_I2C_gonder
	FNCALL	_DS1307_ay,_I2C_Stop
	FNCALL	_DS1307_ay,_I2C_oku
	FNCALL	_DS1307_ay,___bmul
	FNCALL	_DS1307_ay,_Send_NACK
	FNCALL	_DS1307_saat,_I2C_Start
	FNCALL	_DS1307_saat,_I2C_gonder
	FNCALL	_DS1307_saat,_I2C_Stop
	FNCALL	_DS1307_saat,_I2C_oku
	FNCALL	_DS1307_saat,___bmul
	FNCALL	_DS1307_saat,_Send_NACK
	FNCALL	_DS1307_dakika,_I2C_Start
	FNCALL	_DS1307_dakika,_I2C_gonder
	FNCALL	_DS1307_dakika,_I2C_Stop
	FNCALL	_DS1307_dakika,_I2C_oku
	FNCALL	_DS1307_dakika,___bmul
	FNCALL	_DS1307_dakika,_Send_NACK
	FNCALL	_DS1307_saniye,_I2C_Start
	FNCALL	_DS1307_saniye,_I2C_gonder
	FNCALL	_DS1307_saniye,_I2C_Stop
	FNCALL	_DS1307_saniye,_I2C_oku
	FNCALL	_DS1307_saniye,___bmul
	FNCALL	_DS1307_saniye,_Send_NACK
	FNCALL	_seri_porta_veri_gonder,_seri_port
	FNROOT	_main
	global	_gelen_veri
	global	_ay
	global	_dakika
	global	_gun
	global	_saat
	global	_saniye
	global	_yil
	global	_veri
	global	_RCREG
psect	text520,local,class=CODE,delta=2
global __ptext520
__ptext520:
_RCREG	set	26
	global	_SSPBUF
_SSPBUF	set	19
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_RCIF
_RCIF	set	101
	global	_RX9
_RX9	set	198
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
	global	_SSPADD
_SSPADD	set	147
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_BRGH
_BRGH	set	1218
	global	_CKE
_CKE	set	1190
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_SEN
_SEN	set	1160
	global	_SMP
_SMP	set	1191
	global	_SYNC
_SYNC	set	1220
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
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

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_gelen_veri:
       ds      8

_ay:
       ds      2

_dakika:
       ds      2

_gun:
       ds      2

_saat:
       ds      2

_saniye:
       ds      2

_yil:
       ds      2

_veri:
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
	movlw	low((__pbssBANK0)+015h)
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
	global	?_seri_port
?_seri_port:	; 0 bytes @ 0x0
	global	??_seri_port
??_seri_port:	; 0 bytes @ 0x0
	global	?_seri_portu_ayarla
?_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	??_seri_portu_ayarla
??_seri_portu_ayarla:	; 0 bytes @ 0x0
	global	??_I2C_Start
??_I2C_Start:	; 0 bytes @ 0x0
	global	??_I2C_Stop
??_I2C_Stop:	; 0 bytes @ 0x0
	global	??_I2C_gonder
??_I2C_gonder:	; 0 bytes @ 0x0
	global	??_I2C_oku
??_I2C_oku:	; 0 bytes @ 0x0
	global	??_I2C_Master_ayarla
??_I2C_Master_ayarla:	; 0 bytes @ 0x0
	global	?_Send_NACK
?_Send_NACK:	; 0 bytes @ 0x0
	global	??_Send_NACK
??_Send_NACK:	; 0 bytes @ 0x0
	global	?_DS1307_dakika_ayarla
?_DS1307_dakika_ayarla:	; 0 bytes @ 0x0
	global	?_DS1307_saat_ayarla
?_DS1307_saat_ayarla:	; 0 bytes @ 0x0
	global	?_DS1307_saniye_ayarla
?_DS1307_saniye_ayarla:	; 0 bytes @ 0x0
	global	?_DS1307_gun_ayarla
?_DS1307_gun_ayarla:	; 0 bytes @ 0x0
	global	?_DS1307_ay_ayarla
?_DS1307_ay_ayarla:	; 0 bytes @ 0x0
	global	?_DS1307_yil_ayarla
?_DS1307_yil_ayarla:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_I2C_oku
?_I2C_oku:	; 1 bytes @ 0x0
	global	?_DS1307_ay
?_DS1307_ay:	; 1 bytes @ 0x0
	global	?_DS1307_gun
?_DS1307_gun:	; 1 bytes @ 0x0
	global	?_DS1307_yil
?_DS1307_yil:	; 1 bytes @ 0x0
	global	?_I2C_Start
?_I2C_Start:	; 2 bytes @ 0x0
	global	?_I2C_Stop
?_I2C_Stop:	; 2 bytes @ 0x0
	global	?_I2C_gonder
?_I2C_gonder:	; 2 bytes @ 0x0
	global	?_I2C_Master_ayarla
?_I2C_Master_ayarla:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	seri_port@jk
seri_port@jk:	; 1 bytes @ 0x0
	global	I2C_gonder@veri
I2C_gonder@veri:	; 1 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	ds	1
	global	?_seri_porta_veri_gonder
?_seri_porta_veri_gonder:	; 0 bytes @ 0x1
	global	seri_porta_veri_gonder@number
seri_porta_veri_gonder@number:	; 2 bytes @ 0x1
	ds	1
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_seri_porta_veri_gonder
??_seri_porta_veri_gonder:	; 0 bytes @ 0x3
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	?___bmul
?___bmul:	; 1 bytes @ 0x9
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x9
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0xA
	ds	1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0xB
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0xC
	ds	1
	global	DS1307_dakika_ayarla@value
DS1307_dakika_ayarla@value:	; 1 bytes @ 0xD
	global	DS1307_saat_ayarla@value
DS1307_saat_ayarla@value:	; 1 bytes @ 0xD
	global	DS1307_saniye_ayarla@value
DS1307_saniye_ayarla@value:	; 1 bytes @ 0xD
	global	DS1307_gun_ayarla@value
DS1307_gun_ayarla@value:	; 1 bytes @ 0xD
	global	DS1307_ay_ayarla@value
DS1307_ay_ayarla@value:	; 1 bytes @ 0xD
	global	DS1307_yil_ayarla@value
DS1307_yil_ayarla@value:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_DS1307_ay
??_DS1307_ay:	; 0 bytes @ 0x0
	global	??_DS1307_gun
??_DS1307_gun:	; 0 bytes @ 0x0
	global	??_DS1307_yil
??_DS1307_yil:	; 0 bytes @ 0x0
	global	??_DS1307_dakika_ayarla
??_DS1307_dakika_ayarla:	; 0 bytes @ 0x0
	global	??_DS1307_saat_ayarla
??_DS1307_saat_ayarla:	; 0 bytes @ 0x0
	global	??_DS1307_saniye_ayarla
??_DS1307_saniye_ayarla:	; 0 bytes @ 0x0
	global	??_DS1307_gun_ayarla
??_DS1307_gun_ayarla:	; 0 bytes @ 0x0
	global	??_DS1307_ay_ayarla
??_DS1307_ay_ayarla:	; 0 bytes @ 0x0
	global	??_DS1307_yil_ayarla
??_DS1307_yil_ayarla:	; 0 bytes @ 0x0
	global	?_DS1307_saniye
?_DS1307_saniye:	; 2 bytes @ 0x0
	global	?_DS1307_dakika
?_DS1307_dakika:	; 2 bytes @ 0x0
	global	?_DS1307_saat
?_DS1307_saat:	; 2 bytes @ 0x0
	ds	2
	global	??_DS1307_saniye
??_DS1307_saniye:	; 0 bytes @ 0x2
	global	??_DS1307_dakika
??_DS1307_dakika:	; 0 bytes @ 0x2
	global	??_DS1307_saat
??_DS1307_saat:	; 0 bytes @ 0x2
	ds	5
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 21, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     10      31
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?_DS1307_saat	int  size(1) Largest target is 0
;;
;; ?_DS1307_dakika	int  size(1) Largest target is 0
;;
;; ?_DS1307_saniye	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DS1307_saniye_ayarla
;;   _main->_DS1307_dakika_ayarla
;;   _main->_DS1307_saat_ayarla
;;   _main->_DS1307_gun_ayarla
;;   _main->_DS1307_ay_ayarla
;;   _main->_DS1307_yil_ayarla
;;   _DS1307_yil_ayarla->___bmul
;;   _DS1307_ay_ayarla->___bmul
;;   _DS1307_gun_ayarla->___bmul
;;   _DS1307_saniye_ayarla->___bmul
;;   _DS1307_saat_ayarla->___bmul
;;   _DS1307_dakika_ayarla->___bmul
;;   _DS1307_yil->___bmul
;;   _DS1307_gun->___bmul
;;   _DS1307_ay->___bmul
;;   _DS1307_saat->___bmul
;;   _DS1307_dakika->___bmul
;;   _DS1307_saniye->___bmul
;;   _seri_porta_veri_gonder->_seri_port
;;   ___bmul->___awdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_DS1307_saniye_ayarla
;;   _main->_DS1307_dakika_ayarla
;;   _main->_DS1307_saat_ayarla
;;   _main->_DS1307_gun_ayarla
;;   _main->_DS1307_ay_ayarla
;;   _main->_DS1307_yil_ayarla
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0    3768
;;                                              7 BANK0      3     3      0
;;                  _seri_portu_ayarla
;;                  _I2C_Master_ayarla
;;             _seri_porta_veri_gonder
;;               _DS1307_saniye_ayarla
;;               _DS1307_dakika_ayarla
;;                 _DS1307_saat_ayarla
;;                  _DS1307_gun_ayarla
;;                   _DS1307_ay_ayarla
;;                  _DS1307_yil_ayarla
;;                      _DS1307_dakika
;;                        _DS1307_saat
;;                         _DS1307_gun
;;                          _DS1307_ay
;;                         _DS1307_yil
;;                      _DS1307_saniye
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_yil_ayarla                                    8     8      0     503
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      7     7      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                            ___awdiv
;;                             ___bmul
;;                           _I2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_ay_ayarla                                     8     8      0     503
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      7     7      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                            ___awdiv
;;                             ___bmul
;;                           _I2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_gun_ayarla                                    8     8      0     503
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      7     7      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                            ___awdiv
;;                             ___bmul
;;                           _I2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_saniye_ayarla                                 8     8      0     503
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      7     7      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                            ___awdiv
;;                             ___bmul
;;                           _I2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_saat_ayarla                                   8     8      0     503
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      7     7      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                            ___awdiv
;;                             ___bmul
;;                           _I2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_dakika_ayarla                                 8     8      0     503
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      7     7      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                            ___awdiv
;;                             ___bmul
;;                           _I2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_yil                                           4     4      0     114
;;                                              0 BANK0      4     4      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                           _I2C_Stop
;;                            _I2C_oku
;;                             ___bmul
;;                          _Send_NACK
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_gun                                           4     4      0     114
;;                                              0 BANK0      4     4      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                           _I2C_Stop
;;                            _I2C_oku
;;                             ___bmul
;;                          _Send_NACK
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_ay                                            4     4      0     114
;;                                              0 BANK0      4     4      0
;;                          _I2C_Start
;;                         _I2C_gonder
;;                           _I2C_Stop
;;                            _I2C_oku
;;                             ___bmul
;;                          _Send_NACK
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_saat                                          6     4      2     114
;;                                              0 BANK0      6     4      2
;;                          _I2C_Start
;;                         _I2C_gonder
;;                           _I2C_Stop
;;                            _I2C_oku
;;                             ___bmul
;;                          _Send_NACK
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_dakika                                        6     4      2     114
;;                                              0 BANK0      6     4      2
;;                          _I2C_Start
;;                         _I2C_gonder
;;                           _I2C_Stop
;;                            _I2C_oku
;;                             ___bmul
;;                          _Send_NACK
;; ---------------------------------------------------------------------------------
;; (1) _DS1307_saniye                                        6     4      2     114
;;                                              0 BANK0      6     4      2
;;                          _I2C_Start
;;                         _I2C_gonder
;;                           _I2C_Stop
;;                            _I2C_oku
;;                             ___bmul
;;                          _Send_NACK
;; ---------------------------------------------------------------------------------
;; (1) _seri_porta_veri_gonder                               4     2      2      66
;;                                              1 COMMON     4     2      2
;;                          _seri_port
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               4     3      1      92
;;                                              9 COMMON     4     3      1
;;                            ___awdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _Send_NACK                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Master_ayarla                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _I2C_oku                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _I2C_gonder                                           1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Stop                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _seri_portu_ayarla                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _seri_port                                            1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _seri_portu_ayarla
;;   _I2C_Master_ayarla
;;   _seri_porta_veri_gonder
;;     _seri_port
;;   _DS1307_saniye_ayarla
;;     _I2C_Start
;;     _I2C_gonder
;;     ___awdiv
;;     ___bmul
;;       ___awdiv (ARG)
;;     _I2C_Stop
;;   _DS1307_dakika_ayarla
;;     _I2C_Start
;;     _I2C_gonder
;;     ___awdiv
;;     ___bmul
;;       ___awdiv (ARG)
;;     _I2C_Stop
;;   _DS1307_saat_ayarla
;;     _I2C_Start
;;     _I2C_gonder
;;     ___awdiv
;;     ___bmul
;;       ___awdiv (ARG)
;;     _I2C_Stop
;;   _DS1307_gun_ayarla
;;     _I2C_Start
;;     _I2C_gonder
;;     ___awdiv
;;     ___bmul
;;       ___awdiv (ARG)
;;     _I2C_Stop
;;   _DS1307_ay_ayarla
;;     _I2C_Start
;;     _I2C_gonder
;;     ___awdiv
;;     ___bmul
;;       ___awdiv (ARG)
;;     _I2C_Stop
;;   _DS1307_yil_ayarla
;;     _I2C_Start
;;     _I2C_gonder
;;     ___awdiv
;;     ___bmul
;;       ___awdiv (ARG)
;;     _I2C_Stop
;;   _DS1307_dakika
;;     _I2C_Start
;;     _I2C_gonder
;;     _I2C_Stop
;;     _I2C_oku
;;     ___bmul
;;       ___awdiv (ARG)
;;     _Send_NACK
;;   _DS1307_saat
;;     _I2C_Start
;;     _I2C_gonder
;;     _I2C_Stop
;;     _I2C_oku
;;     ___bmul
;;       ___awdiv (ARG)
;;     _Send_NACK
;;   _DS1307_gun
;;     _I2C_Start
;;     _I2C_gonder
;;     _I2C_Stop
;;     _I2C_oku
;;     ___bmul
;;       ___awdiv (ARG)
;;     _Send_NACK
;;   _DS1307_ay
;;     _I2C_Start
;;     _I2C_gonder
;;     _I2C_Stop
;;     _I2C_oku
;;     ___bmul
;;       ___awdiv (ARG)
;;     _Send_NACK
;;   _DS1307_yil
;;     _I2C_Start
;;     _I2C_gonder
;;     _I2C_Stop
;;     _I2C_oku
;;     ___bmul
;;       ___awdiv (ARG)
;;     _Send_NACK
;;   _DS1307_saniye
;;     _I2C_Start
;;     _I2C_gonder
;;     _I2C_Stop
;;     _I2C_oku
;;     ___bmul
;;       ___awdiv (ARG)
;;     _Send_NACK
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      2D       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      A      1F       5       38.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      2F      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 348 in file "../DS1307RTCwithPIC.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_seri_portu_ayarla
;;		_I2C_Master_ayarla
;;		_seri_porta_veri_gonder
;;		_DS1307_saniye_ayarla
;;		_DS1307_dakika_ayarla
;;		_DS1307_saat_ayarla
;;		_DS1307_gun_ayarla
;;		_DS1307_ay_ayarla
;;		_DS1307_yil_ayarla
;;		_DS1307_dakika
;;		_DS1307_saat
;;		_DS1307_gun
;;		_DS1307_ay
;;		_DS1307_yil
;;		_DS1307_saniye
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../DS1307RTCwithPIC.c"
	line	348
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	349
	
l3700:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	350
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	351
	
l3702:	
	fcall	_seri_portu_ayarla
	line	353
	
l3704:	
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u2757:
	decfsz	((??_main+0)+0),f
	goto	u2757
	decfsz	((??_main+0)+0+1),f
	goto	u2757
	nop2
opt asmopt_on

	line	354
	
l3706:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	355
	
l3708:	
	bsf	(1084/8)^080h,(1084)&7
	line	356
	
l3710:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	357
	
l3712:	
	bcf	(60/8),(60)&7
	line	359
	
l3714:	
	fcall	_I2C_Master_ayarla
	line	360
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u2767:
	decfsz	((??_main+0)+0),f
	goto	u2767
	decfsz	((??_main+0)+0+1),f
	goto	u2767
	nop2
opt asmopt_on

	line	361
	
l3716:	
	movlw	low(04Dh)
	movwf	(?_seri_porta_veri_gonder)
	movlw	high(04Dh)
	movwf	((?_seri_porta_veri_gonder))+1
	fcall	_seri_porta_veri_gonder
	line	362
	
l3718:	
	movlw	low(074h)
	movwf	(?_seri_porta_veri_gonder)
	movlw	high(074h)
	movwf	((?_seri_porta_veri_gonder))+1
	fcall	_seri_porta_veri_gonder
	line	363
	
l3720:	
	movlw	low(054h)
	movwf	(?_seri_porta_veri_gonder)
	movlw	high(054h)
	movwf	((?_seri_porta_veri_gonder))+1
	fcall	_seri_porta_veri_gonder
	line	364
	
l3722:	
	movlw	(017h)
	fcall	_DS1307_saniye_ayarla
	line	365
	
l3724:	
	movlw	(017h)
	fcall	_DS1307_dakika_ayarla
	line	366
	
l3726:	
	movlw	(017h)
	fcall	_DS1307_saat_ayarla
	line	367
	
l3728:	
	movlw	(017h)
	fcall	_DS1307_gun_ayarla
	line	368
	
l3730:	
	movlw	(0Ch)
	fcall	_DS1307_ay_ayarla
	line	369
	
l3732:	
	movlw	(017h)
	fcall	_DS1307_yil_ayarla
	line	371
	
l3734:	
	movlw	low(054h)
	movwf	(?_seri_porta_veri_gonder)
	movlw	high(054h)
	movwf	((?_seri_porta_veri_gonder))+1
	fcall	_seri_porta_veri_gonder
	line	374
	
l3736:	
	fcall	_DS1307_dakika
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_DS1307_dakika)),w
	clrf	(_dakika+1)
	addwf	(_dakika+1)
	movf	(0+(?_DS1307_dakika)),w
	clrf	(_dakika)
	addwf	(_dakika)

	line	375
	
l3738:	
	movf	(_dakika+1),w
	clrf	(?_seri_porta_veri_gonder+1)
	addwf	(?_seri_porta_veri_gonder+1)
	movf	(_dakika),w
	clrf	(?_seri_porta_veri_gonder)
	addwf	(?_seri_porta_veri_gonder)

	fcall	_seri_porta_veri_gonder
	line	380
	
l3740:	
	fcall	_DS1307_saat
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_DS1307_saat)),w
	clrf	(_saat+1)
	addwf	(_saat+1)
	movf	(0+(?_DS1307_saat)),w
	clrf	(_saat)
	addwf	(_saat)

	line	381
	
l3742:	
	movf	(_saat+1),w
	clrf	(?_seri_porta_veri_gonder+1)
	addwf	(?_seri_porta_veri_gonder+1)
	movf	(_saat),w
	clrf	(?_seri_porta_veri_gonder)
	addwf	(?_seri_porta_veri_gonder)

	fcall	_seri_porta_veri_gonder
	line	383
	
l3744:	
	fcall	_DS1307_gun
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_gun)
	movf	1+(??_main+0)+0,w
	movwf	(_gun+1)
	line	384
	
l3746:	
	fcall	_DS1307_ay
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_ay)
	movf	1+(??_main+0)+0,w
	movwf	(_ay+1)
	line	385
	
l3748:	
	fcall	_DS1307_yil
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(_yil)
	movf	1+(??_main+0)+0,w
	movwf	(_yil+1)
	goto	l3750
	line	386
	
l790:	
	line	388
	
l3750:	
	movlw	1<<((48)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((48)/8),f
	line	389
	fcall	_DS1307_saniye
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_DS1307_saniye)),w
	clrf	(_saniye+1)
	addwf	(_saniye+1)
	movf	(0+(?_DS1307_saniye)),w
	clrf	(_saniye)
	addwf	(_saniye)

	line	390
	movf	(_saniye+1),w
	clrf	(?_seri_porta_veri_gonder+1)
	addwf	(?_seri_porta_veri_gonder+1)
	movf	(_saniye),w
	clrf	(?_seri_porta_veri_gonder)
	addwf	(?_seri_porta_veri_gonder)

	fcall	_seri_porta_veri_gonder
	line	391
	
l3752:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_saniye+1)),w
	iorwf	((_saniye)),w
	skipz
	goto	u2731
	goto	u2730
u2731:
	goto	l3760
u2730:
	line	393
	
l3754:	
	fcall	_DS1307_dakika
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_DS1307_dakika)),w
	clrf	(_dakika+1)
	addwf	(_dakika+1)
	movf	(0+(?_DS1307_dakika)),w
	clrf	(_dakika)
	addwf	(_dakika)

	line	394
	movf	(_dakika+1),w
	clrf	(?_seri_porta_veri_gonder+1)
	addwf	(?_seri_porta_veri_gonder+1)
	movf	(_dakika),w
	clrf	(?_seri_porta_veri_gonder)
	addwf	(?_seri_porta_veri_gonder)

	fcall	_seri_porta_veri_gonder
	line	395
	
l3756:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_dakika+1)),w
	iorwf	((_dakika)),w
	skipz
	goto	u2741
	goto	u2740
u2741:
	goto	l3760
u2740:
	line	398
	
l3758:	
	fcall	_DS1307_saat
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_DS1307_saat)),w
	clrf	(_saat+1)
	addwf	(_saat+1)
	movf	(0+(?_DS1307_saat)),w
	clrf	(_saat)
	addwf	(_saat)

	line	399
	movf	(_saat+1),w
	clrf	(?_seri_porta_veri_gonder+1)
	addwf	(?_seri_porta_veri_gonder+1)
	movf	(_saat),w
	clrf	(?_seri_porta_veri_gonder)
	addwf	(?_seri_porta_veri_gonder)

	fcall	_seri_porta_veri_gonder
	goto	l3760
	line	402
	
l792:	
	goto	l3760
	line	405
	
l791:	
	line	408
	
l3760:	
	opt asmopt_off
movlw  5
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	145
movwf	((??_main+0)+0+1),f
	movlw	210
movwf	((??_main+0)+0),f
u2777:
	decfsz	((??_main+0)+0),f
	goto	u2777
	decfsz	((??_main+0)+0+1),f
	goto	u2777
	decfsz	((??_main+0)+0+2),f
	goto	u2777
	nop2
opt asmopt_on

	goto	l3750
	line	413
	
l793:	
	line	386
	goto	l3750
	
l794:	
	line	416
	
l795:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DS1307_yil_ayarla
psect	text521,local,class=CODE,delta=2
global __ptext521
__ptext521:

;; *************** function _DS1307_yil_ayarla *****************
;; Defined at:
;;		line 330 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       7       0       0       0
;;      Totals:         1       7       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		___awdiv
;;		___bmul
;;		_I2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text521
	file	"../DS1307RTCwithPIC.c"
	line	330
	global	__size_of_DS1307_yil_ayarla
	__size_of_DS1307_yil_ayarla	equ	__end_of_DS1307_yil_ayarla-_DS1307_yil_ayarla
	
_DS1307_yil_ayarla:	
	opt	stack 6
; Regs used in _DS1307_yil_ayarla: [wreg+status,2+status,0+pclath+cstack]
	movwf	(DS1307_yil_ayarla@value)
	line	331
	
l3690:	
	fcall	_I2C_Start
	line	332
	
l3692:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	333
	
l3694:	
	movlw	(06h)
	fcall	_I2C_gonder
	line	335
	
l3696:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DS1307_yil_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_yil_ayarla+0)+0
	clrf	(??_DS1307_yil_ayarla+0)+0+1
	movf	0+(??_DS1307_yil_ayarla+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_yil_ayarla+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_yil_ayarla+2)+0
	movlw	04h
u2725:
	clrc
	rlf	(??_DS1307_yil_ayarla+2)+0,f
	addlw	-1
	skipz
	goto	u2725
	movlw	(0Ah)
	movwf	(??_DS1307_yil_ayarla+3)+0
	movf	(??_DS1307_yil_ayarla+3)+0,w
	movwf	(?___bmul)
	movf	(DS1307_yil_ayarla@value),w
	movwf	(??_DS1307_yil_ayarla+4)+0
	clrf	(??_DS1307_yil_ayarla+4)+0+1
	movf	0+(??_DS1307_yil_ayarla+4)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_yil_ayarla+4)+0,w
	movwf	1+(?___awdiv)+02h
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	addwf	(DS1307_yil_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	0+(??_DS1307_yil_ayarla+2)+0,w
	movwf	(??_DS1307_yil_ayarla+6)+0
	movf	(??_DS1307_yil_ayarla+6)+0,w
	movwf	(DS1307_yil_ayarla@value)
	line	336
	
l3698:	
	movf	(DS1307_yil_ayarla@value),w
	fcall	_I2C_gonder
	line	337
	fcall	_I2C_Stop
	line	342
	
l787:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_yil_ayarla
	__end_of_DS1307_yil_ayarla:
;; =============== function _DS1307_yil_ayarla ends ============

	signat	_DS1307_yil_ayarla,4216
	global	_DS1307_ay_ayarla
psect	text522,local,class=CODE,delta=2
global __ptext522
__ptext522:

;; *************** function _DS1307_ay_ayarla *****************
;; Defined at:
;;		line 315 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       7       0       0       0
;;      Totals:         1       7       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		___awdiv
;;		___bmul
;;		_I2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text522
	file	"../DS1307RTCwithPIC.c"
	line	315
	global	__size_of_DS1307_ay_ayarla
	__size_of_DS1307_ay_ayarla	equ	__end_of_DS1307_ay_ayarla-_DS1307_ay_ayarla
	
_DS1307_ay_ayarla:	
	opt	stack 6
; Regs used in _DS1307_ay_ayarla: [wreg+status,2+status,0+pclath+cstack]
	movwf	(DS1307_ay_ayarla@value)
	line	316
	
l3680:	
	fcall	_I2C_Start
	line	317
	
l3682:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	318
	
l3684:	
	movlw	(05h)
	fcall	_I2C_gonder
	line	320
	
l3686:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DS1307_ay_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_ay_ayarla+0)+0
	clrf	(??_DS1307_ay_ayarla+0)+0+1
	movf	0+(??_DS1307_ay_ayarla+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_ay_ayarla+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_ay_ayarla+2)+0
	movlw	04h
u2715:
	clrc
	rlf	(??_DS1307_ay_ayarla+2)+0,f
	addlw	-1
	skipz
	goto	u2715
	movlw	(0Ah)
	movwf	(??_DS1307_ay_ayarla+3)+0
	movf	(??_DS1307_ay_ayarla+3)+0,w
	movwf	(?___bmul)
	movf	(DS1307_ay_ayarla@value),w
	movwf	(??_DS1307_ay_ayarla+4)+0
	clrf	(??_DS1307_ay_ayarla+4)+0+1
	movf	0+(??_DS1307_ay_ayarla+4)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_ay_ayarla+4)+0,w
	movwf	1+(?___awdiv)+02h
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	addwf	(DS1307_ay_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	0+(??_DS1307_ay_ayarla+2)+0,w
	movwf	(??_DS1307_ay_ayarla+6)+0
	movf	(??_DS1307_ay_ayarla+6)+0,w
	movwf	(DS1307_ay_ayarla@value)
	line	321
	
l3688:	
	movf	(DS1307_ay_ayarla@value),w
	fcall	_I2C_gonder
	line	322
	fcall	_I2C_Stop
	line	327
	
l784:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_ay_ayarla
	__end_of_DS1307_ay_ayarla:
;; =============== function _DS1307_ay_ayarla ends ============

	signat	_DS1307_ay_ayarla,4216
	global	_DS1307_gun_ayarla
psect	text523,local,class=CODE,delta=2
global __ptext523
__ptext523:

;; *************** function _DS1307_gun_ayarla *****************
;; Defined at:
;;		line 301 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       7       0       0       0
;;      Totals:         1       7       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		___awdiv
;;		___bmul
;;		_I2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text523
	file	"../DS1307RTCwithPIC.c"
	line	301
	global	__size_of_DS1307_gun_ayarla
	__size_of_DS1307_gun_ayarla	equ	__end_of_DS1307_gun_ayarla-_DS1307_gun_ayarla
	
_DS1307_gun_ayarla:	
	opt	stack 6
; Regs used in _DS1307_gun_ayarla: [wreg+status,2+status,0+pclath+cstack]
	movwf	(DS1307_gun_ayarla@value)
	line	302
	
l3670:	
	fcall	_I2C_Start
	line	303
	
l3672:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	304
	
l3674:	
	movlw	(04h)
	fcall	_I2C_gonder
	line	306
	
l3676:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DS1307_gun_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_gun_ayarla+0)+0
	clrf	(??_DS1307_gun_ayarla+0)+0+1
	movf	0+(??_DS1307_gun_ayarla+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_gun_ayarla+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_gun_ayarla+2)+0
	movlw	04h
u2705:
	clrc
	rlf	(??_DS1307_gun_ayarla+2)+0,f
	addlw	-1
	skipz
	goto	u2705
	movlw	(0Ah)
	movwf	(??_DS1307_gun_ayarla+3)+0
	movf	(??_DS1307_gun_ayarla+3)+0,w
	movwf	(?___bmul)
	movf	(DS1307_gun_ayarla@value),w
	movwf	(??_DS1307_gun_ayarla+4)+0
	clrf	(??_DS1307_gun_ayarla+4)+0+1
	movf	0+(??_DS1307_gun_ayarla+4)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_gun_ayarla+4)+0,w
	movwf	1+(?___awdiv)+02h
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	addwf	(DS1307_gun_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	0+(??_DS1307_gun_ayarla+2)+0,w
	movwf	(??_DS1307_gun_ayarla+6)+0
	movf	(??_DS1307_gun_ayarla+6)+0,w
	movwf	(DS1307_gun_ayarla@value)
	line	307
	
l3678:	
	movf	(DS1307_gun_ayarla@value),w
	fcall	_I2C_gonder
	line	308
	fcall	_I2C_Stop
	line	313
	
l781:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_gun_ayarla
	__end_of_DS1307_gun_ayarla:
;; =============== function _DS1307_gun_ayarla ends ============

	signat	_DS1307_gun_ayarla,4216
	global	_DS1307_saniye_ayarla
psect	text524,local,class=CODE,delta=2
global __ptext524
__ptext524:

;; *************** function _DS1307_saniye_ayarla *****************
;; Defined at:
;;		line 283 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       7       0       0       0
;;      Totals:         1       7       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		___awdiv
;;		___bmul
;;		_I2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text524
	file	"../DS1307RTCwithPIC.c"
	line	283
	global	__size_of_DS1307_saniye_ayarla
	__size_of_DS1307_saniye_ayarla	equ	__end_of_DS1307_saniye_ayarla-_DS1307_saniye_ayarla
	
_DS1307_saniye_ayarla:	
	opt	stack 6
; Regs used in _DS1307_saniye_ayarla: [wreg+status,2+status,0+pclath+cstack]
	line	285
	movwf	(DS1307_saniye_ayarla@value)
	
l3660:	
	fcall	_I2C_Start
	line	286
	
l3662:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	287
	
l3664:	
	movlw	(0)
	fcall	_I2C_gonder
	line	289
	
l3666:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DS1307_saniye_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_saniye_ayarla+0)+0
	clrf	(??_DS1307_saniye_ayarla+0)+0+1
	movf	0+(??_DS1307_saniye_ayarla+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_saniye_ayarla+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_saniye_ayarla+2)+0
	movlw	04h
u2695:
	clrc
	rlf	(??_DS1307_saniye_ayarla+2)+0,f
	addlw	-1
	skipz
	goto	u2695
	movlw	(0Ah)
	movwf	(??_DS1307_saniye_ayarla+3)+0
	movf	(??_DS1307_saniye_ayarla+3)+0,w
	movwf	(?___bmul)
	movf	(DS1307_saniye_ayarla@value),w
	movwf	(??_DS1307_saniye_ayarla+4)+0
	clrf	(??_DS1307_saniye_ayarla+4)+0+1
	movf	0+(??_DS1307_saniye_ayarla+4)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_saniye_ayarla+4)+0,w
	movwf	1+(?___awdiv)+02h
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	addwf	(DS1307_saniye_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	0+(??_DS1307_saniye_ayarla+2)+0,w
	movwf	(??_DS1307_saniye_ayarla+6)+0
	movf	(??_DS1307_saniye_ayarla+6)+0,w
	movwf	(DS1307_saniye_ayarla@value)
	line	290
	
l3668:	
	movf	(DS1307_saniye_ayarla@value),w
	fcall	_I2C_gonder
	line	291
	fcall	_I2C_Stop
	line	295
	
l778:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_saniye_ayarla
	__end_of_DS1307_saniye_ayarla:
;; =============== function _DS1307_saniye_ayarla ends ============

	signat	_DS1307_saniye_ayarla,4216
	global	_DS1307_saat_ayarla
psect	text525,local,class=CODE,delta=2
global __ptext525
__ptext525:

;; *************** function _DS1307_saat_ayarla *****************
;; Defined at:
;;		line 265 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       7       0       0       0
;;      Totals:         1       7       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		___awdiv
;;		___bmul
;;		_I2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text525
	file	"../DS1307RTCwithPIC.c"
	line	265
	global	__size_of_DS1307_saat_ayarla
	__size_of_DS1307_saat_ayarla	equ	__end_of_DS1307_saat_ayarla-_DS1307_saat_ayarla
	
_DS1307_saat_ayarla:	
	opt	stack 6
; Regs used in _DS1307_saat_ayarla: [wreg+status,2+status,0+pclath+cstack]
	movwf	(DS1307_saat_ayarla@value)
	line	266
	
l3650:	
	fcall	_I2C_Start
	line	267
	
l3652:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	268
	
l3654:	
	movlw	(02h)
	fcall	_I2C_gonder
	line	270
	
l3656:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DS1307_saat_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_saat_ayarla+0)+0
	clrf	(??_DS1307_saat_ayarla+0)+0+1
	movf	0+(??_DS1307_saat_ayarla+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_saat_ayarla+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_saat_ayarla+2)+0
	movlw	04h
u2685:
	clrc
	rlf	(??_DS1307_saat_ayarla+2)+0,f
	addlw	-1
	skipz
	goto	u2685
	movlw	(0Ah)
	movwf	(??_DS1307_saat_ayarla+3)+0
	movf	(??_DS1307_saat_ayarla+3)+0,w
	movwf	(?___bmul)
	movf	(DS1307_saat_ayarla@value),w
	movwf	(??_DS1307_saat_ayarla+4)+0
	clrf	(??_DS1307_saat_ayarla+4)+0+1
	movf	0+(??_DS1307_saat_ayarla+4)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_saat_ayarla+4)+0,w
	movwf	1+(?___awdiv)+02h
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	addwf	(DS1307_saat_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	0+(??_DS1307_saat_ayarla+2)+0,w
	movwf	(??_DS1307_saat_ayarla+6)+0
	movf	(??_DS1307_saat_ayarla+6)+0,w
	movwf	(DS1307_saat_ayarla@value)
	line	271
	
l3658:	
	movf	(DS1307_saat_ayarla@value),w
	fcall	_I2C_gonder
	line	272
	fcall	_I2C_Stop
	line	277
	
l775:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_saat_ayarla
	__end_of_DS1307_saat_ayarla:
;; =============== function _DS1307_saat_ayarla ends ============

	signat	_DS1307_saat_ayarla,4216
	global	_DS1307_dakika_ayarla
psect	text526,local,class=CODE,delta=2
global __ptext526
__ptext526:

;; *************** function _DS1307_dakika_ayarla *****************
;; Defined at:
;;		line 250 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       7       0       0       0
;;      Totals:         1       7       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		___awdiv
;;		___bmul
;;		_I2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text526
	file	"../DS1307RTCwithPIC.c"
	line	250
	global	__size_of_DS1307_dakika_ayarla
	__size_of_DS1307_dakika_ayarla	equ	__end_of_DS1307_dakika_ayarla-_DS1307_dakika_ayarla
	
_DS1307_dakika_ayarla:	
	opt	stack 6
; Regs used in _DS1307_dakika_ayarla: [wreg+status,2+status,0+pclath+cstack]
	movwf	(DS1307_dakika_ayarla@value)
	line	251
	
l3640:	
	fcall	_I2C_Start
	line	252
	
l3642:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	253
	
l3644:	
	movlw	(01h)
	fcall	_I2C_gonder
	line	255
	
l3646:	
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(DS1307_dakika_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_dakika_ayarla+0)+0
	clrf	(??_DS1307_dakika_ayarla+0)+0+1
	movf	0+(??_DS1307_dakika_ayarla+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_dakika_ayarla+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_dakika_ayarla+2)+0
	movlw	04h
u2675:
	clrc
	rlf	(??_DS1307_dakika_ayarla+2)+0,f
	addlw	-1
	skipz
	goto	u2675
	movlw	(0Ah)
	movwf	(??_DS1307_dakika_ayarla+3)+0
	movf	(??_DS1307_dakika_ayarla+3)+0,w
	movwf	(?___bmul)
	movf	(DS1307_dakika_ayarla@value),w
	movwf	(??_DS1307_dakika_ayarla+4)+0
	clrf	(??_DS1307_dakika_ayarla+4)+0+1
	movf	0+(??_DS1307_dakika_ayarla+4)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_DS1307_dakika_ayarla+4)+0,w
	movwf	1+(?___awdiv)+02h
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	addwf	(DS1307_dakika_ayarla@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	0+(??_DS1307_dakika_ayarla+2)+0,w
	movwf	(??_DS1307_dakika_ayarla+6)+0
	movf	(??_DS1307_dakika_ayarla+6)+0,w
	movwf	(DS1307_dakika_ayarla@value)
	line	256
	
l3648:	
	movf	(DS1307_dakika_ayarla@value),w
	fcall	_I2C_gonder
	line	257
	fcall	_I2C_Stop
	line	262
	
l772:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_dakika_ayarla
	__end_of_DS1307_dakika_ayarla:
;; =============== function _DS1307_dakika_ayarla ends ============

	signat	_DS1307_dakika_ayarla,4216
	global	_DS1307_yil
psect	text527,local,class=CODE,delta=2
global __ptext527
__ptext527:

;; *************** function _DS1307_yil *****************
;; Defined at:
;;		line 231 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		_I2C_Stop
;;		_I2C_oku
;;		___bmul
;;		_Send_NACK
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text527
	file	"../DS1307RTCwithPIC.c"
	line	231
	global	__size_of_DS1307_yil
	__size_of_DS1307_yil	equ	__end_of_DS1307_yil-_DS1307_yil
	
_DS1307_yil:	
	opt	stack 6
; Regs used in _DS1307_yil: [wreg+status,2+status,0+pclath+cstack]
	line	232
	
l3620:	
	fcall	_I2C_Start
	line	233
	
l3622:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	234
	
l3624:	
	movlw	(06h)
	fcall	_I2C_gonder
	line	235
	fcall	_I2C_Stop
	line	236
	fcall	_I2C_Start
	line	237
	
l3626:	
	movlw	(0D1h)
	fcall	_I2C_gonder
	line	238
	
l3628:	
	fcall	_I2C_oku
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_yil+0)+0
	movf	(??_DS1307_yil+0)+0,w
	movwf	(_veri)
	line	239
	
l3630:	
	movlw	(0Ah)
	movwf	(??_DS1307_yil+0)+0
	movf	(??_DS1307_yil+0)+0,w
	movwf	(?___bmul)
	movf	(_veri),w
	movwf	(??_DS1307_yil+1)+0
	movlw	04h
u2665:
	clrc
	rrf	(??_DS1307_yil+1)+0,f
	addlw	-1
	skipz
	goto	u2665
	movf	0+(??_DS1307_yil+1)+0,w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_yil+2)+0
	movf	(_veri),w
	andlw	0Fh
	addwf	0+(??_DS1307_yil+2)+0,w
	movwf	(??_DS1307_yil+3)+0
	movf	(??_DS1307_yil+3)+0,w
	movwf	(_veri)
	line	240
	
l3632:	
	fcall	_Send_NACK
	line	241
	
l3634:	
	fcall	_I2C_Stop
	line	243
	
l3636:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_veri),w
	goto	l769
	
l3638:	
	line	247
	
l769:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_yil
	__end_of_DS1307_yil:
;; =============== function _DS1307_yil ends ============

	signat	_DS1307_yil,89
	global	_DS1307_gun
psect	text528,local,class=CODE,delta=2
global __ptext528
__ptext528:

;; *************** function _DS1307_gun *****************
;; Defined at:
;;		line 212 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		_I2C_Stop
;;		_I2C_oku
;;		___bmul
;;		_Send_NACK
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text528
	file	"../DS1307RTCwithPIC.c"
	line	212
	global	__size_of_DS1307_gun
	__size_of_DS1307_gun	equ	__end_of_DS1307_gun-_DS1307_gun
	
_DS1307_gun:	
	opt	stack 6
; Regs used in _DS1307_gun: [wreg+status,2+status,0+pclath+cstack]
	line	213
	
l3600:	
	fcall	_I2C_Start
	line	214
	
l3602:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	215
	
l3604:	
	movlw	(04h)
	fcall	_I2C_gonder
	line	216
	fcall	_I2C_Stop
	line	217
	fcall	_I2C_Start
	line	218
	
l3606:	
	movlw	(0D1h)
	fcall	_I2C_gonder
	line	219
	
l3608:	
	fcall	_I2C_oku
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_gun+0)+0
	movf	(??_DS1307_gun+0)+0,w
	movwf	(_veri)
	line	220
	
l3610:	
	movlw	(0Ah)
	movwf	(??_DS1307_gun+0)+0
	movf	(??_DS1307_gun+0)+0,w
	movwf	(?___bmul)
	movf	(_veri),w
	movwf	(??_DS1307_gun+1)+0
	movlw	04h
u2655:
	clrc
	rrf	(??_DS1307_gun+1)+0,f
	addlw	-1
	skipz
	goto	u2655
	movf	0+(??_DS1307_gun+1)+0,w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_gun+2)+0
	movf	(_veri),w
	andlw	0Fh
	addwf	0+(??_DS1307_gun+2)+0,w
	movwf	(??_DS1307_gun+3)+0
	movf	(??_DS1307_gun+3)+0,w
	movwf	(_veri)
	line	221
	
l3612:	
	fcall	_Send_NACK
	line	222
	
l3614:	
	fcall	_I2C_Stop
	line	224
	
l3616:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_veri),w
	goto	l766
	
l3618:	
	line	228
	
l766:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_gun
	__end_of_DS1307_gun:
;; =============== function _DS1307_gun ends ============

	signat	_DS1307_gun,89
	global	_DS1307_ay
psect	text529,local,class=CODE,delta=2
global __ptext529
__ptext529:

;; *************** function _DS1307_ay *****************
;; Defined at:
;;		line 194 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		_I2C_Stop
;;		_I2C_oku
;;		___bmul
;;		_Send_NACK
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text529
	file	"../DS1307RTCwithPIC.c"
	line	194
	global	__size_of_DS1307_ay
	__size_of_DS1307_ay	equ	__end_of_DS1307_ay-_DS1307_ay
	
_DS1307_ay:	
	opt	stack 6
; Regs used in _DS1307_ay: [wreg+status,2+status,0+pclath+cstack]
	line	195
	
l3580:	
	fcall	_I2C_Start
	line	196
	
l3582:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	197
	
l3584:	
	movlw	(05h)
	fcall	_I2C_gonder
	line	198
	fcall	_I2C_Stop
	line	199
	fcall	_I2C_Start
	line	200
	
l3586:	
	movlw	(0D1h)
	fcall	_I2C_gonder
	line	201
	
l3588:	
	fcall	_I2C_oku
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_ay+0)+0
	movf	(??_DS1307_ay+0)+0,w
	movwf	(_veri)
	line	202
	
l3590:	
	movlw	(0Ah)
	movwf	(??_DS1307_ay+0)+0
	movf	(??_DS1307_ay+0)+0,w
	movwf	(?___bmul)
	movf	(_veri),w
	movwf	(??_DS1307_ay+1)+0
	movlw	04h
u2645:
	clrc
	rrf	(??_DS1307_ay+1)+0,f
	addlw	-1
	skipz
	goto	u2645
	movf	0+(??_DS1307_ay+1)+0,w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_ay+2)+0
	movf	(_veri),w
	andlw	0Fh
	addwf	0+(??_DS1307_ay+2)+0,w
	movwf	(??_DS1307_ay+3)+0
	movf	(??_DS1307_ay+3)+0,w
	movwf	(_veri)
	line	203
	
l3592:	
	fcall	_Send_NACK
	line	204
	
l3594:	
	fcall	_I2C_Stop
	line	206
	
l3596:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_veri),w
	goto	l763
	
l3598:	
	line	210
	
l763:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_ay
	__end_of_DS1307_ay:
;; =============== function _DS1307_ay ends ============

	signat	_DS1307_ay,89
	global	_DS1307_saat
psect	text530,local,class=CODE,delta=2
global __ptext530
__ptext530:

;; *************** function _DS1307_saat *****************
;; Defined at:
;;		line 177 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		_I2C_Stop
;;		_I2C_oku
;;		___bmul
;;		_Send_NACK
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text530
	file	"../DS1307RTCwithPIC.c"
	line	177
	global	__size_of_DS1307_saat
	__size_of_DS1307_saat	equ	__end_of_DS1307_saat-_DS1307_saat
	
_DS1307_saat:	
	opt	stack 6
; Regs used in _DS1307_saat: [wreg+status,2+status,0+pclath+cstack]
	line	179
	
l3560:	
	fcall	_I2C_Start
	line	180
	
l3562:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	181
	
l3564:	
	movlw	(02h)
	fcall	_I2C_gonder
	line	182
	fcall	_I2C_Stop
	line	183
	fcall	_I2C_Start
	line	184
	
l3566:	
	movlw	(0D1h)
	fcall	_I2C_gonder
	line	185
	
l3568:	
	fcall	_I2C_oku
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_saat+0)+0
	movf	(??_DS1307_saat+0)+0,w
	movwf	(_veri)
	line	186
	
l3570:	
	movlw	(0Ah)
	movwf	(??_DS1307_saat+0)+0
	movf	(??_DS1307_saat+0)+0,w
	movwf	(?___bmul)
	movf	(_veri),w
	movwf	(??_DS1307_saat+1)+0
	movlw	04h
u2635:
	clrc
	rrf	(??_DS1307_saat+1)+0,f
	addlw	-1
	skipz
	goto	u2635
	movf	0+(??_DS1307_saat+1)+0,w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_saat+2)+0
	movf	(_veri),w
	andlw	0Fh
	addwf	0+(??_DS1307_saat+2)+0,w
	movwf	(??_DS1307_saat+3)+0
	movf	(??_DS1307_saat+3)+0,w
	movwf	(_veri)
	line	187
	
l3572:	
	fcall	_Send_NACK
	line	188
	
l3574:	
	fcall	_I2C_Stop
	line	190
	
l3576:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_veri),w
	movwf	(??_DS1307_saat+0)+0
	clrf	(??_DS1307_saat+0)+0+1
	movf	0+(??_DS1307_saat+0)+0,w
	movwf	(?_DS1307_saat)
	movf	1+(??_DS1307_saat+0)+0,w
	movwf	(?_DS1307_saat+1)
	goto	l760
	
l3578:	
	line	191
	
l760:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_saat
	__end_of_DS1307_saat:
;; =============== function _DS1307_saat ends ============

	signat	_DS1307_saat,90
	global	_DS1307_dakika
psect	text531,local,class=CODE,delta=2
global __ptext531
__ptext531:

;; *************** function _DS1307_dakika *****************
;; Defined at:
;;		line 157 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		_I2C_Stop
;;		_I2C_oku
;;		___bmul
;;		_Send_NACK
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text531
	file	"../DS1307RTCwithPIC.c"
	line	157
	global	__size_of_DS1307_dakika
	__size_of_DS1307_dakika	equ	__end_of_DS1307_dakika-_DS1307_dakika
	
_DS1307_dakika:	
	opt	stack 6
; Regs used in _DS1307_dakika: [wreg+status,2+status,0+pclath+cstack]
	line	159
	
l3540:	
	fcall	_I2C_Start
	line	160
	
l3542:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	161
	
l3544:	
	movlw	(01h)
	fcall	_I2C_gonder
	line	162
	fcall	_I2C_Stop
	line	163
	fcall	_I2C_Start
	line	164
	
l3546:	
	movlw	(0D1h)
	fcall	_I2C_gonder
	line	166
	
l3548:	
	fcall	_I2C_oku
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_dakika+0)+0
	movf	(??_DS1307_dakika+0)+0,w
	movwf	(_veri)
	line	167
	
l3550:	
	movlw	(0Ah)
	movwf	(??_DS1307_dakika+0)+0
	movf	(??_DS1307_dakika+0)+0,w
	movwf	(?___bmul)
	movf	(_veri),w
	movwf	(??_DS1307_dakika+1)+0
	movlw	04h
u2625:
	clrc
	rrf	(??_DS1307_dakika+1)+0,f
	addlw	-1
	skipz
	goto	u2625
	movf	0+(??_DS1307_dakika+1)+0,w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_dakika+2)+0
	movf	(_veri),w
	andlw	0Fh
	addwf	0+(??_DS1307_dakika+2)+0,w
	movwf	(??_DS1307_dakika+3)+0
	movf	(??_DS1307_dakika+3)+0,w
	movwf	(_veri)
	line	168
	
l3552:	
	fcall	_Send_NACK
	line	169
	
l3554:	
	fcall	_I2C_Stop
	line	170
	
l3556:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_veri),w
	movwf	(??_DS1307_dakika+0)+0
	clrf	(??_DS1307_dakika+0)+0+1
	movf	0+(??_DS1307_dakika+0)+0,w
	movwf	(?_DS1307_dakika)
	movf	1+(??_DS1307_dakika+0)+0,w
	movwf	(?_DS1307_dakika+1)
	goto	l757
	
l3558:	
	line	174
	
l757:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_dakika
	__end_of_DS1307_dakika:
;; =============== function _DS1307_dakika ends ============

	signat	_DS1307_dakika,90
	global	_DS1307_saniye
psect	text532,local,class=CODE,delta=2
global __ptext532
__ptext532:

;; *************** function _DS1307_saniye *****************
;; Defined at:
;;		line 136 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Start
;;		_I2C_gonder
;;		_I2C_Stop
;;		_I2C_oku
;;		___bmul
;;		_Send_NACK
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text532
	file	"../DS1307RTCwithPIC.c"
	line	136
	global	__size_of_DS1307_saniye
	__size_of_DS1307_saniye	equ	__end_of_DS1307_saniye-_DS1307_saniye
	
_DS1307_saniye:	
	opt	stack 6
; Regs used in _DS1307_saniye: [wreg+status,2+status,0+pclath+cstack]
	line	139
	
l3520:	
	fcall	_I2C_Start
	line	140
	
l3522:	
	movlw	(0D0h)
	fcall	_I2C_gonder
	line	141
	
l3524:	
	movlw	(0)
	fcall	_I2C_gonder
	line	142
	fcall	_I2C_Stop
	line	143
	fcall	_I2C_Start
	line	144
	
l3526:	
	movlw	(0D1h)
	fcall	_I2C_gonder
	line	145
	
l3528:	
	fcall	_I2C_oku
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_saniye+0)+0
	movf	(??_DS1307_saniye+0)+0,w
	movwf	(_veri)
	line	146
	
l3530:	
	movlw	(0Ah)
	movwf	(??_DS1307_saniye+0)+0
	movf	(??_DS1307_saniye+0)+0,w
	movwf	(?___bmul)
	movf	(_veri),w
	movwf	(??_DS1307_saniye+1)+0
	movlw	04h
u2615:
	clrc
	rrf	(??_DS1307_saniye+1)+0,f
	addlw	-1
	skipz
	goto	u2615
	movf	0+(??_DS1307_saniye+1)+0,w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_DS1307_saniye+2)+0
	movf	(_veri),w
	andlw	0Fh
	addwf	0+(??_DS1307_saniye+2)+0,w
	movwf	(??_DS1307_saniye+3)+0
	movf	(??_DS1307_saniye+3)+0,w
	movwf	(_veri)
	line	147
	
l3532:	
	fcall	_Send_NACK
	line	148
	
l3534:	
	fcall	_I2C_Stop
	line	151
	
l3536:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_veri),w
	movwf	(??_DS1307_saniye+0)+0
	clrf	(??_DS1307_saniye+0)+0+1
	movf	0+(??_DS1307_saniye+0)+0,w
	movwf	(?_DS1307_saniye)
	movf	1+(??_DS1307_saniye+0)+0,w
	movwf	(?_DS1307_saniye+1)
	goto	l754
	
l3538:	
	line	154
	
l754:	
	return
	opt stack 0
GLOBAL	__end_of_DS1307_saniye
	__end_of_DS1307_saniye:
;; =============== function _DS1307_saniye ends ============

	signat	_DS1307_saniye,90
	global	_seri_porta_veri_gonder
psect	text533,local,class=CODE,delta=2
global __ptext533
__ptext533:

;; *************** function _seri_porta_veri_gonder *****************
;; Defined at:
;;		line 28 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;  number          2    1[COMMON] int 
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_seri_port
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text533
	file	"../DS1307RTCwithPIC.c"
	line	28
	global	__size_of_seri_porta_veri_gonder
	__size_of_seri_porta_veri_gonder	equ	__end_of_seri_porta_veri_gonder-_seri_porta_veri_gonder
	
_seri_porta_veri_gonder:	
	opt	stack 6
; Regs used in _seri_porta_veri_gonder: [wreg+status,2+status,0+pclath+cstack]
	line	29
	
l3510:	
	movlw	(064h)
	fcall	_seri_port
	line	30
	
l3512:	
	opt asmopt_off
movlw	26
movwf	((??_seri_porta_veri_gonder+0)+0+1),f
	movlw	248
movwf	((??_seri_porta_veri_gonder+0)+0),f
u2787:
	decfsz	((??_seri_porta_veri_gonder+0)+0),f
	goto	u2787
	decfsz	((??_seri_porta_veri_gonder+0)+0+1),f
	goto	u2787
	clrwdt
opt asmopt_on

	line	31
	
l3514:	
	movf	(seri_porta_veri_gonder@number+1),w
	fcall	_seri_port
	opt asmopt_off
movlw	26
movwf	((??_seri_porta_veri_gonder+0)+0+1),f
	movlw	248
movwf	((??_seri_porta_veri_gonder+0)+0),f
u2797:
	decfsz	((??_seri_porta_veri_gonder+0)+0),f
	goto	u2797
	decfsz	((??_seri_porta_veri_gonder+0)+0+1),f
	goto	u2797
	clrwdt
opt asmopt_on

	line	32
	
l3516:	
	movf	(seri_porta_veri_gonder@number),w
	fcall	_seri_port
	
l3518:	
	opt asmopt_off
movlw	26
movwf	((??_seri_porta_veri_gonder+0)+0+1),f
	movlw	248
movwf	((??_seri_porta_veri_gonder+0)+0),f
u2807:
	decfsz	((??_seri_porta_veri_gonder+0)+0),f
	goto	u2807
	decfsz	((??_seri_porta_veri_gonder+0)+0+1),f
	goto	u2807
	clrwdt
opt asmopt_on

	line	35
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_seri_porta_veri_gonder
	__end_of_seri_porta_veri_gonder:
;; =============== function _seri_porta_veri_gonder ends ============

	signat	_seri_porta_veri_gonder,4216
	global	___awdiv
psect	text534,local,class=CODE,delta=2
global __ptext534
__ptext534:

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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DS1307_dakika_ayarla
;;		_DS1307_saat_ayarla
;;		_DS1307_saniye_ayarla
;;		_DS1307_gun_ayarla
;;		_DS1307_ay_ayarla
;;		_DS1307_yil_ayarla
;; This function uses a non-reentrant model
;;
psect	text534
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l3470:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2511
	goto	u2510
u2511:
	goto	l3474
u2510:
	line	11
	
l3472:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l3474
	line	13
	
l1618:	
	line	14
	
l3474:	
	btfss	(___awdiv@dividend+1),7
	goto	u2521
	goto	u2520
u2521:
	goto	l3480
u2520:
	line	15
	
l3476:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l3478:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l3480
	line	17
	
l1619:	
	line	18
	
l3480:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l3482:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2531
	goto	u2530
u2531:
	goto	l3502
u2530:
	line	20
	
l3484:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l3490
	
l1622:	
	line	22
	
l3486:	
	movlw	01h
	
u2545:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2545
	line	23
	
l3488:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l3490
	line	24
	
l1621:	
	line	21
	
l3490:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2551
	goto	u2550
u2551:
	goto	l3486
u2550:
	goto	l3492
	
l1623:	
	goto	l3492
	line	25
	
l1624:	
	line	26
	
l3492:	
	movlw	01h
	
u2565:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2565
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2575
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2575:
	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l3498
u2570:
	line	28
	
l3494:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l3496:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l3498
	line	30
	
l1625:	
	line	31
	
l3498:	
	movlw	01h
	
u2585:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2585
	line	32
	
l3500:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2591
	goto	u2590
u2591:
	goto	l3492
u2590:
	goto	l3502
	
l1626:	
	goto	l3502
	line	33
	
l1620:	
	line	34
	
l3502:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2600
	goto	l3506
u2600:
	line	35
	
l3504:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l3506
	
l1627:	
	line	36
	
l3506:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1628
	
l3508:	
	line	37
	
l1628:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___bmul
psect	text535,local,class=CODE,delta=2
global __ptext535
__ptext535:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    9[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1   12[COMMON] unsigned char 
;;  product         1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DS1307_saniye
;;		_DS1307_dakika
;;		_DS1307_saat
;;		_DS1307_ay
;;		_DS1307_gun
;;		_DS1307_yil
;;		_DS1307_dakika_ayarla
;;		_DS1307_saat_ayarla
;;		_DS1307_saniye_ayarla
;;		_DS1307_gun_ayarla
;;		_DS1307_ay_ayarla
;;		_DS1307_yil_ayarla
;; This function uses a non-reentrant model
;;
psect	text535
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 6
; Regs used in ___bmul: [wreg+status,2+status,0]
	movwf	(___bmul@multiplier)
	line	4
	
l3456:	
	clrf	(___bmul@product)
	line	6
	
l1472:	
	line	7
	btfss	(___bmul@multiplier),(0)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l3460
u2490:
	line	8
	
l3458:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l3460
	
l1473:	
	line	9
	
l3460:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l3462:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l3464:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l1472
u2500:
	goto	l3466
	
l1474:	
	line	12
	
l3466:	
	movf	(___bmul@product),w
	goto	l1475
	
l3468:	
	line	13
	
l1475:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_Send_NACK
psect	text536,local,class=CODE,delta=2
global __ptext536
__ptext536:

;; *************** function _Send_NACK *****************
;; Defined at:
;;		line 124 in file "../DS1307RTCwithPIC.c"
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
;;		_DS1307_saniye
;;		_DS1307_dakika
;;		_DS1307_saat
;;		_DS1307_ay
;;		_DS1307_gun
;;		_DS1307_yil
;; This function uses a non-reentrant model
;;
psect	text536
	file	"../DS1307RTCwithPIC.c"
	line	124
	global	__size_of_Send_NACK
	__size_of_Send_NACK	equ	__end_of_Send_NACK-_Send_NACK
	
_Send_NACK:	
	opt	stack 6
; Regs used in _Send_NACK: []
	line	126
	
l3454:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1165/8)^080h,(1165)&7
	line	127
	bsf	(1164/8)^080h,(1164)&7
	line	128
	goto	l748
	
l749:	
	
l748:	
	btfsc	(1164/8)^080h,(1164)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l748
u2480:
	
l750:	
	line	129
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	132
	
l751:	
	return
	opt stack 0
GLOBAL	__end_of_Send_NACK
	__end_of_Send_NACK:
;; =============== function _Send_NACK ends ============

	signat	_Send_NACK,88
	global	_I2C_Master_ayarla
psect	text537,local,class=CODE,delta=2
global __ptext537
__ptext537:

;; *************** function _I2C_Master_ayarla *****************
;; Defined at:
;;		line 94 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  744[COMMON] int 
;; Registers used:
;;		wreg
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
psect	text537
	file	"../DS1307RTCwithPIC.c"
	line	94
	global	__size_of_I2C_Master_ayarla
	__size_of_I2C_Master_ayarla	equ	__end_of_I2C_Master_ayarla-_I2C_Master_ayarla
	
_I2C_Master_ayarla:	
	opt	stack 7
; Regs used in _I2C_Master_ayarla: [wreg]
	line	95
	
l3440:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1191/8)^080h,(1191)&7
	line	96
	bcf	(1190/8)^080h,(1190)&7
	line	102
	
l3442:	
	movlw	(09h)
	movwf	(147)^080h	;volatile
	line	109
	
l3444:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(163/8),(163)&7
	line	110
	
l3446:	
	bcf	(162/8),(162)&7
	line	111
	
l3448:	
	bcf	(161/8),(161)&7
	line	112
	
l3450:	
	bcf	(160/8),(160)&7
	line	117
	
l3452:	
	bsf	(165/8),(165)&7
	line	121
	
l745:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_ayarla
	__end_of_I2C_Master_ayarla:
;; =============== function _I2C_Master_ayarla ends ============

	signat	_I2C_Master_ayarla,90
	global	_I2C_oku
psect	text538,local,class=CODE,delta=2
global __ptext538
__ptext538:

;; *************** function _I2C_oku *****************
;; Defined at:
;;		line 81 in file "../DS1307RTCwithPIC.c"
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
;;		_DS1307_saniye
;;		_DS1307_dakika
;;		_DS1307_saat
;;		_DS1307_ay
;;		_DS1307_gun
;;		_DS1307_yil
;; This function uses a non-reentrant model
;;
psect	text538
	file	"../DS1307RTCwithPIC.c"
	line	81
	global	__size_of_I2C_oku
	__size_of_I2C_oku	equ	__end_of_I2C_oku-_I2C_oku
	
_I2C_oku:	
	opt	stack 6
; Regs used in _I2C_oku: [wreg]
	line	82
	
l3434:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1163/8)^080h,(1163)&7
	line	83
	goto	l739
	
l740:	
	
l739:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l739
u2470:
	
l741:	
	line	84
	bcf	(99/8),(99)&7
	line	85
	
l3436:	
	movf	(19),w	;volatile
	goto	l742
	
l3438:	
	line	90
	
l742:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_oku
	__end_of_I2C_oku:
;; =============== function _I2C_oku ends ============

	signat	_I2C_oku,89
	global	_I2C_gonder
psect	text539,local,class=CODE,delta=2
global __ptext539
__ptext539:

;; *************** function _I2C_gonder *****************
;; Defined at:
;;		line 70 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;  veri            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  veri            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  732[COMMON] int 
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
;;		_DS1307_saniye
;;		_DS1307_dakika
;;		_DS1307_saat
;;		_DS1307_ay
;;		_DS1307_gun
;;		_DS1307_yil
;;		_DS1307_dakika_ayarla
;;		_DS1307_saat_ayarla
;;		_DS1307_saniye_ayarla
;;		_DS1307_gun_ayarla
;;		_DS1307_ay_ayarla
;;		_DS1307_yil_ayarla
;; This function uses a non-reentrant model
;;
psect	text539
	file	"../DS1307RTCwithPIC.c"
	line	70
	global	__size_of_I2C_gonder
	__size_of_I2C_gonder	equ	__end_of_I2C_gonder-_I2C_gonder
	
_I2C_gonder:	
	opt	stack 6
; Regs used in _I2C_gonder: [wreg]
	movwf	(I2C_gonder@veri)
	line	71
	
l3432:	
	movf	(I2C_gonder@veri),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	72
	goto	l733
	
l734:	
	
l733:	
	btfss	(99/8),(99)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l733
u2460:
	
l735:	
	line	73
	bcf	(99/8),(99)&7
	line	77
	
l736:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_gonder
	__end_of_I2C_gonder:
;; =============== function _I2C_gonder ends ============

	signat	_I2C_gonder,4218
	global	_I2C_Stop
psect	text540,local,class=CODE,delta=2
global __ptext540
__ptext540:

;; *************** function _I2C_Stop *****************
;; Defined at:
;;		line 63 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  726[COMMON] int 
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
;;		_DS1307_saniye
;;		_DS1307_dakika
;;		_DS1307_saat
;;		_DS1307_ay
;;		_DS1307_gun
;;		_DS1307_yil
;;		_DS1307_dakika_ayarla
;;		_DS1307_saat_ayarla
;;		_DS1307_saniye_ayarla
;;		_DS1307_gun_ayarla
;;		_DS1307_ay_ayarla
;;		_DS1307_yil_ayarla
;; This function uses a non-reentrant model
;;
psect	text540
	file	"../DS1307RTCwithPIC.c"
	line	63
	global	__size_of_I2C_Stop
	__size_of_I2C_Stop	equ	__end_of_I2C_Stop-_I2C_Stop
	
_I2C_Stop:	
	opt	stack 6
; Regs used in _I2C_Stop: []
	line	64
	
l3430:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	65
	goto	l727
	
l728:	
	
l727:	
	btfsc	(1162/8)^080h,(1162)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l727
u2450:
	
l729:	
	line	66
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	67
	
l730:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Stop
	__end_of_I2C_Stop:
;; =============== function _I2C_Stop ends ============

	signat	_I2C_Stop,90
	global	_I2C_Start
psect	text541,local,class=CODE,delta=2
global __ptext541
__ptext541:

;; *************** function _I2C_Start *****************
;; Defined at:
;;		line 55 in file "../DS1307RTCwithPIC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  720[COMMON] int 
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
;;		_DS1307_saniye
;;		_DS1307_dakika
;;		_DS1307_saat
;;		_DS1307_ay
;;		_DS1307_gun
;;		_DS1307_yil
;;		_DS1307_dakika_ayarla
;;		_DS1307_saat_ayarla
;;		_DS1307_saniye_ayarla
;;		_DS1307_gun_ayarla
;;		_DS1307_ay_ayarla
;;		_DS1307_yil_ayarla
;; This function uses a non-reentrant model
;;
psect	text541
	file	"../DS1307RTCwithPIC.c"
	line	55
	global	__size_of_I2C_Start
	__size_of_I2C_Start	equ	__end_of_I2C_Start-_I2C_Start
	
_I2C_Start:	
	opt	stack 6
; Regs used in _I2C_Start: []
	line	56
	
l3428:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	57
	goto	l721
	
l722:	
	
l721:	
	btfsc	(1160/8)^080h,(1160)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l721
u2440:
	
l723:	
	line	58
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	60
	
l724:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Start
	__end_of_I2C_Start:
;; =============== function _I2C_Start ends ============

	signat	_I2C_Start,90
	global	_seri_portu_ayarla
psect	text542,local,class=CODE,delta=2
global __ptext542
__ptext542:

;; *************** function _seri_portu_ayarla *****************
;; Defined at:
;;		line 37 in file "../DS1307RTCwithPIC.c"
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
psect	text542
	file	"../DS1307RTCwithPIC.c"
	line	37
	global	__size_of_seri_portu_ayarla
	__size_of_seri_portu_ayarla	equ	__end_of_seri_portu_ayarla-_seri_portu_ayarla
	
_seri_portu_ayarla:	
	opt	stack 7
; Regs used in _seri_portu_ayarla: [wreg]
	
l3408:	
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	38
	
l3410:	
	bsf	(1218/8)^080h,(1218)&7
	line	39
	
l3412:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	40
	
l3414:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	41
	
l3416:	
	bcf	(1222/8)^080h,(1222)&7
	line	42
	
l3418:	
	bsf	(1221/8)^080h,(1221)&7
	line	43
	
l3420:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	44
	
l3422:	
	bsf	(196/8),(196)&7
	line	48
	
l3424:	
	bsf	(62/8),(62)&7
	line	49
	
l3426:	
	bsf	(63/8),(63)&7
	line	50
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_seri_portu_ayarla
	__end_of_seri_portu_ayarla:
;; =============== function _seri_portu_ayarla ends ============

	signat	_seri_portu_ayarla,88
	global	_seri_port
psect	text543,local,class=CODE,delta=2
global __ptext543
__ptext543:

;; *************** function _seri_port *****************
;; Defined at:
;;		line 12 in file "../DS1307RTCwithPIC.c"
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
;;		_seri_porta_veri_gonder
;; This function uses a non-reentrant model
;;
psect	text543
	file	"../DS1307RTCwithPIC.c"
	line	12
	global	__size_of_seri_port
	__size_of_seri_port	equ	__end_of_seri_port-_seri_port
	
_seri_port:	
	opt	stack 6
; Regs used in _seri_port: [wreg]
	movwf	(seri_port@jk)
	
l3402:	
	goto	l703
	
l704:	
	
l703:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l703
u2430:
	goto	l3404
	
l705:	
	line	13
	
l3404:	
	movf	(seri_port@jk),w
	movwf	(25)	;volatile
	line	14
	
l3406:	
	bcf	(100/8),(100)&7
	line	16
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_seri_port
	__end_of_seri_port:
;; =============== function _seri_port ends ============

	signat	_seri_port,4216
psect	text544,local,class=CODE,delta=2
global __ptext544
__ptext544:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
