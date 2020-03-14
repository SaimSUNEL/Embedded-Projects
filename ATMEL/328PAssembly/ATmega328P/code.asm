
.include "m328Pdef.inc"

.org 0
jmp Ana

.org 0x100
Ana:
ldi r17 , 'S'
out 0x2c , r17




ldi r16 , 1 << PINB0
out DDRB , r16

sbi DDRB , 1 ;

sbi DDRB , 2

sbr r16   ,  2 

out PORTB , r16



loop:

sbi PORTB , 0
cbi PORTB , 1
call Delay


cbi PORTB , 0
sbi PORTB , 1
call Delay

jmp loop



this:
jmp this


Delay:

ldi r17  , 0x100 - 0x01
out 0x20 , r17
out 0x21 , r17
out 0x22 , r17



devam:




dev:





rr:

nop
nop
nop
nop
nop

in r16 , 0x22 
dec r16 
out  0x22 , r16
breq df

jmp rr



df:






in r16 , 0x21 
dec r16
breq ss
out 0x21 , r16
jmp dev

ss:








in r16 , 0x20
dec r16
out 0x20 , r16
breq don

jmp devam
don:

ret

