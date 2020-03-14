/* 
 * File:   SDCARD.h
 * Author: Saim
 *
 * Created on 02 Eylül 2019 Pazartesi, 00:14
 */

#ifndef SDCARD_H
#define	SDCARD_H

#include "SPI.h"
#include "ShiftLCD.h"


#ifdef	__cplusplus
extern "C" {
#endif
/*
 The CS pin (Chip Select) must be driven high to low before sending the command and must be kept low during the process. 
 */
extern void wait(byte);    
#define SPI_yaz SPI_write
#define SS RC1 //RA4 pini digital output used for ss of the slave device ( card reader )
unsigned char cevap  ;

char error = FALSE ;;
char * allocated ;
byte SD_RESP[5];

byte SDCARD_send_command(byte command, unsigned long param, byte crc)
{
byte response = 0;
    SS = 0;
	
	SPI_yaz ( command ) ;
	
	SPI_yaz ( param >> 24 ) ;
	SPI_yaz ( param >> 16 ) ;
	SPI_yaz (  param >> 8 ) ;
	SPI_yaz ( param & 0xff ) ;
	//For CMD0 the CRC value 
	SPI_yaz ( crc ) ; 
		
//Geçerli bir cevab?n gelmesi için en az 64 clock göndermke gerekebilir...
	while((response = SPI_yaz ( 0xff )) == 0xff );
    for(j=0; j < 5; j++) SPI_yaz(0xff); //for some CMD8 CMD58
    
    wait(10);
    SS = 1;
    return response;
    
    
    
}


void SDCARD_bir_sektor_yaz  ( unsigned long adres , char * buff , int size ) 
{
	
	SS = 0 ;
	
	SPI_yaz ( 0x40 | 24 ) ;
	
	SPI_yaz ( adres >> 24 ) ;
	SPI_yaz ( adres >>  16  )  ;
	SPI_yaz ( adres  >> 8 ) ;
	SPI_yaz ( adres ) ;
	
	SPI_yaz ( 0xff ) ;
	//Komut cevab?n? bekle
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
		//SD card veriyi yazana kadar busydir ( DO sunu lowa çekiyor. o s?rada 0 okuyaca??z...
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
		//E?er 5 de?ilse bir hata mesaj? ver...
		
}
		
	}
	else {
		 error = TRUE ;
	while ( 1 ) ;
	}
	SS= 1 ;
	
}



byte nisa;
byte threshold;
void SDCARD_bir_sektor_oku  ( unsigned long adres , char * buff )
{
	SS = 0 ;
	
	SPI_yaz ( 0x40 | 17 ) ;
	
	SPI_yaz ( adres >> 24 ) ;
	SPI_yaz ( adres >>  16  )  ;
	SPI_yaz ( adres  >> 8 ) ;
	SPI_yaz ( adres ) ;
	
	SPI_yaz ( 0xff ) ;
	//Komut cevab?n? bekle
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
                     nisa = 'T';
				 }
				 
			 }
			 //CRC önemli de?il bizim için...
			 SPI_yaz ( 0xff ) ;
			 SPI_yaz ( 0xff ) ;
			 
		 }
		 
		 
		 
		 
	 }
	 
	
	
	SS = 1 ;
	
	
	
}

#define SDC_VER1 1
#define SDC_VER2 2
#define MM3_VER  3
byte CARD_VERSION  =0;


void SDCARD_baslat ( )
{
	wait  ( 100 ) ; //wait a little bit after powerup 
	
   SS = 1 ; 
	for ( int a = 0 ; a < 11 ; a++ ) //8*11 clocks are applied to card when CS 1 
	SPI_yaz ( 0xff ) ;	
	
	wait ( 100 ) ;

//First we are sending CMD0 for SD to enter reset ( idle state )	
	cevap = SDCARD_send_command(0x40, 0, 0x95);
  	
    if(cevap != 0x1){ lcd_write("E");
    while(1); }

    //	//CMD8
    
    cevap = SDCARD_send_command(0x48, 0x1aa, 0x87);
 if(cevap & 4){ lcd_write("i");
}    
      
    //CMD55 command...
    cevap = SDCARD_send_command(0x77, 0, 1);
	 
    if(cevap != 0x1){ lcd_write("E2");
    while(1); }
    //ACMD41
    cevap = SDCARD_send_command(0x69, 0x40000000, 0x1 );   
  	
	if(cevap & 4)
    {
        lcd_write("illegal");
    
	//We are sending CMD1
        cevap = 1;
        while(cevap!=0)cevap = SDCARD_send_command(0x41, 0, 0xff);
    }    
    
  	//write OCR 512 byte block... 
    cevap = SDCARD_send_command(0x50, 512, 1);
  
	if(cevap != 0)
    {
        lcd_write("illegal");
        while(1);
    }    	
}    



#ifdef	__cplusplus
}
#endif

#endif	/* SDCARD_H */

