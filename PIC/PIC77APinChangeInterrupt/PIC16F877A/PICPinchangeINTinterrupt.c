
#include<htc.h>

void interrupt FN()
{
	if ( RBIF )
	{
	PORTB;
		RBIF = 0;
		RD1 = ~RD1;
		
		
		asm( "retfie");
		
		
	}
	
	
	
	if( INTF )
	{
		INTF = 0;
		RD0 = ~RD0;
		asm( "retfie" );
	}
	
	
}



void main()
{
	TRISD = 0;
	PORTD = 0;
	
	TRISB = 0b11110001;
PORTB = 0;
GIE = 1;
PEIE = 1;

	RBIE = 1; //pinchange interrupt enable....
	
	
INTEDG = 1;//rising edge or falling edge..
	INTE	= 1; //Enable Interrupt
	

while( 1 );	
	
	
	
	
}