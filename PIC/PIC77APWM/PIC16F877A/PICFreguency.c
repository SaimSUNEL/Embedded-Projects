
#include<htc.h>
#define DelayMs __delay_ms
#define DelayUs __delay_us
unsigned int degerler[ 10 ];
char index;
volatile long int freq;
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

char x ,b=0;
void interrupt FNC ( )
{

	degerler[ index++ ] = CCPR1;
	CCP1IF=0;
	if( index==10){index=0;
		
		
		CCP1IE = 0;
	
		seri_porta_veri_gonder( degerler[ 5 ] - degerler [4]);
		
		DelayMs ( 500 );
		
		
				CCP1IE = 1;
			
		
		
		}
	}

void main()
{
	seri_portu_ayarla();
TRISB = 0;
PORTB = 0;
CCP1M2 = 1;//capture mode on every rising edge...
TMR1 = 0;
TMR1CS = 0;//internal osc / 4
GIE = 1;
PEIE = 1;
CCP1IE = 1;
T1CKPS1 = 0; //Presc 1/4
T1CKPS0 = 0;
TMR1ON = 1;
	
	while( 1 );
	
	
	
}