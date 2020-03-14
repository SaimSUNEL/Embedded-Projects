

void EEPROM_24C040_WriteByte(int address, byte value)
{

CSE = 0;
__delay_us(20);
SPI_WriteByte(6); //WREN command...
CSE = 1;
__delay_ms(10);

CSE = 0;
__delay_us(20);
SPI_WriteByte(2 | (((address>>8)&0x1) << 3)  );//Write command...
SPI_WriteByte(address&0xff);
SPI_WriteByte( value);

CSE = 1;


__delay_ms(50);



}

byte EEPROM_24C040_ReadByte(int address)
{
byte read;
CSE = 0;
__delay_us(20);

SPI_WriteByte(3 | (((address>>8)&0x1) << 3));
SPI_WriteByte(address&0xff);
read = SPI_WriteByte(0);
CSE = 1;
__delay_us(20);

return read;

}