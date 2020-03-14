

#include<htc.h>
#define TRUE 1
#define FALSE 0
#include<math.h>
#include<stdlib.h>
#include<time.h>
#define SS RA4 //RA4 pini digital output used for ss of the slave device ( card reader )
unsigned char SPI_yaz ( unsigned char data ) ;
unsigned char cevap  ;
char buff [ 64 ] ;

char error = FALSE ;;
char * allocated ;

void SDCARD_bir_sektor_yaz  ( unsigned long adres , char * buff , int size ) 
{
	
	SS = 0 ;
	
	SPI_yaz ( 0x40 | 24 ) ;
	
	SPI_yaz ( adres >> 24 ) ;
	SPI_yaz ( adres >>  16  )  ;
	SPI_yaz ( adres  >> 8 ) ;
	SPI_yaz ( adres ) ;
	
	SPI_yaz ( 0xff ) ;
	//Komut cevabýný bekle
	 for ( int a = 0 ; a < 100 ;a++ ) 
	 {
		 cevap = SPI_yaz ( 0xff ) ;
		 if ( cevap == 0 ) break ;
			 
	 }
	
	if ( cevap == 0 ) //Single block write command accepted...
	{
		
		SPI_yaz ( 0xfe ) ; //We are sending data start token to SD card
		
		
		for ( int h = 0 ; h < 512 ; h++ )
		{
			if ( h  < size )
			{
			SPI_yaz ( buff [ h ] ) ;
			}
			else SPI_yaz ( 0x0 ) ;
		}
		
		//CRC bytes has been  sent
		SPI_yaz ( 0xff ) ;
		SPI_yaz ( 0xff ) ;
		
		
		for ( int k = 0 ; k < 100 ; k++ )
		{
			cevap = SPI_yaz ( 0xff ) ;
			if ( cevap == 0x5 )
			{
				break ;
			}
			
		}
		
		if ( cevap == 0x5 )
		{
		//SD card veriyi yazana kadar busydir ( DO sunu lowa çekiyor. o sýrada 0 okuyacaðýz...
		for ( int h = 0 ; h < 10000 ; h ++ )
		{
			cevap = SPI_yaz ( 0xff ) ;
			if ( cevap  != 0 ) 
			break ;
			
			
			
		}
	}
	else 
	{
	error = TRUE ;
	while ( 1 ) ;	
		//Eðer 5 deðilse bir hata mesajý ver...
		
}
		
	}
	else {
		 error = TRUE ;
	while ( 1 ) ;
	}
	SS= 1 ;
	
}





void SDCARD_bir_sektor_oku  ( unsigned long adres , char * buff )
{
	SS = 0 ;
	
	SPI_yaz ( 0x40 | 17 ) ;
	
	SPI_yaz ( adres >> 24 ) ;
	SPI_yaz ( adres >>  16  )  ;
	SPI_yaz ( adres  >> 8 ) ;
	SPI_yaz ( adres ) ;
	
	SPI_yaz ( 0xff ) ;
	//Komut cevabýný bekle
	 for ( int a = 0 ; a < 11 ;a++ ) 
	 {
		 cevap = SPI_yaz ( 0xff ) ;
		 if ( cevap == 0 ) break ;
			 
	 }
	
	
	
	 
	 if ( cevap == 0 ) //CMD 17 has been accepted... 
	 {
		 
		 
		 //Wait for Data start token from the SD card....
		
		 for ( int j = 0 ; j < 10000 ; j ++ )
		 {
			 cevap = SPI_yaz ( 0xf ) ;
			 if ( cevap == 0xfe ) break ;
		 }
		 
		 
		 if ( cevap == 0xfe ) 
		 {
			 //Data ready geldi...
			 
			 for ( int k = 0 ; k < 512 ; k++ ) 
			 {
				 cevap = SPI_yaz ( 0xff ) ;
				 if ( k < 64 ) 
				 {
					 buff [ k ] = cevap ;
				 }
				 
			 }
			 //CRC önemli deðil bizim için...
			 SPI_yaz ( 0xff ) ;
			 SPI_yaz ( 0xff ) ;
			 
		 }
		 
		 
		 
		 
	 }
	 
	
	
	SS = 1 ;
	
	
	
}



