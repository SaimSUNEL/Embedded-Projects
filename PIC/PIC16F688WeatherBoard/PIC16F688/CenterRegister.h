//Center 1 4. pin on main register
//Center 2 5. pin on main register
#define CENTER1 4
#define CENTER2 5

#define CENTERCLOCK 0
#define CENTERDATA 1

byte CenterData[2];//CenterData1, CenterData2;

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
byte index = pin_number / 8;
byte shift_amount = pin_number % 8;

if(pin_value)
	{
		CenterData[index] |= 1 << (shift_amount);
	}
	else 	CenterData[index] &= ~(1 << (shift_amount));

	LoadDataCenter(4+index, CenterData[index]);

}

