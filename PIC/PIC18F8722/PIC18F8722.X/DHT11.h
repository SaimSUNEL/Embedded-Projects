/* 
 * File:   DHT11.h
 * Author: Saim
 *
 * Created on 01 Eylül 2019 Pazar, 14:55
 */
// Since microcontroller runs on 4MHZ, it is not likely that this code will be running properly...

#ifndef DHT11_H
#define	DHT11_H

#ifdef	__cplusplus
extern "C" {
#endif

byte sicaklik, nem ;
char kk[8];
byte low_time_count=0, high_time_count=0;
unsigned char dht11_data[5];//40 bits
byte denemelik[10];
byte tempo=0;
char j;
char low_values[40];
char hig_values[40];

void DHT11_get_data()
{
for(byte a = 0 ; a < 5 ; a++) dht11_data[a] = 0;

RF1 = 0;
TRISF1 = 0;
__delay_ms(10);
__delay_ms(10);
TRISF1 = 1;
__delay_us(65);
//while(RF1);
//RB6=1;RB6=0;
//DHT11 response signal
while(RF1 == 0);
while(RF1);
for(byte byte_index =0; byte_index < 5; byte_index ++)
{
	for(signed char bit_index = 7; bit_index > -1 ; bit_index--)
	{
        //RB6=RF1;
		while(RF1 == 0) low_time_count++;
		//RB6=RF1;

                while(RF1) high_time_count++;
		//RB6=RF1;
        //low_values[8*byte_index+bit_index] = low_time_count;
        //hig_values[8*byte_index+bit_index] = high_time_count;
		if(high_time_count > low_time_count)
		{
            //RB6=1;RB6=0;
			tempo |= (1 << bit_index);
            //kk[bit_index] = tempo;
		}

		low_time_count = 0;
		high_time_count = 0;
	}
	dht11_data[byte_index] = tempo;
    tempo = 0;
}

sicaklik = dht11_data[2];
nem = dht11_data[0];
}
#ifdef	__cplusplus
}
#endif

#endif	/* DHT11_H */

