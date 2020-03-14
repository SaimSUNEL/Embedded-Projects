
#include<htc.h>
typedef unsigned char byte;

#define  RF24_CE    RC4   //9. pin chipEnable nRF24L01+ 
#define  RF24_CS    RC6  //10.pin  chipselect nRF24L01+ 

#define  RF24_IRQ   RC5   //8. pin interrupt nRF24L01+ 

#include "UART.h"
#include "SPI.h"
#include "NRF.h"

byte read[5];

void main()
{

ANSEL = 0;
ANSELH = 0;
//4 MHZ internal
IRCF2 = 1;
IRCF1 = 1;
IRCF0 = 0;
SCS = 1;

TRISC5 = 1;//IRQ pin...
TRISC6 = 0;//CSN pin..
TRISC4 = 0;//CE pin..
RC4 = 0;
RC6 = 0;
PORTC = 0;

//RB7 tx output
//RB5 rx input
TRISB7 = 0;
TRISB5 = 1;




TRISC0 = 0;
RC0 = 0;

SPI_Initialize();

__delay_ms(150);

UART_Initialize();
__delay_ms(20);


UART_SendString("Initializing NRF...\n\0");

NRF_Initialize();
UART_SendString("NRF initialized...\n\0");

__delay_ms(10);
SendData[0] = 'S';
SendData[1] = 'a';
SendData[2] = 'i';
SendData[3] = 'm';

UART_SendString("Deneme\n\0");
CE = 0;
byte status;
byte mode = 0;
while(1)
{

UART_SendString("MODE 2\n\0");
CSN = 0;//output_low(CSN);
       __delay_ms(10);

   SPI_WriteByte(0x26); //Write to 0x6
   SPI_WriteByte(0b00100110);
  CSN = 1;//output_high(CSN);

	__delay_ms(10);

 CSN = 0; //output_low(CSN);
__delay_ms(10);
   SPI_WriteByte(0x6);
   status=SPI_WriteByte(0);
   CSN = 1;//output_high(CSN);
	
	__delay_ms(10);
	UART_SendString("\nStatus : \n\0");
	UART_SendByte(status);
	__delay_ms(10);


UART_SendString("IRQ pin \0");
UART_SendByte(IRQ);
__delay_ms(10);



RC0 = ~RC0;




//NRF_SendData();
__delay_ms(1000);

}

}

