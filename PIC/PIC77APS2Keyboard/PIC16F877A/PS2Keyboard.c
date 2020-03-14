
#include<htc.h>

//Time için gerekli defineleri unutma...
/*
INTE: RB0/INT External Interrupt Enable bit
1 = Enables the RB0/INT external interrupt
0 = Disables the RB0/INT external interrupt


INTF: RB0/INT External Interrupt Flag bit
1 = The RB0/INT external interrupt occurred (must be cleared in software)
0 = The RB0/INT external interrupt did not occur



INTEDG: Interrupt Edge Select bit
1 = Interrupt on rising edge of RB0/INT pin
0 = Interrupt on falling edge of RB0/INT pin


*/

void seri_port(unsigned char jk) 
 { while( !TXIF );
	 TXREG=jk;

	
	 }
	 
	 unsigned char seri_porttan_veri_al() 
{
while( !RCIF );
	//if( RCREG == 's' )asm( "ljmp 0x1eda" );

return RCREG;
}


void seri_porta_veri_gonder( int number )
{
	seri_port( 'd' );
	seri_port( (number >> 8) );
	seri_port( number );
	
	
}


	 
	 
void seri_portu_ayarla()  
{SPBRG=25; //DIVIDER; 9600 for 4 MHZ...
	BRGH=0;
	
	
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
	



char bit_index ;

unsigned int code = 0 , temp = 0 ;

//Scan kodun tamamen alýnýp alýnmadýðýný kontrol etmek için...

#define false 0 
#define true 1
unsigned char data_temp  = 0 ;
unsigned char pressed_key = 0 ; 
volatile char is_data_ready = false ; 
char index =0;

volatile char ignored = false ; 


void interrupt FNC()
{GIE = 0 ; // Bütün interruptlar kapatýldý...
	INTF = 0 ;

data_temp |= RB1 << index ;
	
index ++ ;

if( index == 11 )
{

index = 0 ;
pressed_key = data_temp >> 1  ;
if( pressed_key == 240 ){ ignored = true ; }
else if ( ignored ){ ignored = false ;  }
else 
{
switch( pressed_key )
{
    case 28:
		pressed_key = 'a' ;
	RD7 = ~RD7 ;	
	
	break;
    case 50:pressed_key = 'b' ;break;
 case 33 :pressed_key = 'c' ;break;
case 35 :pressed_key = 'd' ;break;
case 36 :pressed_key = 'e' ;break;
case 43 :pressed_key = 'f' ;break;

case 52 :pressed_key = 'g' ;break;
case 84 :pressed_key = 'ð' ;break;
case 51 :pressed_key = 'h' ;break;
case 67 :pressed_key = 'ý' ;break;
case 82 :pressed_key = 'i' ;break;
case 59 :pressed_key = 'j' ;break;
case 66 :pressed_key = 'k' ;break;

case 41 : pressed_key = ' ' ; break;
case 75 :pressed_key = 'l' ;break;
case 58 :pressed_key = 'm' ;break;

case 49 :pressed_key = 'n' ;break;
case 68 :pressed_key = 'o' ;break;
case 65 :pressed_key = 'ö' ;break;

case 77 :pressed_key = 'p' ;break;
case 45 :pressed_key = 'r' ;break;
case 27 :pressed_key = 's' ;break;
case 76 :pressed_key = 'þ' ;break;
case 44 :pressed_key = 't' ;break;
case 60 :pressed_key = 'u' ;break;
case 91 :pressed_key = 'ü' ;break;
case 42 :pressed_key = 'v' ;break;
case 53 :pressed_key = 'y' ;break;
case 26 :pressed_key = 'z' ;break;
case 112 :pressed_key = '0' ;break;
case 105 :pressed_key = '1' ;break;
case 114 :pressed_key = '2' ;break;
case 122 :pressed_key = '3' ;break;
case 107 :pressed_key = '4' ;break;
case 115  :pressed_key = '5' ;break;
case 116 :pressed_key = '6' ;break;

case 108 :pressed_key = '7' ;break;
case 117 :pressed_key = '8' ;break;
case 125 :pressed_key = '9' ;break;


}	

seri_port( pressed_key );
RB5 = ~RB5 ;
}

	data_temp = 0 ;
}

		

	}
	
	
	
	/*
	PS2 bir tuþa basýldýðýnda clock sinyali 0 olur bir data da low olur ( start ) bit
	Bundan sonra clockun her düþen kenarý datanýn tam ortasýna gelecek þekilde 8 bitlik key scan kodu output edilir...
	8. bitten sonra bir bit parity 
	Parityden sonra clock tekrar düþen kenarda data 1 olur ( stop bit )
	
	
	
	
	*/

void main()
{
TRISB5 = 0 ; //RB5 pini led için output...
	TRISB1 = 1 ; // RB1 pini keyboardýn data pinine baðlý... Input...
	RB1 = 0 ;
	TRISB0 = 1; //RB0 pini PS2 nin clock bacaðýna baðlý 	... Input
	INTEDG = 0; //On falling edge on RBo will generate interrupt ( 1 on rising edge )
	INTF=0;
	INTE = 1; //RB0 external interrupt enabled...
	TRISD7 = 0 ;
	GIE = 1 ; //For global Interrupts...
    PEIE = 1 ; // Peripheral Interrupts enables... 	
	
	while( 1 )
	{
		//while( data_received == 0 ); //While there is no code received wait until it gets received...
			
		
		
		
		
	}
}