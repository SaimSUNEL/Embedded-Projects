#define _XTAL_FREQ 8000000
#define true 1
#define false 0
typedef unsigned char byte;
// CONFIG1
#pragma config FOSC = INTOSC    // Oscillator Selection (INTOSC oscillator: I/O function on CLKIN pin)
#pragma config WDTE = OFF       // Watchdog Timer Enable (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable (PWRT disabled)
#pragma config MCLRE = OFF      // MCLR Pin Function Select (MCLR/VPP pin function is digital input)
#pragma config CP = OFF         // Flash Program Memory Code Protection (Program memory code protection is disabled)
#pragma config CPD = OFF        // Data Memory Code Protection (Data memory code protection is disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable (Brown-out Reset disabled)
#pragma config CLKOUTEN = OFF   // Clock Out Enable (CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin)
#pragma config IESO = ON        // Internal/External Switchover (Internal/External Switchover mode is enabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor is disabled)

// CONFIG2
#pragma config WRT = OFF        // Flash Memory Self-Write Protection (Write protection off)
#pragma config PLLEN = OFF      // PLL Enable (4x PLL disabled)
#pragma config STVREN = OFF     // Stack Overflow/Underflow Reset Enable (Stack Overflow or Underflow will not cause a Reset)
#pragma config BORV = LO        // Brown-out Reset Voltage Selection (Brown-out Reset Voltage (Vbor), low trip point selected.)
#pragma config LVP = OFF        // Low-Voltage Programming Enable (High-voltage on MCLR/VPP must be used for programming)
void show_time(byte rakam);

#include <htc.h>
#include "OneShiftRegisterSevenSegment.h"
#include "INTERRUPT.h"
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


byte leds[5];
void show_time(byte rakam)
{
    for(byte a=0; a < 5; a++) leds[a] = 0;
    if(rakam > 60 ) rakam = 60;
    byte gap = 12;
    for(byte c = 0; c < rakam/gap; c++)
    {
        leds[c] = 1;
    }
    
    RA0 = leds[0];
    RA1 = leds[1];
    RA2 = leds[2];
    
    RA4 = leds[3];
    RA5 = leds[4];

    
    
    
}

void main()
{
    ANSELA = 0;
    
    TRISA = 0;
 
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

IOCAN = 0;
IOCAP = 0;


IOCAP3 = 0; //(Rising) Falling edge on RA3 interrupt  IOCAF3 interrupt flag
IOCAN3 = 1; //It was 1

DELAY(120);
	
	TMR1 = 0 ;
		
	//Timer 1 clock FOSC
	TMR1CS1 = 0 ;
    TMR1CS0 = 1 ;
	
	//Timer 1 prescaler 1/8
	T1CKPS1 = 1 ;
	T1CKPS0 = 1 ;
	
	TMR1IF = 0 ;
	TMR1GE = 0 ;
	
	//50 ms say?lacak....
	TMR1 = 15535 ;
	
	//timer interruptalar?...
	TMR1IE = 1 ;
		
	//Aktifle?tir...
	//TMR1ON = 1 ;


DELAY(100);
__delay_ms(500);
PORTA = 0;
TRISA0 = 0;
DELAY(100);
PEIE = 1;



IOCAF = 0;
IOCIE = 1;



 byte rakam = 0;
 GIE = 1;
        // for(;;);
    while(1)
    {
        if(count_status == COUNT_IDLE)
        RA5 = ~RA5;
        __delay_ms(1000);              
    }
    
    
    
}
