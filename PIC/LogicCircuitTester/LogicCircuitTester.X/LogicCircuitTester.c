/*
 * File:   LogicCircuitTester.c
 * Author: Saim
 *
 * Created on 30 Mart 2020 Pazartesi, 12:24
 */

#define _XTAL_FREQ 4000000
#define true 1
#define false 0
typedef unsigned char byte;
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
#include "UART.h"
#include "I2C.h"
#include "EEPROMAT24C1024B.h"
#include "INTERRUPT.h"
#include "PCF8574.h"
#include "LCD.h"
#include "EEPROM.h"
#include "ADC.h"



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
IRCF1 = 0;
IRCF0 = 1;

SCS1 = 1 ; //Internel oscillator
SCS0 = 0;
RXDTSEL = 1; //Rx pini RA5 te...e o

IOCAP3 = 1; //Rising edge on RA3 interrupt  IOCAF3 interrupt flag
IOCIE = 1;
IOCIF = 0;
DELAY(120);
UART_init();
I2C_initialize();
DELAY(100);
PEIE = 1;
GIE = 1;

TRISA4 = 0;

/*
EEPROMAT24C1024B_start_write_page(0);
for(int a = 0; a < 25; a++)
{
    EEPROMAT24C1024B_write_page(a);
    
}
EEPROMAT24C1024B_stop_write_page();
*/


byte l = 0;

    while(1)
    {
       
  
        DELAY100(10);

     
    }
    
    
    
}
