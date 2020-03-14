




#include<htc.h>
#include "c:\\tc\\delay.c" 

asm("org 0x000");
asm("goto 0x60");









void  FNC () @ 0x60
{
	RC5 = ~RC5;
	GIE = 0;
	
	if( RCIF )
	{
	PORTB ++;
RCIF = 0;	
		
	PORTD = RCREG;
		}

	GIE = 1;

		asm( "retfie" );
		
		} 






unsigned char seri_porttan_veri_al() @ 0x0200
{
while( !RCIF );
return RCREG;
}
void seri_porta_veri_gonder(unsigned char jk) @ 0x250
 { while( !TXIF );
	 TXREG=jk;

	
	 }

	
	
/*
void INT() @ 0x04
	 {
		 FNC();
	 }
	*/


void seri_portu_ayarla() @ 0x300
{SPBRG=25; //DIVIDER;
	BRGH=1;
	
	
	SYNC=0;
	
	TX9=0;
	
   TXEN=1;
	
	RX9=0;
	
	CREN=1;
	
	
	
	SPEN=1;/*
	RC6=1;
	
	RC7=1;
*/
	}

void main() @ 0x500
{
	
 char gelen;
//INT();


	FNC();
	TRISB = 0;
	TRISC = 0b10000000;
	PORTB = 0;
	PORTC = 0;
	seri_portu_ayarla();

	
	DelayMs( 500 );
    seri_porta_veri_gonder( 'S');
	seri_porta_veri_gonder( 'a');
	seri_porta_veri_gonder( 'i');
	seri_porta_veri_gonder( 'm');
	
	
	
	
	PEIE = 1;
	GIE = 1;
    RCIE = 1;	
    TXIE = 0;
	while( 1 )
	{
		gelen = seri_porttan_veri_al();
		
	}
	
	
	
}





