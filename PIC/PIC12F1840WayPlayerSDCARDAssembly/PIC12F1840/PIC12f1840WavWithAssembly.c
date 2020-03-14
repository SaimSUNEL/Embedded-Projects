

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


/*	
	
	PR2 = 0b10110100 ;
T2CON = 0b00000100 ;
CCPR1L = 0b01011010 ;
CCP1CON = 0b00011100 ;
	*/
SPLLEN = 1 ; //8 * 4 = 32 MHZ...
__delay_ms( 3200 );  
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

#asm

#endasm  //BAnk 0 selected...

while( 1 )  //Program s�rekli �al��acak....
	{
		
		
		/*
		RP1:RP0 Bank
        00 0
        01 1
        10 2
        11 3
		*/
		
		
#asm
while_loop5:		
		
		
//SSPBUF 13h
//RP0 : 5 
// Z : 2
//SPSTAT 0x94
		//BF : 0

		
		// while( ReadSPI != 0xFE );	//Multiple read komutunu g�nderdikten ve her 512 byte okuma i�leminden sonra Sd karttan data start(0xfe) komutunu bekliyoruz	...
		
		
		
			movlb 4h //4. bank se�ildi...
		
		start_karekteri_bekle:
	
	
	

	movlw	0xff //SSBUF = 0xff ;
	movwf 0x11h ; // SSBUF = 0xff ;
	
	
	
	
	    //bsf 0x03 , 5 // SSPSTAT i�in bank
		//SSPSTAT bank 4 te zaten...
	
		
		dongu:
		btfss 0x14 , 0 
	    goto dongu ;  // while ( BF == 0 );	
		
	//Hala bank 4 teyiz...	//bcf 0x03 , 5 //SSPBUF i�in banksel
		
		
		movf 0x11 , W // W = SSPBUF and BF = 0
		
		XORLW 0xFE   
		btfss 0x03 ,  2  //if( SSPBUF == 0xFE ) 
		goto start_karekteri_bekle;




iorlw 0x1 //Z biti s�f�rland�....


movlb 0h //bank 0 se�ildi 0x21 adresi i�in...
movlw 0x00  // 0 dan tekrar 0 sayacak 256 ad�m...For loop i�in...
movwf 0x21
for_loop :
btfsc 0x3 , 2   
goto for_loop_bitir;

//for( index = 0 ; index < 256 ; index ++ )
//{



	
 	//�lk ReadSPI ();  //Sd karttan bir byte al�yoruz fakat bunu kullanm�yoruz bu byte ikinci hoparl�r i�in...
			
			movlb 4h //SSPBUF i�in bank 4 se�ildi..
			
		movlw	0xff //SSBUF = 0xff ; 
		
	movwf 0x11 ; 
	
	
	//Hala 4. bank ... //bsf 0x03 , 5 // SSPSTAT i�in bank
		
		
		dongu2:
		btfss 0x14 , 0
	    goto dongu2 ;  // while ( BF == 0 );	
		
		//hala bank 4 teyiz....
		//bcf 0x03 , 5 //SSPBUF i�in banksel
		movf 0x11 , W // W = SSPBUF and BF = 0



//IKINCI read SPI // ikinci byte'� al�yoruz ve bunu CCP1 PWM registerlar�na at�yoruz...
//hala 4. bank 
movlw	0xff //SSBUF = 0xff ; 
	movwf 0x11 ;
	
//	bsf 0x03 , 5 // SSPSTAT i�in bank
		
		dongu3:
		btfss 0x14 , 0
	    goto dongu3 ;  // while ( BF == 0 );	
		
		bcf 0x03, 5 //SSPBUF i�in banksel
	
	movf 0x11 , W // W = SSPBUF and BF = 0
			
			
movlb 0h // 0x24 i�in bank 0 yu se�iyoruz...

  movwf 0x24
	
		
				
TMR2_loop:     //while( TMR2IF == 0 );  // TMR2IF periodun tamamland���n� g�sterir...
btfss 0x011, 1
goto TMR2_loop 
	

	
		
	
		movlb 0h  //0x24 i�in bank s�f�r se�ildi...

		
		btfss 0x24 , 1    //CCP1X = SSPBUF >> 1 ; Okunan verinin ikinci biti CCP1X PWM bitine atan�yor... 
        goto CCP1X_SIFIRLA;
      
	    movlb 5h //CCP1CON i�in banksel 5 
        bsf 0x13, 5
        goto devam_et;

        CCP1X_SIFIRLA:
        movlb 5h //CCP1CON i�in banksel 5 
		bcf 0x13 , 5
        devam_et:
		
		//banks
movlb 0h //0x24 i�in bank 0 
btfss 0x24 , 0     //CCP1Y = SSPBUF ;  Okunan verinin ilk biti CCP1Y PWM bitine atan�yor...
goto CCP1Y_SIFIRLA;
movlb 5h //CCP1CON i�in bank 5 
bsf 0x13 , 4

goto devam_et2;
CCP1Y_SIFIRLA:
movlb 5h //CCP1CON i�in bank 5 
bcf 0x13 , 4

devam_et2:


movlb 0h //0x24 i�in bank 0
rrf 0x24 , W   //CCPR1L = SSPBUF >> 2 ;
movwf 0x25
rrf 0x25 , W
ANDLW 0x3f
movlb 5h //CCPR1L i�in bank 5 
movwf 0x11
//	TMR2IF = 0 ;  //TMR2 interrupt flagi s�f�rl�yoruz....
	
	
movlb 0h //PIR1 i�in bank 0 	
	
bcf 0x11 , 1

decf 0x21 , F

goto for_loop ;

for_loop_bitir:
				
					
//} for	loop end			
				
			//Her 512 byte'tan sonra iki byte'l�k CRC bilgilerini al�yoruz...
		
	


				//	ReadSPI();
					
	movlb 4h	
	movlw	0xff //SSBUF = 0xff ; //CRC �lk ReadSPI ();
	movwf 0x11 ;
	
	//bsf 0x03 , 5 // SSPSTAT i�in bank
		
		dongu5:
		btfss 0x14 , 0
	    goto dongu5 ;  // while ( BF == 0 );	
		
		//bcf 0x03 , 5 //SSPBUF i�in banksel
		
		movf 0x11 , W // W = SSPBUF and BF = 0

					
					
					//ReadSPI();
		 
movlw	0xff //SSBUF = 0xff ; //CRC ikinci read SPI
	movwf 0x11 ;
	
//	bsf 0x03 , 5 // SSPSTAT i�in bank
		
		dongu6:
		btfss 0x14 , 0
	    goto dongu6 ;  // while ( BF == 0 );	
		
		//bcf 0x03, 5 //SSPBUF i�in banksel
		movf 0x11 , W // W = SSPBUF and BF = 0
		
		
		goto while_loop5 
		#endasm
		
		}
	
}








