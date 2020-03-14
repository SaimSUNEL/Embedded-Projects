#include<htc.h>
typedef unsigned char byte;
/*
Problem of power source !!!!!!!!!



*/
/*
RC0 - CE 
RC6 - CS
RC5 - IRQ

RB7 - tx
RB5 - rx

RB6 - SCK
RC7 - SDO
RB4 - SDI


*/
#include "OneWireShiftRegister.h"
#include "7Segments.h"



typedef unsigned char byte;

#define  RF24_CE    RC0   //9. pin chipEnable nRF24L01+ 
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


TRISC3 = 0; //7 segments
RC3 = 0;



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
SendData[4] = ' ';
SendData[5] = 'S';
SendData[6] = 'U';
SendData[7] = 'N';

UART_SendString("Deneme\n\0");
CE = 0;
byte status;
display_number(12);
byte mode = 0;
while(1)
{
NRF_ReceiveData();
UART_SendString("Received : ");
UART_SendString(ReceiveData);

if(ReceiveData[0]=='1')
RC4 = 1;
else RC4 = 0;
display_number(ReceiveData[1]);



/*
NRF_ReceiveData();
UART_SendString("Data receivecd....\0");
ReceiveData[15] = '\0';
UART_SendString(ReceiveData);
*/

__delay_ms(10 );
}

}

