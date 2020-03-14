#include p18f4550.inc                ; Include register definition file
CONFIG MCLRE=ON

;pagesel olmadýðýð için bootlaader 00 adresinin yazarken pic memorinin en sonuna ondan önce bir þey yazmaya
; gerek yok...

;bsf yazdýklarýmýzý tek bir movlw B'bitler' þeklinde kýsalt 



;Yuklenen_Program code ( 0x7ff8-0x08  )
;yuklenen_program:
;bra yuklenen_program
TT code 0x7ff8-0x08
goto $

counter equ 0x10 ; 32 byte yazmak için bir deðiþken

Start code 0x0
goto start


Program_Memory code 0x7f50-0x10;0x6f50 ;

Program_memori_yaz:

; ilk gelen byte 'x' ise yüklenen programýn yukarýdaki 00 bölümüne atla
call Usart_veri_al
movwf 0x20

; RCREG w de 
XORLW A'x'

btfss STATUS , Z
bra yuklemeye_devam

clrf T1CON ; PIC reset haline geri getir...
clrf RCSTA
clrf TXSTA

goto 0x7ff8-0x08;0x7d20  ; Program yükllendi ye 00 adresine atla
yuklemeye_devam:

;Adress bytlarýda geri gönderilip kontrol edilecke...
movf 0x20 , W

;movlw 0x0 ; silinecek
movwf TBLPTRU ; adresin yüksek byte'ý
call Usart_veri_gonder


call Usart_veri_al
;movlw 0x0 ; silinecek
movwf TBLPTRH
call Usart_veri_gonder


call Usart_veri_al

;movlw  D'32'
movwf 0x50
call Usart_veri_gonder
movlw 0x0
movwf TBLPTRL


;Adresleme tamam þimdide 32 byte ý alacaýz

movlw D'32'
movwf counter ; Deðiþkene 32 yi yükledik...7



yaz:
call Usart_veri_al
movwf TABLAT ; bytý yükle...
call Usart_veri_gonder ; Kontrol için geri gönder...
TBLWT*
incf TBLPTRL , F
decfsz counter
bra yaz

; otuz iki byte buffera yüklendi...

bsf EECON1 , EEPGD
bcf EECON1 , CFGS
bsf EECON1 , WREN
movf 0x50 , W
movwf TBLPTRL
bcf INTCON , GIE 
movlw 0x55
movwf EECON2
movlw 0xaa
movwf EECON2
bsf EECON1 , WR

 yazana_kadar_bekle:
btfsc EECON1 , WR
bra yazana_kadar_bekle


movlw A'T'
call Usart_veri_gonder ; En son olarak her 32 bytta bir T göndereceðiz...
bcf EECON1 , WREN



return






Usart_ayarla code 0x7fb8-4
Usart_baslat:


bsf TXSTA , TXEN ; Transmitter aktif ..
bcf TXSTA , SYNC; Async mode 

bsf TXSTA , BRGH ; high speed mode

bsf RCSTA , CREN ; Continuous receive aktif


clrf BAUDCON ; ilk baþta her þeyi sýfýrlýyoruz...
bcf BAUDCON , BRG16 ; SPBRG 8 bit baudrate generator BRGH is ignored...
movlw D'25'
movwf SPBRG ; 4 MHZ 9600 ( 25 ) 20 MHZ 9600 129 þimdilik...


bsf RCSTA , SPEN ; Serial port aktif

return

Usart_veri_al:
devam:
btfss PIR1 , RCIF  ;while( RCIF == 0 );
bra devam
movf RCREG , W ; gelen veriyi w registerine yükle
return

Usart_veri_gonder:
devam2:
btfss PIR1 , TXIF
bra devam2
movwf  TXREG 
return



Main code 0x7f00-0x14
start:

bcf TRISD , RD0 ; RA pini output
bcf PORTD , RD0 ; RA pini low levelde 


call Usart_baslat

;Resetten sonra gene 63 ml saniye beklenilecek gelen bir veri var mý diye...



;Timer1 kullanýlacak....
clrf T1CON
clrf TMR1L
clrf TMR1H

bcf T1CON , RD16 ; read write to TIMER1 in 8 bytes..
bcf T1CON , T1RUN ; Timer1 System clock status 0 device clock is derived from another source
bsf T1CON , T1CKPS1 ;T1CKPS0 0 Timer1 presc 1:4
;TMR1CS zaten sýfýr Clock source internal FOSC/4
bsf T1CON , TMR1ON 
movlw D'10' ; bir saniye için ( silinecek...)
movwf 0x2


bir_saniye:


tmr:
btfss PIR1 , TMR1IF
bra tmr

bcf PIR1 , TMR1IF
btg PORTD , RD0
decfsz 0x2 , F
bra bir_saniye


btfsc PIR1 , RCIF ; 
bra boot 
movf  RCREG , W ; RCIF temizlendii
goto 0x7ff0 ; yüklenen programýn 00 bölümüne git....





boot:

movf RCREG , W
sublw A't'
btfss STATUS , Z
goto 0x7ff0  ;yüklenen programýn 00 bölümüne git....
movlw 0x0
clrf PORTA 
clrf TRISA
bsf  PORTA , 0
infinite: ; main loop
;pagesel flash_yaz
call Program_memori_yaz
goto infinite
goto $

loop:
;call Program_memori_yaz




;call Usart_veri_al

;call Usart_veri_gonder

bra loop


END