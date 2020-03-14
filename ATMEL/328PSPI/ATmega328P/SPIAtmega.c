
#include <avr/io.h>
#include <util/delay.h>


#define SS_LOW (PORTB&=~(1<<PIN2))
#define SS_HIGH (PORTB|=1<<PINB2 )
/*
////SPCR – SPI Control Register
------Bit 7 – SPIE: SPI Interrupt Enable
This bit causes the SPI interrupt to be executed if SPIF bit in the SPSR Register is set and the if the Global Interrupt
Enable bit in SREG is set.

-----SPE: SPI Enable
When the SPE bit is written to one, the SPI is enabled. This bit must be set to enable any SPI operations.
----DORD: Data Order
When the DORD bit is written to one, the LSB of the data word is transmitted first.
When the DORD bit is written to zero, the MSB of the data word is transmitted first.



MSTR: Master/Slave Select
This bit selects Master SPI mode when written to one, and Slave SPI mode when written logic zero. If SS is configured
as an input and is driven low while MSTR is set, MSTR will be cleared, and SPIF in SPSR will become set.
The user will then have to set MSTR to re-enable SPI Master mode.


• Bit 3 – CPOL: Clock Polarity
When this bit is written to one, SCK is high when idle. When CPOL is written to zero, SCK is low when idle. Refer
to Figure 19-3 and Figure 19-4 for an example. The CPOL functionality is summarized below:
• Bit 2 – CPHA: Clock Phase
The settings of the Clock Phase bit (CPHA) determine if data is sampled on the leading (first) or trailing (last) edge
of SCK. Refer to Figure 19-3 and Figure 19-4 for an example. The CPOL functionality is summarized below:
• Bits 1, 0 – SPR1, SPR0: SPI Clock Rate Select 1 and 0
These two bits control the SCK rate of the device configured as a Master. SPR1 and SPR0 have no effect on the
Slave. The relationship between SCK and the Oscillator Clock frequency fosc is shown in the following table:
Bit 7 6 5 4 3 2 1 0
0



Bits 1, 0 – SPR1, SPR0: SPI Clock Rate Select 1 and 0
These two bits control the SCK rate of the device configured as a Master. SPR1 and SPR0 have no effect on the
Slave. The relationship between SCK and the Oscillator Clock frequency fosc is shown in the following table:
Bit 7 6 5 4 3 2 1 0
0x2C (0x4C) SPIE SPE DORD MSTR CPOL CPHA SPR1 SPR0 SPCR
Read/Write R/W R/W R/W R/W R/W R/W R/W R/W
Initial Value 0 0 0 0 0 0 0 0
Table 19-3. CPOL Functionality
CPOL Leading Edge Trailing Edge
0 Rising Falling
1 Falling Rising
Table 19-4. CPHA Functionality
CPHA Leading Edge Trailing Edge
0 Sample Setup
1 Setup Sample
ATmega48A/PA/88A/PA/168A/PA/328/P [DATASHEET] 170
8271G–AVR–02/2013
19.5.2 SPSR – SPI Status Register
• Bit 7 – SPIF: SPI Interrupt Flag
When a serial transfer is complete, the SPIF Flag is set. An interrupt is generated if SPIE in SPCR is set and global
interrupts are enabled. If SS is an input and is driven low when the SPI is in Master mode, this will also set the SPIF
Flag. SPIF is cleared by hardware when executing the corresponding interrupt handling vector. Alternatively, the
SPIF bit is cleared by first reading the SPI Status Register with SPIF set, then accessing the SPI Data Register
(SPDR).
• Bit 6 – WCOL: Write COLlision Flag
The WCOL bit is set if the SPI Data Register (SPDR) is written during a data transfer. The WCOL bit (and the SPIF
bit) are cleared by first reading the SPI Status Register with WCOL set, and then accessing the SPI Data Register.
• Bit [5:1] – Reserved
These bits are reserved bits in the ATmega48A/PA/88A/PA/168A/PA/328/P and will always read as zero.
• Bit 0 – SPI2X: Double SPI Speed Bit
When this bit is written logic one the SPI speed (SCK Frequency) will be doubled when the SPI is in Master mode
(see Table 19-5). This means that the minimum SCK period will be two CPU clock periods. When the SPI is configured
as Slave, the SPI is only guaranteed to work at fosc/4 or lower.
The SPI interface on the ATmega48A/PA/88A/PA/168A/PA/328/P is also used for program memory and EEPROM
downloading or uploading. See page 299 for serial programming and verification.
Table 19-5. Relationship Between SCK and the Oscillator Frequency
SPI2X SPR1 SPR0 SCK Frequency
0 0 0 fosc/4
0 0 1 fosc/16
0 1 0 fosc/64
0 1 1 fosc/128
1 0 0 fosc/2
1 0 1 fosc/8
1 1 0 fosc/32
1 1 1 fosc/64




***********SPSR – SPI Status Register**************
SPIF: SPI Interrupt Flag
When a serial transfer is complete, the SPIF Flag is set. An interrupt is generated if SPIE in SPCR is set and global
interrupts are enabled. If SS is an input and is driven low when the SPI is in Master mode, this will also set the SPIF
Flag. SPIF is cleared by hardware when executing the corresponding interrupt handling vector. Alternatively, the
SPIF bit is cleared by first reading the SPI Status Register with SPIF set, then accessing the SPI Data Register
(SPDR)




**********SPDR – SPI Data Register**************
The SPI Data Register is a read/write register used for data transfer between the Register File and the SPI Shift
Register. Writing to the register initiates data transmission. Reading the register causes the Shift Register Receive
buffer to be read.





*/


