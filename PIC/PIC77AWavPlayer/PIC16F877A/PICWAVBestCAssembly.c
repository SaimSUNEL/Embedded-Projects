


#include <htc.h>




#ifndef _XTAL_FREQ
//Delay fonksiyonlarý için...
#define _XTAL_FREQ 16000000
#endif

// CCP1X : CCP1Y pwm least significant bit 


/*
----SMP: Sample bit
SPI Master mode:
1 = Input data sampled at end of data output time
0 = Input data sampled at middle of data output time
SPI Slave mode:
SMP must be cleared when SPI is used in Slave mode.



----CKE: SPI Clock Select bit
1 = Transmit occurs on transition from active to Idle clock state
0 = Transmit occurs on transition from Idle to active clock state
Note: Polarity of clock state is set by the CKP bit (SSPCON1<4>).



-----BF: Buffer Full Status bit (Receive mode only)
1 = Receive complete, SSPBUF is full
0 = Receive not complete, SSPBUF is empty




----WCOL: Write Collision Detect bit (Transmit mode only)
1 = The SSPBUF register is written while it is still transmitting the previous word. (Must be
cleared in software.)
0 = No collision
bit 6 SSPOV: Receive Overflow Indicator bit
SPI Slave mode:
1 = A new byte is received while the SSPBUF register is still holding the previous data. In case
of overflow, the data in SSPSR is lost. Overflow can only occur in Slave mode. The user
must read the SSPBUF, even if only transmitting data, to avoid setting overflow. (Must be
cleared in software.)
0 = No overflow
Note: In Master mode, the overflow bit is not set, since each new reception (and
transmission) is initiated by writing to the SSPBUF register.


----SSPEN: Synchronous Serial Port Enable bit
1 = Enables serial port and configures SCK, SDO, SDI, and SS as serial port pins
0 = Disables serial port and configures these pins as I/O port pins
Note: When enabled, these pins must be properly configured as input or output.

----CKP: Clock Polarity Select bit
1 = Idle state for clock is a high level
0 = Idle state for clock is a low level


----SSPM3:SSPM0: Synchronous Serial Port Mode Select bits
0101 = SPI Slave mode, clock = SCK pin. SS pin control disabled. SS can be used as I/O pin.
0100 = SPI Slave mode, clock = SCK pin. SS pin control enabled.
0011 = SPI Master mode, clock = TMR2 output/2
0010 = SPI Master mode, clock = FOSC/64
0001 = SPI Master mode, clock = FOSC/16
0000 = SPI Master mode, clock = FOSC/4
Note: Bit combinations not specifically listed here are either reserved or implemented in
I2C mode only.




SDO must have TRISC<5> bit cleared
• SCK (Master mode) must have TRISC<3> bit
cleared
• SCK (Slave mode) must have TRISC<3> bit set
• SS must have TRISC<4> bit set

*/

unsigned int i , r;
unsigned int i2 , r2;



#define CARD_SELECT RB7  //SD kard modulündeki CS pinine baðlý
#define ReadSPI() (spi_yaz(0xff)) //SD karttan gelen veri geri okumak için basit bit macro tanýmlýyoruz...
#define ClockSPI()(spi_yaz(0xff)) //Bazý yerlerde SD karta clock sinyali saðlamamýz gerekiyor..Aslýnda SD den okumakla ayný þey...

unsigned long adress; //Sd karttan okumaya baþlayacaðýmýz adres 

unsigned char spi_yaz( unsigned char veri )   // SPI veri gönderme fonksiyonu ayný zamanda gelen veriyi de alýyor...
{

	SSPBUF = veri;
	
	while( !BF );
		
	return SSPBUF;
	
	}
	
unsigned char temp  ;
int sendSDCmd( unsigned char c , unsigned long x  , unsigned char frame ) //SD karta komut göndermek için kullandýðýmýz fonksiyon..
{

CARD_SELECT = 0 ; // CS pinini sýfýra çekiyoruz ve SD kart iletiþime aktif hale geliyor...
__delay_ms( 300 );
	
	
	spi_yaz( (  c | 0x40 ) & 0xff ); //Öncelikler komut verimizi gönderiyoruz...
	
	
	
	spi_yaz(  (x >> 24 ) & 0xff ); //Ardýndan 4 byttan oluþan adres bilgisi bazý komutlar için argüman bilgisi...

     spi_yaz( ( x>>16 ) & 0xff );

	spi_yaz( ( x >> 8 ) & 0xff  );

	spi_yaz( x  & 0xff );

spi_yaz( frame ); //Son olarak CRC bilgisini gönderiyoruz.... 

	
	//SD karttan gelen cevabý bekleyip geri döndürüyoruz...
	i= 10;
	do
	{
		r = ReadSPI();
		if( r != 0xff ) break;
	}
	while( --i>0);
	
	return (r );
	
	
	
	/* return response
FF - timeout, no answer
00 - command accepted
01 - command received, card in idle state (after RESET)
other errors
*/
	/*
	
	bit 0 = Idle state
bit 1 = Erase Reset
bit 2 = Illegal command
bit 3 = Communication CRC error
bit 4 = Erase sequence error
bit 5 = Address error
bit 6 = Parameter error
bit 7 = Always 0
	*/
	
}

