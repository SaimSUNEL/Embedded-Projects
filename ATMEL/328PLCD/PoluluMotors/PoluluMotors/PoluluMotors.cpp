/*
 * PoluluMotors.cpp
 *
 * Created: 31.12.2015 00:24:29
 *  Author: Saim
 */ 


#include <avr/io.h>
#define F_CPU 20000000L
#include<util/delay.h>
#include<avr/atmega328.h>

#include "polulu_lcd.h"






void Usart_baslat()
{//For 115200 baud rate
	UBRR0 = 10;
	UCSR0C = ( 0 << UMSEL00 ) | (3<<UCSZ00) |( 0 << UMSEL01 ) | ( 0 << UPM00) | (0 << UPM01) | ( 0 << USBS0 ) ; //Asynronuousr Usart seçildi...Parity modu yok...Stopbit 1 8 nit veri alýmý
	UCSR0B = ( 1 << TXEN0) | ( 1 << RXEN0 ) | ( 0 << UCSZ02 ); //Transmitter ve Receiver Enabled...
	//UCSR0A = ( 1 << U2X0);
	
	
	
}

unsigned char Usart_veri_al()
{
	while ( !(UCSR0A & (1<<RXC0)) );
	return UDR0;
	
}
void Usart_veri_gonder( unsigned char veri )
{
	
	while ( !( UCSR0A & (1<<UDRE0)) );
	UDR0 = veri;
}







char rakam_array[ 10 ];
char rakam_index;
char * temp;
void rakam_yaz( int rakam )
{
rakam_array[ 0 ] = rakam / 10000 +48;
rakam = rakam % 10000;

rakam_array[ 1 ] = rakam / 1000 +48 ;
rakam = rakam % 1000;
rakam_array[ 2 ] = rakam / 100 +48; 
rakam = rakam % 100;
rakam_array[ 3 ] = rakam / 10+48;
rakam_array[ 4 ] = rakam % 10 +48;
rakam_array[ 5 ] = 0;
temp = rakam_array;
while( *temp == '0' ) temp ++ ;
lcd_write( temp );
	



	
}
void motor_ayarla( int sol_hiz , int sag_hiz )
{
	if( sag_hiz < 0 )
	{
		
		OCR2A = 0;
		OCR2B = -1 * sag_hiz;
		
		
	}
	else if ( sag_hiz > 0 )
	{
		OCR2A = sag_hiz;
	    OCR2B = 0;
	}
	else
	{
		OCR2A = 0; OCR2B = 0;
	}
	
	
	
	if( sol_hiz < 0 )
	{
		
		OCR0A = 0;
		OCR0B = -1 * sol_hiz;
		
		
	}
	else if ( sol_hiz > 0 )
	 {
		 OCR0A = sol_hiz;
	     OCR0B = 0;
	 }
	else
	{
		OCR0A = 0; OCR0B = 0;
	}
	
}






 int adc_oku ( char pin_numarasi )
{
	
	ADCSRA = 0x87;
	static unsigned char temp;
	
	temp = ADMUX;
	temp &= ~0x1f;
	temp |= pin_numarasi ;
	
ADMUX = temp; //( ADMUX & 0xf0 ) | pin_numarasi;
_delay_ms(3);
ADCSRA |= 1 << ADSC; //Start conversion...
//lcd_write( "b" );

while( ADCSRA & ( 1 << ADSC ) );


//ADCSRA = ( ADCSRA & ~( 1 << ADIF ) )  | (  1 << ADIF );
//lcd_write( "f" );
return ADC;	

}


int adc_average_oku ( char channel  , unsigned char sample )
{
	static long total;
	static unsigned char times; 
	total = 0;
	times = sample ;
	
	adc_oku ( channel );
	
	
	while( sample -- )
	{
		ADCSRA |= 1 << ADSC; //Start conversion...
		//lcd_write( "b" );

		while( ADCSRA & ( 1 << ADSC ) );


		//ADCSRA = ( ADCSRA & ~( 1 << ADIF ) )  | (  1 << ADIF );
		//lcd_write( "f" );
		total +=  ADC ;
			
	}
	
	
	
	return ( total / times );
	
}




void ADC_ayarla()
{
	
	ADMUX |= 1 << REFS1 | 1 << REFS0;// 1.1 reference deðiþtirildi...(  0 1  //1 1 interval 1.1 V reference 
	ADCSRA |= 1 << ADEN; //ADC enable...
    ADCSRA |= 1 << ADPS2 | 1 << ADPS1 | 1 << ADPS0 ; // presc 1/128
}


void melodi_ayarla()
{
	TCCR1A |= 1 << COM1B0; //Toggle Compare pin on match
	TCCR1A |= 1 << WGM12;
	OCR1B = 50000;
	TCCR1B |= 1<< CS10;
	
	
	
	
}


