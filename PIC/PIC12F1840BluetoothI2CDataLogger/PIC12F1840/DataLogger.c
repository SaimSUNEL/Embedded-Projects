
#include<htc.h>
typedef unsigned char byte;

#include "I2C.h"
#include "UART.h"
#include "EEPROM24C64.h"

/*

3 commands
1 store all data
2 read all data
3 erase all data

*/


byte command;
void interrupt FNC()
{
	
	//If command comes...
	if(RCIF == 1)
	{
		command = UART_ReadByte();
		unsigned int address;

		switch(command)
		{
			case '1':
	for(int sector = 0; sector < 2048; sector++)
	{

	address = sector * 32;
	I2C_Start();
	
	I2C_SendByte(0b10100000);


	I2C_SendByte((address>>8)&0xff);
	

	I2C_SendByte(address & 0xff);
	
	
	for(byte i = 0; i < 32 ; i++)
	{
		I2C_SendByte(UART_ReadByte());
		__delay_ms(1);
		UART_SendByte('T');
	}
	
	I2C_Stop();


	
	__delay_ms(7);
	}
		

				break;
		case '2':
I2C_Start();
	I2C_SendByte(0b10100000);
	I2C_SendByte(0);
	I2C_SendByte(0);

	
	I2C_Stop();

	I2C_Start();
	
	I2C_SendByte(0b10100001);
	
	for(long int i= 0; i <= 65535; i++)
	{
		UART_SendByte(I2C_ReadByte());
		__delay_ms(5);
	}

	I2C_NACK();

	I2C_Stop();
		break;


	case '3':
		EEPROM24C64_ClearAllData();
		UART_SendByte('T');
	break;

		}

RCIF = 0;	
}



}



byte read;
void main()
{

ANSELA = 0;
SPLLEN = 0;
//4 mhz internal oscillator
IRCF3 = 1;
IRCF2 = 1;
IRCF1 = 0;
IRCF0 = 1;

SCS1 = 1 ; //Internel oscillator
SCS0 = 0;

PORTA = 0;

TRISA0 = 0; //TX pin
RXDTSEL = 1; // RX on RA5
TRISA5 = 1; //RX input

I2C_Initialize();
__delay_ms(100);

TRISA4 = 0;
UART_Initialize();
__delay_ms(50);
RA4 = 1;
RA4 = 0;


while(1)
{
	
	

}// while(1)

}// main

