
byte sicaklik, nem ;
byte low_time_count, high_time_count;
byte dht11_data[5];//40 bits
byte temp;
byte bit_index;
byte var;
byte byte_index;
void DHT11_get_data()
{
#asm

//clear dht11_data array...
movlw _dht11_data
movwf _FSR
banksel _temp
movlw 5
movwf _temp
kkk:
clrf indf 
incf _FSR
decfsz _temp
goto kkk



banksel _byte_index	//byte_index = 5
movlw 5
movwf _byte_index

movlw _dht11_data
movwf _FSR


banksel _PORTA  //RA1 = 0
bcf _PORTA, 1


banksel _TRISA	//TRISA1 = 0;
bcf 0x5, 1

#endasm
__delay_ms(20); //__delay_ms(20)
#asm

banksel _TRISA
bsf 0x5, 1 		//TRISA1 = 1
#endasm
__delay_us(25); //__dekay_us(20);
#asm
banksel _PORTA  

loop5:			//while(RA1 == 1);
btfsc _PORTA, 1 
goto loop5



loop6:			//while(RA1 == 0);
btfss _PORTA, 1
goto loop6



loop7:			//while(RA1 == 1);
btfsc _PORTA, 1
goto loop7




main_loop: 		//for byte_index = 5 {

#endasm



//return;






		#asm
		banksel _bit_index  //bit_index = 1 <<7;
		bsf _bit_index, 7 

		banksel _var
		movlw 0x8
		movwf _var

		for1:   // for bit_index ;= 128 {
		
		loop1:
		banksel _low_time_count; //while(RA1 ==0)low_time_count++;
		INCF _low_time_count;
		banksel _PORTA;
		btfss _PORTA, 1;
		goto loop1;
		


		loop2:
		banksel _high_time_count;	//while(RA1 ==1)high_time_count++;
		INCF _high_time_count;
		banksel _PORTA;
		btfsc _PORTA, 1;
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
		movf _high_time_count, W
		banksel _low_time_count
		subwf _low_time_count, W	//if high_time > low_time 
//c = 0 high > low
		btfsc 0x3, 0; //STATUS REg C 0. bit...
		goto devam;
		//high > low
		
		//set bit...
		banksel _bit_index			//{  temp |= bit_index}
		movf _bit_index, W
		banksel _temp 
		IORWF _temp, f
							// _temp |= 1 << bit_index...
		
		
		devam:

		banksel _low_time_count		//low_time = 0, hight_time = 0
		CLRF _low_time_count
		banksel _high_time_count
		CLRF _high_time_count
		
		




		banksel _bit_index			// temp = temp >> 1
		bcf 0x3, 0 //C 0. bit in status
		RRF _bit_index, f //shift rigth...
		banksel _var  				//
		decfsz _var
		goto for1


		#endasm
		//low_time_count = 0;
		//high_time_count = 0;
//	}





//dht11_data[byte_index] = temp;
#asm
banksel _temp
movf _temp, W
movwf indf 
incf _FSR


banksel _temp
		CLRF _temp

banksel _byte_index
decfsz _byte_index
goto main_loop;


decf _FSR
decf _FSR
decf _FSR
movf indf, W
banksel _sicaklik
movwf _sicaklik
decf _FSR
decf _FSR
movf indf, W
banksel _nem
movwf _nem
#endasm
}

