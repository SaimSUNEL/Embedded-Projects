#pragma config CLKOUTEN=OFF, WDTE = OFF, PWRTE = OFF, CP = OFF, BOREN = OFF, FCMEN = OFF, MCLRE = OFF, CPD = OFF, IESO = ON, FOSC = INTOSC, STVREN = OFF, BORV = LO, LVP = OFF, WRT = OFF, PLLEN = OFF

#define _XTAL_FREQ 8000000
#define true 1
#define false 0
typedef unsigned char byte;
byte nisa[2];
byte start;
unsigned int measured_adc_value;
byte DISPLAY_POEM = false;
byte LCD_LED_ON = false;
byte saniye, dakika, saat ;


#include <htc.h>
void DELAY(byte number)
{
    for(byte k=0; k != number; k++)
        __delay_ms(1);
}
void DELAY100(byte number)
{
    for(byte k=0; k != number; k++)
        __delay_ms(100);
}
#include <stdlib.h>
#include "SoftwareUART.h"
//#include "EEPROM24C32.h"
byte value;
byte gelen;

byte bilgi[5]={'N', 'i', 's', 'a', ' '};
byte bilgi2[5];
void main()
{
    ANSELA = 0;
    
    SPLLEN = 0;
//16 mhz 1111 internal oscillator
//8MHZ 1110
    //1101 4 MHZ    
//8MHZ
IRCF3 = 1;
IRCF2 = 1;
IRCF1 = 1;
IRCF0 = 0;

SCS1 = 1 ; //Internal oscillator
SCS0 = 0;
TRISA2 = 0;
RA2 = 1;
DELAY(120);
//RA0 output  
TRISA0 = 0;
SoftwareUART_initialize();
DELAY(100);

int k = 0;
    while(1)
    {
        SoftwareUART_send_byte(k++);
        value = Software_read_byte();
                //Toggle pin
        RA0 = ~RA0;
        //1 sec
        DELAY100(10);
        
    }
    
    
}
