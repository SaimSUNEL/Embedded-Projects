

; 4MHZ crystal - > 1us instruction cycle...


DelayMs macro miliseconds
movlw miliseconds
call DelayMsroutine
endm 





DELAY code 0x200
DelayMsroutine: 
banksel delay_x
; delay_x = miliseconds
movwf delay_x

devam:
movlw d'250'
movwf delay_y
; ~4us

loop1:
nop
nop
nop
decfsz delay_y, 1
goto loop1

decfsz delay_x, 1
goto devam
return
