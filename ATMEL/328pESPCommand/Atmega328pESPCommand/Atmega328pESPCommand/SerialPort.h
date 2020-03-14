/*
 * SerialPort.h
 *
 * Created: 12.07.2019 12:08:11
 *  Author: Saim
 */ 


#ifndef SERIALPORT_H_
#define SERIALPORT_H_


#define FOSC 16000000L // CPU frekansı
#define BAUD 2400 //Baud Rate
#define UBRR (((FOSC/16UL)/BAUD)-1)  //UBBRR value..



void UsartInit()
{
	UBRR0H = ((unsigned char)( (UBRR >> 8)) );
	UBRR0L = (unsigned char)UBRR;
	UCSR0C = ( 0 << UMSEL00 ) | (3<<UCSZ00) |( 0 << UMSEL01 ) | ( 0 << UPM00) | (0 << UPM01) | ( 0 << USBS0 ) ; //Asynronuousr Usart seçildi...Parity modu yok...Stopbit 1 8 nit veri alımı
	UCSR0B = ( 1 << TXEN0) | ( 1 << RXEN0 ) | ( 0 << UCSZ02 ); //Transmitter ve Receiver Enabled...
	//UCSR0A = ( 1 << U2X0);	
}

unsigned char UsartRead()
{
	while ( !(UCSR0A & (1<<RXC0)) );
	return UDR0;
	
}
void UsartSend( unsigned char veri )
{
	while ( !( UCSR0A & (1<<UDRE0)) );
	UDR0 = veri;
}

void SerialPortReadString()
{
	byte previous_char=0, current_char=0;
	byte index = 0;
	do
	{
		previous_char = current_char;
		
		current_char = UsartRead();
		string_characters[index] = current_char;
		index++;
	} while (previous_char != '\r' && current_char != '\n');
	string_characters[index] = '\0';
}

void SerialPortSendString()
{
	byte previous_char=0, current_char=0;
	byte index = 0;
	do
	{
		previous_char = current_char;
		current_char = string_characters[index];
		UsartSend(current_char);
		_delay_us(500);
		index ++;
	} 
	while (previous_char != '\r' && current_char != '\n');
}

#endif /* SERİALPORT_H_ */