void SPI_hazirla()
{
	
	
	SPCR |= 1 << SPR0;//Prescaler...fosc/16(1MHZ)
	/*
	0 CPOL=0, CPHA=0 Sample (Rising) Setup (Falling)
1 CPOL=0, CPHA=1 Setup (Rising) Sample (Falling)
2 CPOL=1, CPHA=0 Sample (Falling) Setup (Rising)
3 CPOL=1, CPHA=1 Setup (Falling) Sample (Rising)
	
	
	
	
	
	*/
	
	SPCR |= 0 << CPOL;
	SPCR |= 0 << CPHA;
	SPCR |= 1 << MSTR;
	SPCR |= 1 << SPE; //Enable module...
	
}


char gelen;
void spi_yaz( char deger )
{
	
	
	SPDR = deger;
	
	while( !( SPSR & 1 << SPIF ) );
	
	
	
	
}


void SPI_ayarla( )
{
	
	
	// DDRB = 0b00101100;
	

	
	//SPI master mode...
	SPCR |= 1 << MSTR ;
	 
	 
	 //SPI mode 0
	 SPCR &= ~( 1  << CPOL );
	 SPCR &=~(  1 << CPHA );
	
	
	//SPI SCK freq is fosc/16 ( 16 /16 = 1 MHZ for arduino uno )
	SPCR &= ~( 1 << SPR1 );
	SPCR |= 1 << SPR0;
	
	SPCR |= 1 << SPE;
	
	
	//Enable SPI
	

} 





unsigned char spi_oku()
{
	
	SPDR = 0x0;
		while( ! ( SPSR & 1 << SPIF )   );
		
		SPCR |= 1 << SPIF;
	
	while( ! ( SPSR & 1 << SPIF )   );
	return SPDR ;
	
	
	
}

char gelen;




int main()
{
	
	DDRB = 0b00101100;
    PORTB = 0;
	SS_HIGH;
	
	SPI_ayarla();
	_delay_ms( 1000 );
	_delay_ms(150);
	
//Write latch enable command
SS_LOW;
	spi_yaz( 0x06 );
	SS_HIGH;
	_delay_ms( 1 );


//Write command
	SS_LOW;
	spi_yaz( 0x02 );
//Address
spi_yaz( 0x03 );
spi_yaz( 'B' );
SS_HIGH;
_delay_ms( 5 );

	
	
	
	SS_LOW;
	//read command
		spi_yaz( 0x03 );
//read address	 
spi_yaz( 3 );
//data
	gelen = spi_oku( );
	
	_delay_ms( 100 );
	SS_HIGH;
	
	
	
	
	while( 1 );
	
	
	
}