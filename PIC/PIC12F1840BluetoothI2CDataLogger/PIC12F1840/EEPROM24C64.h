

void EEPROM24C64_WriteByte(unsigned int address, byte value)
{
	I2C_Start();
	
	I2C_SendByte(0b10100000);


	I2C_SendByte(address >> 8);
	

	I2C_SendByte(address&0xff);
	

	I2C_SendByte(value);
	

	I2C_Stop();
	
	



}


byte EEPROM24C64_ReadByte(unsigned int address)
{
	byte read;
	I2C_Start();
	I2C_SendByte(0b10100000);
	I2C_SendByte(address >> 8);
	I2C_SendByte(address&0xff);
	__delay_ms(1);
	
	I2C_Stop();

	I2C_Start();
	
	I2C_SendByte(0b10100001);
	

	read = I2C_ReadByte();
	I2C_NACK();

	I2C_Stop();
	
	

	return read;

}


void EEPROM24C64_ClearAllData()
{
	unsigned int address;
	for(int sector = 0; sector < 2048; sector++)
	{

	address = sector * 32;
	I2C_Start();
	
	I2C_SendByte(0b10100000);


	I2C_SendByte(address >> 8);
	

	I2C_SendByte(address&0xff);
	
	
	for(byte i = 0; i < 32 ; i++)
		I2C_SendByte(0);
	
	I2C_Stop();


	
	__delay_ms(8);
	}
		


}



/*



//Write time to EEPROM is 6 ms...
EEPROM24C64_WriteByte(6, 'S');
__delay_ms(10);
EEPROM24C64_WriteByte(7, 'a');
__delay_ms(10);
EEPROM24C64_WriteByte(8, 'i');
__delay_ms(10);
EEPROM24C64_WriteByte(9, 'm');
__delay_ms(10);

read = EEPROM24C64_ReadByte(9);


*/