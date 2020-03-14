
#define EN_DUSUK_1 4
#define EN_DUSUK_2 5
#define EN_YUKSEK_1 6
#define EN_YUKSEK_2 7

byte rakamlar []= { 0b01000000, 0b11111001, 0b00100100, 0b00110000, 0b00011001, 0b00010010, 0b00000010, 0b01111000, 0, 0b00010000  };
byte endusuk1, endusuk2, enyuksek1, enyuksek2;

void TempLoadDigit(byte digit_number, byte value)
{

	for(signed char index=7 ; index > -1; index--)
	{
		CenterSetPin(CENTERDATA, (value >> index) & 0x1);
		__delay_us(50);
		CenterSetPin(CENTERCLOCK, 0x1);
		__delay_us(20);
		CenterSetPin(CENTERCLOCK, 0);
	}
	CenterSetPin(digit_number, 1);
	__delay_us(50);
	CenterSetPin(digit_number, 0);

	__delay_us(200);

}

void EnDusukDisplay(byte number)
{
	endusuk1 = rakamlar[number/10];
	endusuk2 = rakamlar[number%10];

	
	TempLoadDigit(EN_DUSUK_1, endusuk1);
	TempLoadDigit(EN_DUSUK_2, endusuk2);
}
void EnYuksekDisplay(byte number)
{
	enyuksek1 = rakamlar[number/10];
	enyuksek2 = rakamlar[number%10];

	
	TempLoadDigit(EN_YUKSEK_1, enyuksek1);
	TempLoadDigit(EN_YUKSEK_2, enyuksek2);
}