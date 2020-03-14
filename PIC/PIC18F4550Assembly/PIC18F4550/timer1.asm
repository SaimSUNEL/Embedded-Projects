#include p18f4550.inc                ; Include register definition file
CONFIG MCLRE=OFF




Rst code 0x0
goto start

Main
start:
clrf T1CON
clrf TMR1L
clrf TMR1H
clrf TRISD 
clrf PORTD

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

decfsz 0x2 , F
bra bir_saniye
btg PORTD , RD0







goto $




END