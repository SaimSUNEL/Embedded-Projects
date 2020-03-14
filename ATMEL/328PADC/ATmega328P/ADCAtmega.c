
#include<avr/io.h>
#include<util/delay.h>


#define FOSC 16000000L // CPU frekansý
#define BAUD 9600 //Baud Rate
#define UBRR (((FOSC/16UL)/BAUD)-1)  //UBBRR value..

char gelen_data;
int temp;
char *p;
void Usart_baslat()
{
	UBRR0H = ((unsigned char)( (UBRR >> 8)) );
   UBRR0L = (unsigned char)UBRR;
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
int main()
{
  DDRD = 0;
	DDRD = 1 << PIND1;
	PORTD = 0;
  DDRC = 0;
  PORTC = 0;
  
  Usart_baslat();
 _delay_ms( 1000 );
 
	
	Usart_veri_gonder( 'S' );
 PRR = 0 << PRADC;
 	_delay_ms( 10 );
 
  /*
	Input Channel Selections
MUX3...0 Single Ended Input
0000 ADC0
0001 ADC1
0010 ADC2
0011 ADC3
0100 ADC4
0101 ADC5
0110 ADC6
0111 ADC7
1000 ADC8(1)
*/
//We are chosing the channel
	ADMUX |= 0 << MUX3;
	ADMUX |= 0 << MUX2;
	ADMUX |= 0 << MUX1;
	ADMUX |= 0 << MUX0;
	_delay_ms( 10 );
	/*
	ADEN: ADC Enable
Writing this bit to one enables the ADC. By writing it to zero, the ADC is turned off. Turning the ADC off while a conversion
is in progress, will terminate this conversion.
	*/
	
	//We are enabling the adc module....
	ADCSRA |= 1 << ADEN;
		_delay_ms( 10 );
	


/*
	ADIF: ADC Interrupt Flag
This bit is set when an ADC conversion completes and the Data Registers are updated. The ADC Conversion
Complete Interrupt is executed if the ADIE bit and the I-bit in SREG are set. ADIF is cleared by hardware when
executing the corresponding interrupt handling vector. Alternatively, ADIF is cleared by writing a logical one to the
flag. Beware that if doing a Read-Modify-Write on ADCSRA, a pending interrupt can be disabled. This also applies
if the SBI and CBI instructions are use
	*/
	
	
	/*
	ADIE: ADC Interrupt Enable
When this bit is written to one and the I-bit in SREG is set, the ADC Conversion Complete Interrupt is activated.
	
	*/
	


/*
	ADPS[2:0]: ADC Prescaler Select Bits
These bits determine the division factor between the system clock frequency and the input clock to the ADC.
24.9.3 ADCL and ADCH – The ADC Data Register
24.9.3.1 ADLAR = 0
24.9.3.2 ADLAR = 1
When an ADC conversion is complete, the result is found in these two registers.
Table 24-5. ADC Prescaler Selections
ADPS2 ADPS1 ADPS0 Division Factor
0 0 0 2
0 0 1 2
0 1 0 4
0 1 1 8
1 0 0 16
1 0 1 32
1 1 0 64
1 1 1 128
*/
	
ADCSRA |= 1 << ADPS2;
ADCSRA |= 0 << ADPS1;
ADCSRA |= 0 << ADPS0;
		_delay_ms( 10 );
	
	

	/*
	ADSC: ADC Start Conversion
In Single Conversion mode, write this bit to one to start each conversion. In Free Running mode, write this bit to
one to start the first conversion. The first conversion after ADSC has been written after the ADC has been enabled,
or if ADSC is written at the same time as the ADC is enabled, will take 25 ADC clock cycles instead of the normal
13. This first conversion performs initialization of the ADC.
ADSC will read as one as long as a conversion is in progress. When the conversion is complete, it returns to zero.
Writing zero to this bit has no effect.
	
	*/
	//Start converting..
	
	
	
	
	/*
	ADCL and ADCH – The ADC Data Register
	*/

while( 1 )
{
  
  ADCSRA |= 1 << ADSC;
	
while( ( ADCSRA & 1 << ADSC ) );
Usart_veri_gonder( 'R' );
Usart_veri_gonder( ':' );

Usart_veri_gonder( ADCL );
Usart_veri_gonder( '\n' );
Usart_veri_gonder( ADCH );

	p = ( char * ) &temp;
	*p = ADCL;
    *( p + 1 ) = ADCH;	
	temp = temp / 2;
  
  
  
  if( (UCSR0A & (1<<RXC0)) )
  {
    gelen_data = Usart_veri_al();
    switch( gelen_data )
    {
     
     case 't':
     
     Usart_veri_gonder( 'S' );
     Usart_veri_gonder( 'a' );
     Usart_veri_gonder( 'i' );
     Usart_veri_gonder( 'm' );
     Usart_veri_gonder( ' ' );
     Usart_veri_gonder( ':' );
     Usart_veri_gonder( ' ' );
     Usart_veri_gonder( ( temp )  ); 
     Usart_veri_gonder( '\n' );
     
     
     break;
     
      
      
      
    }
    
    
  }
  
  
  _delay_ms( 500 );
  
  
}


  
  
  
}


