
#include<htc.h>
#define DelayMs __delay_ms
/*
----Two pins are used for data transfer:
• Serial clock (SCL) – RC3/SCK/SCL
• Serial data (SDA) – RC4/SDI/SDA
---The user must configure these pins as inputs or outputs
through the TRISC<4:3> bits.
----SSPBUF is the buffer register to which data bytes
are written to or read from.


----SSPADD register holds the slave device address
when the SSP is configured in I2C Slave mode. When
the SSP is configured in Master mode, the lower
seven bits of SSPADD act as the baud rate generator
reload value.


----D/A: Data/Address bit
In Master mode:
Reserved.
In Slave mode:
1 = Indicates that the last byte received or transmitted was data
0 = Indicates that the last byte received or transmitted was address
----bit 4 P: Stop bit
1 = Indicates that a Stop bit has been detected last
0 = Stop bit was not detected last
Note: This bit is cleared on Reset and when SSPEN is cleared.
-----bit 3 S: Start bit
1 = Indicates that a Start bit has been detected la



----R/W: Read/Write bit information (I2C mode only)
In Slave mode:
1 = Read
0 = Write
Note: This bit holds the R/W bit information following the last address match. This bit is
only valid from the address match to the next Start bit, Stop bit or not ACK bit.
In Master mode:
1 = Transmit is in progress
0 = Transmit is not in progress

-----BF: Buffer Full Status bit
In Transmit mode:
1 = Receive complete, SSPBUF is full
0 = Receive not complete, SSPBUF is empty
In Receive mode:
1 = Data Transmit in progress (does not include the ACK and Stop bits), SSPBUF is full
0 = Data Transmit complete (does not include the ACK and Stop bits), SSPBUF is empty

----CKP: SCK Release Control bit
In Slave mode:
1 = Release clock
0 = Holds clock low (clock stretch). (Used to ensure data setup time.)
In Master mode:
Unused in this mode.









------GCEN: General Call Enable bit (Slave mode only)
1 = Enable interrupt when a general call address (0000h) is received in the SSPSR
0 = General call address disabled
bit 6 ACKSTAT: Acknowledge Status bit (Master Transmit mode only)
1 = Acknowledge was not received from slave
0 = Acknowledge was received from slave
bit 5 ACKDT: Acknowledge Data bit (Master Receive mode only)
1 = Not Acknowledge
0 = Acknowledge
Note: Value that will be transmitted when the user initiates an Acknowledge sequence at
the end of a receive.
bit 4 ACKEN: Acknowledge Sequence Enable bit (Master Receive mode only)
1 = Initiate Acknowledge sequence on SDA and SCL pins and transmit ACKDT data bit.
Automatically cleared by hardware.
0 = Acknowledge sequence Idle
bit 3 RCEN: Receive Enable bit (Master mode only)
1 = Enables Receive mode for I2C
0 = Receive Idle
bit 2 PEN: Stop Condition Enable bit (Master mode only)
1 = Initiate Stop condition on SDA and SCL pins. Automatically cleared by hardware.
0 = Stop condition Idle
bit 1 RSEN: Repeated Start Condition Enabled bit (Master mode only)
1 = Initiate Repeated Start condition on SDA and SCL pins. Automatically cleared by hardware.
0 = Repeated Start condition Idle
bit 0 SEN: Start Condition Enabled/Stretch Enabled bit
In Master mode:
1 = Initiate Start condition on SDA and SCL pins. Automatically cleared by hardware.
0 = Start condition Idle
In Slave mode:
1 = Clock stretching is enabled for both slave transmit and slave receive (stretch enabled)
0 = Clock stretching is enabled for slave transmit only (PIC16F87X compatibility)










---Selection of any I2C mode, with the SSPEN bit set,
forces the SCL and SDA pins to be open-drain, provided
these pins are programmed to inputs by setting
the appropriate TRISC bits. To ensure proper operation
of the module, pull-up resistors must be provided
externally to the SCL and SDA pins.









----In Slave mode, the SCL and SDA pins must be configured
as inputs (TRISC<4:3> set).The MSSP module
will override the input state with the output data when
required (slave-transmitter)




----Once the MSSP module has been enabled, it waits for
a Start condition to occur. Following the Start condition,
the 8 bits are shifted into the SSPSR register. All incoming
bits are sampled with the rising edge of the clock
(SCL) line. The value of register SSPSR<7:1> is compared
to the value of the SSPADD register. The
address is compared on the falling edge of the eighth
clock (SCL) pulse. If the addresses match, and the BF
and SSPOV bits are clear, the following events occur:
1. The SSPSR register value is loaded into the
SSPBUF register.
2. The Buffer Full bit, BF, is set.
3. An ACK pulse is generated.
4. MSSP Interrupt Flag bit, SSPIF (PIR1<3>), is
set (interrupt is generated if enabled) on the
falling edge of the ninth SCL pulse.



Each time a byte of data is written to SSPBUF to
be transmitted to the master device. The BF bit
will be cleared automatically when all bits have
been shifted from SSPBUF to the master device.

When an address byte is received with the LSb
cleared. This will be the first byte sent by the
master device during an I2C write operation.
• Each time a data byte is received during an I2C
write to the slave device.


The user must read SSPBUF and clear the
SSPOV bit to properly clear an overflow condition. If
the user reads SSPBUF to clear the BF bit, but does
not clear the SSPOV bit, the next byte of data received
will be loaded into SSPBUF but the module will not
generate an ACK pulse.





The SSP module performs clock stretching automatically when data is read by the
master device. The CKP bit will be cleared by the
module after the address byte and each subsequent
data byte is read. After SSPBUF is loaded, the CKP bit
must be set in software to release the clock and allow
the next byte to be transferred.


The address of the slave node must be written to the
SSPADD register (see Figure 3). For 7-Bit Addressing
mode, bits<7:1> determine the slave address value.
The LSb of the address byte is not used for address
matching; this bit determines whether the transaction
on the bus will be a read or write. Therefore, the value
written to SSPADD will always have an even value
(LSb = 0). Effectively, each slave node uses two
addresses; one for write operations and another for
read operations.



The SSPIF bit indicates an I2C event on the bus has
completed.

The SSPIF bit may be polled in software or
can be configured as an interrupt source. Each time the
SSPIF bit is set, the I2C event must be identified by
testing various bits in the SSPSTAT register.






*/





