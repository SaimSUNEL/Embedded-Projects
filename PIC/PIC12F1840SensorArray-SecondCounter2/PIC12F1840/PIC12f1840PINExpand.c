
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


#include "EEPROM.h"

void set_bit(byte bit_number, byte val);


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


#define DATA RA1
#define CLOCK RA0
#define FIRST_DIGIT RA2
#define SECOND_DIGIT RA4

void send_pin_value(byte segment_number, byte value)
{
	
	

	for(byte index = 0; index < 8; index++)
		{
			DATA = ( value >> (7-index)) & 0x1;
			
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


byte rakamlar [] = {0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110, 0b01101101, 
					0b01111101, 0b00000111, 0b01111111, 0b01101111};
#define DATA1 1
#define CLOCK1 0
#define FIRST_DIGIT1 2
#define SECOND_DIGIT1 3
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
			set_bit(DATA1, ( temp >> (7-index)) & 0x1);
			
			set_bit(CLOCK1, 1);
			
			__delay_us(100);
			set_bit(CLOCK1, 0);
			
			__delay_us(100);

		}


	if(segment_number == 1)
	{
		set_bit(FIRST_DIGIT1, 1);
		
		__delay_us(100);
		set_bit(FIRST_DIGIT1, 0);
		
		__delay_us(100);
	}
	else
	{
		set_bit(SECOND_DIGIT1, 1);
		
		__delay_us(100);
		set_bit(SECOND_DIGIT1, 0);
		
		__delay_us(100);
	}


}


void display_number(byte number)
{
	display_digit(1, number / 10);
	
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
		if(second_count == 0)
		{
			second_count = EEPROM_ReadByte(100);

		}
		
		second_count ++;
		if(second_count % 5 ==0)
			EEPROM_WriteByte(100, second_count);
		if(second_count == 99)
		{
			EEPROM_WriteByte(100, 0);
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
		EEPROM_WriteByte(100, 0);

		count_status = COUNT_IDLE;
		TMR1ON = 0;

	}

	IOCIF = 0;
	IOCAF5 = 0;
}

}


byte first_pinheader_value = 0;
byte second_pinheader_value = 0;
void set_bit(byte bit_number, byte val)
{
	if(bit_number /8 == 0)
	{	
		if(val == 1)
		{
			first_pinheader_value |= (1 << bit_number);
			send_pin_value(1, first_pinheader_value);
		}
		else if(val == 0)
		{
			first_pinheader_value = (first_pinheader_value & (~( 1 << bit_number)));
			send_pin_value(1, first_pinheader_value);

		}
	}
	else
	{
		if(val == 1)
		{
			second_pinheader_value |= (1 << (bit_number%8));
			send_pin_value(2, second_pinheader_value);
		}
		else if(val == 0)
		{
			second_pinheader_value = (second_pinheader_value & (~( 1 << (bit_number%8))));
			send_pin_value(2, second_pinheader_value);

		}

	}

}
// 4, 5,6 pinler 0. bit-4 1. bit -5 
void input_selection(byte number)
{
	set_bit(4, (number&0x1));
	set_bit(5, (number>>1)&0x1);
	


}

void led_on (byte led)
{
	for(byte index = 0; index < 8; index++)
		{
			set_bit(DATA1, (led >> (7-index)) & 0x1);
			
			set_bit(CLOCK1, 1);
			
			__delay_us(100);
			set_bit(CLOCK1, 0);
			
			__delay_us(100);

		}


	
		set_bit(7, 1);
		
		__delay_us(100);
		set_bit(7, 0);
		
		__delay_us(100);
	

}



int ADC_read()
{
	int val;
	ADGO = 1;
	while(ADGO);

	val = (ADRESH << 8) | ADRESL;
	ADIF = 0;
	return val;
}

int sensor_measurements[4];
int voltage = 0;
int val;
byte sensor_min_max [][2] = {{0, 60}, {0, 60}, {0,60}, {0, 60} };
float sensor_scalar [] = {5.0/1024.0*100.0, 5.0/1024.0*100.0, 5.0/1024.0*100.0, 5.0/1024.0*100.0};

byte danger_sensor[] = {5, 5, 5, 5};

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
TRISA4 = 1;

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

ADPREF1 = 0;
ADPREF0 = 0;
//FOSC/64 freq for ADC 
ADCS2 = 1;
ADCS1 = 1;
ADCS0 = 0;

ANSA4 = 1;
//AN3 Channel
CHS1 = 1;
CHS0 = 1;

ADFM = 1;//Convertion result is right adjusted...

__delay_ms(250);
IOCAP3 = 1; //Rising edge on RA3 interrupt  IOCAF3 interrupt flag
IOCIE = 1;
IOCIF = 0;

ADON = 1; //ADC module is on...


EEPROM_WriteByte(5, 'S');

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
	


	for(byte sensor_index = 0; sensor_index < 4; sensor_index++)
		{
			byte temp = 0, temp2 = 0;
			temp |= 1 << (sensor_index+4); 
			input_selection(sensor_index);
			__delay_ms(30);
			voltage = ADC_read();
			voltage = (int)(voltage*sensor_scalar[sensor_index]);
			sensor_measurements[sensor_index] = voltage;
			what_to_display = NONE;
			display_number(voltage);
			temp2 = voltage - sensor_min_max[sensor_index][0];
			temp2 =  (byte)(temp2 /((sensor_min_max[sensor_index][1] - sensor_min_max[sensor_index][0])/4.0));
			for(byte i = 0; i < 4;i++)
			{
				if(i < temp2) temp |= 1 << i;
				
			}
			if(temp2 >= 3)
				danger_sensor[sensor_index] = 1;
				else
				danger_sensor[sensor_index] = 5;

			led_on(temp);
			__delay_ms(2000);
		}
		byte alarm = 0;
		for(byte i = 0; i < 4; i++)
		{
			if(danger_sensor[i] == 1)
				alarm = 1;
		}
		if(alarm == 1)
		{
			set_bit(6, 1);
		}
		else 
			set_bit(6, 0);
		led_on(0);
	}



}// while(1)

}// main
