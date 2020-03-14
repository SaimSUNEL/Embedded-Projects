/*
 * Atmega328p22050HZfreq.cpp
 *
 * Created: 12.02.2016 21:32:25
 *  Author: Saim
 */ 


#include <avr/io.h>
#define F_CPU 16000000UL
#include <util/delay.h>
int main(void)
{
	
	DDRB |= 1 << PINB1 ;
	TCCR1A = 0 ;
	TCCR1B = 0 ;
	TCNT1 = 0;
	TCCR1A |= 1 << COM1A1 ;  //Clear OC1A pin on compare match set at bottom....
	
	TCCR1B |= 1 << WGM13 | 1 << WGM12 ; //Fast PWM top ICR1
	TCCR1A |= 1 << WGM11  ;
	ICR1 = 90 ; //For 22000 HZ...
	OCR1A =726 / 2 ;
	TCCR1B |= 1 << CS11 ;  //Presc 1 : 1
	

	
	

	//FOR CTC MODE
	/*
	TCNT1 = 0 ;
TCCR1A |= 1 << COM1A0 ; // Toggle OC1A on Compare Match
 TCCR1A |= 1 << WGM12 ; // CTC Top : OCR1A
 OCR1A = 362 ; //for 22000 HZ
  TCCR1B |= 1 << CS10 ; //Presc 1:1

*/
 int k ;
 
    while(1)
    {
 
 for( k =  0; k < 725 ; k ++ )
 {
	 OCR1A = k ;
	 _delay_ms( 10 ) ;
 }
  for( k =  725; k >0 ; k -- )
  {
	  OCR1A = k ;
	  _delay_ms( 10 ) ;
  }
 
 
 
        //TODO:: Please write your application code 
    }
}