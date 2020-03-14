

//RA5 pininde 

byte current_value; //Current value on main shift register

#define MAINDATA 2
#define MAINCLOCK 1
byte count;
void MainRegisterLoadData(unsigned char data)
{

for(signed char a = 7; a > -1;a--)
{

if((data >> a) & 0x1)
{
//4 MHZ FOSC...
RA5 = 0;
RA5 = 1;


__delay_us(60);
}
else
{
RA5 = 0;
__delay_us(100);
RA5= 1;

__delay_us(60);

}

}

RA5 = 0;
__delay_us(500);
RA5 = 1;



__delay_us(150);


}

void MainRegisterSetPin(byte pin_number, byte value)
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

MainRegisterLoadData(current_value);
__delay_us(200);
}