#define disableSD() CARD_SELECT=1;ClockSPI()
#define enableSD() CARD_SELECT=0


#define RESET 0//RESET komutu 0'dýr.
#define INIT 1 //Initialize komutu
#define READ_SINGLE 17 
#define WRITE_SINGLE 24

#define DATA_ACCEPT 0x05
int result;
#define DATA_START 0xFE

//Bu fonksiyonuz bu projede kullanmýyoruz...
int writeSector( unsigned long address , char * p )
{
	
	int r2 , i2;
	do 
	{
	
	r2	= sendSDCmd( WRITE_SINGLE , address , 0xff );
	} while (r2 != 0 );
	
	;
	
	if( r2 == 0 )
	{ 
		spi_yaz( DATA_START );
		for( i2 = 0 ;i2 < 512 ; i2 ++ )
		{
						spi_yaz( p[i2]  ) ;
			
		}
		ClockSPI();
		ClockSPI();
		
		
		
		while( ReadSPI() != 0 );
		
	}

	disableSD();

	disableSD();
	ReadSPI();
	ReadSPI();
	return (r2);
	
	}
char gelen[ 20 ];
	
	
	
	//Bu fonksiyonu bu projede kullanmýyoruz...
int readSector( unsigned long addr , char * buf )
{
	int r, i;

do 
{

	
	r = sendSDCmd( READ_SINGLE , addr  , 0xff );
} while (r != 0 ) ;


	if( r == 0 )
	{
	//Usart_veri_gonder( 'T' );
	
		while( ReadSPI() != DATA_START );
		
		
		for( i = 0 ; i < 512 ; i ++ )
		{
			if( i < 20 ) gelen[ i ] = ReadSPI();
			else	ReadSPI();
		}
		
		ReadSPI();
		ReadSPI();
		
	}
	disableSD();
	ReadSPI();
	ReadSPI();
	return 0;
}


/*

bit 0 = Idle state
bit 1 = Erase Reset
bit 2 = Illegal command
bit 3 = Communication CRC error
bit 4 = Erase sequence error
bit 5 = Address error
bit 6 = Parameter error
bit 7 = Always 0



*/
//Kartý yerleþtirip pice enerji verdiðimizde kartý kullanabilmek için bir takým ön iþlemler yapmamýz gerekiyor...

int initMedia()
{int i , r;
	adress = 0;
	
	//En baþta en az 80 clock sinyali göndermemiz gerekiyor... ( CS enable deðil )
	CARD_SELECT = 1 ;
	 for( i = 0 ; i < 20 ; i++ )
	ClockSPI();
	 
	  //CS pinini lowa çekiyoruz ve reset komutunu gönderiyoruz.. addres(argüman) 0 , CRC Reset komutu için mutlaka 0x95 olmalýdýr.
	 
	 CARD_SELECT = 0 ;
 r = sendSDCmd( RESET , adress , 0x95 );
 

//	 CARD_SELECT = 1;

if( r!= 1 )  //Eðer SD karttan uygun cevap gelmezse hata bilgisiyle geri dönüyoruz...
return 0x84;
	


//Cevap uygunsa 

r = sendSDCmd( 8 , 0x1AA , 0X87 );
//Usart_veri_gonder( r );
__delay_ms( 100 );
for( int k =  0 ; k < 5 ; k++ ) {r = ReadSPI () ; }



__delay_ms( 100 );

do
{
	sendSDCmd( 55 , 0 , 0xff ) ;
	r = sendSDCmd( 0x69 , 0X40000000  , 0xff );

} while ( r != 0  );




/*

do 
{
	r = sendSDCmd( 1,  0 , 0xff );
	CARD_SELECT_ON ;
	Usart_veri_gonder( r );
	_delay_ms( 100 );
	
} while ( r != 0);

*/
//Usart_veri_gonder( 'j' );
CARD_SELECT = 1 ;

/*do
	{
	r = sendSDCmd( INIT , adress );
		CARD_SELECT = 1;
		if( r ) break;
		
		}
	while( --i > 0 );
	if ( (i == 0)  || (r != 1)  )
	return 0x85; //timed out;
	
	*/
	return 0;
		
 	
}