int deger [6]; 
int main(void)
{
	trisc.RC0 = 0;
	trisc.RC1 = 0;
	trisc.RC2 = 0;
	trisc.RC3 = 0;
	trisc.RC4 = 0;
	trisc.RC5 = 1;
	trisd.RD5 = 1;
	trisd.RD6 = 1;
	trisb.RB3 = 1;
	trisd.RD3 = 1;
	trisb.RB2 = 1;
	PORTD = 0;
	
 //  melodi_ayarla();
   lcd_init();
   _delay_ms(100);
 portc.RC5 = 1 ;
   while( 1 ) 
   {
	lcd_goto( 1 , 1 ) ;
	   lcd_data( pinc.RC0 +48) ;
	     lcd_data( pinc.RC1 +48) ;
		   lcd_data( pinc.RC2+48) ;
		     lcd_data( pinc.RC3 +48) ;
			 lcd_data( pinc.RC4 +48) ;
	   _delay_ms( 250  );
	   
	   
	   
	   
   }
   
   
   
   
   
   ADC_ayarla();
   
   
   
   _delay_ms( 250 );
   lcd_write( "Saim" );
   lcd_goto( 2 , 0 );
   lcd_write( "SUNEL" );
   lcd_write ( "Deneme" );
   _delay_ms( 500 );
   lcd_clear();
   lcd_write( "Tamam" );
   rakam_yaz( 20496 );
   
   //char data;
   
   TCCR0A |= 1 << COM0A1;//( COM0A0 = 0 ) ;Clear OC0A on Compare Match when up-counting. Set OC0A on
   //Compare Match when down-counting.
   TCCR0A |= 1 << COM0B1;
   TCCR0A |=  1 << WGM00 ;//0 0 1 PWM, Phase Correct 0xFF TOP BOTTOM
   OCR0A = 0;
   OCR0B = 0;
   TCCR0B |= 1 << CS01  ; //Presc clock 1/64
 
   TCCR2A |= 1 << COM2A1 ;
   TCCR2A |= 1 << COM2B1 ;
   TCCR2A |= 1 << WGM20 ;
   OCR2A = 0;
   OCR2B = 0;
   
   TCCR2B |= 1 << CS21 ;
   
   
   
   //motor_ayarla( 200, 0 );
   int hiz;
   hiz = 15;
   if( hiz == 0 );
   
   
   
   trisd.RD1 = 1; //Red led....
   
   
   portd.RD1 = 0;
   
   
   int  times = 0;
   trisd.RD7 = 1; //Green Led...

Usart_baslat();
_delay_ms( 100 );
trisc.RC5 = 1;
portc.RC5 = 0;
   
   portd.RD7 = 0;
   
//   _delay_ms( 1000 );
   portd.RD7 = 1;
  // _delay_ms( 1000 );
   portd.RD7 = 0;
   int k=0;
  // motor_ayarla(50 , 50 );
   times++;
   if(k); while(1)
    {

for( k = 0; k < 5 ; k ++ )
{
	deger[ k ] = adc_average_oku( k  , 60 );
	//if( deger[ k ] == 0 ) lcd_write( "S" );
}
lcd_clear( );
//rakam_yaz( ADCL );

rakam_yaz( deger [ 0 ] );
lcd_write( "-" );
rakam_yaz( deger [ 1 ] );
lcd_write( "-" );
rakam_yaz( deger [ 2 ] );
lcd_goto( 2 ,1 );

rakam_yaz( deger [ 3 ] );
lcd_write( "-" );
rakam_yaz( deger [ 4 ] );
_delay_ms( 200 );



/*
//Usart_veri_gonder( 'H' );
_delay_ms( 1 );
if ( UCSR0A & ( 1 << RXC0 ) )
{
//lcd_goto( 1 , 1 );
data = Usart_veri_al();

if( data == 't' )
{
	
	motor_ayarla( 100 , 100 );
	data = 0;
	
}
if( data =='z' )
{
	motor_ayarla( 0 , 0 );
	data = 0;
}

lcd_data( data );	
}
	//portc.RC5 = ~portc.RC5 ;
	
	_delay_ms(  500  );	
*/	
	//rakam_yaz( times ++ );
		
		/*
		
for( hiz = 0 ; hiz <= 255 ; hiz = hiz +5 )
{	    //TODO:: Please write your application code 

motor_ayarla( hiz , hiz * -1 );
_delay_ms( 150 );


	}
	
	
	for( hiz = 255 ; hiz >= 0 ; hiz -=5 )
{	//TODO:: Please write your application code

	motor_ayarla( hiz , hiz * -1 );

_delay_ms( 150 );

}
	
	for( hiz = 0 ; hiz >= -255 ; hiz -=5 )
	{	//TODO:: Please write your application code

		motor_ayarla( hiz , hiz * -1 );

		_delay_ms( 150 );

	}
	
	
	for( hiz = -255 ; hiz <= 0 ; hiz +=5 )
	{	//TODO:: Please write your application code

		motor_ayarla( hiz , hiz * -1 );

		_delay_ms( 150 );

	}
	

	*/

    }  //while end
 

 } // Main end