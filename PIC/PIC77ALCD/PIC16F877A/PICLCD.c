
#include<htc.h>

#ifndef _XTAL_FREQ
 // Unless already defined assume 4MHz system frequency
 // This definition is required to calibrate __delay_us() and __delay_ms()
 #define _XTAL_FREQ 4000000
#endif
#define DelayMs(x) __delay_ms(x)
#define DelayUs(x) __delay_us(x)


#include  "LCD.h" 
unsigned char custom[8] = {
	
	0b00000,
	0b01110,
	0b10000,
	0b10000,
	0b10000,
	0b01110,
	0b00100,
	0b00000
	
};

#define lcd_komut lcd_command
#define lcd_veri lcd_data
void ozel_karakterler()
{
   // CGRAM'de 1. Adrese "Ç" Karakteri Kaydediliyor
    lcd_komut(0x40);lcd_veri( 0 );
	lcd_komut(0x41);lcd_veri(14);
   lcd_komut(0x42);lcd_veri(17);
  
   lcd_komut(0x43);lcd_veri(16);
   lcd_komut(0x44);lcd_veri(16);
   lcd_komut(0x45);lcd_veri(21);
   lcd_komut(0x46);lcd_veri(14);
   lcd_komut(0x47);lcd_veri(0);

   // CGRAM'de 1. Adrese "Ð" Karakteri Kaydediliyor
   lcd_komut(0x48);lcd_veri(14);
   lcd_komut(0x49);lcd_veri(0);
   lcd_komut(0x4A);lcd_veri(15);
   lcd_komut(0x4B);lcd_veri(16);
   lcd_komut(0x4C);lcd_veri(19);
   lcd_komut(0x4D);lcd_veri(17);
   lcd_komut(0x4E);lcd_veri(15);
   lcd_komut(0x4F);lcd_veri(0);

   // CGRAM'de 2. Adrese "Ý" Karakteri Kaydediliyor
   lcd_komut(0x50);lcd_veri(4);
   lcd_komut(0x51);lcd_veri(0);
   lcd_komut(0x52);lcd_veri(4);
   lcd_komut(0x53);lcd_veri(4);
   lcd_komut(0x54);lcd_veri(4);
   lcd_komut(0x55);lcd_veri(4);
   lcd_komut(0x56);lcd_veri(4);
   lcd_komut(0x57);lcd_veri(0);

   // CGRAM'de 3. Adrese "Ö" Karakteri Kaydediliyor
   lcd_komut(0x58);lcd_veri(10);
   lcd_komut(0x59);lcd_veri(0);
   lcd_komut(0x5A);lcd_veri(14);
   lcd_komut(0x5B);lcd_veri(17);
   lcd_komut(0x5C);lcd_veri(17);
   lcd_komut(0x5D);lcd_veri(17);
   lcd_komut(0x5E);lcd_veri(14);
   lcd_komut(0x5F);lcd_veri(0);

   // CGRAM'de 4. Adrese "Þ" Karakteri Kaydediliyor
   lcd_komut(0x60);lcd_veri(14);
   lcd_komut(0x61);lcd_veri(17);
   lcd_komut(0x62);lcd_veri(16);
   lcd_komut(0x63);lcd_veri(14);
   lcd_komut(0x64);lcd_veri(1);
   lcd_komut(0x65);lcd_veri(21);
   lcd_komut(0x66);lcd_veri(14);
   lcd_komut(0x67);lcd_veri(0);

   // CGRAM'de 5. Adrese "Ü" Karakteri Kaydediliyor
   lcd_komut(0x68);lcd_veri(10);
   lcd_komut(0x69);lcd_veri(0);
   lcd_komut(0x6A);lcd_veri(17);
   lcd_komut(0x6B);lcd_veri(17);
   lcd_komut(0x6C);lcd_veri(17);
   lcd_komut(0x6D);lcd_veri(17);
   lcd_komut(0x6E);lcd_veri(14);
   lcd_komut(0x6F);lcd_veri(0);

   // CGRAM'de 6. Adrese "I" Karakteri Kaydediliyor
   lcd_komut(0x70);lcd_veri(4);
   lcd_komut(0x71);lcd_veri(4);
   lcd_komut(0x72);lcd_veri(4);
   lcd_komut(0x73);lcd_veri(4);
   lcd_komut(0x74);lcd_veri(4);
   lcd_komut(0x75);lcd_veri(4);
   lcd_komut(0x76);lcd_veri(4);
   lcd_komut(0x77);lcd_veri(0);

   // CGRAM'de 7. Adrese "'" Karakteri Kaydediliyor
   lcd_komut(0x78);lcd_veri(12);
   lcd_komut(0x79);lcd_veri(18);
   lcd_komut(0x7A);lcd_veri(18);
   lcd_komut(0x7B);lcd_veri(12);
   lcd_komut(0x7C);lcd_veri(0);
   lcd_komut(0x7D);lcd_veri(0);
   lcd_komut(0x7E);lcd_veri(0);
   lcd_komut(0x7F);lcd_veri(0);
}

	static char len  = 1 ;
