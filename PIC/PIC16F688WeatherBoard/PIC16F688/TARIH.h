
#define TARIHREGISTER 3 //3. pin on main register
#define TARIHREGISTERDATA 1
#define TARIHREGISTERCLOCK 0

#define GUN1DIGITPIN 2
#define GUN2DIGITPIN 3

#define AY1DIGITPIN 4
#define AY2DIGITPIN 5

#define YIL1DIGITPIN 6
#define YIL2DIGITPIN 7

byte tarihData;
void TarihRegisterSetPin(byte pin, byte value)
{
	if(value)
		tarihData |= 1 << pin;
	else
		tarihData &= ~(1<<pin); 
	
	LoadDataCenter(TARIHREGISTER, tarihData);
}

byte gunDisplay1, gunDisplay2, ayDisplay1, ayDisplay2, yilDisplay1, yilDisplay2;
void TarihSetDisplay(byte display_number, byte value)
{
	
	for(signed char index = 7; index > -1; index--)
	{
		TarihRegisterSetPin(TARIHREGISTERDATA, (value>>index) & 0x1);
		__delay_us(50);
		TarihRegisterSetPin(TARIHREGISTERCLOCK, 0x1);
		__delay_us(30);
		TarihRegisterSetPin(TARIHREGISTERCLOCK, 0);
		__delay_us(20);
	}
	TarihRegisterSetPin(display_number, 1);
	__delay_us(100);
	TarihRegisterSetPin(display_number, 0);
	__delay_us(150);
	
	
}
 
void DisplayGun(byte number)
{
	gunDisplay1 = rakamlar[number/10];
	gunDisplay2 = rakamlar[number%10];
	TarihSetDisplay(GUN1DIGITPIN, gunDisplay1);
	TarihSetDisplay(GUN2DIGITPIN, gunDisplay2);

}

void DisplayAy(byte number)
{
	ayDisplay1 = rakamlar[number/10];
	ayDisplay2 = rakamlar[number%10];
	TarihSetDisplay(AY1DIGITPIN, ayDisplay1);
	TarihSetDisplay(AY2DIGITPIN, ayDisplay2);

}

void DisplayYil(byte number)
{
	yilDisplay1 = rakamlar[number/10];
	yilDisplay2 = rakamlar[number%10];
	TarihSetDisplay(YIL1DIGITPIN, yilDisplay1);
	TarihSetDisplay(YIL2DIGITPIN, yilDisplay2);

}
