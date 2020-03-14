
#include <htc.h>


struct _servo 
{
	
	
unsigned int angle ;
	
}
bir , iki , uc;




	unsigned char code ;
	unsigned char speed ;
unsigned char seri_porttan_veri_al()
{
while( !RCIF );
return RCREG;
}
void seri_porta_veri_gonder(unsigned char jk)
 { while( !TXIF );
	 TXREG=jk;

	
	 }
void seri_portu_ayarla()
{SPBRG=51;//8 MHZ için BRGH = 1 iken 51 9600 baud rate
	BRGH=1;
	
	SPEN=1;
	
	SYNC=0;
	
	TX9=0;
	
	TXEN=1;
	
	RX9=0;
	
	CREN=1;
	
	
	/*
	RC6=1;
	
	RC7=1;
*/
	}

	
	#define false 0
	#define true 1
	
char servo_number = 0;
char dogru = false;


void interrupt FNC(  )
{
GIE = 0 ;		
		
		
if( servo_number == 0 )
	{
		
	if( dogru ) 
	{
		dogru = false;
	
		RA4 = 0;
		
//65535
		TMR1 = 45535;
		
		servo_number = 1;
		
		
		}
	else
	{
		RA4 = 1;
	
		
		TMR1 = 65535 - ( 540 + 9 * bir.angle ) ;
	
		dogru = true;
			}
		
		
	
	}	
	else if ( servo_number == 1 )
	{
	if( dogru ) 
	{
	dogru = false;
	RA5 = 0;
	
	
		TMR1 = 45535 ;
	
		servo_number = 0;
		}
	else
	{
		dogru = true;
	RA5 = 1;
		
		TMR1 = 65535 - ( 540 + 9 * iki.angle ) ;
		
		}
		
		
		
		
			

	
		
		
			
	//Interruptlarý aç...


}
	
			
	
	
	
	
		
TMR1IF = 0 ;
GIE = 1 ;	
}

	
	
	
	
	
	

//INTOSC seçilmesi CONFIG WORD
void main()
{
	bir.angle = 3;
iki.angle = 3;
	
	SCS1 = 0 ;
	SCS0 = 0 ;
	
	IRCF3 = 1 ;
	IRCF2 = 1 ;
	IRCF1 = 1 ;
	IRCF0 = 0 ;
	SPLLEN = 0 ;  //4x PLL enable...not enabled...
	
	
	TRISA0 = 0 ;
	RA0 = 0 ;
	TRISA1 = 0 ;
	RA1 = 0 ;
	ANSELA = 0 ;
	TRISA2 = 0 ; //PWM pini...
	
	TRISA4 = 0 ; //Servo bir 
	TRISA5 = 0 ; //Servo iki
	
	
	PR2 = 0b01111100 ;  // 8 MHz için 1000 hz 
T2CON = 0b00000111 ;
CCPR1L = 0b00111110 ;
CCP1CON = 0b00011100 ;
CCPR1L = 0 ;
TRISA1 = 1 ;
seri_portu_ayarla() ;
	//TMR2ON 

	int temp ;
	
	TMR1CS1 = 0 ; //Timer clock source fosc( 8 MHZ )
	TMR1CS0 = 1 ;
	
	T1CKPS1 = 1 ;//Timer 1 presc 1/8
	T1CKPS0 = 1 ; 
	 // 1 MHZ clock 1 us for each increment...
	TMR1 = 65535 - 20000 ;
	TMR1ON = 1 ;
	TMR1IE = 1 ;
	GIE = 1 ; 
	PEIE = 1 ;
	
	
	
	
	
	
	
	while( 1 ) 
	{ 
		code = seri_porttan_veri_al (  ) ;
		speed = seri_porttan_veri_al (   )  ;
		if( code == 12 ) 
		{
			temp = speed * 4 ;
			DC1B1 = temp >> 1 ;
			DC1B0 = temp ;
			CCPR1L = temp >> 2 ;
			
			
		}
		else if ( code == 10 ) 
			bir.angle = speed ;
		else iki.angle = speed ;
		
		
		
	}
	
	
}