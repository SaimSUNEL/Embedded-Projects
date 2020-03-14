
#include<htc.h>
#include "c:\\Tc\\delay.c"
int sayi = 0;
void interrupt funct()
{
	
	if( TMR2IF == 1)
	{
TMR2IF = 0;
		sayi ++;
		
		if( sayi == 245 )
		{
			RB0 = ~RB0;
			sayi = 0;
			
			
		}
		
		
		
	}
	
	
	
	
	
}


void main()
{
	TRISB0 = 0;
	PORTB = 0;
	//TMR2 = 0;
	GIE = 1;
	PEIE = 1;
	
	PR2 = 250;
	
	//Presc 1/4
	T2CKPS1 = 0;
	T2CKPS0 = 1;
	
	
	//Postscale 1/4

	TOUTPS3 = 0;
	TOUTPS2 = 0;
	TOUTPS1 = 1;
	TOUTPS0 = 1;

	TMR2IE =  1;
	
	TMR2ON = 1;
	
	
	while( 1 );
	
	
}