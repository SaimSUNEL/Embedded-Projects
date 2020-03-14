/*
 * atmel25602Usart.cpp
 *
 * Created: 08.01.2016 21:05:55
 *  Author: Saim
 */ 


#include <avr/io.h>
 #define F_CPU 16000000UL
 #include <util/delay.h >
 
 #define RCIF ((UCSR0A&(1<<RXC0)))
 typedef unsigned char byte ;
 
 
 
//Usart0 için

unsigned char Usart0_veri_al(  )
{
	while(  !( UCSR0A & ( 1 << RXC0 )) );
	return UDR0 ;
	
	
}
void Usart0_veri_gonder( unsigned char data )
{
	while( !( UCSR0A & 1 << UDRE0 ) );
	UDR0 = data;
	while( ! ( UCSR0A & 1 << TXC0 ) );
UCSR0A = UCSR0A | 1 << TXC0 ;
}


void Usart0_ayarla() 
{
	UCSR0A = 0;
	UCSR0C = 0 | 1 << UCSZ01 | 1 << UCSZ00; //8 bit data 1 stop no parity asyncronous Usart 
	UBRR0 = 103 ; //Baud rate 9600 ( 4 Mhz için )
	UCSR0B = 1 << RXEN0 | 1 << TXEN0 ;
	
}



//**************Usart1 için.....******************



unsigned char Usart1_veri_al(  )
{
	while(  !( UCSR1A & ( 1 << RXC1 )) );
	return UDR1 ;
	
	
}
void Usart1_veri_gonder( unsigned char data )
{
	while( !( UCSR1A & 1 << UDRE1 ) );
	UDR1 = data;
	while( ! ( UCSR1A & 1 << TXC1 ) );
	UCSR1A = UCSR1A | 1 << TXC1 ;
}


void Usart1_ayarla()
{
	UCSR1A = 0;
	UCSR1C = 0 | 1 << UCSZ11 | 1 << UCSZ10; //8 bit data 1 stop no parity asyncronous Usart
	UBRR1 = 25 ; //Baud rate 9600 ( 4 Mhz için )
	UCSR1B = 1 << RXEN1 | 1 << TXEN1 ;
	
}


//***************Usart 2 Ýçin...."***************






unsigned char Usart2_veri_al(  )
{
	while(  !( UCSR2A & ( 1 << RXC2 )) );
	return UDR2 ;
	
	
}
void Usart2_veri_gonder( unsigned char data )
{
	while( !( UCSR2A & 1 << UDRE2 ) );
	UDR2 = data;
	while( ! ( UCSR2A & 1 << TXC2 ) );
	UCSR2A = UCSR2A | 1 << TXC2 ;
}


void Usart2_ayarla()
{
	UCSR2A = 0;
	UCSR2C = 0 | 1 << UCSZ11 | 1 << UCSZ10; //8 bit data 1 stop no parity asyncronous Usart
	UBRR2 = 25 ; //Baud rate 9600 ( 4 Mhz için )
	UCSR2B = 1 << RXEN2 | 1 << TXEN2 ;
	
}


//**************Usart 3 için.....***************
unsigned char Usart3_veri_al(  )
{
	while(  !( UCSR3A & ( 1 << RXC3 )) );
	return UDR3 ;
	
	
}
void Usart3_veri_gonder( unsigned char data )
{
	while( !( UCSR3A & 1 << UDRE3 ) );
	UDR3 = data;
	while( ! ( UCSR3A & 1 << TXC3 ) );
	UCSR3A = UCSR3A | 1 << TXC3 ;
}


void Usart3_ayarla()
{
	UCSR3A = 0;
	UCSR3C = 0 | 1 << UCSZ31 | 1 << UCSZ30; //8 bit data 1 stop no parity asyncronous Usart
	UBRR3 = 25 ; //Baud rate 9600 ( 4 Mhz için )
	UCSR3B = 1 << RXEN3 | 1 << TXEN3 ;
	
}












int main(void)
{
	
	DDRB = 255 ;
	PORTB = 0 ;
	
	
Usart0_ayarla();
 //Usart1_ayarla();
//Usart2_ayarla();
//Usart3_ayarla();

_delay_ms( 100 );






Usart0_veri_gonder( 'S' );
Usart0_veri_gonder( 'a' );
Usart0_veri_gonder( 'i' );
Usart0_veri_gonder( 'm' );
/*
Usart1_veri_gonder( 'S' );
Usart1_veri_gonder( 'a' );
Usart1_veri_gonder( 'i' );
Usart1_veri_gonder( 'm' );

Usart2_veri_gonder( 'S' );
Usart2_veri_gonder( 'a' );
Usart2_veri_gonder( 'i' );
Usart2_veri_gonder( 'm' );

Usart3_veri_gonder( 'S' );
Usart3_veri_gonder( 'a' );
Usart3_veri_gonder( 'i' );
Usart3_veri_gonder( 'm' );
_delay_ms( 200 );


*/

//unsigned char data;


byte deger ;
    while(1)
    {
if ( RCIF )
{
	
	deger = Usart0_veri_al() ;
	switch  ( deger )
	{
		case 100:
		PORTB |= 1 << PINB7 ;
		
		
		
		break;
		
		
		case 101:
		PORTB &= ~( 1 << PINB7 ) ;
		break;
	}
	
	
}
Usart0_veri_gonder( 'T' ) ;
_delay_ms( 1000 );
        //TODO:: Please write your application code 
    }
}