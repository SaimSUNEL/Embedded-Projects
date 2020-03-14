/*Functions implemented
void DS1307_time()
void DS1307_date()
void DS1307_set_time(byte saat, byte dakika, byte saniye)
void DS1307_set_date(byte gun, byte ay, byte yil)

*/


/*
All DS1307 operations are performed here,
Date and time information retrieval
Date and time settings

*/

/*
7-bit DS1307
address, which is 1101000,

*/

#define SAAT 2
#define DAKIKA 1
#define SANIYE 0

#define GUN 2
#define AY 1
#define YIL 0

unsigned char zaman[3] ;
unsigned char tarih[3];

void DS1307_time()
{
   //DS1307 mem pointer is set to the second information location....
   I2C_Start();
   I2C_data_send(0b11010000);
   I2C_data_send(0);

   I2C_Stop();
   
   I2C_Start();
   I2C_data_send(0b11010001);
  zaman[SANIYE]= I2C_data_receive();
   zaman[SANIYE] = (zaman[SANIYE] >>4)*10 + (zaman[SANIYE]&0xf);
   I2C_SendACK();
   zaman[DAKIKA] = I2C_data_receive();
  zaman[DAKIKA] = (zaman[DAKIKA] >> 4)*10 + (zaman[DAKIKA]&0xf);
   I2C_SendACK();
   zaman[SAAT] = I2C_data_receive();
  zaman[SAAT] = ((zaman[SAAT]>>4)&0b11)*10 + (zaman[SAAT]&0xf);
   I2C_SendNACK();
  I2C_Stop();
   
}

void DS1307_date()
{
    I2C_Start();
   I2C_data_send(0b11010000);
   //DS1307 mem pointer has been set to date information location....
   I2C_data_send(4);

   I2C_Stop();
   
   I2C_Start();
   I2C_data_send(0b11010001);
  tarih[GUN]= I2C_data_receive();
   tarih[GUN] = (tarih[GUN] >>4)*10 + (tarih[GUN]&0xf);
   I2C_SendACK();
   tarih[AY] = I2C_data_receive();
  tarih[AY] = (tarih[AY] >> 4)*10 + (tarih[AY]&0xf);
   I2C_SendACK();
   tarih[YIL] = I2C_data_receive();
  tarih[YIL] = ((tarih[YIL]>>4)&0b11)*10 + (tarih[YIL]&0xf);
   I2C_SendNACK();
  I2C_Stop(); 
}

void DS1307_set_time(byte saat, byte dakika, byte saniye)
{
 I2C_Start();
   I2C_data_send(0b11010000);
   //DS1307 mem pointer has been set to date information location....
   I2C_data_send(0);
   I2C_data_send( ((saniye/10)<<4)+(saniye%10));
   I2C_data_send( ((dakika/10)<<4)+(dakika%10));
   I2C_data_send( ((saat/10)<<4)+(saat%10));
   I2C_Stop();
}

void DS1307_set_date(byte gun, byte ay, byte yil)
{
I2C_Start();
   I2C_data_send(0b11010000);
   //DS1307 mem pointer has been set to date information location....
   I2C_data_send(4);
   I2C_data_send( ((gun/10)<<4)+(gun%10));
   I2C_data_send( ((ay/10)<<4)+(ay%10));
   I2C_data_send( ((yil/10)<<4)+(yil%10));

   I2C_Stop();



}