void SDCARD_baslat ( )
{
	__delay_ms  ( 3200 ) ; //wait a little bit after powerup 
	
   SS = 1 ; 
	for ( int a = 0 ; a < 11 ; a++ ) //8*11 clocks are applied to card when CS 1 
	SPI_yaz ( 0xff ) ;	
	
	__delay_ms ( 4000 ) ;

//First we are sending CMD0 for SD to enter reset ( idle state )	
	SS = 0 ;
	
	SPI_yaz ( 0x40 ) ;
	
	SPI_yaz ( 0x0 ) ;
	SPI_yaz ( 0x0 ) ;
	SPI_yaz ( 0x0 ) ;
	SPI_yaz ( 0x0 ) ;
	//For CMD0 the CRC value 
	SPI_yaz ( 0x95 ) ; 
	
	
	
	
	
	cevap = SPI_yaz ( 0x0 ) ;
	
	
	//Geçerli bir cevabýn gelmesi için en az 64 clock göndermke gerekebilir...
	for ( int k = 0 ; k < 10 ; k ++ ) 
	{
		cevap = SPI_yaz ( 0xff ) ;
		if ( cevap != 0x1 )continue  ;
			else break;
	}
	

	__delay_ms ( 100 ) ;
	
	
	
	if ( cevap == 0x1 )
	{
	do
	{
	//We are sending CMD1
		SPI_yaz ( 0x41 ) ;

		SPI_yaz ( 0x0 ) ;
		SPI_yaz ( 0x0 ) ;
		SPI_yaz ( 0x0 ) ;
		SPI_yaz ( 0x0 ) ;
SPI_yaz ( 0xff ) ;//CRC is not important anymore...
		
		for ( int a = 0 ; a < 10 ; a++ )
		{
		cevap = SPI_yaz ( 0xff ) ;
		if ( cevap != 0xff ) break ;
			
		}
		
		if ( cevap == 0 ) 
		{
			 //Card initialization has been succeded ... 
			
		
			
			
		}
		else continue ;
		
	}	
while ( cevap == 0xff ) ;	

	
	}
	
	
	
	SS = 1 ;
	
	
}



unsigned char SPI_yaz ( unsigned char data ) 
{
	
SSP1BUF = data ;
while ( !BF ) ;
SSP1IF = 0 ;
return SSPBUF ; //this also clears BF ;
	
	
	
	
	
	
	
}



void SPI_ayarla (  ) 
{
	
	
	TRISA4 = 0 ;
	
	
	//RA0 SDO
	TRISA0 = 0 ; //SDO output
	//SCK RA1
	TRISA1 = 0 ; //SCK output
	//SDI RA2
	TRISA2 = 1 ; //SDI input...
	
	
	SMP = 0 ; //The data will be sampled in the middle of clock...
	
	//SPI mode 0 ayarlandý...
	CKP = 0 ;
	CKE = 0 ; 
	
	
	SSP1ADD = 31 ; // 250 khz SPI freq
	
	
	SSPM3 = 1 ;
	SSPM2 = 0 ;
	SSPM1 = 1 ;
	SSPM0 = 0 ;
	
	//We are enabling the SPI module...
	SSPEN = 1 ;

			
}

void main ( ) 
{

int k = rand ( ) % 25 ;

	
	
	TRISA = 0x0 ;
	PORTA = 0 ;
	
	
	
	//If the config PLLEN enable PLL is always enabled
	//IF the config PPL off , when SPLLEN = 1 4x pll enable..
	SPLLEN = 1 ; 
	//8 mhz is selected and 4x pll is enable therefore 32 MHZ current...
	IRCF3 = 1 ;
	IRCF2 = 1 ;
	IRCF1 = 1 ;
	IRCF0 = 0 ;
	//Internal oscillator selected...
	SCS1 = 1 ;
	SCS0 = 0 ;
	
	
	ANSELA = 0 ; //All pins are digital IO
	//RA3 is always input...
	
	CCP1SEL = 1 ; //CCP1 pini is in RA5 after know
	
	

	
	
	//PWM mode P1A active high , P1B active high
	CCP1M3 = 1 ;
	CCP1M2 = 1 ;
	CCP1M1 = 0 ;
	CCP1M0 = 0 ; 
	
	
	CCPR1L = 20 ;
	DC1B1 = 0 ;
	DC1B0 = 0 ; 
	
	//timer2 2mhz source her bir increment için...
	T2CKPS1 = 0 ; //timer2 presc 1/4
	T2CKPS0 = 1 ;
	
	//PWM freq 44100 hz
	
	PR2 = 44 ;
	CCPR1L = 22 ;
	
	TMR2 = 0 ;
	
	
	
	// 0 <= CPR1L << 4 + 2bits < 180
	
	
	
	TMR2ON = 1 ;
	
	__delay_ms ( 1000 ) ;
	SPI_ayarla ( ) ;
	__delay_ms ( 1000 ) ;
	SS = 1 ;
	
	SDCARD_baslat ( ) ;
	__delay_ms ( 1500 ) ;
	SDCARD_bir_sektor_oku ( 0 , buff  ) ;
	

	
	
	while ( 1 ) 
	{
		
		__delay_ms ( 3000 ) ;
	}
	
	
	
	
	
}