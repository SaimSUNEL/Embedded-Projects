

#include <htc.h>

typedef unsigned char byte ;

byte_send ( byte data )
{
   while ( !TXIF ) ;
      TXREG = data ;
}

byte byte_receive  ( )
{
   while ( !RCIF ) ;
 return RCREG ;
  
}



void Usart_ayarla ( ) 
{
   //Rx pin digital input
 ANSA1 = 0 ;
 TRISA1 = 1 ;
   //Tx pini digital output...
   ANSA0 = 0 ;
  TRISA1 = 0 ; 
   
   //Async mode...
   SYNC = 0 ;
   //9600 baud rate for 8MHz..
   BRGH = 0;
   BRG16 = 0 ;
   SPBRG = 12 ;
   //continuous receive enabled...
   CREN = 1 ;
   //Serial port enable...
   SPEN = 1 ;
   TXEN = 1 ;
  
}
#define VAR 1
#define YOK 0
char hata = 0;
char hata_array [ 5 ] ;
unsigned char dht_data [ 5 ] ;

unsigned char saim  , kk , lk , mm ;

void get_DHT11_data()
{
   unsigned char fa  , _ind , sayi  , count , temp , index  ;
   
  
   
	for( fa =  0; fa < 5 ; fa++ )
	dht_data [ fa ] = 0 ;	
//	TRISB0 = 0 ;//DDRB |= 1 ;//trisb.RB0 = 1 ;
//	RB0 = 1 ; //PORTB = 1 ;//portb.RB0 = 1 ;
//	__delay_ms( 250 ) ; //iþlemci baþlayýnca biraz bekle line is high pull up tan ötürü
	 // PB0 pini output ve low line is low
//	TRISB0=0;
	TRISA5 = 0 ;
	RA5	= 0 ; //PORTB = 0 ;//portb.RB0 = 0 ;
	__delay_ms(18) ; //Start signal için...
	RA5 = 1 ; //PORTB = 1 ;//portb.RB0 = 1 ; //PB0 high line is high
	
	while ( RA5 ) ;
	//__delay_us(30) ;
	RA5 = 0 ; //PORTB = 0 ; //portb.RB0 = 0 ;
	//Bundan sonra input edilip
//	nRBPU=1;
	//OPTION_REG |= ( 1 << 7 );
	TRISA5 = 1 ; //DDRB = 0 ; //trisb.RB0 = 0 ; //PB0 input
	sayi = 0 ;

while(  !RA5 ){ sayi ++ ; if( sayi == 200 ) { hata = VAR ;return;    }   } //DHT responsu tamam....
//saim = sayi ;


sayi = 0 ;

	while( RA5  ) { sayi ++ ; if( sayi == 200 ) {hata = VAR ; return ;}    }  ;  

//kk = sayi ;
	for ( _ind = 0 ; _ind < 5 ; _ind++ )
	{
			for( index = 0 ; index < 8 ; index ++ )
			{
				
				count = 0 ;
			  
				while( !RA5 ) 
					{ count ++  ; 
						if( count >200 ) { hata = VAR ;
						   hata_array [ _ind ] = 1 ;
							return ;  
							}  
							} 
				temp = count;
					__delay_us(2);
							
				count = 0 ;
							while( RA5 ){ 
					count ++  ; 
					if( count > 200 ) 
						
						{ 	hata = VAR ;
						    hata_array [ _ind ] = 1 ;
						   
							return ;  }   
							}
							
					//		mm = count ;
				if( count > temp ) dht_data[ _ind ] |= 1 << (7- (index ) ) ;
			}
		}
			
			
			
TRISA5 = 0 ;
RA5 = 1 ;

}



int sicaklik , nem ;


void main ( ) 
{
   
   
   //Internal oscillator will be used...
	SCS1 = 1 ;
	SCS0 = 0 ; 
	
	//8 MHZ...
	IRCF3 = 1 ;
	IRCF2 = 1 ;
   	
   IRCF1 = 1;
	IRCF0 = 0 ;
  // IRCF1 = 1 ;
	//IRCF0 = 0 ;
/*	
   IRCF1 = 0 ;
	IRCF0 = 1 ;
*/	
	ANSELA  = 0 ;
	
	
	TRISA = 0 ;
	PORTA = 0 ;
	Usart_ayarla ( ) ;
	
	
	//A3 pini input uzaklýk sensöründen gelen....
	TRISA3 = 1 ;
//DHT pini...					
TRISA5 = 0 ;
RA5 = 1 ;
	
	while ( 1 ) 
	{
	   get_DHT11_data ( );
	   byte_send ( dht_data [ 2 ] ) ;
	   sicaklik = dht_data [ 2 ] ;
	   byte_send ( ':' ) ;
	   byte_send ( dht_data [ 0 ] ) ;
	   nem = dht_data [ 0 ] ; 
	   byte_send ( '-' );
	   RA5 = ~ RA5 ;
	   __delay_ms ( 1000 ) ;
	   
	}
	
	   
}