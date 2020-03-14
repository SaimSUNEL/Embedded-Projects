/* 
 * File:   EEPROM24C32.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 18:00
 */

#ifndef EEPROM24C32_H
#define	EEPROM24C32_H

#ifdef	__cplusplus
extern "C" {
#endif

    void Generic_write_byte(byte dev_id, unsigned int address, byte data)
    {
        I2C_Start();
	//24c32 address 10100A2A1A0
	I2C_data_send(dev_id);
	I2C_data_send(address>>8);
	I2C_data_send(address&0x00ff);
	
	I2C_data_send(data);
	I2C_Stop();
	DELAY(10);
        
    }
    
    byte Generic_read_byte(byte dev_id, unsigned int address)
    {
        byte received;
    //DS1307 mem pointer is set to the second information location....
    I2C_Start();
    I2C_data_send(dev_id);
    
	I2C_data_send(address>>8);
	I2C_data_send(address&0xff);

    I2C_Stop();
	DELAY(5);
    I2C_Start();
    I2C_data_send(dev_id+1);
    received = I2C_data_receive();
     
    I2C_SendNACK();
    I2C_Stop();
	DELAY(5);
	return received;
    }
    
    
void EEPROM24C32_write_byte(unsigned int address, byte data)
{
	Generic_write_byte(0b10100000, address, data);
}
byte EEPROM24C32_read_byte(unsigned int address)
{	
	return Generic_read_byte(0b10100000, address);
   }

#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM24C32_H */

