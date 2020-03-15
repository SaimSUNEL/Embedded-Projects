/*Functions implemented...
void DHT11_get_data()
void DHT11_initialize()
*/
byte sicaklik, nem;

/*
 One communication process is about 4ms. 
Data consists of decimal and integral parts. A complete data transmission is 40bit, and the
sensor sends higher data bit first. 

Data format: 8bit integral RH data + 8bit decimal RH data + 8bit integral T data + 8bit decimal T
data + 8bit check sum. If the data transmission is right, the check-sum should be the last 8bit of
"8bit integral RH data + 8bit decimal RH data + 8bit integral T data + 8bit decimal T data".
*/
void DHT11_initialize()
{
//Pull Up...
TRISC0 = 0 ;
RC0 = 1 ;


TRISC1 = 0;
RC1 = 0;
TRISC2 = 0;
RC2= 0;
}
byte DHT11_data[5]={0};
byte test = 0;

void DHT11_get_data()
{
DHT11_data[0] = 0;
DHT11_data[1] = 0;
DHT11_data[2] = 0;
DHT11_data[3] = 0;
DHT11_data[4] = 0;

//4 bytes will be received from DHT11
/*
Data format: 8bit integral RH data + 8bit decimal RH data + 8bit integral T data + 8bit decimal T
data + 8bit check sum. If the data transmission is right, the check-sum should be the last 8bit of
"8bit integral RH data + 8bit decimal RH data + 8bit integral T data + 8bit decimal T data".
*/


signed char bit_index = 0, data_index=0;
byte low_count=0, high_count=0;


/*
Data Single-bus free status is at high voltage level. When the communication between MCU and
DHT11 begins, the programme of MCU will set Data Single-bus voltage level from high to low
and this process must take at least 18ms to ensure DHT’s detection of MCU's signal, then MCU
will pull up voltage and wait 20-40us for DHT’s response.
*/
//voltage down..

RC0 = 0 ;


__delay_ms(18);
//pull up 20 us...
RC0 = 1;

__delay_us(20);
RC0 = 0;
TRISC0 = 1;
//To ensure the line data is in RC0
//Wait for 20 us check if RC0 is still up, if so wait until it gets low..


if(RC0 ==1)while(RC0==1);
//Wait until DHT11 finishes low_start signal

while(RC0 == 0 );
//wait until DHT11 finished hight_start signal...

while(RC0 == 1);




/*
Once DHT detects the start signal, it will send out a low-voltage-level response signal, which
lasts 80us. Then the programme of DHT sets Data Single-bus voltage level from low to high and
keeps it for 80us for DHT’s preparation for sending data.

When DATA Single-Bus is at the low voltage level, this means that DHT is sending the response
signal. Once DHT sent out the response signal, it pulls up voltage and keeps it for 80us and
prepares for data transmission.

*/
/*
When DHT is sending data to MCU, every bit of data begins with the 50us low-voltage-level and
the length of the following high-voltage-level signal determines whether data bit is "0" or "1" 
data transfer...
first 50 us low , if 70 us hight the bit is 1, if 26-28 us the bit is zero..
*/
for(data_index=0; data_index < 5;data_index++)
{
for(bit_index = 7; bit_index > -1 ; bit_index--)
{

while(RC0 == 0) low_count ++;

while(RC0 == 1)high_count ++;

if( high_count > low_count)
//High bit first...
DHT11_data[data_index] |= (1 << bit_index);

low_count = 0;
high_count = 0;


}

}


/*
When the last bit data is transmitted,
DHT11 pulls down the voltage level and keeps it for 50us. Then the Single-Bus voltage will be
pulled up by the resistor to set it back to the free status
*/



sicaklik = DHT11_data[2];
nem = DHT11_data[0];
__delay_ms(5);
//tekrar pull up bir daha ki iþlem için....
TRISC0 = 0 ;
RC0 = 1;

}
/*
The single-wire serial interface
makes system integration quick and easy. Its small size, low power consumption and up-to-20
meter signal transmission making it the best choice for various applications,

When the connecting cable is shorter than 20 metres, a 5K pull-up resistor is recommended;
when the connecting cable is longer than 20 metres, choose a appropriate pull-up resistor as
needed.

DHT11’s power supply is 3-5.5V DC. When power is supplied to the sensor, do not send any
instruction to the sensor in within one second in order to pass the unstable status. One
capacitor valued 100nF can be added between VDD and GND for power filtering. 



*/


