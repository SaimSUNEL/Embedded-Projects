
#include<avr/io.h>
#include<avr/interrupt.h>
 


int sayi = 0;
    
   void  TIMER0_OVF_vect (void) __attribute__ ((signal,__INTR_ATTRS)) ; void TIMER0_OVF_vect  (void)
	{
	sayi++;
	
	if( sayi == 500 )
	{
	
	sayi = 0;
		if( PINB & 1 << PINB0 )
			
		{
			
			PORTB &= ~( 1 << PINB0 ) ;
			
			
			
		}else PORTB |= 1 << PINB0;
		
	
	}	
		
		
		
	TCNT0 = 6;	
		
		
		
		
	}


int main()
 {
	 
	 
	 DDRB = 255;
	 PORTB = 0 ;
	 
	 sei();
	 
	 
	 
	 TCCR0B |= 1 << CS01; //   clock/8
	 
	 // TCNT0 – Timer/Counter Register
	 TCNT0 = 6;
	 
	 
	 //TIMSK0 – Timer/Counter Interrupt Mask Register
	 
	// TOIE0: Timer/Counter0 Overflow Interrupt Enable
	 
	 TIMSK0 |= 1 << TOIE0;
	 
	 
	 
	 
	 
	 
	 
	 while( 1 );
	 
	 
 }