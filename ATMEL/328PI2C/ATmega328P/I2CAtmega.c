
#include<avr/io.h>
#include <util/delay.h>
#define FOSC 16000000L // CPU frekansý
#define BAUD 19200 //Baud Rate
#define UBRR (((FOSC/16UL)/BAUD)-1)  //UBBRR value..
#define DelayMs( x ) _delay_ms( x )
void Usart_baslat()
{
	UBRR0H = ((unsigned char)( (UBRR >> 8)) );
   UBRR0L = (unsigned char)UBRR;
	UCSR0C = ( 0 << UMSEL00 ) | (3<<UCSZ00) |( 0 << UMSEL01 ) | ( 0 << UPM00) | (0 << UPM01) | ( 0 << USBS0 ) ; //Asynronuousr Usart seçildi...Parity modu yok...Stopbit 1 8 nit veri alýmý
	UCSR0B = ( 1 << TXEN0) | ( 1 << RXEN0 ) | ( 0 << UCSZ02 ); //Transmitter ve Receiver Enabled...
	//UCSR0A = ( 1 << U2X0);
	UCSR0B |= 1 << RXCIE0; // Interrupt enabled...
	
	
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


/*
----TWBR – TWI Bit Rate Register ( + )
• Bits 7...0 – TWI Bit Rate Register
TWBR selects the division factor for the bit rate generator. The bit rate generator is a frequency divider which generates
the SCL clock frequency in the Master modes. See ”Bit Rate Generator Unit” on page 215 for calculating bit
rates.


SCL frequency CPU Clock frequency/(
16 + 2(TWBR) *(PrescalerValue))
= -----------------------------------------------------------------------------------------

***********TWCR – TWI Control Register*************

Bit 6 – TWEA: TWI Enable Acknowledge Bit  ( + )
The TWEA bit controls the generation of the acknowledge pulse. If the TWEA bit is written to one, the ACK pulse is
generated on the TWI bus if the following conditions are met:
1. The device’s own slave address has been received.
2. A general call has been received, while the TWGCE bit in the TWAR is set.
3. A data byte has been received in Master Receiver or Slave Receiver mode.
By writing the TWEA bit to zero, the device can be virtually disconnected from the 2-wire Serial Bus temporarily.
Address recognition can then be resumed by writing the TWEA bit to one again.







*/


void I2C_send( char deger )
{
	
	
	TWDR = deger;
		TWCR = 0b11000100;//Erase the flag...
	while( ( TWCR & 1 << TWINT ) == 0 );
//TWCR |= 1 << TWINT;
}



unsigned char I2C_read()
{
	
	TWCR = 1 << TWINT | 1 << TWEN;
	while( !(TWCR & (1 << TWINT ) ) );
	return TWDR;
	
}
void I2C_start()
{
	
	TWCR = 0b11100100;
	while( !( TWCR & 1<<TWINT) );
	
	
	/*
	*****TWCR – TWI Control Register***
	
	
	Bit 5 – TWSTA: TWI START Condition Bit   ( + )
The application writes the TWSTA bit to one when it desires to become a Master on the 2-wire Serial Bus. The TWI
hardware checks if the bus is available, and generates a START condition on the bus if it is free. However, if the
bus is not free, the TWI waits until a STOP condition is detected, and then generates a new START condition to
claim the bus Master status. TWSTA must be cleared by software when the START condition has been
transmitted.
	
---	TWEN: TWI Enable Bit   ( + )
The TWEN bit enables TWI operation and activates the TWI interface. When TWEN is written to one, the TWI
takes control over the I/O pins connected to the SCL and SDA pins, enabling the slew-rate limiters and spike filters.
If this bit is written to zero, the TWI is switched off and all TWI transmissions are terminated, regardless of any
ongoing operation.
	
	
	
----TWINT: TWI Interrupt Flag    ( + )
This bit is set by hardware when the TWI has finished its current job and expects application software response. If
the I-bit in SREG and TWIE in TWCR are set, the MCU will jump to the TWI Interrupt Vector. While the TWINT Flag
is set, the SCL low period is stretched. The TWINT Flag must be cleared by software by writing a logic one to it.
Note that this flag is not automatically cleared by hardware when executing the interrupt routine. Also note that
clearing this flag starts the operation of the TWI, so all accesses to the TWI Address Register (TWAR), TWI Status
Register (TWSR), and TWI Data Register (TWDR) must be complete before clearing this flag.	
	
	
	
	
	************TWSR – TWI Status Register*******************
	-----Bits 1:0 – TWPS: TWI Prescaler Bits
	
	
	These bits can be read and written, and control the bit rate prescaler.

-----7. TWI Bit Rate Prescaler   ( + )
TWPS1 TWPS0 Prescaler Value
0 0 1
0 1 4
1 0 16
1 1 64
	
	


-----TWDR – TWI Data Register
In Transmit mode, TWDR contains the next byte to be transmitted. In Receive mode, the TWDR contains the last
byte received. It is writable while the TWI is not in the process of shifting a byte. This occurs when the TWI Interrupt
Flag (TWINT) is set by hardware. Note that the Data Register cannot be initialized by the user before the first interrupt
occurs. The data in TWDR remains stable as long as TWINT is set. While data is shifted out, data on the bus
is simultaneously shifted in. TWDR always contains the last byte present on the bus, except after a wake up from a
sleep mode by the TWI interrupt. In this case, the contents of TWDR is undefined. In the case of a lost bus arbitration,
no data is lost in the transition from Master to Slave. Handling of the ACK bit is controlled automatically by the
TWI logic, the CPU cannot access the ACK bit directly.







-----TWAR – TWI (Slave) Address Register
The TWAR should be loaded with the 7-bit Slave address (in the seven most significant bits of TWAR) to which the
TWI will respond when programmed as a Slave Transmitter or Receiver, and not needed in the Master modes. In
multi master systems, TWAR must be set in masters which can be addressed as Slaves by other Masters.
The LSB of TWAR is used to enable recognition of the general call address (0x00). There is an associated address
comparator that looks for the slave address (or general call address if enabled) in the received serial address. If a
match is found, an interrupt request is generated.
	
	
	*/
}
void I2C_stop()
{
	
	//// | 1 << TWEN;
	TWCR = 0b11010100;
	
	//TWCR |= 1 << TWINT;
	/*
	*****TWCR – TWI Control Register***
	TWSTO: TWI STOP Condition Bit
Writing the TWSTO bit to one in Master mode will generate a STOP condition on the 2-wire Serial Bus. When the
STOP condition is executed on the bus, the TWSTO bit is cleared automatically. In Slave mode, setting the
TWSTO bit can be used to recover from an error condition. This will not generate a STOP condition, but the TWI
returns to a well-defined unaddressed Slave mode and releases the SCL and SDA lines to a high impedance state.
	
	
	
	*/
	
	
	
}

void I2C_initialize()
{
	
	TWBR = 72;
	TWCR |= 1 << TWEA;  //Acknowlegde enable....

	TWCR |= 1 << TWEN; //Enable I2C module..
	
	
	TWSR |=  0 <<  TWPS1;//Prescale for baudrate...
	TWSR |=  0 <<  TWPS0;
	
	
	}


char gelen;


unsigned char EEPROM_24C32A_oku( int adres )
{
	
	 I2C_start();
	 I2C_send( 0b10100000 );
	 I2C_send( adres >> 8 );
	 I2C_send( 0xff & adres  );
	 I2C_stop();
	 I2C_start();
	 I2C_send( 0b10100001 );
	 gelen  =  I2C_read();
    DelayMs( 5 );
	 I2C_stop(); 
	DelayMs( 5 );
	return gelen;
	
}

void EEPROM_24C32A_yaz( int adres , char deger )
{
	
	I2C_start();
		
	I2C_send ( 0b10100000 );//I2C_send( 0x40 );
DelayMs( 10 );	

	
		
		//I2C_read( 0x08 );
	I2C_send( adres >> 8 );
	DelayMs( 1 );
	I2C_send( ( 0xFF & adres ) );
	DelayMs( 10 );
	I2C_send( deger );
	//I2C_send( 0b10100000 );
	
	I2C_stop();
	DelayMs( 20 );
	
	
}
char data [ 20 ];
int main()
{
	DDRD = 255;
	PORTD = 0;
	
	DDRC = 0;
	PORTC = 0;
	
	I2C_initialize();
	_delay_ms( 1000 );

Usart_baslat();
	
	/*
	I2C_start();
	PORTD = 1 << PIND0;
		I2C_send( 0x41 );
	PORTD = 1 << PIND1;
	
	gelen = I2C_read();//I2C_send( 8 );
	PORTD = 1 << PIND2;
	
	I2C_stop();
	PORTD = 1 << PIND3;
	PORTD = 255;
	*/ EEPROM_24C32A_yaz( 0 , ' ' );
	 
	 EEPROM_24C32A_yaz( 1  , 'S' );
	 EEPROM_24C32A_yaz( 2  , 'A' );
	 EEPROM_24C32A_yaz( 3  , 'I' );
	 EEPROM_24C32A_yaz( 4  , 'M' );
	 EEPROM_24C32A_yaz( 5  , ' ' );
	 EEPROM_24C32A_yaz( 6  , 'S' );
	 EEPROM_24C32A_yaz( 7  , 'U' );
	 EEPROM_24C32A_yaz( 8  , 'N' );
	 EEPROM_24C32A_yaz( 9  , 'E' );
	 EEPROM_24C32A_yaz( 10  , 'L' );
	 EEPROM_24C32A_yaz( 11  , ' ' );

    
	int a;
for(  a = 0 ; a < 20 ; a++ )
{


	data [ a ] =  EEPROM_24C32A_oku( a );
		Usart_veri_gonder( data [ a ] );
}
	/**/
	while( 1 );
	
	
	
	
	
	
	
	
	
}


