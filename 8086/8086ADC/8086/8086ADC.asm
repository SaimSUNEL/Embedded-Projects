

;====================================================================
; Main.asm file generated by New Project wizard
;
; Processor: 8086
; Compiler:  MASM32
;
; Before starting simulation set Internal Memory Size 
; in the 8086 model properties to 0x10000
;====================================================================

DATA SEGMENT  ; data segment of the program...
shift_reg_pin_to_set db 0 
PORTA_data db 0
data_to_be_stored db 0
reg_pin_value db 0
index db 0
adc_select_input db 0

adc_result db 0

DATA ENDS


CODE    SEGMENT PUBLIC 'CODE' 
        ASSUME CS:CODE, DS: DATA


;A16-A19 are not involved in port operations...
; first port is latched in 74hc373 (8086 first outputs port address on data/address bus)
; then this select the port to write, then 8086 sends data to 8255A


; important : data with even numbered addresses are sent over AD0-AD7, odd numbered are over AD8-AD15
; 
; A0 and A1 are connected in a specific way to make the addresses even numbered...
; that's whay Q1 and Q2 is used to select port of 8255a, 
; if it were Q0, Q1 we would use odd addreess number
; 
; Datasheet :
;Physically, the memory is organized as a high bank
;(D15�D8) and a low bank (D7�D0) of 512K 8-bit
;bytes addressed in parallel by the processor�s address lines A19�A1. Byte data with even addresses
;is transferred on the D7�D0 bus lines while odd addressed byte data (A0 HIGH) is transferred on the
;D15�D8 bus lines.
;
;
START:
	mov AX, 100h
	mov SS, AX ; set stack segment
	mov ax, 800h
	mov DS, ax
	mov ax, 0d00h
	mov es, ax
	mov sp , ax ; don't forget to set it...
	
	

push AX


	mov ah, 0
	mov al, 83h ; PORT A ,PORT C 0-3 are outputs; PORTB and PORTC 4-7 are inputs...
	out 06, al ; control reg  address 
	
	mov al, 0 ; clean all ports, Port A=B=C= 0
	out 0, al
	out 2, al
	out 4, al
	
	
	mov PORTA_data, 0 ; do not forget to reset critical variable beforehand...
	mov data_to_be_stored, 0 ; due to DS segment change assigned predefined values are not valid...
		


		
ENDLESS:
	

		mov adc_select_input, 2
		call ADC_input_select

		mov cx, 500 ; loop lasts when branch is taken 17 cycles, not taken 5 cycles ~ 8.5 ms
		l1:
		loop l1

		call ADC_start

		mov cx, 500 ; loop lasts when branch is taken 17 cycles, not taken 5 cycles ~ 8.5 ms
		l2:
		loop l2

		call ADC_read_result

	
	
	mov cx, 2ffh
	call delayfunction
		
	JMP ENDLESS

; cx stores the delay number
delayfunction proc far


	COUNT2:
	mov bx, 01fh


devam2:
	dec bx

	cmp bx, 0
	je fin2
	jmp devam2

fin2:

	loop COUNT2
ret
delayfunction endp






LoadShiftRegister proc

mov  index, 7h

send_data_to_shift_register:


mov ch, 0
mov cl,  index

mov ah, 0
mov al, data_to_be_stored

shr ax, cl

DATA_PIN equ 1
DATA_CLK equ 0
DATA_STR equ 2

and ax, 1h
cmp ax, 1
je bir 

and PORTA_data, 253
jmp temp1

bir:
or PORTA_data, 2h

temp1: ; shift_register_data = data 

mov al, PORTA_data ; data is put into PA1
out 0, al

or al, 1 ; CLK = 1
out 0, al
nop
nop
nop
nop

and al, 254 ; CLK = 0 
out 0, al
nop
nop
nop
nop

dec index
cmp index, -1
je store
jmp send_data_to_shift_register


store: 
or PORTA_data, 4 ; STR= 1
mov al, PORTA_data
out 0 ,al

nop
nop
nop
nop
and PORTA_data, 251
mov al, PORTA_data
out 0, al

nop
nop




ret

LoadShiftRegister endp

shift_reg_set_pin proc

mov cl, shift_reg_pin_to_set
mov bx, 1

shl bx, cl

cmp reg_pin_value, 1h
je bir_set
not bl
and data_to_be_stored, bl
jmp call_load

bir_set:
or data_to_be_stored, bl

call_load:
call LoadShiftRegister

ret
shift_reg_set_pin endp 




ADC_input_select PROC

and data_to_be_stored, 11111000b
mov al, adc_select_input
or data_to_be_stored, al
call LoadShiftRegister

ret
ADC_input_select ENDP

ADC_start_pin equ 3
ADC_output_enable equ 4
ADC_start PROC

	mov shift_reg_pin_to_set, ADC_start_pin ; START = 1
	mov reg_pin_value, 1
	call shift_reg_set_pin

	nop
	nop
	nop
	nop
	
	mov reg_pin_value, 0   ; START = 0
	call shift_reg_set_pin
	
	mov shift_reg_pin_to_set, ADC_output_enable ; Output Enable = 1
	mov reg_pin_value, 1
	call shift_reg_set_pin

ret
ADC_start ENDP

ADC_read_result PROC



in al, 02 ; Read B port 
mov adc_result, al; store value in memory

; after reading result disable ADC output; Other device might use 
mov shift_reg_pin_to_set, ADC_output_enable ; Output Enable = 0
	mov reg_pin_value, 0
	call shift_reg_set_pin
ret
ADC_read_result ENDP


CODE    ENDS
        END START


