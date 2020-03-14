#include<htc.h>
typedef unsigned char byte;
#include "ShiftReg.h"

void main()
{
	//Internal oscillator will be used...
	SCS1 = 1 ;
	SCS0 = 0 ; 
	
	//4 MHZ...
	IRCF3 = 1 ;
	IRCF2 = 1 ;
  	
	IRCF1 = 0;
	IRCF0 = 1 ;
	ANSELA  = 0 ;

	TRISA0 = 0;
	TRISA5 = 0; //Main register...
	RA5 = 1; //Must be high, while loading it is pulled down...

	__delay_ms(100);

	while(1)
	{
//		MainRegisterLoadData(0b01010101);
	//	MainRegisterLoadData(0b1000);

		MainRegisterSetPin(1, 1);
		//MainRegisterSetPin(1, 0);
		__delay_ms(500);

	}

}