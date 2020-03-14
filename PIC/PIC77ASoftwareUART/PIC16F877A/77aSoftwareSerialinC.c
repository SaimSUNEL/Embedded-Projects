
#include<htc.h>



//16 mhz tamam....









void SerialSoftware_ayarla() 
{
	
	TRISD7=1;
	TRISD6=0;
	RD7 = 0;
	RD6 = 1 ;
	
	
}
char __ind ;
void SoftwareSerial_gonder ( unsigned char data )
{
	RD6 = 0 ; 
	__delay_us ( 100 ) ;
	
	for  (  __ind =  0 ; __ind < 8 ;__ind ++ )
	{
		
		RD6 = data >> __ind ;
		__delay_us ( 95 );//55 for 9600 in 4 mhz  //75 for 9600 in 8MHZ  ; 95 for 9600 in 16mhz 
		
		
		
	}
	
	//RD6 = 0 ; 
	//__delay_us ( 85  );
	RD6 = 1 ;
	__delay_us ( 104 ) ;
	
	
	
	
	
	
	
	
	
	
	
}

unsigned char t ;

unsigned char gelen_data ;
unsigned char SoftwareSerial_receive ( ) 
{
	gelen_data = 0 ;
while ( RD7 == 1 ) ;


__delay_us ( 110) ;

for ( __ind = 0 ; __ind < 8 ; __ind ++ )
{
	gelen_data |= RD7 << __ind ;
	RD5 = RD7 ;
	__delay_us (100 ) ; //60 for 9600 in 4 mhz //80 for 9600 in 8mhz ;  100 for 9600 in 16MHZ
	
	
	
}
	
	
	t = gelen_data ;
	return gelen_data ;
	
	
}








void main ()
{
	
	TRISB0 = 0 ;
	 RB0 = 0 ;
	
	
	SerialSoftware_ayarla ( ); 
	__delay_ms ( 100 ) ;
	TRISD5 = 0 ;
	RD5 = 0 ;
	
	
	
	
	
	
	while ( 1 ) 
	{
		
	 SoftwareSerial_gonder ( 'a' ) ;
		__delay_ms ( 100  );
		SoftwareSerial_gonder( 's' ) ;
		__delay_ms ( 10 );
		SoftwareSerial_gonder( 'a' );
		t = SoftwareSerial_receive( ) ;
		if( t == 'a' )
		{
			RB0 = ~RB0 ;
			
		}
		__delay_ms ( 2000  );
		
		
	}
	
	
}