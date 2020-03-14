/* 
 * File:   PCF8574.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 13:00
 */

#ifndef PCF8574_H
#define	PCF8574_H

#ifdef	__cplusplus
extern "C" {
#endif
    byte PCF8574_value;

    void PCF8574_load_data(byte data)
    {
        PCF8574_value = data;
         I2C_Start();
   I2C_data_send(0x40); //Write...
   //DS1307 mem pointer has been set to date information location....
   I2C_data_send(data);

   I2C_Stop();
    }
/*    void PCF8574_set_pin(byte pin_number, byte value)
    {
        if(value) PCF8574_value |= 1 <<pin_number;
        else PCF8574_value &= ~(1 << pin_number);
        PCF8574_load_data(PCF8574_value);
        __delay_us(20);
        
    }
  */  
    

#ifdef	__cplusplus
}
#endif

#endif	/* PCF8574_H */

