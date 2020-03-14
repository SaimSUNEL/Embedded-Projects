
#include <htc.h>


__CONFIG( FOSC_HS & WDTE_OFF & PWRTE_OFF & BOREN_OFF & LVP_OFF & CPD_OFF & WRT_OFF );

#ifndef _XTAL_FREQ
//Delay fonksiyonlarý için...
#define _XTAL_FREQ 16000000
#endif

unsigned int i , r;




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
 

if( r!= 1 )  //Eðer SD karttan uygun cevap gelmezse hata bilgisiyle geri dönüyoruz...
return 0x84;
	


//CMD8	*3	R7	No	SEND_IF_COND	For only SDC V2. Check voltage range

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
		TRISB7 = 0;
		RB7 = 1;
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
    TRISB = 0 ; //Kullanýlacak pinleri uygun bir þekilde output yada input yapýyoruz... 
	PORTB = 0;
	TRISC3 = 0;
    TRISC5 = 0;
	TRISC4 = 1 ;
	
	InitSd();  //SD kartýn CS pini aktif ve SPI iletiþim hazýr...
	
	__delay_ms( 100 );
r = initMedia(); //Kartý baþlatýyoruz...

	if( r )	{ //Sýfýr dýþý bir deðer gelirse kart initialize baþarýsýzdýr...
    	RB5 = 1 ; //Ledi yak...
	
		while( 1 );
	}
	
	TRISC2 = 0; //CCP1 pin output olarak seçildi...
	//Wav stereo fakat biz sadece bir kanal kullanacaðýz( CCP1 ) . Ýstenirse ikinci CCP kullanýlarak ikinci hoparlör baðlanabilir...
	//Not : Eðer müzik datasý ikisi hoparlör için farklý bu projede bunlardan sadece bir tanesi çalýnacak...
	
//16 MHZ için 44100 PWM frequency...
PR2 = 0b01011010 ;
T2CON = 0b00000100 ;
CCPR1L = 0b00101101 ;
CCP1CON = 0b00011100 ;
TMR2ON = 0 ;
	int index; 

	SSPM1 = 0 ; //SPI Speed 16 MHZ/4 e deðiþtirildi... Sd karttan okuma hýzýný 4 MHZ çýkartýyoruz...
    SSPM0 = 0;
ReadMultiSector (  0x00  ) ; //Kartýn en baþýndan itibaren okumaya baþlýyoruz...		
TMR2IF = 0;
TMR2ON = 1;  //Timer 2 aktif 
#asm
bcf 0x3 , 5  //Aþaðýdaki kullanýlacak registerlar için bank0'ý seçiyoruz...
bcf 0x3 , 6 
#endasm  //BAnk 0 selected...

while( 1 )  //Program sürekli çalýþacak....
	{
		/*
		RP1:RP0 Bank
        00 0
        01 1
        10 2
        11 3
		*/
		
		
#asm
//SSPBUF 13h
//RP0 : 5 
// Z : 2
//SPSTAT 0x94
		//BF : 0

		
		// while( ReadSPI != 0xFE );	//Multiple read komutunu gönderdikten ve her 512 byte okuma iþleminden sonra Sd karttan data start(0xfe) komutunu bekliyoruz	...
		
		
		start_karekteri_bekle:
		
	movlw	0xff //SSBUF = 0xff ;
	movwf 0x13 ;
	
	    bsf 0x03 , 5 // SSPSTAT için bank
		
		dongu:
		btfss 0x94 , 0 
	    goto dongu ;  // while ( BF == 0 );	
		bcf 0x03 , 5 //SSPBUF için banksel
		movf 0x13 , W // W = SSPBUF and BF = 0
		
		XORLW 0xFE   
		btfss 0x03 ,  2  //if( SSPBUF == 0xFE ) 
		goto start_karekteri_bekle;

iorlw 0x1 //Z biti sýfýrlandý....

movlw 0x00  // 0 dan tekrar 0 sayacak 256 adým...For loop için...
movwf 0x21
for_loop :
btfsc 0x3 , 2   
goto for_loop_bitir;

//for( index = 0 ; index < 256 ; index ++ )
//{





		
				
TMR2_loop:     //while( TMR2IF == 0 );  // TMR2IF periodun tamamlandýðýný gösterir...
btfss 0x0c, 1
goto TMR2_loop 
			

 //Ýlk ReadSPI ();  //Sd karttan bir byte alýyoruz fakat bunu kullanmýyoruz bu byte ikinci hoparlör için...
			
		movlw	0xff //SSBUF = 0xff ; 
	movwf 0x13 ;
	
	bsf 0x03 , 5 // SSPSTAT için bank
		
		dongu2:
		btfss 0x94 , 0
	    goto dongu2 ;  // while ( BF == 0 );	
		
		bcf 0x03 , 5 //SSPBUF için banksel
		movf 0x13 , W // W = SSPBUF and BF = 0



//IKINCI read SPI // ikinci byte'ý alýyoruz ve bunu CCP1 PWM registerlarýna atýyoruz...

movlw	0xff //SSBUF = 0xff ; 
	movwf 0x13 ;
	
	bsf 0x03 , 5 // SSPSTAT için bank
		
		dongu3:
		btfss 0x94 , 0
	    goto dongu3 ;  // while ( BF == 0 );	
		
		bcf 0x03, 5 //SSPBUF için banksel
		movf 0x13 , W // W = SSPBUF and BF = 0
			
 
	


			
	
		
		
		btfss 0x13 , 1    //CCP1X = SSPBUF >> 1 ; Okunan verinin ikinci biti CCP1X PWM bitine atanýyor... 
        goto CCP1X_SIFIRLA;

        bsf 0x17, 5
        goto devam_et;

        CCP1X_SIFIRLA:
        bcf 0x17 , 5
        devam_et:


btfss 0x13 , 0     //CCP1Y = SSPBUF ;  Okunan verinin ilk biti CCP1Y PWM bitine atanýyor...

goto CCP1Y_SIFIRLA;

bsf 0x17 , 4

goto devam_et2;
CCP1Y_SIFIRLA:
bcf 0x17 , 4

devam_et2:



rrf 0x13 , W   //CCPR1L = SSPBUF >> 2 ;
movwf 0x25
rrf 0x25 , W
ANDLW 0x3f
movwf 0x15

			

	








			
	     	//	TMR2IF = 0 ;  //TMR2 interrupt flagi sýfýrlýyoruz....
	
bcf 0x0c , 1



decf 0x21 , F

goto for_loop ;

for_loop_bitir:
				
					
//} for	loop end			
				
			//Her 512 byte'tan sonra iki byte'lýk CRC bilgilerini alýyoruz...
		
	


				//	ReadSPI();
					
		
	movlw	0xff //SSBUF = 0xff ; //CRC Ýlk ReadSPI ();
	movwf 0x13 ;
	
	bsf 0x03 , 5 // SSPSTAT için bank
		
		dongu5:
		btfss 0x94 , 0
	    goto dongu5 ;  // while ( BF == 0 );	
		
		bcf 0x03 , 5 //SSPBUF için banksel
		movf 0x13 , W // W = SSPBUF and BF = 0

					
					
					//ReadSPI();

movlw	0xff //SSBUF = 0xff ; //CRC ikinci read SPI
	movwf 0x13 ;
	
	bsf 0x03 , 5 // SSPSTAT için bank
		
		dongu6:
		btfss 0x94 , 0
	    goto dongu6 ;  // while ( BF == 0 );	
		
		bcf 0x03, 5 //SSPBUF için banksel
		movf 0x13 , W // W = SSPBUF and BF = 0
		#endasm
		
		}
	
}








