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

void main()
{
    ANSELA = 0;
    
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


RXDTSEL = 1; //Rx pini RA5 te...e o
DELAY(120);

UART_init();

DELAY(100);
//if(false)
   
TRISA0 = 0; //RA0 Output
while(true)
{
    RA0 = ~RA0;
    DELAY100(10);
    
}

}
