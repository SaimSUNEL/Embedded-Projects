//Center 1 4. pin on main register
//Center 2 5. pin on main register
#define CENTER1 4
#define CENTER2 5

#define CENTERCLOCK 0
#define CENTERDATA 1

byte CenterData1, CenterData2;

void LoadDataCenter(byte center_no, byte center_data)
{

	for(signed char index = 7; index > -1; index--)
	{
		MainRegisterSetPin(MAINDATA, (center_data>>index) & 0x1);
		__delay_us(50);
		MainRegisterSetPin(MAINCLOCK, 0x1);
		__delay_us(30);
		MainRegisterSetPin(MAINCLOCK, 0);
		__delay_us(20);
	}
	MainRegisterSetPin(center_no, 1);
	__delay_us(50);
	MainRegisterSetPin(center_no, 0);
	__delay_us(50);
}


void CenterSetPin(byte pin_number, byte pin_value)
{
if(pin_number > 7)
 {
	if(pin_value)
	{
		CenterData2 |= 1 << (pin_number - 8);
	}
	else 	CenterData2 &= ~(1 << (pin_number - 8));

	LoadDataCenter(CENTER2, CenterData2);

}
else
{
	if(pin_value)
	CenterData1 |= 1 << pin_number;
	else CenterData1 &= ~(1 << pin_number);
	LoadDataCenter(CENTER1, CenterData1);

}


}
