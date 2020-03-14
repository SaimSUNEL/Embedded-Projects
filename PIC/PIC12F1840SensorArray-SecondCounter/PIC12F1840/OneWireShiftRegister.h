

//RA5 pininde normal

byte current_value;

void load_shift_data(unsigned char data)
{

for(signed char a = 7; a > -1;a--)
{

if((data >> a) & 0x1)
{
#asm
banksel _PORTA
bcf _PORTA, 5
nop
nop
bsf _PORTA, 5
#endasm

__delay_us(15);
}
else
{
RA5 = 0;
__delay_us(15);
RA5 = 1;
__delay_us(30);
}

}

RA5 = 0;
__delay_us(199);
RA5 = 1;
__delay_us(300);


}
void shift_reg_set_pin(byte pin_number, byte value)
{
if(value > 0) value = 1;
else value = 0;
pin_number --;
if(value)
{
current_value  |= 1 <<pin_number;
}
else
{
current_value &= ~(1<<pin_number);

}

load_shift_data(current_value);

}
