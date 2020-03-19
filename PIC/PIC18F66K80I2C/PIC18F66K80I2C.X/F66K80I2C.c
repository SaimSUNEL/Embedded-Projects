
#define FALSE 0
#define TRUE 1
#pragma config INTOSCSEL = LOW, SOSCSEL = DIG, XINST = OFF, RETEN = OFF, IESO = ON, FOSC = INTIO2, PLLCFG = OFF, BOREN = OFF, BORPWR = LOW, BORV = 3, PWRTEN = OFF, WDTPS = 4, WDTEN = OFF, MCLRE = OFF, STVREN = OFF, BBSIZ = BB1K, CP0 = OFF, CP1 = OFF, CP2 = OFF, CP3 = OFF, CPD = OFF, CPB = OFF, WRT0 = OFF, WRT2 = OFF, WRT3 = OFF, WRTB = OFF, WRTC = OFF, WRTD = OFF, EBTR0 = OFF, EBTR1 = OFF, EBTR2 = OFF, EBTR3 = OFF, EBTRB = OFF
#define _XTAL_FREQ 4000000UL
typedef unsigned char byte;
signed int saim = 0;

#include <htc.h>
#include<stdlib.h>

#include "I2C.h"
#include "DS1307.h"
//IntOI2 mode is selected...

void wait(byte val)
{
    for(byte k = 0; k < val; k++)__delay_ms(10);
    
}
char received, received2;
int measured_value;
byte status;
byte buff[512] = {'D', 'e', 'n', 'e', 'm', 'e', 'l', 'i', 'k'};

byte collision_bit ;
void main()
{
//Internal oscillator selected...
SCS1 = 1;
SCS0 = 0;
INTSRC = 1;
MFIOSEL = 0;
__delay_ms(5);
//101 4MHZ
//110 8MHZ
//111 16MHZ
//4MHZ...
IRCF2 = 1;
IRCF1 = 0;
IRCF0 = 1;
__delay_ms(10);
//PLLEN = 1;
__delay_ms(10);
wait(100);

__delay_ms(5);
__delay_ms(10);

I2C_initialize();
wait(100);
__delay_ms(15);


while(1)
{
DS1307_time();
//DS1307_date();
wait(100);//1 sec
} //while(1)
} // void main
