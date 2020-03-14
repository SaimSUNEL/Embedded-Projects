/*
 * PS2Keyboard.cpp
 *
 * Created: 16.02.2016 10:21:13
 *  Author: Saim
 */ 


#include <avr/io.h>
#define F_CPU 16000000UL
#include <util/delay.h>
#include <avr/atmega328.h>
#include <avr/interrupt.h>
unsigned char index  =  0 ;

unsigned char tim  = 0;



#define FOSC 16000000L // CPU frekansý
#define BAUD 9600 //Baud Rate
#define UBRR (((FOSC/16UL)/BAUD)-1)  //UBBRR value..


void Usart_baslat()
{
	UBRR0H = ((unsigned char)( (UBRR >> 8)) );
	UBRR0L = (unsigned char)UBRR;
	
	UCSR0C = ( 0 << UMSEL00 ) | (3<<UCSZ00) |( 0 << UMSEL01 ) | ( 0 << UPM00) | (0 << UPM01) | ( 0 << USBS0 ) ; //Asynronuousr Usart seçildi...Parity modu yok...Stopbit 1 8 nit veri alýmý
	UCSR0B = ( 1 << TXEN0) | ( 1 << RXEN0 ) | ( 0 << UCSZ02 ); //Transmitter ve Receiver Enabled...
	//UCSR0A = ( 1 << U2X0);
	//UCSR0B |= 1 << RXCIE0; // Interrupt enabled...
	
	
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







int data_temp  = 0 ;
unsigned char pressed_key = 0 ; 
volatile bool is_data_ready = false ; 

volatile bool ignored = false ; 


ISR( INT0_vect  )
{

cli();
data_temp |= pind.RD3 << index ;
index ++ ;

if( index == 11 )
{

index = 0 ;
pressed_key = data_temp >> 1   ;
if( pressed_key == 240 ){ ignored = true ; }
else if ( ignored ){ ignored = false ;  }
else 
{
switch( pressed_key )
{
    case 28:pressed_key = 'a' ;break;
    case 50:pressed_key = 'b' ;break;
 case 33 :pressed_key = 'c' ;break;
case 35 :pressed_key = 'd' ;break;
case 36 :pressed_key = 'e' ;break;
case 43 :pressed_key = 'f' ;break;

case 52 :pressed_key = 'g' ;break;
case 84 :pressed_key = 'ð' ;break;
case 51 :pressed_key = 'h' ;break;
case 67 :pressed_key = 'ý' ;break;
case 82 :pressed_key = 'i' ;break;
case 59 :pressed_key = 'j' ;break;
case 66 :pressed_key = 'k' ;break;

case 41 : pressed_key = ' ' ; break;
case 75 :pressed_key = 'l' ;break;
case 58 :pressed_key = 'm' ;break;

case 49 :pressed_key = 'n' ;break;
case 68 :pressed_key = 'o' ;break;
case 65 :pressed_key = 'ö' ;break;


case 90 :pressed_key = '\n';break;

case 21 :pressed_key = 'q' ;break;
case 29 :pressed_key = 'w' ;break;
case 34 :pressed_key = 'x' ;break;


case 77 :pressed_key = 'p' ;break;
case 45 :pressed_key = 'r' ;break;
case 27 :pressed_key = 's' ;break;
case 76 :pressed_key = 'þ' ;break;
case 44 :pressed_key = 't' ;break;
case 60 :pressed_key = 'u' ;break;
case 91 :pressed_key = 'ü' ;break;
case 42 :pressed_key = 'v' ;break;
case 53 :pressed_key = 'y' ;break;
case 26 :pressed_key = 'z' ;break;
case 112 :pressed_key = '0' ;break;
case 105 :pressed_key = '1' ;break;
case 114 :pressed_key = '2' ;break;
case 122 :pressed_key = '3' ;break;
case 107 :pressed_key = '4' ;break;
case 115  :pressed_key = '5' ;break;
case 116 :pressed_key = '6' ;break;

case 108 :pressed_key = '7' ;break;
case 117 :pressed_key = '8' ;break;
case 125 :pressed_key = '9' ;break;


}	

Usart_veri_gonder( pressed_key );
portb.RB5 = ~ portb.RB5 ;
}
is_data_ready = true ;
	data_temp = 0 ;
}

sei();
}

int main(void)
{
	trisd.RD2 = 0 ; //INT0 pini input ... 
	portd.RD2 = 0 ;
	
	trisd.RD3 = 0 ; //PB0 data giriþi için input edildi...
	trisd.RD3 = 0;
	
	
	trisb.RB5 = 1 ;
	portb.RB5 = 0 ;
	
/*

EICRA – External Interrupt Control Register A
The External Interrupt Control Register A contains control bits for interrupt sense control.
• Bit 7:4 – Reserved
These bits are unused bits in the ATmega48A/PA/88A/PA/168A/PA/328/P, and will always read as zero.
• Bit 3, 2 – ISC11, ISC10: Interrupt Sense Control 1 Bit 1 and Bit 0
The External Interrupt 1 is activated by the external pin INT1 if the SREG I-flag and the corresponding interrupt
mask are set. The level and edges on the external INT1 pin that activate the interrupt are defined in Table 13-1.
The value on the INT1 pin is sampled before detecting edges. If edge or toggle interrupt is selected, pulses that last
longer than one clock period will generate an interrupt. Shorter pulses are not guaranteed to generate an interrupt.
If low level interrupt is selected, the low level must be held until the completion of the currently executing instruction
to generate an interrupt.
• Bit 1, 0 – ISC01, ISC00: Interrupt Sense Control 0 Bit 1 and Bit 0
The External Interrupt 0 is activated by the external pin INT0 if the SREG I-flag and the corresponding interrupt
mask are set. The level and edges on the external INT0 pin that activate the interrupt are defined in Table 13-2.
The value on the INT0 pin is sampled before detecting edges. If edge or toggle interrupt is selected, pulses that last
longer than one clock period will generate an interrupt. Shorter pulses are not guaranteed to generate an interrupt.
If low level interrupt is selected, the low level must be held until the completion of the currently executing instruction
to generate an interrupt.
Bit 7 6 5 4 3 2 1 0
(0x69) – – – – ISC11 ISC10 ISC01 ISC00 EICRA
Read/Write R R R R R/W R/W R/W R/W
Initial Value 0 0 0 0 0 0 0 0
Table 13-1. Interrupt 1 Sense Control
ISC11 ISC10 Description
0 0 The low level of INT1 generates an interrupt request.
0 1 Any logical change on INT1 generates an interrupt request.
1 0 The falling edge of INT1 generates an interrupt request.
1 1 The rising edge of INT1 generates an interrupt request.
Table 13-2. Interrupt 0 Sense Control
ISC01 ISC00 Description
0 0 The low level of INT0 generates an interrupt request.
0 1 Any logical change on INT0 generates an interrupt request.
1 0 The falling edge of INT0 generates an interrupt request.
1 1 The rising edge of INT0 generates an interrupt request.





*/	

Usart_baslat ( ) ;


   EICRA |= 1 << ISC01 ; // Interrupt on falling edge 
   sei();
   EIMSK |= 1 << INT0 ; //Int0 interrupt enabled...
	
  
  
    while(1)
    {
        //TODO:: Please write your application code 
 /*   
	Usart_veri_gonder( index ) ;
	_delay_ms( 250 ) ;
	*/
	
	/*while( is_data_ready == false );
	Usart_veri_gonder( pressed_key );
	portb.RB5 = ~ portb.RB5 ;
	is_data_ready = false; 
	*/
	
	}



}