/* 
 * File:   AT24C1024B.h
 * Author: Saim
 *
 * Created on 02 Nisan 2020 Per?embe, 19:59
 */

#ifndef AT24C1024B_H
#define	AT24C1024B_H

#ifdef	__cplusplus
extern "C" {
#endif


    unsigned long EEPROM_memory_address = 0; //initial zero...    
    void EEPROMAT24C1024B_start_write_page(unsigned long address)
    {
        EEPROM_memory_address = address;
        I2C_Start();
        //17 bit is requried to address 128 kb mem...
        //p0 bit 1 - the most significant bit...
        I2C_data_send(0b10100000+ (((address >> 16)&0x1) << 1) );
        I2C_data_send((address >> 8) & 0xff);
        I2C_data_send(address & 0xff);
                
    }
    
    void EEPROMAT24C1024B_write_page(byte data)
    {
        I2C_data_send(data);
        EEPROM_memory_address++;
        if((EEPROM_memory_address % 256) == 0)
        {
            I2C_Stop();
            __delay_ms(10); //Wait writing time...
            I2C_Start();
            I2C_data_send(0b10100000+ (((EEPROM_memory_address >> 16)&0x1) << 1) );
            I2C_data_send((EEPROM_memory_address >> 8) & 0xff);
            I2C_data_send(EEPROM_memory_address & 0xff);
        }
        
    }
    
    void EEPROMAT24C1024B_stop_write_page()
    {
        I2C_Stop();
    }
    
    
    unsigned char EEPROMAT24C1024B_read_byte(unsigned long address)
    {
            I2C_Start();
            
            I2C_data_send(0b10100000+ (((address >> 16)&0x1) << 1) );
            I2C_data_send((address >> 8) & 0xff);
            I2C_data_send(address & 0xff);
            
            
            
            I2C_Stop();
            __delay_ms(6);
            I2C_Start();
            //I2C_data_send(0b10100001);
            I2C_data_send(0b10100001+ (((address >> 16)&0x1) << 1) );

            byte data = I2C_data_receive();
            I2C_SendNACK();

            I2C_Stop();
            return data;

        
    }


#ifdef	__cplusplus
}
#endif

#endif	/* AT24C1024B_H */

