DATA_PIN equ RA1
CLOCK equ RA0
STORE equ RA2

Load_Shift_Cons macro info
movlw data
call SHIFT_Load
endm

Load_Shift_Var macro info
banksel info
movf info, w
call SHIFT_Load
endm


SIFTHREG code 0x300
; set pin configs...

SHIFT_Load:
banksel bit_index 
movwf load_data
movlw D'7'
movwf bit_index

bsf PORTA, DATA_PIN
btfss load_data, 0
bcf PORTA, DATA_PIN

bsf PORTA, CLOCK
DelayMs 3
bcf PORTA, CLOCK


LSRF load_data, f


devam1:

bsf PORTA, DATA_PIN
btfss load_data, 0
bcf PORTA, DATA_PIN

bsf PORTA, CLOCK
DelayMs 3
bcf PORTA, CLOCK


LSRF load_data, f


decfsz bit_index
goto devam1

bsf PORTA, STORE
DelayMs 2
bcf PORTA, STORE

return
