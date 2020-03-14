
#include<htc.h>

#define BAUD 9600 //Osilatore hesaba göre secilir
#define FOSC 4000000L //osc

#define DIVIDER ((int)(FOSC/(16UL * BAUD) -1))

#define DelayUs __delay_us
#define DelayMs __delay_ms

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
{SPBRG=DIVIDER;
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



int app , wait , times ,ind;
 void servo_dondur( unsigned char angle )
{


 wait = 1000 +  8* angle   ;
times = wait/ 250;
	
 for (  app = 0 ; app < 6 ; app++ )
 {
  RB0 = 1;


for( ind = 0 ; ind < times ; ind ++ )
{
DelayUs( 250 );


}


int b, c =wait % 250 - 10;
for( b= 0; b < c; b++)
__delay_us(1);




RB0 = 0;
DelayMs( 18 );
 }
  
  
}




	
	
	
	
void main()
{
	unsigned char gelen;
	TRISC7 = 1;
	TRISB = 0;
	PORTB = 0;
	PORTC = 0;
	
seri_portu_ayarla();
DelayMs( 100 );
	

	
	
	
	
	
	int b  = 0;
	int c = 0;
	while( 1 )
	{
		
		for( b = 0 ; b < 180 ; b+=20 )
		{
		servo_dondur( b );	
		DelayMs( 50);
	}
		
		
		for( b = 180 ; b > 0 ; b-=20 )
		{
			servo_dondur( b ) ;
			DelayMs( 50 );
		}
		
		
		/*
		gelen = seri_porttan_veri_al();
		
   servo_dondur( gelen );		
		*/
		
		
	}
	
	
	
	
}