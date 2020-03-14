
#include<htc.h>

char veri[ 20 ];


void eeprom_hazirla()
{
	//EEIF = 0;//EEPROM write operation flag bit...
	/*
	Control bits, RD and WR, initiate read and write or
erase, respectively. These bits cannot be cleared, only
set, in software.
	*/
	
	
//	EEDATA holds the 8 bit-data for read/write
	//we can access the program memory by using these registers...
	//EEADR holds the address of the eeprom location being accessed... range 00h - ffh
	//EEPGD determines whether the access will be a program or data memory access...
	//Access data memory
	
	//WR = 1; it writes set 0 by the hardware RD = 1; reads set zero by the hardware...
	
	
	EEPGD = 0;
	
	EEIE = 0;//EEPROM write operation interrupt bit...
}

void eeprom_yaz( char adres , unsigned char veri )
{	WREN = 1;
	
	EEADR = adres;
	EEDATA =veri;
	
	EECON2 = 0x055;//Nedensiz
	EECON2 = 0xAA;//...
	WR = 1;
	while( WR );
	EEIF= 0;
WREN = 0;	
}

unsigned char eeprom_oku( char adres )
{
	
EEADR = adres;
	EEDATA = 0;
 RD = 1;
return EEDATA;
		
	
	
}	
int gelen;
void main()
{
	eeprom_hazirla();
	
	eeprom_yaz( 0 , 'S' );
	eeprom_yaz( 0 , 'S' );
	//gelen = eeprom_oku( 100 );
	
	for( int a = 0; a < 20 ; a++ )
	{
	eeprom_yaz( a , ( a + 25 ) );
	
	}	
	/*
for(int k = 0 ; k < 20 ; k++ )
{
	veri[ k ] = eeprom_oku( k );
	
	
	
}
	*/
eeprom_yaz( 100 , 's' );
eeprom_yaz( 102 , 'g' );	
eeprom_yaz( 103 , 'r' );
	eeprom_yaz( 104 , 'd' );
	eeprom_yaz( 105 , 's' );
	eeprom_yaz( 106 , ' ' );
eeprom_yaz( 107 , 'g' );
	eeprom_yaz( 108 , 'h' );
	eeprom_yaz( 109 , 'j' );
	eeprom_yaz( 110 , 'k' );
	while(1);
	
	
}