unsigned char deneme;
unsigned char veri;
lcd_yaz( const char * p )
{
 
	
	
	while( *( p)!='\0' )
	{
		if( *p == 'Ç' ) 
		{
		lcd_komut(0x40);;DelayMs( 2 );lcd_veri( 0 );DelayMs( 2 );
	lcd_komut(0x41);;DelayMs( 2 );lcd_veri(14);DelayMs( 2 );
   lcd_komut(0x42);;DelayMs( 2 );lcd_veri(17);DelayMs( 2 );
  
   lcd_komut(0x43);DelayMs( 2 );lcd_veri(16);DelayMs( 2 );
   lcd_komut(0x44);DelayMs( 2 );lcd_veri(16);DelayMs( 2 );
   lcd_komut(0x45);DelayMs( 2 );lcd_veri(21);
   lcd_komut(0x46);DelayMs( 2 );lcd_veri(14);
   lcd_komut(0x47);DelayMs( 2 );lcd_veri(0);DelayMs( 2 );
	//	lcd_command( 128 );
	//	lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		
			lcd_data(0);
			///lcd_komut( 128 ) ;
		RD1 = 1 ;	
			
			}
			else if ( *p == 'Þ' )
		{
	// CGRAM'de 4. Adrese "Þ" Karakteri Kaydediliyor
   lcd_komut(0x48);lcd_veri(14);
   lcd_komut(0x49);lcd_veri(17);
   lcd_komut(0x4a);lcd_veri(16);
   lcd_komut(0x4b);lcd_veri(14);
   lcd_komut(0x4c);lcd_veri(1);
   lcd_komut(0x4d);lcd_veri(21);
   lcd_komut(0x4e);lcd_veri(14);
   lcd_komut(0x4f);lcd_veri(0);
		//lcd_command( 128 ) ;
			//lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		//lcd_goto ( 1, 1 );DelayMs( 2 );
		lcd_data(1);
			//lcd_komut( 128 ) ;
		}	
		
	else if ( *p == 'þ' )
		{
// CGRAM'de 4. Adrese "þ" Karakteri Kaydediliyor
   lcd_komut(0x78);lcd_veri(0b00000);
   lcd_komut(0x79);lcd_veri(0b01110);
   lcd_komut(0x7a);lcd_veri(0b01000);
   lcd_komut(0x7b);lcd_veri(0b01110);
   lcd_komut(0x7c);lcd_veri(0b00010);
   lcd_komut(0x7d);lcd_veri(0b01110);
   lcd_komut(0x7e);lcd_veri(0b01100);
   lcd_komut(0x7f);lcd_veri(0);
		//lcd_command( 128 ) ;
		//	lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		//lcd_goto ( 1, 1 );DelayMs( 2 );
		lcd_data(7);
		RD6 = 1;
		//	lcd_komut( 128 ) ;
			
			}	
	
/*	else if ( *p == 'ð' )
		{
// CGRAM'de 4. Adrese "ð" Karakteri Kaydediliyor
   lcd_komut(0x80);lcd_veri(0b01110);
   lcd_komut(0x81);lcd_veri(0b00000);
   lcd_komut(0x82);lcd_veri(0b01110);
   lcd_komut(0x83);lcd_veri(0b01010);
   lcd_komut(0x84);lcd_veri(0b01110);
   lcd_komut(0x85);lcd_veri(0b00010);
   lcd_komut(0x86);lcd_veri(0b01110);
   lcd_komut(0x87);lcd_veri(0);
		//lcd_command( 128 ) ;
			lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		//lcd_goto ( 1, 1 );DelayMs( 2 );
		lcd_data(7);
		RD6 = 1;
		}	
	
	
	*/
		else if ( *p == 'Ý' )
		{
	
   // CGRAM'de 2. Adrese "Ý" Karakteri Kaydediliyor
   lcd_komut(0x50);lcd_veri(4);
   lcd_komut(0x51);lcd_veri(0);
   lcd_komut(0x52);lcd_veri(4);
   lcd_komut(0x53);lcd_veri(4);
   lcd_komut(0x54);lcd_veri(4);
   lcd_komut(0x55);lcd_veri(4);
   lcd_komut(0x56);lcd_veri(4);
   lcd_komut(0x57);lcd_veri(0);

		//lcd_command( 128 ) ;
			//lcd_komut( 128 ) ;
			
			//lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		//lcd_goto ( 1, 1 );DelayMs( 2 );
		lcd_data(2);
		//	lcd_komut( 128 ) ;
		}	
		
		
		
		
		
		
		else if ( *p == 'Ð' )
		{
	// CGRAM'de 1. Adrese "Ð" Karakteri Kaydediliyor
   lcd_komut(0x58);lcd_veri(14);
   lcd_komut(0x59);lcd_veri(0);
   lcd_komut(0x5a);lcd_veri(15);
   lcd_komut(0x5b);lcd_veri(16);
   lcd_komut(0x5c);lcd_veri(19);
   lcd_komut(0x5d);lcd_veri(17);
   lcd_komut(0x5e);lcd_veri(15);
   lcd_komut(0x5f);lcd_veri(0);
		//lcd_command( 128 ) ;
			//lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		//lcd_goto ( 1, 1 );DelayMs( 2 );
		lcd_data(3);
			//lcd_komut( 128 ) ;
		}	
		else if ( *p == 'Ü' )
		{
		// CGRAM'de 5. Adrese "Ü" Karakteri Kaydediliyor
   lcd_komut(0x60);lcd_veri(10);
   lcd_komut(0x61);lcd_veri(0);
   lcd_komut(0x62);lcd_veri(17);
   lcd_komut(0x63);lcd_veri(17);
   lcd_komut(0x64);lcd_veri(17);
   lcd_komut(0x65);lcd_veri(17);
   lcd_komut(0x66);lcd_veri(14);
   lcd_komut(0x67);lcd_veri(0);
		//lcd_command( 128 ) ;
			//lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		//lcd_goto ( 1, 1 );DelayMs( 2 );
		lcd_data(4);
			//lcd_komut( 128 ) ;
		}	
			else if ( *p == 'Ö' )
		{
	// CGRAM'de 3. Adrese "Ö" Karakteri Kaydediliyor
   lcd_komut(0x68);lcd_veri(10);
   lcd_komut(0x69);lcd_veri(0);
   lcd_komut(0x6A);lcd_veri(14);
   lcd_komut(0x6B);lcd_veri(17);
   lcd_komut(0x6C);lcd_veri(17);
   lcd_komut(0x6D);lcd_veri(17);
   lcd_komut(0x6E);lcd_veri(14);
   lcd_komut(0x6F);lcd_veri(0);
		//lcd_command( 128 ) ;
			//lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		//lcd_goto ( 1, 1 );DelayMs( 2 );
		lcd_data(5);
		//	lcd_komut( 128 ) ;
		}	
		else if ( *p == 'I' )
		{
	// CGRAM'de 6. Adrese "I" Karakteri Kaydediliyor
   lcd_komut(0x70);lcd_veri(4);
   lcd_komut(0x71);lcd_veri(4);
   lcd_komut(0x72);lcd_veri(4);
   lcd_komut(0x73);lcd_veri(4);
   lcd_komut(0x74);lcd_veri(4);
   lcd_komut(0x75);lcd_veri(4);
   lcd_komut(0x76);lcd_veri(4);
   lcd_komut(0x77);lcd_veri(0);
		//lcd_command( 128 ) ;
			//lcd_goto ( ( len / 16 ) + 1 , len % 16 );DelayMs( 2 );
		//lcd_goto ( 1, 1 );DelayMs( 2 );
		lcd_data(6);
			///lcd_komut( 128 ) ;
		}	
		
		
		else
		lcd_data( *p );	
		
		p++;
		
		len ++ ;
		
	} // While end...
	
	
	
	
} //Fonk end




void main()
{
	
	
	deneme = 'Þ';
TRISA = 0b00000001;
	TRISD  = 0;
	PORTD = 0;
	PORTA = 0;
	TRISB = 0;
	PORTB = 0;
	TRISC = 0;
	 PORTC = 0;
	//if( deneme =='Þ' ) RD0 = 1;
lcd_init();

	//if( deneme == 'þ' ) RD5 = 1;
	//ozel_karakterler();
DelayMs( 100 );
	//lcd_command( 0x40 );
	//for( int b = 0 ; b < 8 ; b++ )
	//{
	//lcd_command( 0x40 + b );
	//lcd_data( custom[ b ] );	
		
		
//	}
	lcd_goto ( 1, 1 );
//	lcd_data( 0 );
 lcd_yaz( "saim" );
		//DelayMs( 2000 );
	//DelayMs( 2000 );
	//DelayMs( 2000 );
	DelayMs( 2000 );
	lcd_yaz( "Deneme" );
		//lcd_veri( 'l' );DelayMs( 2 );	//lcd_goto( 2 , 1 );
	//lcd_yaz( "assaasÇ");
//lcd_data( 0 );lcd_data( 0 );
	while( 1 );	
	
	
	
	
}