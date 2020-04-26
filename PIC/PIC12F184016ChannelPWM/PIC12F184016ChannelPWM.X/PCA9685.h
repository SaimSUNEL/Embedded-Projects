/* 
 * File:   PCA9685.h
 * Author: Saim
 *
 * Created on 25 Mart 2020 Çar?amba, 17:02
 */

#ifndef PCA9685_H
#define	PCA9685_H

#include "I2C.h"


#ifdef	__cplusplus
extern "C" {
#endif

    void PCA9685_write1Byte_memory(unsigned char address, unsigned char data)
    {
        I2C_Start();
        I2C_data_send(0b10000000); //Write command to A5=A4=A3=A2=A1=A0=0
        I2C_data_send(address);
        I2C_data_send(data);
        I2C_Stop();
    }
    
    void PCA9685_write2Byte_memory(unsigned char address, unsigned int data)
    {
        I2C_Start();
        I2C_data_send(0b10000000); //Write command to A5=A4=A3=A2=A1=A0=0
        I2C_data_send(address);
        I2C_data_send((data >> 8)&0xff);
        I2C_data_send(data & 0xff);
        I2C_Stop();
    }
    
    void PCA9684_set_pwm(unsigned char led_number, unsigned int pwm_value)
    {
        byte address = led_number*4+6 ;
        I2C_Start();
        I2C_data_send(0b10000000);
        I2C_data_send(address);
        I2C_data_send(0);
        I2C_data_send(0);
        I2C_data_send(pwm_value & 0xff);

        I2C_data_send((pwm_value >> 8)&0xff);
        I2C_Stop();        
        
    }
    
    unsigned char PCA9684_read_byte(unsigned char address)
    {
        byte data;
        I2C_Start();
        I2C_data_send(0b10000000); //Write command to A5=A4=A3=A2=A1=A0=0
        I2C_data_send(address);
        
        I2C_Stop();
        __delay_ms(15); 
        I2C_Start();
        I2C_data_send(0b10000001); //Write command to A5=A4=A3=A2=A1=A0=0
        data = I2C_data_receive();
        I2C_SendNACK();
        I2C_Stop();
        
        
        return data;        
    }
    
    //update_rate = frequency...
    //prescale_value = round(25 MHZ / (4096 / update_rate)) - 1
    PCA9684_set_prescaler(unsigned char value)
    {
        //Prescaler should be set when oscialltor off...
        byte dat = PCA9684_read_byte(0);
        dat |= 1 << 4;
        PCA9685_write1Byte_memory(0, dat);       

        __delay_ms(20);
        PCA9685_write1Byte_memory(254, value);       
        __delay_ms(25);
        dat &= ~(1 << 4);
        PCA9685_write1Byte_memory(0, dat);       
        __delay_ms(1);
        
    }
    
    
    void PCA9685_init()
    {
        //RESTART disabled, external clock disabled, register auto increment enabled, normal mode osciallator on, sub calls and all call are disabled... ...
        PCA9685_write1Byte_memory(0xfa, 0);
        PCA9685_write1Byte_memory(0xfb, 0);
        PCA9685_write1Byte_memory(0xfc, 0);
        PCA9685_write1Byte_memory(0xfd, 0);

        
        byte command = (0 << 7) | (0 << 6) | ( 1 << 5) | (0 << 4 ) +0;
        PCA9685_write1Byte_memory(0, command);
        
        //Output logic is inverted, output change on Stop, OUTDRV = 1, OUTNE= 01
        command = (0 <<4) | (0 << 3) | 0b101;
        PCA9685_write1Byte_memory(1, command);
        //PCA9684_set_prescaler(30);//200 hz
        PCA9684_set_prescaler(11);//500 hz
        __delay_ms(25);
        
    }

    
    
    

#ifdef	__cplusplus
}
#endif

#endif	/* PCA9685_H */

