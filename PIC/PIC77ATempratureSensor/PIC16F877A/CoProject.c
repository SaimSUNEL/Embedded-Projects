
#include <htc.h>
#define DelayMs __delay_ms
#include "LCD.h"

int value = 0;


int pow( int a , int b )
{ int c = 1;
	for( int k = 1 ; k <= b ; k++ )
	{
	c = c * a ;
		}
	return c ;

}


int 
strlen( char * s)
{
	 char *	cp;

	cp = s;
	while(*cp++)
		continue;
	return cp-s-1;
}

void karakter_yaz( char *s )
{
int boyut= strlen(s),deger=0;

	if(boyut<=16)
{
		
lcd_write(s);	
	
}
	
if(boyut>16)
{while(deger<=16)	lcd_data(s[deger++]);
lcd_command(satir_2);
deger=deger-1;
	while(deger!=boyut)
	lcd_data(s[deger++]);	
		
	
	

	
	
	}
	
	
	
	
	

	


}

char rakam_digits [ 5 ];
int bolum;
char rakam_digits [ 5 ];
int bolum;
void rakam_yaz ( int a )
{
   
		for( int k = 4; k >= 0 ; k--)
		{
			bolum = a / pow( 10 , k );
            a = a % pow( 10 , k );
     	rakam_digits[ 4 - k ] = bolum + 48 ;

		}
 int k = 0;
while( rakam_digits[ k ] == '0')k++;
for( k=k ; k < 5 ; k ++ )
{	
	lcd_data( rakam_digits[ k ] );
}
		}


void main()
{char *s;
	TRISA = 0b00000001;
	PORTA = 0;
	TRISB = 0;
	PORTB = 0;
	TRISC = 0;
	 PORTC = 0;
	
	DelayMs( 200 );
	lcd_init();
	DelayMs( 200 );
	
	lcd_write( "Saim" );
	RC7 = 1;
	
	
	ADCS2 = 0;
ADCS1 = 0;
ADCS0 =	1;
	CHS2=0;
	CHS1=0;
	CHS0 = 0;
	ADON = 1;
	ADFM = 1;
	DelayMs( 500 );
	
	GO_DONE = 1;
	while( GO_DONE ) ;
	s = (char*)&value;
	*s = ADRESL;
	*( s + 1 )= ADRESH;
	value = value / 2; 
	
	while( 1 )
	{
		
		asm( "nop");
		RC7 = 1;
		
		DelayMs( 1000 );
		RC7 = 0;
		DelayMs( 1000 );
		
		lcd_clear();
karakter_yaz( (char* )"Temp : " );
		rakam_yaz( value );
	DelayMs( 2000 );
	
		RA1 = 1;
		RB0 = ~RB0;
	GO_DONE = 1;
		while( !GO_DONE ) ;
	s = (char*)&value;
	*s = ADRESL;
	*( s + 1 )= ADRESH;
	value = value / 2; 
		//rakam_yaz( value );
	DelayMs( 1000 );
	RA1 = 0;
	
		}
	}