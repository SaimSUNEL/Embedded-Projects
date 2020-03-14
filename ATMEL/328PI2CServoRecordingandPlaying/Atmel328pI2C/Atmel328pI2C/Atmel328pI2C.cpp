/*
 * Atmel328pI2C.cpp
 *
 Atmel328p ile EEPROM kullanýlacak..EEPROM memoriye veri yazýlýp okunacak...
 
 * Created: 22.07.2017 21:20:26
 *  Author: Saim
 */ 

#define F_CPU 16000000UL
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include<avr/atmega328.h>

#include<util/delay.h>
unsigned char status ;
unsigned char read_one;

unsigned char buff [ 10 ] ;


struct Servo 
{
	unsigned char angle ;
	
	
	
	};

struct Servo servo_listesi [ 3 ]  ;
int servo_sayisi ;

int servo_index=0 ;

bool high = false ;

int us ( int taban , int us )
 {
	if ( us == 0 ) return 1 ; 
	 
	 int temp = taban ;
	 
	 for ( int a = 1 ; a < us ; a++ )
	 temp *= taban ;
	 
	return temp ; 
	 
 }


ISR ( TIMER1_COMPA_vect )
{
	
	if ( high == false )
	{
		OCR1A = 2 * ( servo_listesi [ servo_index ].angle * 9  + 540 ) ;
		PORTB |= 1 <<  servo_index ;
		high = true ;
	}
	else 
	{
		
		high = false ;
		PORTB &= ~( 1 << servo_index ) ;
		OCR1A = 38000 ;
		if ( servo_index +1 == servo_sayisi ) servo_index = 0 ;
		else 
		servo_index ++ ;
		
		
	}







	
	
}









/*
EEprom address when A2=A1=A0=0 1010000

*/

void I2C_ayarla ( ) 
{
	/*
	100 khz for 16MHz CPU freq
	
	SCL frequency CPU Clock frequency
	SCL = CPU_CLOCK_FREQ / ( 16 + 2 ( TBWR )*prescaler ) 
	
	
	40 = 16 + 2 ( TBWR ) *Prescaler 
	12 = ( TBWR ) * Prescaler 
	*/
	TWBR = 72 ;
	//Son iki bit prescaler için 00 = 1 presc
	TWSR = 0 ;
	
	
	
}


//Baþarýlý olursa true , baþarýsýzsa false döner...
bool I2C_start (  ) 
{
	//Start condition will be transmitter , clear TWINT for operation to be executed , TWEN enale the I2C
	TWCR =  ( 1 << TWSTA )  | ( 1 << TWINT ) |  ( 1 << TWEN ) ;
	
	//Start bitene kadar bekle
	
	while ( !( TWCR & ( 1 << TWINT ) ) ) ;

/*

0x08 A START condition has been transmitted

*/

if ( ( TWSR  ) == 0x8    )return true ;

else return false ;


	
	
}


void hata ( ) 
{
	
for ( int c = 0 ; c < 10 ; c++ )
{
	portc.RC0 = ~portc.RC0 ;
	_delay_ms( 500 ) ;
	
	
}
	
	
	
}


#define READ 1
#define WRITE 0 

unsigned char I2C_data_oku ( ) 
{
	
	TWCR =   ( 1 << TWINT ) |  ( 1 << TWEN )   ;
	
	/*
	
	0x50 Data byte has been received;
	ACK has been returned
	
	0x58 Data byte has been received;
	NOT ACK has been returned
	
	*/
	while ( !( TWCR & ( 1 << TWINT ) ) ) ;
	status = TWSR ;
	return TWDR  ;

	//else return false ;
	
	
	
}


bool I2C_data_yaz  ( unsigned char data )
{
	TWDR = data ;
	
	TWCR =   ( 1 << TWINT ) |  ( 1 << TWEN ) ;
	
	/*
	0x28 Data byte has been transmitted;
	ACK has been received
	
	*/
	while ( !( TWCR & ( 1 << TWINT ) ) ) ;
	
	if ( ( TWSR ) == 0x28    )return true ;

	else return false ;
	
}



bool  I2C_device_adres ( unsigned char adres  , unsigned char mod ) 
{
	
	TWDR =  ( adres << 1 ) |  mod ;
	
	TWCR =   ( 1 << TWINT ) |  ( 1 << TWEN ) ;
	
	
	/*
	0x18 SLA+W has been transmitted;
	ACK has been received
	
	0x40 SLA+R has been transmitted;
	ACK has been received
	
	
	*/
	while ( !( TWCR & ( 1 << TWINT ) ) ) ;
	
	if (  (  TWSR  == 0x18 )  ||  ( ( TWSR  ) == 0x40 ) )return true ;

	else return false ;
	
}

