


//RC3 pininde normal

byte current_value;

void load_shift_data(unsigned char data)
{

for(signed char a = 7; a > -1;a--)
{

if((data >> a) & 0x1)
{
#asm
banksel _PORTC
bcf _PORTC, 3
bsf _PORTC, 3
#endasm

__delay_us(15);
}
else
{
RC3 = 0;
__delay_us(15);
RC3 = 1;
__delay_us(30);
}

}

RC3 = 0;
__delay_us(199);
RC3 = 1;
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
