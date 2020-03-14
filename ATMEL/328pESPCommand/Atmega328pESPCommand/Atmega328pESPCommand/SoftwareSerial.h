/*
 * SoftwareSerial.h
 *
 * Created: 11.07.2019 17:19:37
 *  Author: Saim
 */ 


#ifndef SOFTWARESERIAL_H_
#define SOFTWARESERIAL_H_


void SoftwareSerialInit()
{
trisb.RB0 = 0; //RX
trisb.RB1 = 1; //TX
portb.RB0 = 0;
portb.RB1 = 1;	
	
	
}
byte deger = 0;
byte SoftwareSerialRead()
{
	portd.RD3 = pinb.RB0;
	byte received_byte = 0;
	while(PINB & 0x1);
	portd.RD3 = pinb.RB0;
 	//_delay_us(150); //9600
 	_delay_us(620);
	 portd.RD3 = 1;
	 _delay_us(1);
	 portd.RD3 = 0;
	 for(byte k = 0 ; k < 8; k++)
 	{
 		if(PINB &0x1)
 			received_byte |= (1<<k);
 		 		//_delay_us(98) ; //9600
				   portd.RD3 = 1;
				   _delay_us(1);
				  portd.RD3 = 0;
				  _delay_us(416);
 	} 	
	 //_delay_us(150*4);//9600
	
	 portd.RD3 = 1;
	 _delay_us(1);
	 portd.RD3 = 0;
	
	return received_byte;
}


void SoftwareSerialSend(byte val)
{
	
	portb.RB1 = 0;	
	_delay_us(104*4);
	
	for(byte k = 0 ; k < 8; k++)
	{
		portb.RB1 = (val >> k) & 0x1;
		
		
		_delay_us(104*4);
		
	}
	
	portb.RB1 = 1;
	_delay_us(104*4);
	portb.RB1 = 1;
	
}

byte string_characters [ 60 ];
void SoftwareSerialReadString()
{
	byte previous_char=0, current_char=0;
	byte index = 0;
	
	do 
	{
		previous_char = current_char;
		
		current_char = SoftwareSerialRead();
		string_characters[index] = current_char;
		index++;
		
	
	} while (previous_char != '\r' && current_char != '\n');
	string_characters[index] = '\0';
	
	
	
}


void SoftwareSerialSendString()
{
	byte previous_char=0, current_char=0;
	byte index = 0;
	
	do
	{
		previous_char = current_char;
		
		current_char = string_characters[index];
		SoftwareSerialSend(current_char);
		_delay_us(500);
		index ++;
		
		
	} while (previous_char != '\r' && current_char != '\n');

}



#endif /* SOFTWARESERİAL_H_ */