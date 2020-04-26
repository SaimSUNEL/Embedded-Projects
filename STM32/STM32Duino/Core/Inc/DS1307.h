/*
 * DS1307.h
 *
 *  Created on: 25 Nis 2020
 *      Author: Saim
 */

#ifndef INC_DS1307_H_
#define INC_DS1307_H_
uint8_t zaman[6];
uint8_t saat, dakika, saniye;
void DS1307_shared_get(uint8_t addr, uint8_t * reg)
{
    //DS1307 mem pointer is set to the second information location....

	HAL_I2C_Master_Transmit(&hi2c1, 0b11010000, &addr, 1, 100);
   //I2C_Start();
   //I2C_data_send(0b11010000);
   //I2C_data_send(addr);

   //I2C_Stop();
	uint8_t temp[3];

	HAL_I2C_Master_Receive(&hi2c1, 0b11010000, temp, 3, 100);
   //I2C_Start();
   //I2C_data_send(0b11010001);
   uint8_t den;
   for(signed char k=2; k !=-1; k--)
   {
   den = temp[2-k];
   if(k == 0)
     den = ((den>>4)&0b11)*10 + (den&0xf);
       else den = (den >>4)*10 + (den&0xf);
   reg[k] = den;
   //I2C_SendACK();
   }

  //I2C_Stop();


}

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
uint8_t time_array[4];
uint8_t t_i = 0;
void DS1307_set_shared(uint8_t addr)
{
	time_array[0] = addr;
	HAL_I2C_Master_Transmit(&hi2c1, 0b11010000, time_array, 4, 100);
// I2C_Start();
  // I2C_data_send(0b11010000);
   //DS1307 mem pointer has been set to date information location....
   //I2C_data_send(addr);
   for(t_i = 0; t_i != 3; t_i++)
   {
       //I2C_data_send(time_array[t_i]);
          //I2C_data_send( ((saniye/10)<<4)+(saniye%10));

   }
   //I2C_data_send( ((dakika/10)<<4)+(dakika%10));
   //I2C_data_send( ((saat/10)<<4)+(saat%10));
   //I2C_Stop();
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

void DS1307_dakika_ayarla( char value )
{
	uint8_t temp[2] ;
	temp[0] = 0x1;
	temp[1] =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;;

	HAL_I2C_Master_Transmit(&hi2c1, 0b11010000, temp, 2, 100);

  //I2C_Start();
	//I2C_gonder( 0b11010000 );
	//I2C_gonder( 0x01 );

        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
        //I2C_gonder( value );
	//I2C_Stop();

 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;


}

void DS1307_saat_ayarla( char value )
{

	uint8_t temp[2] ;
		temp[0] = 0x2;
		temp[1] =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;;

		HAL_I2C_Master_Transmit(&hi2c1, 0b11010000, temp, 2, 100);

  /*I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x02 );

        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
        I2C_gonder( value );
	I2C_Stop();
*/
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;


}




void DS1307_saniye_ayarla( char value )
{

	uint8_t temp[2] ;
		temp[0] = 0x0;
		temp[1] =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;;

		HAL_I2C_Master_Transmit(&hi2c1, 0b11010000, temp, 2, 100);


/*
 I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x00 );

        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ;
        I2C_gonder( value );
	I2C_Stop();
*/


}


#endif /* INC_DS1307_H_ */