void I2C_start()
 {
	 
	 
	 SEN = 1;
	 while( SEN );
	 
	 
 }
 void send_NACK()
 {
	 ACKDT = 1;
	 ACKEN = 1;
	 while( ACKEN );
	 
	 
	 
 }
 void send_ACK()
 {
	 
	 
	 ACKDT = 0;
	 ACKEN = 1;
	 while( ACKEN );
	 
 }
 
 
 void bekle()
 {
	 
	  while(R_W || SEN || RSEN || PEN || RCEN || ACKEN){
        DelayMs(1);
 }
 
 }
 void I2C_stop()
 {
	 
	 PEN = 1;
	 while( PEN );
	 	SSPIF = 0;	
 }
I2C_send( char c )
{
R_W = 0;
	BF = 0;
	bekle();
		SSPIF = 0;	
	SSPBUF = c;
	while( BF );
	
	RB0 = ~RB0;
}



unsigned char I2C_read( )
{
	
	RCEN = 1;
	bekle();
	while( RCEN );
	
	
	while( !SSPIF  );
			SSPIF = 0;	
	return SSPBUF;
	
	
}


void I2C_initialize()
{
	
	/*
	SSPEN: Synchronous Serial Port Enable bit
1 = Enables the serial port and configures the SDA and SCL pins as the serial port pins
0 = Disables the serial port and configures these pins as I/O port pins
	
	
	*/
	
	SSPEN = 1;
	
	
	
	/*
	SMP: Slew Rate Control bit
In Master or Slave mode:
1 = Slew rate control disabled for standard speed mode (100 kHz and 1 MHz)
0 = Slew rate control enabled for high-speed mode (400 kHz)
	
	*/
	SMP = 1;
	/*
	
	SSPM3:SSPM0: Synchronous Serial Port Mode Select bits
1111 = I2C Slave mode, 10-bit address with Start and Stop bit interrupts enabled
1110 = I2C Slave mode, 7-bit address with Start and Stop bit interrupts enabled
1011 = I2C Firmware Controlled Master mode (Slave Idle)
1000 = I2C Master mode, clock = FOSC/(4 * (SSPADD + 1))
0111 = I2C Slave mode, 10-bit address
0110 = I2C Slave mode, 7-bit address
	
	
	*/
	SSPADD = 9;// ? for 4MHZ 100KHZ
	SSPM3 = 1;
	SSPM2 = 0;
	SSPM1 = 0;
	SSPM0 = 0;
	
	
	
	
	
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
     send_NACK();
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

char data[ 20 ];

void main()
{
	
	
	TRISC = 0b00011000;
	PORTC = 0;
	TRISB = 0;
	PORTB = 0;
	I2C_initialize();
	
DelayMs( 1000 );
	
	
		DelayMs( 100 );
	 EEPROM_24C32A_yaz( 0 , ' ' );
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

    
	
for( int a = 0 ; a < 20 ; a++ )
{
	data [ a ] =  EEPROM_24C32A_oku( a );
		
}




	int adres = 0;
	while( 1 )
	{
		
	
	
	
	
		
		
		
		DelayMs( 500 );
		
		}
}