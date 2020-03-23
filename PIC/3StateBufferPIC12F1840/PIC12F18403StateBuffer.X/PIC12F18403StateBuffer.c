#define _XTAL_FREQ 4000000
#define true 1
#define false 0
typedef unsigned char byte;
;


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
#include "UART.h"
#include "ADC.h"
void main()
{
    ANSELA = 0; //All ADC inputs are disabled...
    
    TRISA = 0b00111110;
 
    SPLLEN = 0;
//16 mhz 1111 internal oscillator
//8MHZ 1110
    //1101 4 MHZ    
//8MHZ - 1110
IRCF3 = 1;
IRCF2 = 1;
IRCF1 = 0;
IRCF0 = 1;

SCS1 = 1 ; //Internel oscillator
SCS0 = 0;

DELAY(120);

#define BUFFER_1 RA0
#define BUFFER_3 RA2

TRISA0 = 0; RA0 = 1; //Buffer disabled..
TRISA2 = 0; RA2 = 1; //Buffer disabled..

TRISA4 = 0; RA4 = 0; //multiplexer selection...

BUFFER_1 = 1; //enable buffer one    
BUFFER_3 = 1; //Disable third buffer

TRISA1 = 0; RA1 = 1;

//ANSA1 = 1;
//ADC_init();

__delay_ms(25);
//RA1 = 1;
RA4 = 1;

TRISA5 = 0;
while(true)
{
    //ADC_read(0);
    RA1 = ~RA1;
    DELAY100(5);
    
    RA5 = RA1;
}

}