void spi_hazirla() 
{
//	0010 = SPI Master mode, clock = FOSC/64
//0001 = SPI Master mode, clock = FOSC/16
//0000 = SPI Master mode, clock = FOSC/4
	
	
	
	SSPEN = 1; //Enable the SPI module....
	CKP = 0;//Idle state for clock is a low level
	CKE = 1;

	SSPM3 =  0 ; // 4
	//16/64 mhz baþlangýçta
	SSPM2 = 0 ;
	SSPM1 = 1 ; 
	SSPM0 = 0 ;
	
	
	/*
	FOR 8 MHZ...
	
	//16/64 prescaler of SPI for 16MHZ
	SSPM3 = 0 ; 
	SSPM2 = 0 ;
	SSPM1 = 1;
	SSPM0 = 0 ; 
	

*/
	/*

	//For 16MHZ
	SSPM3 = 0;
	SSPM2 = 0;
    SSPM1 = 1;
    SSPM0 = 0;	
*/	
	//For 4MHZ
	
	//0000 = SPI Master mode, clock = FOSC/1	

	
	
	
}

char c;
void InitSd()
	{
		TRISB7 = 0;
		RB7 = 1;
		spi_hazirla();
	}

	
unsigned char ReadMultiSector (   long adress )
	{
	do
	{
		 r = 	sendSDCmd( 18 , adress , 0xff );
		
	}while( r != 0 );
		if( r!= 0 ) return -1;
			
		return 0;
		
	}
	
volatile	int read_data = 0;
//176 max Duty register...CCP1L:CCP1X:CCP1Y
	
	
	
	unsigned char buffer [ 64 ] ;
	unsigned char load_index  , read_index ;
	unsigned char  available_data_size = 0 ;
	unsigned music_data ;
void interrupt INTERRUPT_FONKSYONU ( )
{
music_data = buffer[ read_index ++ ] ; 

	 
		CCP1X = ( music_data >> 1 ) ;
		CCP1Y = music_data   ;
	CCPR1L = ( music_data >> 2 )  ;	
	TMR2IF = 0 ;
if( read_index == 64 ) read_index = 0 ;
		



}	
	
	
	
	
void main() 
{
TRISB = 0 ; 
	PORTB = 0;
	TRISC3 = 0;
  TRISC5 = 0;
	TRISC4 = 1 ;
	
	InitSd();
	
	__delay_ms( 100 );
r = initMedia();

	if( r )	{
	RB5 = 1 ;
	
		while( 1 );
	}
else
	{
	
	
}



	TRISC2 = 0; //CCP1 pin output olarak seçildi...
	//ilk önce sadece bir kanal için yapacaðýz CCP1 i kullanýyoruz...
	
/*	
TMR1CS: Timer1 Clock Source Select bit
1 = External clock from pin RC0/T1OSO/T1CKI (on the rising edge)
0 = Internal clock (FOSC/4)
	*/
	
	/*
	TMR1ON: Timer1 On bit
1 = Enables Timer1
0 = Stops Timer1
*/

CCPR1L = 88 >> 2 ;
	CCP1X = ( 88 >> 3 ) & 0x1 ;
CCP1Y = 0 ;
	 	//TMR2ON = 1  ;
	int k  = 0; 


//16 MHZ için 22050 PWM frequency...
PR2 = 0b10110100 ;
T2CON = 0b00000100 ;
CCPR1L = 0b01011010 ;
CCP1CON = 0b00011100 ;
TMR2ON = 0;
	unsigned char rr ;
	int index; 
	unsigned char data ;

SSPM1 = 0 ; //SPI Speed 16 MHZ/4 e deðiþtirildi...
SSPM0 = 0;
	
	ReadMultiSector (  0x00  ) ;		


read_index = 32 ;
TMR2IE =1 ; 
PEIE = 1;
GIE = 1 ; 


TMR2IF = 0;
	TMR2ON = 1;


int total_read = 0 ;

while( 1 )
	{

	
	//Accept bekleniyor...
		do
		{
		SSPBUF = 0xff ;
		 while( !BF );
			 
	
		
	 }
	while( SSPBUF != 0xFE );	
		total_read =  0 ;
	
	
		while( total_read < 4 )
		{
			
			index = 0 ;
				while( index < 32 )
			{
			
			SSPBUF = 0xff ;
			while( !BF );
				temp = SSPBUF ;
			
			SSPBUF = 0xff ;
			
			while( !BF );
		buffer[ index++ ] = SSPBUF ;	
			
		}//while index < 32
					


while( read_index > 32 );
			
index = 32 ; 
				while( index < 64 )
			{
			
			SSPBUF = 0xff ;
			while( !BF );
				temp = SSPBUF ;
			
			SSPBUF = 0xff ;
			
			while( !BF );
		buffer[ index++ ] = SSPBUF ;

			
			
			
			} //while( index < 64 )
			

while( read_index < 32 );

	
		


total_read ++ ;


}
	
			
	
	
		
		

			
			
		
	
					
					
					
					
					
					
					//CRC kýsmý
		
	SSPBUF = 0xff ;
					while( !BF );
		
	temp = SSPBUF ;
			SSPBUF = 0xff ;
					while( !BF );
		
	temp = SSPBUF ;		
		
				
				
	
		}
	
}







