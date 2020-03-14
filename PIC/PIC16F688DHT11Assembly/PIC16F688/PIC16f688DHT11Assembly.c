typedef unsigned char byte;
#include <htc.h>
#include "DHT11.h"

void main()
{

//Internal oscillator will be used...
	SCS = 1 ; 
	
	//8 MHZ...
	IRCF2 = 1 ;
  	
	IRCF1 = 1;
	IRCF0 = 1 ;

	ANSEL  = 0 ;

	TRISA3 = 1;
	__delay_ms(100);

	TRISA0 = 0;
	TRISA5 = 0; //Main register...

	TRISA2 = 0; 
	TRISA4 = 0;
	TRISA1 = 1;//DHT11
	
	
	DHT11_get_data();

while(1)
{
	RA2 = ~RA2;
	DHT11_get_data();
	RA0 = 0;
	__delay_ms(500);
}

}
