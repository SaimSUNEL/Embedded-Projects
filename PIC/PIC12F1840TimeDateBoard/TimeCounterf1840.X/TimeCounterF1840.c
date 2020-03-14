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
#include "SevenSegments.h"
#include "INT0.h"
#include "TIMER1.h"
#include "INTERRUPT.h"
#include "DS1307.h"
#include <time.h>


struct tm Time1Start;    
struct tm Time1End;
double seconds;

//double year_diff, month_diff, day_diff, hour_diff, minute_diff, second_diff;
//unsigned int year_diff1, month_diff1, day_diff1, hour_diff1, minute_diff1, second_diff1;

unsigned long long difference[6];
unsigned long long divisions[] = {3600*24*30*12, 3600*24*30, 3600*24, 3600, 60, 1.0};
unsigned char diffs [6];

void getTimeDifference()
{
    
    /*
     19-20-10-12 14-55-20
      0  1  2  3  4  5  6 
     
     */
    
    Time1Start.tm_hour=12;
    Time1Start.tm_min=30;
    Time1Start.tm_sec=0;
    Time1Start.tm_year=118;
    Time1Start.tm_mon=5-1;
    Time1Start.tm_mday=2;
    
    
    Time1End.tm_hour= zaman[4];
    Time1End.tm_min=zaman[5];
    Time1End.tm_sec=zaman[6];
    Time1End.tm_year=100+zaman[0];
    Time1End.tm_mon=zaman[2]-1;
    Time1End.tm_mday=zaman[3];
    
seconds = difftime(mktime(&Time1End), mktime(&Time1Start));
for(char i=0; i < 6; i++)
{
    difference[i] = seconds/divisions[i];
    diffs[i] = (unsigned int)difference[i];
    seconds -= difference[i]*divisions[i];
    if (i > 0)
    zaman[i+1] = diffs[i];
    else
    zaman[i] = diffs[i];
}
zaman[1] = 0;
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


TRISA0 = 0; //A0 CLK pin...
PORTA = 0;
TRISA3 = 1; //MCLR - A3 always input
TRISA4 = 0; // DATA pin
TRISA5 = 0; // STR pin

TRISA1 = 1; //I2C pins pin both input...
TRISA2 = 1;

I2C_initialize();

DELAY(100);
PEIE = 1;
GIE = 1;
byte counter=0;

//DisplayNumber(6, 11);

//LoadSevenSegment(5, rakamlar[7]);
//LoadSevenSegment(6, rakamlar[7]);

while(1)
{
   /* DS1307_time();
    DisplayTime();
    DELAY100(10);
    */
   
DS1307_time();
DS1307_date();
getTimeDifference();


DisplayDate();
DisplayTime();
DELAY100(9);
}



}
