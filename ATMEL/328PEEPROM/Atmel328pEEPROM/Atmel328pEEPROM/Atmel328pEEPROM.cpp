/*
 * Atmel328pEEPROM.cpp
 *
 * Created: 22.07.2017 18:12:50
 *  Author: Saim
 */ 

#define F_CPU 16000000UL

#include <avr/io.h>
#include<util/delay.h>
#include<string.h>
//328p adress space [ 0 , 1023 ] = 1 kb

void EEPROM_yaz  ( unsigned int adres , unsigned char bilgi )

{
	
	
	
	//Yazýlacak adres
	EEAR = adres ;
	
	//Yazýlacak veri
	EEDR = bilgi ;
	
	
	EECR |= 1 << EEMPE ;
	
	EECR |= 1 << EEPE ;
	
	//Yazým iþlemi bitene kadar bekle...
	while (  EECR & ( 1 << EEPE ) ) ;
	
}


unsigned char EEPROM_oku ( unsigned int adres ) 

{
	
	
	//Okunacak adres
	
	EEAR = adres ; 
	
	//Read enable 
	EECR = 1 ; 
	
	
	return EEDR ;
}





int main(void)
{
    
	_delay_ms ( 1000 ) ;
	const char * saim = "Deneme             Deneme" ;
	
	for ( int a = 0 ; a < strlen (  ( char * ) saim )  ; a++ )
	{
		EEPROM_yaz( a , saim [ a ] ) ;
		
	}
	
	
	for ( int b = 0 ; b < strlen ( (char* ) saim ) ; b++  ) 
	{
		
		EEPROM_yaz(  100 + b , EEPROM_oku( b )   );
		
		
	} 
	
	
	
	
	while(1)
    	
	{
		
		
    
	
	    //TODO:: Please write your application code 
    
	
	
	
	}
}