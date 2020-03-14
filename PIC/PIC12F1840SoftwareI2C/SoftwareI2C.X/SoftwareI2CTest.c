
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
#include "SoftwareI2C.h"
#include "EEPROM24C32.h"
byte value;

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

SCS1 = 1 ; //Internel oscillator
SCS0 = 0;

DELAY(120);
//RA0 output  
TRISA0 = 0;
SoftwareI2C_initialize();
DELAY(100);

 
   
   
   

int k = 0;
    while(1)
    {
SoftwareI2C_start();
   SoftwareI2C_send_byte(0b11010000, READ);
   SoftwareI2C_send_byte(0x0, READ);

   SoftwareI2C_stop();
   
    SoftwareI2C_start();
   SoftwareI2C_send_byte(0b11010001, WRITE);
   SoftwareI2C_ACK();
   saniye = SoftwareI2C_read_byte();
   SoftwareI2C_ACK();
   dakika = SoftwareI2C_read_byte();
   SoftwareI2C_NACK();
   
   SoftwareI2C_stop();
   
   EEPROM24C32_write_byte  (k++, k);

        //Toggle pin
        RA0 = ~RA0;
        //1 sec
        DELAY100(10);
        
    }
    
    
}
