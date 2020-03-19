/* 
 * File:   DS1307.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 12:29
 */

#ifndef DS1307_H
#define	DS1307_H

#ifdef	__cplusplus
extern "C" {
#endif

#define SAAT 3
#define DAKIKA 4
#define SANIYE 5

#define GUN 2
#define AY 1
#define YIL 0

unsigned char zaman[6] ;

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
   for(signed char k=2; k !=-1; k--)
   {
   den = I2C_data_receive();
   if(k == 0)
     den = ((den>>4)&0b11)*10 + (den&0xf);
       else den = (den >>4)*10 + (den&0xf);
   reg[k] = den;
   if(k!=0)   

   I2C_SendACK();
   } 
   
  I2C_Stop();
    
    
}

byte saat, dakika, saniye;
void DS1307_time()
{
   DS1307_shared_get(0, zaman+3);
   saat = zaman[3];
   dakika = zaman[4];
   saniye = zaman[5];
}

void DS1307_date()
{
    DS1307_shared_get(4, zaman);
}
byte time_array[3];
byte t_i = 0;
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


#ifdef	__cplusplus
}
#endif

#endif	/* DS1307_H */

