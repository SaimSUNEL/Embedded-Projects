/* 
 * File:   PCF8574.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 13:00
 */

#ifndef PCF8574_H
#define	PCF8574_H

#include "I2C.h"


#ifdef	__cplusplus
extern "C" {
#endif
    byte PCF8574_value[4];

    void PCF8574_load_data(byte id, byte data)
    {
         I2C_Start();
   I2C_data_send(0x40+(id <<1)); //Write...
   //DS1307 mem pointer has been set to date information location....
   I2C_data_send(data);

   I2C_Stop();
    }
    //Each PCF8574 is given a number...
    void PCF8574_set_pin(byte id, byte pin_number, byte value)
    {
        if(value) PCF8574_value[id] |= 1 <<pin_number;
        else PCF8574_value[id] &= ~(1 << pin_number);
        PCF8574_load_data(id, PCF8574_value[id]);
        __delay_us(20);
        
    }
    byte PCF8574_read(byte id)
    {
        
        byte received;
           I2C_Start();
   I2C_data_send(0x40+(id <<1)+1); //Write...
   //DS1307 mem pointer has been set to date information location....
   received = I2C_data_receive();

   I2C_Stop();
   return received;
    }
    
    
    

#ifdef	__cplusplus
}
#endif

#endif	/* PCF8574_H */

