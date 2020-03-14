
/*
SD kart : 4 GB micro sd...


Herhangi bir dosyalama sistemi ( FAT12 , 16 ) implemente edilmedi... Sadece karttan m�zik verisini yazd���m�z adresten itibaren
okumaya ba�lay�p (e�er devre kapat�lmazsa sd kart�n t�m� okunana kadar devam eder.Istenirse play , pause , stop butonlar� eklenebilir.




Wav dosyas�,  e�er PWM frekans� 22500 ise 8 bit 22050 HZ Stereo ; 44100 ise 8 bit 44100 HZ olamad�l�r.

MP3 , wav vb. dosyalar�n�z�  http://audio.online-convert.com/convert-to-wav gibi bir websitesi yada uygun bir m�zik d�n��t�rme program� ile gerekli formata d�n��t�rebilirsiniz...


Wav dosyas�n� Hex Editor Neo gibi dosyalar� byte byte a�abilen bir programla Sd kart�n 0. adresinden itibaren kopyal�yoruz...
( Not : bu i�lem kart�n dosyalama sistemini bozacakt�r ve i�indeki di�er bilgilere( m�zik , belgeler , video ... ) eri�im m�mk�n olmayacakt�r. )


*/





#include <htc.h>





#ifndef _XTAL_FREQ
 // Unless already defined assume 4MHz system frequency
 // This definition is required to calibrate __delay_us() and __delay_ms()
 #define _XTAL_FREQ 20000000UL
#endif

unsigned int i , r;




#define CARD_SELECT RA4  //SD kard modul�ndeki CS pinine ba�l�
#define ReadSPI() (spi_yaz(0xff)) //SD karttan gelen veri geri okumak i�in basit bit macro tan�ml�yoruz...
#define ClockSPI()(spi_yaz(0xff)) //Baz� yerlerde SD karta clock sinyali sa�lamam�z gerekiyor..Asl�nda SD den okumakla ayn� �ey...

unsigned long adress; //Sd karttan okumaya ba�layaca��m�z adres 

unsigned char spi_yaz( unsigned char veri )   // SPI veri g�nderme fonksiyonu ayn� zamanda gelen veriyi de al�yor...
{

	SSPBUF = veri;
	
	while( !BF );
		
	return SSPBUF;
	
	}
	

