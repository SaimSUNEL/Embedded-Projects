#define F_CPU 16000000UL

#include<avr/atmega328.h>
#include<util/delay.h>
#include<avr/io.h>

void I2C_Initialize ( )
{
	TWBR = 72 ;
	TWCR = 1 << TWEN ;
	TWSR |=  0 <<  TWPS1;//Prescale for baudrate...
	TWSR |=  0 <<  TWPS0;
	
}


unsigned char  I2C_Send( unsigned char data )
{
	TWDR = data ; ;//TWDR must be loaded while TWINT 1
	TWCR = 0b10000100;
	while( !( TWCR & ( 1 << TWINT )  ) ) ;
	return TWDR ;
	
}
void I2C_Start( )
{
	
	TWCR = 0b10100100 ; //start
	while( !( TWCR & ( 1 << TWINT ) ) ) ; // 
	
}


void I2C_Nack()
{
	
	
}

void I2C_Ack()
{
	TWCR = 0b11000100 ;
	while( !( TWCR & ( 1 << TWINT ) ) ) ;
	
}

void I2C_Stop()
{
	
	TWCR = 0b10010100;
	while( TWCR & ( 1 << TWSTO ) ) ;
	
	
}











 unsigned char veri ;
 
 int DS1307_saniye( )
 {
	 

	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x00 );
	 I2C_Stop();
	 I2C_Start();
	 I2C_Send( 0b11010001 );
	 veri = I2C_Send(0xff  );
	 veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
	// Send_NACK();
	 I2C_Stop();
	 
	 
	 return veri;
	 
	 
 }

 int DS1307_dakika( )
 {
	 
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x01 );
	 I2C_Stop();
	 I2C_Start();
	 I2C_Send( 0b11010001 );

	 veri = I2C_Send( 0xff  );
	 veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
	// Send_NACK();
	 I2C_Stop();
	 return veri;
	 
	 
	 
 }

 int DS1307_saat()
 {
	 
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x02 );
	 I2C_Stop();
	 I2C_Start();
	 I2C_Send( 0b11010001 );
	 veri = I2C_Send( 0xff  );
	 veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
	// Send_NACK();
	 I2C_Stop();
	 
	 return veri;
 }

 char DS1307_ay()
 {
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x05 );
	 I2C_Stop();
	 I2C_Start();
	 I2C_Send( 0b11010001 );
	 veri = I2C_Send( 0xff  );
	 veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
	// Send_NACK();
	 I2C_Stop();
	 
	 return veri;
	 
	 
	 
 }
 char DS1307_gun()
 {
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x04 );
	 I2C_Stop();
	 I2C_Start();
	 I2C_Send( 0b11010001 );
	 veri = I2C_Send( 0xff  );
	 veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
	 //Send_NACK();
	 I2C_Stop();
	 
	 return veri;
	 
	 
	 
 }
 
 char DS1307_yil()
 {
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x06 );
	 I2C_Stop();
	 I2C_Start();
	 I2C_Send( 0b11010001 );
	 veri = I2C_Send( 0xff  );
	 veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
	// Send_NACK();
	 I2C_Stop();
	 
	 return veri;
	 
	 
	 
 }
 
 void DS1307_dakika_ayarla( char value )
 {
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x01 );
	 
	 value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 I2C_Send( value );
	 I2C_Stop();
	 
	 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 
	 
 }

 void DS1307_saat_ayarla( char value )
 {
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x02 );
	 
	 value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 I2C_Send( value );
	 I2C_Stop();
	 
	 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 
	 
 }




 void DS1307_saniye_ayarla( char value )
 {
	 
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x00 );
	 
	 value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 I2C_Send( value );
	 I2C_Stop();
	 
	 
	 
 }




 void DS1307_gun_ayarla( char value )
 {
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x04 );
	 
	 value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 I2C_Send( value );
	 I2C_Stop();
	 
	 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 
	 
 }
 void DS1307_ay_ayarla( char value )
 {
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x05 );
	 
	 value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 I2C_Send( value );
	 I2C_Stop();
	 
	 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 
	 
 }

 void DS1307_yil_ayarla( char value )
 {
	 I2C_Start();
	 I2C_Send( 0b11010000 );
	 I2C_Send( 0x06 );
	 
	 value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 I2C_Send( value );
	 I2C_Stop();
	 
	 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
	 
	 
 }


 
 int gun , yil , ay , dakika , saat , saniye ;
 
 
int main()
{

I2C_Initialize() ;
_delay_ms( 100 ) ;	
	
	saniye = DS1307_saniye() ;
	dakika = DS1307_dakika() ;
	saat = DS1307_saat() ;
	yil = DS1307_yil() ;
	ay = DS1307_ay() ;
	gun = DS1307_gun() ;

	
	
while( 1 )
{
	
	saniye = DS1307_saniye() ;
_delay_ms( 900 ) ;
	
}
	
	
	
	
	
}