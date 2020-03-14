




byte count = 0;


byte rakamlar [] = {0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110, 0b01101101, 
					0b01111101, 0b00000111, 0b01111111, 0b01101111};
#define DATA1 1
#define CLOCK1 0

#define SICAKLIK 2
#define NEM 3
#define NONE 5



#define DATA7 2
#define CLOCK7 1
#define STORE1 3
#define STORE2 4

#define FIRST_DIGIT 3
#define SECOND_DIGIT 4

//temp or moisture led indicator...
byte what_to_display = NONE;



void set_segment_shift(byte segment_no, byte data)
{

for(signed char a = 7; a > -1;a--)
{
	
	shift_reg_set_pin(DATA7, (data >> a) & 0x1);
	__delay_us(2);
	shift_reg_set_pin(CLOCK7, 1);
	__delay_us(2);
	shift_reg_set_pin(CLOCK7, 0);
	

}

shift_reg_set_pin(segment_no, 1);
__delay_us(15);
shift_reg_set_pin(segment_no, 0);


} 



void display_number(byte number)
{
	byte digit = ~rakamlar[number / 10];
	if(what_to_display == SICAKLIK)
		digit |= 1 << 7;
	
	set_segment_shift(FIRST_DIGIT, digit);
	//display_digit(1, number / 10);
	digit = ~rakamlar[number % 10];
	if(what_to_display == NEM)
		digit |= 1 << 7;
	set_segment_shift(SECOND_DIGIT, digit);
	//display_digit(SECOND_DIGIT, rakamlar[number % 10]);
}

