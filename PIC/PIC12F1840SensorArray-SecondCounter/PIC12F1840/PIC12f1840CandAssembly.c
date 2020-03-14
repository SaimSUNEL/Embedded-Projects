#include <htc.h>

#include<stdlib.h>
#include<stdio.h>
#include<string.h>
typedef unsigned char byte;
#include "OneWireShiftRegister.h"
#include "OneWireLCD.h"
#include "7Segments.h"
#include "LED.h"
#include "INPUTHEADER.h"
#include "DHT11.h"
#include "ADC.h"
#include "UART.h"
#include "EEPROM.h"
#include "INT0.h"
#include "TIMER1.h"
#include "INTERRUPT.h"
#include "ALARM.h"
#include "InternalTemperature.h"


byte dht11_data[5];//40 bits
byte sicaklik, nem ;
byte low_time_count, high_time_count;

byte deneme;

byte oku1, oku2;

int sensor_measurements[4];
int voltage = 0;
int val;
byte sensor_min_max [][2] = {{0, 60}, {0, 60}, {0,60}, {0, 60} };
float sensor_scalar [] = {5.0/1024.0*100.0, 5.0/1024.0*100.0, 5.0/1024.0*100.0, 5.0/1024.0*100.0};

byte danger_sensor[] = {5, 5, 5, 5};

byte kommand [60];

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
TRISA4 = 1; //dth11 pin, analog inputs, digital inputs...

TRISA0 = 0;
TRISA1 = 1; //RX pin.
TRISA2 = 0;
TRISA5 = 0;

RA2 = 1;
RA5 = 1;

for(int j = 0 ; j < 60 ; j++)
{
	kommand[j] = j;
}

//while(1);


__delay_ms(100);
LCD_init();
ADC_init();
UART_init();
INT0_init();
TIMER1_init();
//TEMPINDICATOR_init();
__delay_ms(100);

PEIE = 1;
GIE = 1;

int rakam = 0;

lcd_write("This is a try");
__delay_ms(1000);
lcd_clear();
while(1)
{
lcd_goto(1, 1);
rakam ++;
lcd_write_number(rakam);
display_number(rakam);

__delay_ms(1000);
lcd_write("     ");

//oku1 = TempIndicator_read();

}


//set_segment_shift(SECOND_DIGIT, rakamlar[1]);



/*
lcd_write("Saim SUNEL");
set_segment_shift(FIRST_DIGIT, rakamlar[0]);
set_segment_shift(SECOND_DIGIT, rakamlar[1]);
led_on(15);
input_selection(4);
__delay_ms(50);
DHT11_get_data();
input_selection(0);
__delay_ms(20);
UART_byte_send(ADC_read());
input_selection(4);
__delay_ms(20);
DHT11_get_data();
input_selection(1);
__delay_ms(20);
UART_byte_send(ADC_read());
*/




/*
byte rakam = 0;
while(1)
{



if(count_status == COUNT_IDLE)
	{
		input_selection(4); //DHT index...
		__delay_ms(10);
		DHT11_get_data();

		what_to_display = SICAKLIK;
		GIE = 0;
		display_number(sicaklik);
		GIE = 1;
		__delay_ms(1000);
		while(count_status == COUNT_ACTIVE);
		what_to_display = NEM;
		GIE = 0;
		display_number(nem);
		GIE = 1;
		__delay_ms(1000);
		while(count_status == COUNT_ACTIVE) ;



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
			GIE= 0;
			display_number(voltage);
			GIE = 1;
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
			//As soon as the emergency is detected, warn till normal values are reached...
			if(danger_sensor[sensor_index] == 1)
				alarm_on();

			led_on(temp);
			__delay_ms(2000);
			while(count_status == COUNT_ACTIVE);

		}
		byte alarm = 0;
		for(byte i = 0; i < 4; i++)
		{
			if(danger_sensor[i] == 1)
				alarm = 1;
		}
		if(alarm == 1)
		{
			alarm_on();
			//set_bit(6, 1);
		}
		else alarm_off();
			//set_bit(6, 0);
		

		led_on(0);
	}





}

*/

}