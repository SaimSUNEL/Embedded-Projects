

/*
 * ATMEGA328PTC0PWM.c
 *
 * Created: 17.07.2015 19:09:44
 *  Author: Saim
 */ 


#include <avr/io.h>

#include <util/delay.h>
int main(void)
{
   
   DDRD = 1 << 6;
   TCCR0A |= 1 << COM0A1;
   
   TCCR0A |= 1 << WGM01 ;
   TCCR0A |= 1 << WGM00 ;
   
   TCCR0B |= 1 << CS02 ;
    
   OCR0A = 0 ;
   
   int k;
   
    while(1)
    {
   
   
   for( k = 0 ; k < 255 ; k++ )
   {
	   OCR0A = k;
	  _delay_ms( 30 ); 
	   
   }
   
    for( k = 255 ; k > 0 ; k-- )
    {
	    OCR0A = k;
	    _delay_ms( 30 );
	    
    }
    
   
   
   
        //TODO:: Please write your application code 
    }
}