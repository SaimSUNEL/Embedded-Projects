
#include <htc.h>


/*
----SMP: Sample bit
SPI Master mode:
1 = Input data sampled at end of data output time
0 = Input data sampled at middle of data output time
SPI Slave mode:
SMP must be cleared when SPI is used in Slave mode.



----CKE: SPI Clock Select bit
1 = Transmit occurs on transition from active to Idle clock state
0 = Transmit occurs on transition from Idle to active clock state
Note: Polarity of clock state is set by the CKP bit (SSPCON1<4>).



-----BF: Buffer Full Status bit (Receive mode only)
1 = Receive complete, SSPBUF is full
0 = Receive not complete, SSPBUF is empty




----WCOL: Write Collision Detect bit (Transmit mode only)
1 = The SSPBUF register is written while it is still transmitting the previous word. (Must be
cleared in software.)
0 = No collision
bit 6 SSPOV: Receive Overflow Indicator bit
SPI Slave mode:
1 = A new byte is received while the SSPBUF register is still holding the previous data. In case
of overflow, the data in SSPSR is lost. Overflow can only occur in Slave mode. The user
must read the SSPBUF, even if only transmitting data, to avoid setting overflow. (Must be
cleared in software.)
0 = No overflow
Note: In Master mode, the overflow bit is not set, since each new reception (and
transmission) is initiated by writing to the SSPBUF register.


----SSPEN: Synchronous Serial Port Enable bit
1 = Enables serial port and configures SCK, SDO, SDI, and SS as serial port pins
0 = Disables serial port and configures these pins as I/O port pins
Note: When enabled, these pins must be properly configured as input or output.

----CKP: Clock Polarity Select bit
1 = Idle state for clock is a high level
0 = Idle state for clock is a low level


----SSPM3:SSPM0: Synchronous Serial Port Mode Select bits
0101 = SPI Slave mode, clock = SCK pin. SS pin control disabled. SS can be used as I/O pin.
0100 = SPI Slave mode, clock = SCK pin. SS pin control enabled.
0011 = SPI Master mode, clock = TMR2 output/2
0010 = SPI Master mode, clock = FOSC/64
0001 = SPI Master mode, clock = FOSC/16
0000 = SPI Master mode, clock = FOSC/4
Note: Bit combinations not specifically listed here are either reserved or implemented in
I2C mode only.




SDO must have TRISC<5> bit cleared
• SCK (Master mode) must have TRISC<3> bit
cleared
• SCK (Slave mode) must have TRISC<3> bit set
• SS must have TRISC<4> bit set

*/
char gelen;

void spi_hazirla() 
{
	
	SSPEN = 1; //Enable the SPI module....
	CKP = 0;//Idle state for clock is a low level
	CKE = 1;
	
	SMP = 0;
	//0000 = SPI Master mode, clock = FOSC/4
	
	SSPM3 = 0;
	SSPM2 = 0;
    SSPM1 = 0;
    SSPM0 = 0;	
	
	
	
	
}

char c;
unsigned char spi_yaz( unsigned char veri )
{
	
	
		
	SSPBUF = veri;
	
	while( BF );
	
	while( !BF );
		
	return SSPBUF;
	
	
	
	
	}

unsigned char spi_oku()
{
	SSPBUF = 0x00;
	while( !SSPIF);
	
	while( !SSPIF );
		
	return SSPBUF;
	
	
}

#define DelayMs __delay_ms
#define DelayUs __delay_us
char data [ 50 ];
int count;
char veri , ikinci;

void main()
{
	
	TRISB = 0b00001000;
	
	PORTB = 0;
	TRISC =  0b00010000;
PORTC = 0;
RC0 = 1;
spi_hazirla();
	DelayMs( 1000 );
	DelayMs( 2000 );
	///*
	RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x03 );
spi_yaz( 'S' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;
	
	
	
	RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x04 );
spi_yaz( 'A' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;
	
	RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x05 );
spi_yaz( 'I' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;
	RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x06 );
spi_yaz( 'M' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;

RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x07 );
spi_yaz( ' ' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;


RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x08 );
spi_yaz( 'N' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;

RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x09 );
spi_yaz( 'U' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;
RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x0A );
spi_yaz( 'N' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;
RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x0B );
spi_yaz( 'E' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;

RC0 = 0;
	
	spi_yaz( 0x06 );
	
	RC0 = 1;
	
	RC0 = 0;
	spi_yaz( 0x02 );
spi_yaz( 0x0C );
spi_yaz( 'L' );
RC0 = 1;
DelayMs( 5 );
	RB1 = 1;

//*/
	
	
	
	
	
	
	
	
	
	
	
	for( int b = 0 ; b < 49 ; b++ )
	{
	RC0 = 0;
	DelayUs( 5 );
		spi_yaz( 0x03 );
	gelen =  spi_yaz( b );
	ikinci = spi_oku( );
	data [ b ] = ikinci;
	DelayMs( 100 );
	RC0 = 1 ;
	
	DelayMs( 50 );
	}
	
	

	
	
	
	
	
	
while( 1 )
{
	
	DelayMs( 250 );
	
	
}
	
	
	
	
	
}