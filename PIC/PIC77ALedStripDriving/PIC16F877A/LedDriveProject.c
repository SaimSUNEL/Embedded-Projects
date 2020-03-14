
#include<htc.h>

#define OUTPUT_ENABLE RB0 
#define DATA RB1
#define SRCLR RB2
#define CLK RB3
#define STORE_CLK RB4
//SER = DATA 
int index ;

int speed = 30 ;


int pow ( int val  , int us )
{
	if ( val == 0 ) return 1 ;
		
	int temp = val ;
	
	for ( int b = 0 ; b  < us ; b++ )
	{
	temp *= val ;	
		}	
	
		return temp ;
}






void load_reg ( unsigned char data ) 
{
	
	for ( index = 7 ; index >= 0 ; index -- )
	{
		
		DATA = ( data >> index ) &  0x1 ;
		CLK = 1 ;
		__delay_us ( 10 ) ;
		CLK = 0 ;
		
	}
	
	STORE_CLK = 1 ;
	__delay_us ( 10 ) ;
	STORE_CLK = 0 ;
}


void choose_reg ( int number ) 
{
	PORTC = number ;
__delay_us ( 10 ) ;
PORTC = 15 ;
	
	
	
}
void set_speed ( int val ) 
{
	
	int onluk = val / 8 ;
	int kalan = val % 8 ;
	
	load_reg ( 255 ) ;
	int a=0; 
	for ( a = 0 ; a < onluk ; a++ )
	{
		choose_reg ( a ) ;		
	}
	
load_reg ( pow ( 2, kalan  ) -1 ) ;

	choose_reg ( a ) ;
load_reg ( 0 ) ;
for ( int g = a +1 ; g < 10 ; g++ )
{choose_reg ( g ) ;

	}
	
	
	
	
}

int sicaklik = 0 ;
void main ( ) 
{
	
	
	//FOSC/64 conversion clock
	ADCS2 = 1 ;
	ADCS1 = 1 ;
	ADCS0 = 0 ;
	
	//AN0 channel selected...
	CHS2 = 0 ;
	CHS1 = 0 ;
	CHS0 = 0 ;
	//Result right justified
	ADFM = 1 ;
	//All port a pins are analog
	PCFG3 = 0;
	PCFG2 = 0 ;
	PCFG1 = 0 ;
	PCFG0 = 0 ;
	
	ADON = 1 ;
	
	
	
	
	TRISB = 0 ;
	PORTB = 0 ;
	TRISC = 0 ;
	PORTC =15;
	
	
	//Output enable when 0 enabled...
	OUTPUT_ENABLE = 0 ;
	//Shift reg clear , when 0 shift reg is cleared
	SRCLR = 1 ;
	
	
	int value = 0 ;
	char increase = 1 ;
	
while ( 1 ) 
{

	GO_DONE = 1 ;
	 while ( GO_DONE ) ;
		 
	sicaklik = ( ADRESH << 8 )  + ADRESL ;
	sicaklik = (int ) ( sicaklik * ( 5000.0 /1024.0 ) ) ;
	 sicaklik = (int ) ( sicaklik /10.0  ) ;
	 
	 set_speed ( sicaklik ) ;
	 
	/*
	if ( increase ) 
	{
	set_speed ( value++ ) ;
	if  ( value == 56 ) increase =  0 ;
	}
	else 
	{
		set_speed ( value -- ) ;
		if ( value == 0 ) increase = 1 ;
	}
		
	
*/
	__delay_ms  ( 250 ) ;
}
	
	
	
}