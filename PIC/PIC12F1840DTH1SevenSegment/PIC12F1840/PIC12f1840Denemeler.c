
#include<htc.h>

#define SICAKLIK 2
#define NEM 3
#define NONE 5


/*

Data format: 8bit integral RH data + 8bit decimal RH data + 8bit integral T data + 8bit decimal T
data + 8bit check sum. If the data transmission is right, the check-sum should be the last 8bit of
"8bit integral RH data + 8bit decimal RH data + 8bit integral T data + 8bit decimal T data".

*/
typedef unsigned char byte;
byte dht11_data[5];//40 bits
byte sicaklik, nem ;
byte low_time_count, high_time_count;

void DHT11_get_data()
{
for(byte a = 0 ; a < 5 ; a++) dht11_data[a] = 0;

RA5 = 0;
TRISA5 = 0;
__delay_ms(20);
TRISA5 = 1;
__delay_us(20);
while(RA5 == 1);
//DHT11 response signal
while(RA5 == 0);
while(RA5 == 1);

for(byte byte_index =0; byte_index < 5; byte_index ++)
{

	for(signed char bit_index = 7; bit_index >= 0 ; bit_index--)
	{
		while(RA5 == 0) low_time_count++;
		while(RA5 == 1) high_time_count++;
		if(high_time_count > low_time_count)
		{
			dht11_data[byte_index] |= 1 << bit_index;
		}

		low_time_count = 0;
		high_time_count = 0;
	}
 


}

sicaklik = dht11_data[2];
nem = dht11_data[0];




}

byte rakamlar [] = {0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110, 0b01101101, 
					0b01111101, 0b00000111, 0b01111111, 0b01101111};
#define DATA RA1
#define CLOCK RA0
#define FIRST_DIGIT RA2
#define SECOND_DIGIT RA4
byte what_to_display = NONE;

void display_digit(byte segment_number, byte value)
{
	byte temp = rakamlar[value];
	if(what_to_display == SICAKLIK)
	{
		if(segment_number == 1 )
		{
			temp |= (1 << 7);
		}
	
	}
	else if(what_to_display == NEM)
	{
		if(segment_number == 2 )
		{
			temp |= (1 << 7);
		}
	
	}
	

	for(byte index = 0; index < 8; index++)
		{
			DATA = ( temp >> (7-index)) & 0x1;
			
			CLOCK = 1;
			
			__delay_us(100);
			CLOCK = 0;
			
			__delay_us(100);

		}


	if(segment_number == 1)
	{
		FIRST_DIGIT = 1;
		
		__delay_us(100);
		FIRST_DIGIT = 0;
		
		__delay_us(100);
	}
	else
	{
		SECOND_DIGIT = 1;
		
		__delay_us(100);
		SECOND_DIGIT = 0;
		
		__delay_us(100);
	}


}

byte count = 0;

void display_number(byte number)
{
	display_digit(1, number / 10);
	__delay_ms(50);
	display_digit(2, number % 10);
}

#define COUNT_ACTIVE 9
#define COUNT_IDLE 8

byte count_status = COUNT_IDLE;
byte timer_count = 0;
byte second_count = 0;
void interrupt FNC()
{
if(TMR1IF == 1)
{
	timer_count ++;
	if(timer_count == 20)
	{
		timer_count = 0;
		second_count ++;
		if(second_count == 99)
		{
			
			TMR1ON = 0;
			count_status = COUNT_IDLE;
		}
		display_number(second_count);
	}

TMR1IF = 0;
}
else
 
if(IOCIF == 1)
{
	if(count_status == COUNT_IDLE)
	{
		count_status = COUNT_ACTIVE;
		TMR1 = 15535;
		second_count = 0;
		TMR1ON = 1;
	}
	else if(count_status == COUNT_ACTIVE)
	{
		count_status = COUNT_IDLE;
		TMR1ON = 0;

	}

	IOCIF = 0;
	IOCAF5 = 0;
}

}



void main()
{

ANSELA = 0;
SPLLEN = 0;
//16 mhz internal oscillator
IRCF3 = 1;
IRCF2 = 1;
IRCF1 = 1;
IRCF0 = 1;

SCS1 = 1 ; //Internel oscillator
SCS0 = 0;
TRISA0 = 0; //A0 output
PORTA = 0;


TRISA3 = 1; //MCLR - A3 always input
TRISA5 = 1; //dth11 pin 

TRISA0 = 0;
TRISA1 = 0;
TRISA2 = 0;
TRISA4 = 0;

IOCAN = 0;
IOCAP = 0;

IOCAP3 = 1; //Rising edge on RA3 interrupt  IOCAF3 interrupt flag
IOCIE = 1;
IOCIF = 0;
IOCAF5 = 0;


TMR1H = 0;
TMR1L = 0;


//timer1 source fosc/4 
TMR1CS1 = 0;
TMR1CS0 = 0;

//Prescaler 1/4
T1CKPS1 = 1;
T1CKPS0 = 0;

//Each interrupt will be rised in every 50000 us, 50 ms
TMR1ON = 0;
TMR1 = 15535;
TMR1IF = 0;
TMR1IE = 1; //Timer1 interrupt enabled...
PEIE = 1;
GIE = 1;
DHT11_get_data();
__delay_ms(100);
//display_number(12);
while(1)
{

	if(count_status == COUNT_IDLE)
	{
		DHT11_get_data();

		what_to_display = SICAKLIK;
		display_number(sicaklik);
		__delay_ms(1000);
		what_to_display = NEM;
		display_number(nem);

		__delay_ms(1000);
	}

}// while(1)

}// main