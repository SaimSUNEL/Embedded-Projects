


list p=16f877a
#include p16f877a.inc
org 0x1fff ; sayac variable ý için....
sayac db 2
;org 0x1ff8
;sayac data 50
;sayac2 data 15

;deneme db 0j  
org 0x00
pagesel Start    
goto Start

org 0x1ff6
clrf STATUS
clrf PCLATH
pagesel 0x1ff6
goto $
;
;DENEME code 0x1fb6
;JK
;bcf 0x3 , 6
;bcf 0x3 , 5
;bcf 0xa  , 4
;bcf 0xa , 3
;pagesel  JK
;goto $



USART code 0x1fdf;0x1fbf

Usart_veri_al:

banksel PIR1
devam:
btfss PIR1 , RCIF
goto devam
movf RCREG , W ; RCREG w içine atýlýyor...
;movf PORTA , W
;XORLW 1
;movwf PORTA


return

Usart_veri_gonder

banksel TXREG
movwf TXREG
dev:



btfss PIR1 , TXIF 
goto dev

return
vcv
Usart_ayarla

banksel SPBRG  ;SPBRG = 3
movlw D'51';19200 -current olan for 16 MHZ...
movwf SPBRG
movlw B'00100100' ; TX ayarlandý...
movwf TXSTA

banksel RCSTA  ; RX ayarlandý...
movlw B'10010000'
movwf RCSTA
return


FLASH code 0x1f9e + 14

flash_yaz:
;pagesel Usart_veri_al
call Usart_veri_al
bcf STATUS , Z
sublw D'120'  ; if ( gelen_veri ==  'x' ) jmp yüklenen programa....
btfss STATUS , Z
goto rt
;pagesel 0x1ff6
goto 0x1ff6
;bsf PCLATH , 4
;bsf PCLATH , 3
;goto 0x7da


rt:
banksel RCREG
movf RCREG , W
banksel EEADRH
movwf EEADRH

;pagesel Usart_veri_gonder
call Usart_veri_gonder

;pagesel Usart_veri_al
call Usart_veri_al

banksel EEADR
movwf EEADR

;pagesel Usart_veri_gonder
call Usart_veri_gonder

;pagesel Usart_veri_al; DAtah  alýndý...
call Usart_veri_al
banksel EEDATA
movwf EEDATA
;pagesel Usart_veri_gonder
call Usart_veri_gonder

;pagesel Usart_veri_al ;datal alýndý...
call Usart_veri_al

banksel EEDATH
movwf EEDATH

;pagesel Usart_veri_gonder
call Usart_veri_gonder


movlw B'10000100'

banksel EECON2;veriyi yaz...

movwf EECON1


movlw 0x55
movwf EECON2

movlw 0xaa
movwf EECON2

bsf EECON1 , WR
nop
nop
bcf EECON1 , WREN

loop:;while( WR == 1 );

btfsc EECON1 , WR
goto loop

movlw A'T'
;pagesel Usart_veri_gonder
call Usart_veri_gonder
return 

Main code 0x1f74 + 0x1d

Start

;Bir saniye bekleyeceðiz ve gelen bir bilgi var mý yok mu bakacaðýz uygun karakter alýndýysa bootloader
;çalýþacak eðer yoksa hafýzaya daha önce yüklenmiþ olan programý çalýþtýracaðýz...

;pagesel Usart_ayarla
call Usart_ayarla



;movlw D'8'
;movwf sayac


;63 ms bekleyecek... resetten sonra...

banksel T1CON
movlw B'00100000';1:4 prescaler
movwf T1CON
movf RCREG , W

;azalt:
;bcf T1CON , TMR1ON
movlw D'9'
movwf TMR1H
movlw D'231'
movwf TMR1L
bsf T1CON , TMR1ON
btfss PIR1 , TMR1IF
goto $-1

bcf PIR1 , TMR1IF ; TMR1F yazýlýmda silinmelidir...



;decfsz sayac,F
;goto azalt
btfsc PIR1 , RCIF
goto boot
movf RCREG , W
;pagesel 0x1ff6
goto 0x1ff6
boot:
movf RCREG , W
sublw A't'
btfss STATUS , Z
goto 0x1ff6
movlw 0x0
banksel TRISA
movwf TRISA
banksel PORTA
movwf PORTA
bsf  PORTA , 0
infinite: ; main loop
;pagesel flash_yaz
call flash_yaz
goto infinite
goto $
END