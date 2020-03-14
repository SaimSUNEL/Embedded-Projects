
#include<htc.h>

void main()
{
TRISB = 0 ; //PORTB tümü output ....
PORTB = 0 ; //For safe ...	
	__delay_ms( 4000 ) ;
RB0 = 1 ;	
	
	
		__delay_ms( 4000 ) ;
	
RB0 = 0 ;	
RB1 = 1 ;	
	
		__delay_ms( 4000 ) ;

RB1 = 0 ;	
	RB2 = 1 ;
		__delay_ms( 4000 ) ;
	
	RB2 = 0 ;	
	RB3 = 1 ;
		__delay_ms( 4000 ) ;
	
while( 1 ) ;
	
	
	
}