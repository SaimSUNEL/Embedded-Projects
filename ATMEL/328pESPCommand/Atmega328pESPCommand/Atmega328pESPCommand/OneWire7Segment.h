/*
 * OneWire7Segment.h
 *
 * Created: 11.07.2019 15:59:10
 *  Author: Saim
 */ 


#ifndef ONEWIRE7SEGMENT_H_
#define ONEWIRE7SEGMENT_H_



//----------------------------------------- START ----------------------------------------------------------


void assembly_pin3()
{
	//5th pin...
	asm volatile("ldi r19, 16\n"
	"ldi r17, 4\n"
	"lds r18, 43\n"
	"eor r18, r19\n"
	"sts 0x2b, r18\n"
	
	"denr: \n"
	"dec r17\n"
	"nop\n"
	"nop\n"
	"nop\n"
	"brne denr\n"
	
	"lds r18, 43\n"
	"ori r18, 16\n"
	"sts 0x2b, r18\n"
	
	);
	
}


void assembly_pin4()
{
	//5th pin...
	//5th pin...
	asm volatile("ldi r19, 16\n"
	"ldi r17, 61\n"
	"lds r18, 43\n"
	"eor r18, r19\n"
	"sts 0x2b, r18\n"
	
	"denef: \n"
	"dec r17\n"
	"nop\n"
	"nop\n"
	"brne denef\n"
	
	"lds r18, 43\n"
	"ori r18, 16\n"
	"sts 0x2b, r18\n"
	
	);
}




void shift_register(byte data)
{
	
	for(int a=7; a >-1 ; a--)
	{
		if((data >> a) & 0x1)
		{
			
			
			
			assembly_pin3();
			
			//PORTD &= ~(1 << SHIFT_PIN);
			//delayMicroseconds(1);
			//PORTD |= 1 <<SHIFT_PIN ;
			delayMicroseconds(100);
		}
		else
		{
			//PORTD &= ~(1 <<SHIFT_PIN);
			//digitalWrite(SHIFT_PIN, 0);
			assembly_pin4();
			//delayMicroseconds(15);
			// PORTD |= 1 <<SHIFT_PIN;
			//    digitalWrite(SHIFT_PIN, 1);
			delayMicroseconds(100);
			
		}
		
		
	}
	PORTD &= ~(1 <<SHIFT_PIN);
	//  digitalWrite(SHIFT_PIN, 0);
	delayMicroseconds(200);
	PORTD |= 1 <<SHIFT_PIN;

	// digitalWrite(SHIFT_PIN, 1);
	delay(3);
}


byte SHIFT_REG_DATA;
void set_shift_pin(byte pin_number, byte value)
{
	if(value == 1)
	{
		SHIFT_REG_DATA |= 1 << pin_number;
	}
	else if(value == 0)
	{
		SHIFT_REG_DATA &= ~(1 << pin_number);
	}
	
	shift_register(SHIFT_REG_DATA);
	
}

#define SHIFT_DATA 1
#define SHIFT_CLK 0
#define DIGIT1 2
#define DIGIT2 3



byte rakamlar [] = {0b01000000, 0b11111001, 0b00100100, 0b00110000, 0b00011001, 0b00010010, 0b00000010, 0b11111000, 0b00000000, 0b00010000};

void set_digit(byte digit_number, byte value)
{
	for(int i = 7; i > -1 ; i--)
	{
		set_shift_pin(SHIFT_DATA, (value >> (i))&0x1);
		delayMicroseconds(3);
		set_shift_pin(SHIFT_CLK, 1);
		delay(1);
		set_shift_pin(SHIFT_CLK, 0);
		delay(1);
	}
	
	if(digit_number == 1)
	{
		set_shift_pin(DIGIT1, 1);
		delay(1);
		set_shift_pin(DIGIT1, 0);
		delayMicroseconds(5);
	}
	else if(digit_number == 2)
	{
		set_shift_pin(DIGIT2, 1);
		delay(1);
		set_shift_pin(DIGIT2, 0);
		delayMicroseconds(5);

	}
	
}//void set_digit(byte digit_number, byte value)


void display_number(byte rakam)
{
	set_digit(2, rakamlar[rakam%10]);
	set_digit(1, rakamlar[rakam/10]);
	
}






#endif /* ONEWİRE7SEGMENT_H_ */