int sendSDCmd( unsigned char c , unsigned long x  , unsigned char frame ) //SD karta komut g�ndermek i�in kulland���m�z fonksiyon..
{

CARD_SELECT = 0 ; // CS pinini s�f�ra �ekiyoruz ve SD kart ileti�ime aktif hale geliyor...
__delay_ms( 300 );
	
	
	spi_yaz( (  c | 0x40 ) & 0xff ); //�ncelikler komut verimizi g�nderiyoruz...
	
	
	
	spi_yaz(  (x >> 24 ) & 0xff ); //Ard�ndan 4 byttan olu�an adres bilgisi baz� komutlar i�in arg�man bilgisi...

     spi_yaz( ( x>>16 ) & 0xff );

	spi_yaz( ( x >> 8 ) & 0xff  );

	spi_yaz( x  & 0xff );

spi_yaz( frame ); //Son olarak CRC bilgisini g�nderiyoruz.... 

	
	//SD karttan gelen cevab� bekleyip geri d�nd�r�yoruz...
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


#define _RESET 0//RESET komutu 0'd�r.
#define INIT 1 //Initialize komutu
#define READ_SINGLE 17 
#define WRITE_SINGLE 24

#define DATA_ACCEPT 0x05
int result;
#define DATA_START 0xFE

//Bu fonksiyonuz bu projede kullanm�yoruz...
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
	
	
	
	//Bu fonksiyonu bu projede kullanm�yoruz...
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
//Kart� yerle�tirip pice enerji verdi�imizde kart� kullanabilmek i�in bir tak�m �n i�lemler yapmam�z gerekiyor...

int initMedia()
{int i , r;
	adress = 0;
	
	//En ba�ta en az 80 clock sinyali g�ndermemiz gerekiyor... ( CS enable de�il )
	CARD_SELECT = 1 ;
	 for( i = 0 ; i < 20 ; i++ )
	ClockSPI();
	 
	  //CS pinini lowa �ekiyoruz ve reset komutunu g�nderiyoruz.. addres(arg�man) 0 , CRC Reset komutu i�in mutlaka 0x95 olmal�d�r.
	 
	 CARD_SELECT = 0 ;
 r = sendSDCmd( _RESET , adress , 0x95 );
 

if( r!= 1 )  //E�er SD karttan uygun cevap gelmezse hata bilgisiyle geri d�n�yoruz...
return 0x84;
	


//CMD8	*3	R7	No	SEND_IF_COND	For only SDC V2. Check voltage range
/*

Initializing high-capacity cards
After the card enters idle state with a CMD0, send a CMD8 with argument of 0x000001AA and correct CRC prior to initialization process.
If the CMD8 is rejected with illigal command error (0x05), the card is SDC version 1 or MMC version 3. If accepted, R7 response (R1(0x01) + 32-bit return value) will be returned. 
The lower 12 bits in the return value 0x1AA means that the card is SDC version 2 and it can work at voltage range of 2.7 to 3.6 volts. 
If not the case, the card should be rejected.
( http://elm-chan.org/docs/mmc/mmc_e.html )
*/


r = sendSDCmd( 8 , 0x1AA , 0X87 );
//Usart_veri_gonder( r );
__delay_ms( 100 );
for( int k =  0 ; k < 5 ; k++ ) {r = ReadSPI () ; }



__delay_ms( 100 );

//Karta kart kabul edene kadar Initialize komutu g�nderiyoruz...
do
{
sendSDCmd( 55 , 0 , 0xff ) ;  //Initialize komutu i�in gerekli �n komut...
r = sendSDCmd( 0x69 , 0X40000000  , 0xff );

} while ( r != 0  );



/*

do 
{
	r = sendSDCmd( 1,  0 , 0xff );
	CARD_SELECT = 1; ;

	__delay_ms( 100 );
	
} while ( r != 0);

*/



CARD_SELECT = 1 ;

return 0;
		
 	
}





void spi_hazirla() 
{
//	0010 = SPI Master mode, clock = FOSC/64
//0001 = SPI Master mode, clock = FOSC/16
//0000 = SPI Master mode, clock = FOSC/4

	
	SSPEN = 1; //Enable the SPI module....
	CKP = 0;//Idle state for clock is a low level
	CKE = 1;  //Transmit occurs on transition from active to Idle clock state 
	SMP = 0 ;//Input data sampled at middle of data output time

	SSPM3 =  0 ; // 4
	//16/64 mhz ba�lang��ta
	SSPM2 = 0 ;
	SSPM1 = 1 ; 
	SSPM0 = 0 ;
}

char c;
void InitSd()
	{
		TRISA4 = 0;
		RA4 = 1;
		spi_hazirla();
	}

	//Sd karttan veri okumak i�in sadece bu komutu kullan�yoruz...
unsigned char ReadMultiSector (   long adress  )
	{
	do
	{
		 r = 	sendSDCmd( 18 , adress , 0xff );  //Karta multiple read komutunu , kart kabul edene kadar g�nderiyoruz...
		
	}while( r != 0 );
	return 0;
		
	}
	

void main() 
{
	
		SCS1 = 0 ;
	SCS0 = 0 ;
	
	IRCF3 = 1 ;
	IRCF2 = 1 ;
	IRCF1 = 1 ;
	IRCF0 = 0 ;
	SPLLEN = 0 ;  //4x PLL enable...not enabled...
	
	
	
	
	
	
	ANSELA = 0 ;
	CCP1SEL = 1 ; //CCP1 RA5 te
	
	
	
	
	
	
	
	
	
     //Kullan�lacak pinleri uygun bir �ekilde output yada input yap�yoruz... 
	TRISA0 = 0 ; //SDO output
	TRISA1 = 0 ; //SCK output
	TRISA2 = 1 ; //SDI input
	
	
		
	
	InitSd();  //SD kart�n CS pini aktif ve SPI ileti�im haz�r...
	
	__delay_ms( 100 );
r = initMedia(); //Kart� ba�lat�yoruz...

	if( r )	{ //S�f�r d��� bir de�er gelirse kart initialize ba�ar�s�zd�r...
    	//Ledi yak...
	
		while( 1 );
	}
	
	TRISA5 = 0; //CCP1 pin output olarak se�ildi...
	//Wav stereo fakat biz sadece bir kanal kullanaca��z( CCP1 ) . �stenirse ikinci CCP kullan�larak ikinci hoparl�r ba�lanabilir...
	//Not : E�er m�zik datas� ikisi hoparl�r i�in farkl� bu projede bunlardan sadece bir tanesi �al�nacak...
	/*
//16 MHZ i�in 22050 PWM frekans�...
PR2 = 0b10110100 ;
T2CON = 0b00000100 ; //Timer2 post scaler 1:1 , prescale 1:1  Timer2 aktif 
CCP1CON = 0b00001100 ;  // CCP module PWM module olarak ayarland�...
  //Timer2 yi daha sonra �al��t�raca��z...
*/


	
SPLLEN = 1 ; //8 * 4 = 32 MHZ...	

	__delay_ms( 3200 ) ;
//32 MHZ i�in 44100 
	PR2 = 0b10110100 ;
T2CON = 0b00000100 ;
CCPR1L = 0b01011010 ;
CCP1CON = 0b00011100 ;
	/*
	// 32 mhz i�in 22050
	PR2 = 0b01011010 ;
T2CON = 0b00000101 ;
CCPR1L = 0b00101101 ;
CCP1CON = 0b00011100 ;
*/
/*	
//8 MHZ i�in 44100 PWM frekans�
PR2 = 0b00101100 ;
T2CON = 0b00000100 ;
CCPR1L = 0b00010110 ;
CCP1CON = 0b00011100 ;
	*//*
//20 MHZ i�in 22050
PR2 = 0b11100010 ;
T2CON = 0b00000100 ;
CCPR1L = 0b01110001 ;
CCP1CON = 0b00011100 ;
	*/
	TMR2ON = 0;
	
int index; 

	SSPM1 = 0 ; //SPI Speed 16 MHZ/4 e de�i�tirildi... Sd karttan okuma h�z�n� 4 MHZ ��kart�yoruz...
    SSPM0 = 0;
ReadMultiSector (  0x00  ) ; //Kart�n en ba��ndan itibaren okumaya ba�l�yoruz...		
TMR2IF = 0;
TMR2ON = 1;  //Timer 2 aktif 
#asm
#endasm  //BAnk 0 selected...

int _ind ;
unsigned char temp ;
while( 1 )  //Program s�rekli �al��acak....
	{
		

		
	
			do
		{
		SSPBUF = 0xff ;
		 while( !BF );
			 
	 }
	 	while( SSPBUF != 0xFE );	
	 for( _ind = 0 ; _ind < 256 ; _ind ++ )
	 {

		 	SSPBUF = 0xff ;
			while( !BF );
			temp = SSPBUF ;
			
			
			SSPBUF = 0xff ;
			
			while( !BF );
		 temp = SSPBUF ;
	 
			while( !TMR2IF  );
		
	 DC1B1 = temp >> 1 ;
	 DC1B0 = temp ;
	 CCPR1L = temp >> 2 ; 
	 TMR2IF = 0 ;
	 
	 
	 }
		
	 SSPBUF = 0xff ;
					while( !BF );
		
	temp = SSPBUF ;
			SSPBUF = 0xff ;
					while( !BF );
		
	temp = SSPBUF ;		
	 
	 
	 
	 
	 
		}
	
}








