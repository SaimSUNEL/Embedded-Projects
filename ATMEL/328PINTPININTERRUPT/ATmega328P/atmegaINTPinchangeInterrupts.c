


//  c C
#include <avr/io.h>
#include <avr/interrupt.h>
volatile int number ;
ISR ( INT0_vect )
{
	number ++ ;
	if( PORTB == 1 ) PORTB = 0; else PORTB = 1;
	
	
	
}
int main()
{
	
	DDRD = 0;
	PORTD = 0;
	sei();
	EICRA = 1 << ISC00; //on pin Change..
	EIMSK = 1 << INT0; //interrupt enabled...
	while( 1 );
	
	
	
	
}