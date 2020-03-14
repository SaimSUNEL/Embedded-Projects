
/*
SD kart : 4 GB micro sd...


Herhangi bir dosyalama sistemi ( FAT12 , 16 ) implemente edilmedi... Sadece karttan müzik verisini yazdýðýmýz adresten itibaren
okumaya baþlayýp (eðer devre kapatýlmazsa sd kartýn tümü okunana kadar devam eder.Istenirse play , pause , stop butonlarý eklenebilir.




Wav dosyasý,  eðer PWM frekansý 22500 ise 8 bit 22050 HZ Stereo ; 44100 ise 8 bit 44100 HZ olamadýlýr.

MP3 , wav vb. dosyalarýnýzý  http://audio.online-convert.com/convert-to-wav gibi bir websitesi yada uygun bir müzik dönüþtürme programý ile gerekli formata dönüþtürebilirsiniz...


Wav dosyasýný Hex Editor Neo gibi dosyalarý byte byte açabilen bir programla Sd kartýn 0. adresinden itibaren kopyalýyoruz...
( Not : bu iþlem kartýn dosyalama sistemini bozacaktýr ve içindeki diðer bilgilere( müzik , belgeler , video ... ) eriþim mümkün olmayacaktýr. )


*/





#include <htc.h>





#ifndef _XTAL_FREQ
 // Unless already defined assume 4MHz system frequency
 // This definition is required to calibrate __delay_us() and __delay_ms()
 #define _XTAL_FREQ 20000000UL
#endif

unsigned int i , r;




#define CARD_SELECT RA4  //SD kard modulündeki CS pinine baðlý
#define ReadSPI() (spi_yaz(0xff)) //SD karttan gelen veri geri okumak için basit bit macro tanýmlýyoruz...
#define ClockSPI()(spi_yaz(0xff)) //Bazý yerlerde SD karta clock sinyali saðlamamýz gerekiyor..Aslýnda SD den okumakla ayný þey...

unsigned long adress; //Sd karttan okumaya baþlayacaðýmýz adres 

unsigned char spi_yaz( unsigned char veri )   // SPI veri gönderme fonksiyonu ayný zamanda gelen veriyi de alýyor...
{

	SSPBUF = veri;
	
	while( !BF );
		
	return SSPBUF;
	
	}
	

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


#define _RESET 0//RESET komutu 0'dýr.
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
 r = sendSDCmd( _RESET , adress , 0x95 );
 

if( r!= 1 )  //Eðer SD karttan uygun cevap gelmezse hata bilgisiyle geri dönüyoruz...
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

//Karta kart kabul edene kadar Initialize komutu gönderiyoruz...
do
{
sendSDCmd( 55 , 0 , 0xff ) ;  //Initialize komutu için gerekli ön komut...
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
	//16/64 mhz baþlangýçta
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

	//Sd karttan veri okumak için sadece bu komutu kullanýyoruz...
unsigned char ReadMultiSector (   long adress  )
	{
	do
	{
		 r = 	sendSDCmd( 18 , adress , 0xff );  //Karta multiple read komutunu , kart kabul edene kadar gönderiyoruz...
		
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
	
	
	
	
	
	
	
	
	
     //Kullanýlacak pinleri uygun bir þekilde output yada input yapýyoruz... 
	TRISA0 = 0 ; //SDO output
	TRISA1 = 0 ; //SCK output
	TRISA2 = 1 ; //SDI input
	
	
		
	
	InitSd();  //SD kartýn CS pini aktif ve SPI iletiþim hazýr...
	
	__delay_ms( 100 );
r = initMedia(); //Kartý baþlatýyoruz...

	if( r )	{ //Sýfýr dýþý bir deðer gelirse kart initialize baþarýsýzdýr...
    	//Ledi yak...
	
		while( 1 );
	}
	
	TRISA5 = 0; //CCP1 pin output olarak seçildi...
	//Wav stereo fakat biz sadece bir kanal kullanacaðýz( CCP1 ) . Ýstenirse ikinci CCP kullanýlarak ikinci hoparlör baðlanabilir...
	//Not : Eðer müzik datasý ikisi hoparlör için farklý bu projede bunlardan sadece bir tanesi çalýnacak...
	/*
//16 MHZ için 22050 PWM frekansý...
PR2 = 0b10110100 ;
T2CON = 0b00000100 ; //Timer2 post scaler 1:1 , prescale 1:1  Timer2 aktif 
CCP1CON = 0b00001100 ;  // CCP module PWM module olarak ayarlandý...
  //Timer2 yi daha sonra çalýþtýracaðýz...
*/


	
SPLLEN = 1 ; //8 * 4 = 32 MHZ...	

	__delay_ms( 3200 ) ;
//32 MHZ için 44100 
	PR2 = 0b10110100 ;
T2CON = 0b00000100 ;
CCPR1L = 0b01011010 ;
CCP1CON = 0b00011100 ;
	/*
	// 32 mhz için 22050
	PR2 = 0b01011010 ;
T2CON = 0b00000101 ;
CCPR1L = 0b00101101 ;
CCP1CON = 0b00011100 ;
*/
/*	
//8 MHZ için 44100 PWM frekansý
PR2 = 0b00101100 ;
T2CON = 0b00000100 ;
CCPR1L = 0b00010110 ;
CCP1CON = 0b00011100 ;
	*//*
//20 MHZ için 22050
PR2 = 0b11100010 ;
T2CON = 0b00000100 ;
CCPR1L = 0b01110001 ;
CCP1CON = 0b00011100 ;
	*/
	TMR2ON = 0;
	
int index; 

	SSPM1 = 0 ; //SPI Speed 16 MHZ/4 e deðiþtirildi... Sd karttan okuma hýzýný 4 MHZ çýkartýyoruz...
    SSPM0 = 0;
ReadMultiSector (  0x00  ) ; //Kartýn en baþýndan itibaren okumaya baþlýyoruz...		
TMR2IF = 0;
TMR2ON = 1;  //Timer 2 aktif 
#asm
#endasm  //BAnk 0 selected...

int _ind ;
unsigned char temp ;
while( 1 )  //Program sürekli çalýþacak....
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








