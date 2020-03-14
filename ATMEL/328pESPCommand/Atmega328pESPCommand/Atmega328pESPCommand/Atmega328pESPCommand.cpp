/*
 * Atmega328pESPCommand.cpp
 *
 * Created: 11.07.2019 15:53:15
 *  Author: Saim
 */ 

typedef unsigned char byte;
#include<stdlib.h>
#include<stdio.h>
byte pB;
#include<string.h>
#include <avr/io.h>
#define F_CPU 16000000L
#include <util/delay.h>

#include <avr/atmega328.h>
#define SHIFT_LCD_PIN 5
#define SHIFT_PIN 4
#define delay_ms _delay_ms
#define delay_us _delay_us

#define __delay_ms delay_ms
#define delay delay_ms
#define delayMicroseconds delay_us

#include "OneWireLCD.h"
#include "OneWire7Segment.h"
#include "SoftwareSerial.h"
#include "SerialPort.h"
#include "CommandProcess.h"


byte value = 0;
int main(void)
{
	
	trisd.RD5 = 1; // one wire lcd
	trisd.RD4 = 1; // one wire 7 segment...
	trisd.RD6 = 0; // obstacle sensor...
	trisd.RD3 = 1;
	
	SoftwareSerialInit();
	UsartInit();
	_delay_ms(10);
	//LCD_init();
	delay_ms(250);
	trisb.RB5 = 1; //pin 13 output
	portb.RB5 = 0;
	
	
	
	sprintf((char*)string_characters, "Saim SUNEL \r\n");
	SerialPortSendString();
	
	
	

	while(1)
    {
        //TODO:: Please write your application code 
				
		//portb.RB1 = pinb.RB0;
		
		//portb.RB5 = ~portb.RB5;
		//display_number(pind.RD6);
		//display_number(value);
		//lcd_goto(1, 1);
		//lcd_write_number(value);
		//value++;
		sprintf((char*)string_characters, "C-0\r\n");
		SoftwareSerialSendString();
		SoftwareSerialReadString();
		SerialPortSendString();
		SoftwareSerialReadString();
		SerialPortSendString();
		ProcessCommand();
		//SoftwareSerialSendString();
		//SoftwareSerialReadString();
			portd.RD3 = ~portd.RD3;		
		delay_ms(250);
    }
}