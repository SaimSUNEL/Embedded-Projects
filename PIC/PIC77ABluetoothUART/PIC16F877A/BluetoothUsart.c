
#include<htc.h>
#define BAUD 9600 //Osilatore hesaba göre secilir
#define FOSC 4000000L //osc
#define DIVIDER ((int)(FOSC/(16UL * BAUD) -1))
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
{SPBRG=DIVIDER; //DIVIDER;
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


unsigned char gelen;
#define DelayMs __delay_ms


void main()

{  // TRISC = 0b10000000;
	PORTC = 0;
	PORTB = 0;
	TRISB = 0;
	seri_portu_ayarla();
	

	while( 1 )
	{  
		gelen = seri_porttan_veri_al();
	
	
		RC0 = ~RC0;
		DelayMs( 250 );
		if( gelen == 'w' )
		{
			RB0 = ~RB0;
		}
		if( gelen == 's' )
		{
			RB1 = ~RB1;
		}
		if( gelen == 'd' )
		{
		RB2 = ~RB2;
		}
		if( gelen == 'a' )
		{
			RB3 = !RB3;
		}
		
		seri_porta_veri_gonder( 'V' );
		DelayMs( 20 );
		seri_porta_veri_gonder( 'e' );
		DelayMs( 20 );
		seri_porta_veri_gonder( 'r' );
		DelayMs( 20 );
		seri_porta_veri_gonder( 'i' );
		DelayMs( 20 );
		seri_porta_veri_gonder( ' ' );
		DelayMs( 20 );
		seri_porta_veri_gonder( 'G' );
		DelayMs( 20 );
		seri_porta_veri_gonder( 'e' );
		DelayMs( 20 );seri_porta_veri_gonder( 'l' );
		DelayMs( 20 );seri_porta_veri_gonder( 'd' );
		DelayMs( 20 );seri_porta_veri_gonder( 'i' );
		DelayMs( 20 );
		seri_porta_veri_gonder( '-');
		DelayMs( 20 );
		seri_porta_veri_gonder( gelen );
		DelayMs( 20 );
	}
	
	
	
	
	
	
	
	
	
	
}