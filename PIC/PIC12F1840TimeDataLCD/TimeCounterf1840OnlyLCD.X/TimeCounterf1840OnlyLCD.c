
#include <htc.h>
typedef unsigned char byte;
#define _XTAL_FREQ 16000000L

void DELAY(byte milisecond)
{
    for(; milisecond >0; milisecond --)
        __delay_ms(1);
    
}

void DELAY100(byte milisecond)
{
    for(; milisecond >0; milisecond --)
        __delay_ms(100);
    
}
unsigned char zaman[7] ;


#include<stdlib.h>
#include<stdio.h>
#include "I2C.h"
#include "EEPROM.h"
#include "INT0.h"
#include "TIMER1.h"
#include "INTERRUPT.h"
#include "DS1307.h"
#include "PCF8574.h"
#include "LCD.h"
#include <time.h>
#include "TimeDiff.h"

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


TRISA0 = 0; //A0 CLK pin...
PORTA = 0;
TRISA3 = 1; //MCLR - A3 always input
TRISA4 = 0; // DATA pin
TRISA5 = 0; // STR pin

TRISA1 = 1; //I2C pins pin both input...
TRISA2 = 1;

I2C_initialize();


DELAY(100);
LCD_init();

PEIE = 1;
GIE = 1;
byte counter=0;

//DisplayNumber(6, 11);

//LoadSevenSegment(5, rakamlar[7]);
//LoadSevenSegment(6, rakamlar[7]);
lcd_goto(1, 1);
lcd_write("Saim");
while(1)
{
   /* DS1307_time();
    DisplayTime();
    DELAY100(10);
    */
   
DS1307_time();
DS1307_date();
getTimeDifference();
lcd_goto(1, 1);
displayTime();
lcd_goto(2, 1);
displayDate();
DELAY100(9);

}



}
