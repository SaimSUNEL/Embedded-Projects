list p=16f877a
#include p16f877a.inc


org 0x00
goto Start
group idata 20
sayilar db A'1' , A'2' , A'3'


 ss code 0x5
deneme 
retlw 01h
retlw 02h
retlw 03h
retlw 04h

index  equ 02ch
temp equ 02dh


bekle:

banksel 0x20
movlw D'100'
movwf 0x21




tekrar:



movwf 0x22

tekrar1:



movwf 0x23


tekrar2:

decfsz 0x23 ,f 

goto tekrar2




decfsz 0x22 ,f 


goto tekrar1




decfsz 0x21 , f
goto tekrar







return


sayi equ 0x21
sayi2 equ 0x22
Main code 0x100
Start
movlw 0xff 
andlw 0x1


banksel sayi
movlw 0 
movwf sayi



;movlw 0xff 
movwf sayi2


loop:

btfsc STATUS , Z 
goto loop_bitir;


incf sayi



decf sayi2 , F

goto loop

loop_bitir:








goto $







banksel TRISB
movlw 0x00
movwf TRISB
banksel PORTB 
movwf PORTB




banksel TXSTA
movlw B'00100100'  ;TXSTA = 0b00100100  ; TXEN = 1 , SYNC = 0 , BRGH = 1
movwf TXSTA
banksel RCSTA
movlw B'10010000' ;RCSTA = 0b10010000 ; SPEN = 1 , CREN = 1 
movwf RCSTA
banksel SPBRG
movlw D'51' ;SPBRG = 51 for 16MHZ 19600 baud...
movwf SPBRG
nop
nop
nop

gonder:

movlw A's'
banksel TXREG
movwf 19h
label:
banksel TXSTA
btfss 0x98 , TRMT
goto label 

bcf 0x98 , TRMT
nop

banksel PORTB
bsf PORTB , RB0


call bekle

bcf PORTB , RB0
call bekle



goto gonder

goto $
END




