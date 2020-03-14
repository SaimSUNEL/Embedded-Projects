
byte sicaklik, nem ;
byte low_time_count, high_time_count;
byte dht11_data[5];//40 bits

void DHT11_get_data()
{
for(byte a = 0 ; a < 5 ; a++) dht11_data[a] = 0;

RA4 = 0;
TRISA4 = 0;
__delay_ms(20);
TRISA4 = 1;
__delay_us(20);
while(RA4 == 1);
//DHT11 response signal
while(RA4 == 0);
while(RA4 == 1);

for(byte byte_index =0; byte_index < 5; byte_index ++)
{

	for(signed char bit_index = 7; bit_index >= 0 ; bit_index--)
	{
		while(RA4 == 0) low_time_count++;
		while(RA4 == 1) high_time_count++;
		if(high_time_count > low_time_count)
		{
			dht11_data[byte_index] |= 1 << bit_index;
		}

		low_time_count = 0;
		high_time_count = 0;
	}
 


}

sicaklik = dht11_data[2];
nem = dht11_data[0];




}
