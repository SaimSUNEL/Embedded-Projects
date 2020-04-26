/*
 * PCF8574.h
 *
 *  Created on: Apr 18, 2020
 *      Author: Saim
 */

#ifndef INC_PCF8574_H_
#define INC_PCF8574_H_


    byte PCF8574_value[4];

    void PCF8574_load_data(byte id, byte data)
    {
         //I2C_Start();
    	HAL_I2C_Master_Transmit(&hi2c1, (0x40+(id <<1)), &data, 1, 100);

   //I2C_data_send(0x40+(id <<1)); //Write...
   //DS1307 mem pointer has been set to date information location....
   //I2C_data_send(data);


   //I2C_Stop();
    }
    //Each PCF8574 is given a number...
    void PCF8574_set_pin(byte id, byte pin_number, byte value)
    {
        if(value) PCF8574_value[id] |= 1 <<pin_number;
        else PCF8574_value[id] &= ~(1 << pin_number);
        PCF8574_load_data(id, PCF8574_value[id]);
        HAL_Delay(1);

    }
    byte PCF8574_read(byte id)
    {

        byte received;
        HAL_I2C_Master_Receive(&hi2c1, (0x40+(id <<1)), &received, 1, 100);
           //I2C_Start();
   //I2C_data_send(0x40+(id <<1)+1); //Write...
   //DS1307 mem pointer has been set to date information location....
   //received = I2C_data_receive();

   //I2C_Stop();


   return received;
    }


#endif /* INC_PCF8574_H_ */
