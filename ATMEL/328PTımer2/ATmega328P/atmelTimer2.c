
#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>


int count = 0;
ISR( TIMER2_OVF_vect )
{
	
	count++;
	
	if( count == 200 )
	{
count = 0;
		if( PORTB & 1 << PINB0 )
	{
PORTB &= ~( 1 << PINB0 );
		


	}		
else
	PORTB |= 1<< PINB0;
	
		
	}
TCNT2 = 6;
	
	
	
}


int main()
{
	
	DDRB = 255;
	PORTB = 0;
	
	PRR &= ~( 1 << PRTIM2 ); 
	TCNT2 = 6;
	TIMSK2 |= 1 << TOIE2;
	sei();
	
	//1/32 prescaling..
	TCCR2B |= 1 << CS21;
	TCCR2B |= 1 << CS20;
	
	
	while( 1 );
		
	
	
}