bool I2C_repeat_start (  ) 
{
	
	TWCR =  ( 1 << TWSTA )  | ( 1 << TWINT ) |  ( 1 << TWEN ) ;
	
	while ( !( TWCR & ( 1 << TWINT ) ) ) ;

	/*

0x10 A repeated START condition
has been transmitted

	*/

	if ( ( TWSR  ) == 0x10    )return true ;

	else return false ;
	
	
}



void I2C_stop ( ) 
{
	
	TWCR  =  ( 1 << TWSTO )  | ( 1 << TWINT ) |  ( 1 << TWEN ) ;
	
	
}



void EEPROM_yaz (unsigned char adres , unsigned char data ) 
{
	
	cli ( )  ;
	if ( !I2C_start() ) hata() ;
	if ( !I2C_device_adres( 0b01010000 , WRITE  ) ) hata() ;
	if ( !I2C_data_yaz( adres >> 8 ) ) hata() ;
	if ( !I2C_data_yaz( adres & 0xff  ) )hata() ;
	if ( !I2C_data_yaz ( data  ) ) hata();
	I2C_stop() ;
	_delay_ms( 5 ) ;
	
	sei ( ) ;
}


unsigned char EEPROM_oku ( unsigned int adres  )
{
	cli ( ) ;
	unsigned char temp ;
	if ( !I2C_start()  )hata() ;
	if ( !I2C_device_adres( 0b01010000 , WRITE  ) ) hata() ;
	if ( !I2C_data_yaz( adres >> 8 ) ) hata() ;
	if ( !I2C_data_yaz( adres & 0xff   )  ) hata() ;
	
	if ( !I2C_repeat_start() ) hata();
	if ( !I2C_device_adres( 0b01010000 , READ ) ) ;
	temp  =  I2C_data_oku();
	
	I2C_stop();
	
	sei ( ) ;
	
	return temp ;
	
}

int temp = 0 ;

void ADC_ayarla ( ) 
{
	/*
	internal 1.1V referans
	*/
	
	ADMUX =  ( 1 <<REFS1 | 1 << REFS0 ) ; // ADC0 is selected...
	 
	 //pres 128
	ADCSRA = 1 << ADEN  | 1 << ADPS2 | 1 << ADPS1 | 1 << ADPS0 ;
	
	
}


int ADC_oku ( char kanal ) 
{
	
	ADMUX = ( ADMUX & 0xf0 ) + kanal ;
	
		
		ADCSRA |= 1 << ADSC ;
		while ( !(ADCSRA & ( 1 << ADSC )  ) );
		
		
		return  ADC ;
	
}




int main(void)
{
	ADC_ayarla() ;
	
	PORTB = 0 ;
	trisb.RB0 = 1 ;
	trisb.RB1 = 1 ;
	trisb.RB2 = 1 ;
	
	PORTC =  0 ;
	
	trisc.RC0 = 1 ; //PC0 OUTPUT


	I2C_ayarla() ;
	
	
	_delay_ms( 500 ) ;
	
	
	
	
	
		
	const char  * data = "Deneme                Deneme\0" ;
	
	
	for ( unsigned int b = 0 ; b <  strlen ( (char * ) data ) ; b++ )
	{
	//EEPROM_yaz( b , data [ b ] ) ;	
	}
			
	
	
//	read_one = EEPROM_oku( 11 ) ;
	
	
	for ( unsigned int c = 0 ; c <  strlen ( (char * ) data ) ; c++ )
	
	{
	//	EEPROM_yaz( 100 +  c , EEPROM_oku( c ) ) ;
	
		
	}
	
	
	
	servo_listesi [ 0 ].angle = 0  ;
		servo_listesi [ 1 ].angle = 0  ;
			servo_listesi [ 2 ].angle  = 0 ;
	servo_sayisi = 3 ;
	
	/*
	CTC  TOP = OCR1A
	timer1 prescaler 1:8 
	0.5 us for each increment in TMR1
	*/
	TCNT1 =  0 ;
	
 	TCCR1A =  0 ;
		OCR1A = 40000 ;
	TCCR1B =  ( 1 << WGM12 ) | ( 1<< CS11 )   ;
	
	
	//Output Compare A interrupt Enabled...

	
	TIMSK1 = 1 << OCIE1A ;
	
	//global interrupt açýk...
	sei ( ) ;
	
	 

	
	
	
	

	bool artir = true ;
	
    while(1)
    {
		
	
		
		
	
		if ( artir == true ) 
		{
			
		
		servo_listesi [ 0 ].angle += 10  ;
		servo_listesi [ 1 ].angle += 10  ;
		servo_listesi [ 2 ].angle  += 10 ;
		
		if ( servo_listesi[0].angle == 180 ) artir = false ;
		}
		else 
		{
			
			servo_listesi [ 0 ].angle -= 10  ;
			servo_listesi [ 1 ].angle -= 10  ;
			servo_listesi [ 2 ].angle  -= 10 ;
			
			if ( servo_listesi [ 0 ].angle == 0 ) artir = true ;
			
		}
		
		
        //TODO:: Please write your application code 
    }
}