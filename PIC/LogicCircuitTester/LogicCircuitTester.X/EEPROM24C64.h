/* 
 * File:   EEPROM24C64.h
 * Author: Saim
 *
 * Created on 03 Nisan 2020 Cuma, 02:03
 */

#ifndef EEPROM24C64_H
#define	EEPROM24C64_H

#ifdef	__cplusplus
extern "C" {
#endif


    unsigned int EEPROM24C64_memory_address = 0; //initial zero...    
    void EEPROM24C64_start_write_page(unsigned int address)
    {
        EEPROM24C64_memory_address = address;
        I2C_Start();
        //17 bit is requried to address 128 kb mem...
        //p0 bit 1 - the most significant bit...
        I2C_data_send(0b10101110);
        I2C_data_send((address >> 8) & 0xff);
        I2C_data_send(address & 0xff);
                
    }
    
    void EEPROM24C64_write_page(byte data)
    {
        I2C_data_send(data);
        EEPROM24C64_memory_address++;
        if((EEPROM24C64_memory_address % 32) == 0)
        {
            
            I2C_Stop();
            __delay_ms(10); //Wait writing time...
            I2C_Start();
            I2C_data_send(0b10101110);
            I2C_data_send((EEPROM24C64_memory_address >> 8) & 0xff);
            I2C_data_send(EEPROM24C64_memory_address & 0xff);
        }
        
    }
    
    void EEPROM24C64_stop_write_page()
    {
        I2C_Stop();
    }
    
    
    unsigned char EEPROM24C64_read_byte(unsigned int address)
    {
            I2C_Start();
            
            I2C_data_send(0b10101110);
            I2C_data_send((address >> 8) & 0xff);
            I2C_data_send(address & 0xff);
            
            
            
            I2C_Stop();
            __delay_ms(6);
            I2C_Start();
            //I2C_data_send(0b10100001);
            I2C_data_send(0b10101111);

            byte data = I2C_data_receive();
            I2C_SendNACK();

            I2C_Stop();
            return data;

        
    }


#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM24C64_H */

