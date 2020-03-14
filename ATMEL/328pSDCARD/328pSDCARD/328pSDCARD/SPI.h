/*
 * SPI.h
 *
 * Created: 02.09.2019 20:36:09
 *  Author: Saim
 */ 


#ifndef SPI_H_
#define SPI_H_

byte SPI_write( unsigned char veri )
{
	SPDR = veri ;
	//SPIF is clear by reading SPSR and SPDR...
	while( ! ( SPSR & 1 << SPIF )   );
	
	return SPDR;
}
void SPI_ayarla( )
{
	
	
	
	

	
	//SPI master mode...
	SPCR |= 1 << MSTR ;
	
	
	//SPI mode 0
	SPCR &= ~( 1  << CPOL );
	SPCR &=~(  1 << CPHA );
	
	
	//SPI SCK freq is fosc/16 ( 16 /64 = 1 MHZ for arduino uno )
	SPCR &= ~( 1 << SPR0 );
	SPCR |= 1 << SPR1;
	
	
	
	
	//Enable SPI
	SPCR |= 1 << SPE;

}




#endif /* SPI_H_ */