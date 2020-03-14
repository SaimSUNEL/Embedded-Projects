

//RA5 pininde - CLK
//RA4 - DATA
//RA2 - STORE

byte current_value; //Current value on main shift register
#define DATA RA4
#define CLK RA5
#define STORE RA2

#define MAINDATA 2
#define MAINCLOCK 1
byte count;
void MainRegisterLoadData(unsigned char data)
{

for(signed char a = 7; a > -1;a--)
{
DATA = (data>>a)&0x1;
CLK = 1;
__delay_us(5);
CLK = 0;
__delay_us(5);
}
STORE = 1;
__delay_us(5);
STORE = 0;
__delay_us(10);


}

void MainRegisterSetPin(byte pin_number, byte value)
{

//pin_number --;
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




/*
void MainRegisterLoadData(unsigned char data)
{

for(signed char a = 7; a > -1;a--)
{

if((data >> a) & 0x1)
{
//4 MHZ FOSC...
#asm
banksel _PORTA
bcf _PORTA, 5

bsf _PORTA, 5
#endasm

__delay_us(60);
}
else
{

#asm
movlw 0x4
banksel _count
movwf _count
banksel _PORTA
bcf _PORTA, 5
banksel _count
del:
nop
decfsz _count
goto del
nop
banksel _count
bsf _PORTA, 5
#endasm
__delay_us(60);

}

}



#asm
movlw 0x24
banksel _count
movwf _count
banksel _PORTA
bcf _PORTA, 5
banksel _count
del2:
nop
decfsz _count
goto del2
nop
nop
nop
banksel _count
bsf _PORTA, 5
#endasm

__delay_us(150);


}






*/
