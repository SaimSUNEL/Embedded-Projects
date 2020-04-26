/* 
 * File:   EEPROM24C128.h
 * Author: Saim
 *
 * Created on 30 Mart 2020 Pazartesi, 22:35
 */

#ifndef EEPROM24C128_H
#define	EEPROM24C128_H

#include "I2C.h"


#ifdef	__cplusplus
extern "C" {
#endif

    unsigned int EEPROM_memory_address = 0; //initial zero...    
    void EEPROM24C128_start_write_page(unsigned int address)
    {
        EEPROM_memory_address = address;
        I2C_Start();
        I2C_data_send(0b10100000);
        unsigned int temp = ((address / 64) << 6) + (address %64);
        I2C_data_send(temp >> 8);
        I2C_data_send(temp & 0xff);
                
    }
    
    void EEPROM24C128_write_page(byte data)
    {
        I2C_data_send(data);
        EEPROM_memory_address++;
        if((EEPROM_memory_address % 64) == 0)
        {
            I2C_Stop();
            __delay_ms(10); //Wait writing time...
            unsigned int temp = ((EEPROM_memory_address / 64) << 6) + (EEPROM_memory_address %64);
            I2C_Start();
            I2C_data_send(0b10100000);

            I2C_data_send(temp >> 8);
            I2C_data_send(temp & 0xff);
        }
        
    }
    
    void EEPROM24C128_stop_write_page()
    {
        I2C_Stop();
    }
    
    
    unsigned char EEPROM24C128_read_byte(unsigned int address)
    {
        unsigned int temp = ((address / 64) << 6) + (address %64);
            I2C_Start();
            I2C_data_send(0b10100000);

            I2C_data_send(temp >> 8);
            I2C_data_send(temp & 0xff);
            I2C_Stop();
            __delay_ms(6);
            I2C_Start();
            I2C_data_send(0b10100001);
            byte data = I2C_data_receive();
            I2C_SendNACK();

            I2C_Stop();
            return data;

        
    }

#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM24C128_H */

