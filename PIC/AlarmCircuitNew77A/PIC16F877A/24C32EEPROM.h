/*Functions implemented...

void EEPROM24C32_write_byte(unsigned int address, byte data)
byte EEPROM24C32_read_byte(unsigned int address)
//By so, we are solving buffer problem and unneceassary setting of address location
byte EEPROM24C32_read_bytes(unsigned int address, byte action)
*/




void EEPROM24C32_write_byte(unsigned int address, byte data)
{
	I2C_Start();
	//24c32 address 10100A2A1A0
	I2C_data_send(0b10100000);
	I2C_data_send(address>>8);
	I2C_data_send(address&0x00ff);
	
	I2C_data_send(data);
	I2C_Stop();
	__delay_ms(10);
}
#define WRITE 2
void EEPROM24C32_write_bytes(unsigned int address, byte action, byte data)
{
	if(action == SET_LOCATION)
	{
		I2C_Start();
		//24c32 address 10100A2A1A0
		I2C_data_send(0b10100000);
		I2C_data_send(address>>8);
		I2C_data_send(address&0xff);
		
	}
	else if(action == WRITE)
	{
		I2C_data_send(data);
	}
	else
	{
		I2C_Stop();
		__delay_ms(10);
	}
}


byte EEPROM24C32_read_byte(unsigned int address)
{	
	byte received;
    //DS1307 mem pointer is set to the second information location....
    I2C_Start();
    I2C_data_send(0b10100000);
    
	I2C_data_send(address>>8);
	I2C_data_send(address&0xff);

    I2C_Stop();
	__delay_ms(5);
    I2C_Start();
    I2C_data_send(0b10100001);
    received = I2C_data_receive();
     
    I2C_SendNACK();
    I2C_Stop();
	__delay_ms(5);
	return received;
   

}


//By so, we are solving buffer problem and unneceassary setting of address location
byte EEPROM24C32_read_bytes(unsigned int address, byte action)
{

    //DS1307 mem pointer is set to the second information location....
    if(action == SET_LOCATION)
	{
		I2C_Start();
		I2C_data_send(0b10100000);
		I2C_data_send(address>>8);
		I2C_data_send(address&0xff);
		
		I2C_Stop();
	__delay_ms(5);
   
		I2C_Start();
		I2C_data_send(0b10100001);
		return 0;
	}	
	else if(action == READ)
	{
		byte t_= I2C_data_receive();
		I2C_SendACK();
		return t_;
		
    }
    else 
	{	
		I2C_data_receive();
		I2C_SendNACK();
		I2C_Stop();
		__delay_ms(8);
		return 0;
	}
   

}

