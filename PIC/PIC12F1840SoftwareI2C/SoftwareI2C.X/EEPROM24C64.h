/* 
 * File:   EEPROM24C64.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 13:39
 */

#ifndef EEPROM24C64_H
#define	EEPROM24C64_H

#ifdef	__cplusplus
extern "C" {
#endif

    //Be carefull with address, 24C32(0 adress) 24c64(111) confliction might occur..
void EEPROM24C64_write_byte(unsigned int address, byte data)
{
    	Generic_write_byte(0b10101110, address, data);

	/*I2C_Start();
	//24c32 address 10100A2A1A0
	I2C_data_send();
	I2C_data_send(address>>8);
	I2C_data_send(address&0x00ff);
	
	I2C_data_send(data);
	I2C_Stop();
	DELAY(10);*/
}


byte EEPROM24C64_read_byte(unsigned int address)
{	
    
    return Generic_read_byte(0b10101110, address);
    
    /*
	byte received;
    //DS1307 mem pointer is set to the second information location....
    I2C_Start();
    I2C_data_send();
    
	I2C_data_send(address>>8);
	I2C_data_send(address&0xff);

    I2C_Stop();
	//DELAY(5);
    I2C_Start();
    I2C_data_send(0b10101111);
    received = I2C_data_receive();
     
    I2C_SendNACK();
    I2C_Stop();
	DELAY(5);
	return received;
   */

}


#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM24C64_H */

