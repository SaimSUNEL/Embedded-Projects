/* 
 * File:   EEPROM24C32.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 18:00
 */

#ifndef EEPROM24C32_H
#define	EEPROM24C32_H

#include "SoftwareI2C.h"


#ifdef	__cplusplus
extern "C" {
#endif
    
    void Generic_write_byte(byte dev_id, unsigned int address, byte data)
    {
        SoftwareI2C_start();
	//24c32 address 10100A2A1A0
	SoftwareI2C_send_byte(dev_id, READ);
	SoftwareI2C_send_byte(address>>8, READ);
	SoftwareI2C_send_byte(address&0x00ff, READ);
	
	SoftwareI2C_send_byte(data, READ);
	SoftwareI2C_stop();
	DELAY(10);
        
    }
    
    byte Generic_read_byte(byte dev_id, unsigned int address)
    {
        byte received;
    //DS1307 mem pointer is set to the second information location....
    SoftwareI2C_start();
    SoftwareI2C_send_byte(dev_id, READ);
    
	SoftwareI2C_send_byte(address>>8, READ);
	SoftwareI2C_send_byte(address&0xff, READ);

    SoftwareI2C_stop();
	DELAY(5);
    SoftwareI2C_start();
    SoftwareI2C_send_byte(dev_id+1, WRITE);
    received = SoftwareI2C_read_byte();
     
    SoftwareI2C_NACK();
    SoftwareI2C_stop();
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

