/* 
 * File:   DHT11Sensor.h
 * Author: Saim
 *
 * Created on 05 Eylül 2019 Per?embe, 04:21
 */

#ifndef DHT11SENSOR_H
#define	DHT11SENSOR_H

#ifdef	__cplusplus
extern "C" {
#endif
#define BANKMASK(addr)((addr)&07Fh)

byte sicaklik, nem ;
char kk[8];
byte low_time_count=0, high_time_count=0;
unsigned char dht11_data[5];//40 bits
byte tempo=0;
char j;

byte temp=0;
byte bit_index;
byte var;
byte byte_index;
void DHT11_get_data()
{
for(byte a = 0 ; a < 5 ; a++) dht11_data[a] = 0;
temp = 0;
#define _PORTA 0xc
#define _TRISA 0x8c
#define _FSR 0x4

#asm

banksel _byte_index	//byte_index = 5
movlw 5
movwf BANKMASK(_byte_index)

#endasm
TRISA4 = 1;
DELAY(200);
        
RA4 = 0;
TRISA4 = 0;
__delay_ms(20);
TRISA4 = 1;
__delay_us(50);

#asm
banksel _PORTA  

bsf _PORTA, 5
bcf _PORTA, 5
loop6:			//while(RA1 == 0);
btfss _PORTA, 4
goto loop6



loop7:			//while(RA1 == 1);
btfsc _PORTA, 4
goto loop7




main_loop: 		//for byte_index = 5 {

#endasm



//return;






		#asm
		banksel _bit_index  //bit_index = 1 <<7;
		bsf BANKMASK(_bit_index), 7 

		banksel _var
		movlw 0x8
		movwf BANKMASK(_var)

		for1:   // for bit_index ;= 128 {
		
		loop1:
		banksel _low_time_count; //while(RA1 ==0)low_time_count++;
		INCF BANKMASK(_low_time_count);
		banksel _PORTA;
		btfss _PORTA, 4;
		goto loop1;
		


		loop2:
		banksel _high_time_count;	//while(RA1 ==1)high_time_count++;
		INCF BANKMASK(_high_time_count);
		banksel _PORTA;
		btfsc _PORTA, 4;
		goto loop2;
		

		#endasm
		//while(RA1 == 0) low_time_count++;
		//while(RA1 == 1) high_time_count++;
		//if(high_time_count > low_time_count)
		//{
		//	temp |= 1 << bit_index;
		//}
		#asm
		
		
		banksel _high_time_count
		movf BANKMASK(_high_time_count), W
		banksel _low_time_count
		subwf BANKMASK(_low_time_count), W	//if high_time > low_time 
//c = 0 high > low
		btfsc 0x3, 0; //STATUS REg C 0. bit...
		goto devam;
		//high > low
		banksel _PORTA  

bsf _PORTA, 5
bcf _PORTA, 5

        
		//set bit...
		banksel _bit_index			//{  temp |= bit_index}
		movf BANKMASK(_bit_index), W
		banksel _temp 
		IORWF BANKMASK(_temp), f
							// _temp |= 1 << bit_index...
		
		
		devam:

		banksel _low_time_count		//low_time = 0, hight_time = 0
		CLRF BANKMASK(_low_time_count)
		banksel _high_time_count
		CLRF BANKMASK(_high_time_count)
		
		




		banksel _bit_index			// temp = temp >> 1
		bcf 0x3, 0 //C 0. bit in status
		RRF BANKMASK(_bit_index), f //shift rigth...
		banksel _var  				//
		decfsz BANKMASK(_var)
		goto for1


		#endasm
		//low_time_count = 0;
		//high_time_count = 0;
//	}





dht11_data[byte_index-1] = temp;
/*
#asm
banksel _temp
movf _temp, W
movwf indf 
incf _FSR
#endasm
*/
#asm
banksel _temp
		CLRF BANKMASK(_temp)

banksel _byte_index
decfsz BANKMASK(_byte_index)
goto main_loop;

#endasm

sicaklik = dht11_data[2];
nem = dht11_data[4];
}


#ifdef	__cplusplus
}
#endif

#endif	/* DHT11SENSOR_H */

