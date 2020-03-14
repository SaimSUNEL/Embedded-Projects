/* 
 * File:   DS1307.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 12:29
 */

#ifndef DS1307_H
#define	DS1307_H

#include "I2C.h"
#include "LCD.h"


#ifdef	__cplusplus
extern "C" {
#endif

#define SAAT 3
#define DAKIKA 4
#define SANIYE 5

#define GUN 2
#define AY 1
#define YIL 0


/*
Codes can be combined... 
 
 */


#define TIME_ 1
#define DATE_ 2
void DS1307_shared_get(byte addr, byte * reg)
{
    //DS1307 mem pointer is set to the second information location....
   I2C_Start();
   I2C_data_send(0b11010000);
   I2C_data_send(addr);

   I2C_Stop();
   
   I2C_Start();
   I2C_data_send(0b11010001);
   byte den;
   for(signed char k=2; k != -1; k--)
   {
   den = I2C_data_receive();
   if(k == 0 && addr==0)
   {
       den = ((den>>4)&0b11)*10 + (den&0xf);
   }
       else den = (den >>4)*10 + (den&0xf);
   
   reg[k] = den;
   if(k!=0)   

   I2C_SendACK();
   else I2C_SendNACK();
   } 
   
  I2C_Stop();
    
    
}
byte saat, dakika, saniye;
void DS1307_time()
{
    /*
     zaman[4} = saat
     zaman[5} = dakika
     zaman]6} = saniye
     */
    
   DS1307_shared_get(0, zaman+4);

}

void DS1307_date()
{
      /*
     zaman[0} = tarih
     zaman[1} = ay 
     zaman]2} = gun
     */
    
    DS1307_shared_get(4, zaman);
    //day, month, year
    zaman[3] = zaman[2];
    zaman[2]= zaman[1];
    zaman[1] = 20;
    
    
}
byte time_array[3];
byte t_i = 0;
/*
void DS1307_set_shared(byte addr)
{
 I2C_Start();
   I2C_data_send(0b11010000);
   //DS1307 mem pointer has been set to date information location....
   I2C_data_send(addr);
   for(t_i = 0; t_i != 3; t_i++)
   {
       I2C_data_send(time_array[t_i]);
          //I2C_data_send( ((saniye/10)<<4)+(saniye%10));

   }
   //I2C_data_send( ((dakika/10)<<4)+(dakika%10));
   //I2C_data_send( ((saat/10)<<4)+(saat%10));
   I2C_Stop();
}
*/
/*
void DS1307_set_date(byte gun, byte ay, byte yil)
{
/I2C_Start();
   I2C_data_send(0b11010000);
   //DS1307 mem pointer has been set to date information location....
   I2C_data_send(4);
   //I2C_data_send( ((gun/10)<<4)+(gun%10));
   //I2C_data_send( ((ay/10)<<4)+(ay%10));
   //I2C_data_send( ((yil/10)<<4)+(yil%10));

   I2C_Stop();



}

*/


void displayTime()
{
    for(char c = 4; c < 7; c++)
    {
        lcd_write_number(zaman[c]);
        if(c != 6) lcd_yaz(':');
    }
    
}
void displayDate()
{
     for(signed char c = 3; c != -1; c--)
    {
        lcd_write_number(zaman[c]);
        if(c > 1) lcd_yaz('/');
    }
}



#ifdef	__cplusplus
}
#endif

#endif	/* DS1307_H */

