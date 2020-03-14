
#include <htc.h>
#define BAUD 9600 //Osilatore hesaba göre secilir
#define FOSC 4000000L //osc
#define DIVIDER ((int)(FOSC/(16UL * BAUD) -1))//SPBRG calculator
//void seri_porta_veri_gonder(unsigned char jk);
char gelen_veri[8];
unsigned char seri_porttan_veri_al();
#define DelayMs __delay_ms

void seri_port(unsigned char jk) 
 { while( !TXIF );
	 TXREG=jk;
TXIF = 0;
	
	 }
	 
	 unsigned char seri_porttan_veri_al() 
{
while( !RCIF );
	//if( RCREG == 's' )asm( "ljmp 0x1eda" );

return RCREG;
}


void seri_porta_veri_gonder( int number )
{
	seri_port( 'd' );
	DelayMs( 20 );
	seri_port( (number >> 8) );DelayMs( 20 );
	seri_port( number );DelayMs( 20 );
	
	
}
void seri_portu_ayarla()
{SPBRG=DIVIDER;
	BRGH=1;
	SPEN=1;
	SYNC=0;
	TX9=0;
	TXEN=1;
	RX9=0;
	CREN=1;
	
	
	
	RC6=1;
	RC7=1;
}



I2C_Start(  )
{
	SEN = 1;
	while( SEN );
	SSPIF = 0;
	
	}

	I2C_Stop(  )
	{
		PEN = 1;
		while( PEN );
		SSPIF = 0;
	}
	
I2C_gonder(  unsigned char veri )
{
SSPBUF = veri;
	while( !SSPIF );
		SSPIF = 0;

	

}	


unsigned char I2C_oku (   )
{
RCEN  = 1;	//RCEN = 1;	
	while( !SSPIF );
	SSPIF = 0;
return SSPBUF;	
	
	
	
	
}


I2C_Master_ayarla (   )
{
SMP = 1;
CKE = 0;

	
	
	//Fosc/4( 0 +1 )
	//100 khz
	SSPADD = 9;//
	
	
	
	
	
	//I2C 7 bit 
SSPM3 = 1;
SSPM2 = 0;
SSPM1 = 0;;
SSPM0 = 0;	
	
	

 
SSPEN = 1;
	
	
	
}

void Send_NACK()
{
	
	ACKDT = 1;
	ACKEN = 1;
	while( ACKEN );
		SSPIF = 0;
	
	
}
unsigned char veri ;

int DS1307_saniye( )
{
	

		I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x00 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
		
		
return veri;
	
	
}

int DS1307_dakika( )
{
	
	I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x01 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );

	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	return veri;
	
	
	
}

int DS1307_saat()
 {
	 
	 I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x02 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	 
	 return veri;
 }

char DS1307_ay()
 {
	  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x05 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	 
	 return veri;
	 
	 
	 
	 }
 char DS1307_gun()
 {
	  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x04 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	 
	 return veri;
	 
	 
	 
	 }
 
 char DS1307_yil()
 {
	  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x06 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	 
	 return veri;
	 
	 
	 
	 }
 
void DS1307_dakika_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x01 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}

void DS1307_saat_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x02 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}




void DS1307_saniye_ayarla( char value )
{
  
 I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x00 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
  
  
}




void DS1307_gun_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x04 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}
void DS1307_ay_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x05 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}

void DS1307_yil_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x06 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}


int dakika , saat , saniye;
int gun , ay ,yil;
void main(  )
{
	TRISB0 = 0;
	RB0=1;//SCL and SDA pins are input...
	seri_portu_ayarla();
	
	DelayMs( 100 );
	TRISC3 = 1;
	TRISC4 = 1;
	RC3=0;
	RC4 = 0;
	
	I2C_Master_ayarla();
	DelayMs( 100 );
	seri_porta_veri_gonder ( 'M' );
	seri_porta_veri_gonder ( 't' );
	seri_porta_veri_gonder ( 'T' );
	DS1307_saniye_ayarla( 23 );
	DS1307_dakika_ayarla( 23 );
	DS1307_saat_ayarla( 23 );
	DS1307_gun_ayarla( 23 );
	DS1307_ay_ayarla( 12 );
	DS1307_yil_ayarla( 23 );
	
	seri_porta_veri_gonder( 'T' );
	
	
	dakika = DS1307_dakika();
	seri_porta_veri_gonder( dakika );
    
	
	
	
	saat = DS1307_saat();
	seri_porta_veri_gonder( saat );
	
	gun = DS1307_gun();
	ay = DS1307_ay();
	yil = DS1307_yil();
	while( 1 )
	{
		RB0 =  ~ RB0 ;
		saniye = DS1307_saniye();
	seri_porta_veri_gonder( saniye );
		if ( saniye == 0 )
		{
			dakika = DS1307_dakika();
			seri_porta_veri_gonder( dakika );
			if( dakika == 0 )
			{
				
				saat = DS1307_saat();
				seri_porta_veri_gonder( saat );
				
				
			}
			
			
		}
		
		
		DelayMs( 900 );
	
		
		
		
		}
	
	
}