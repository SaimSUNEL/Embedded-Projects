#include<htc.h>
typedef unsigned char byte;
#define CSE RC6

#include "SoftwareSPI.h"

#define SPI_WriteByte SoftwareSPI_WriteByte


#include "EEPROM_24C040.h"



byte read[5];

void main()
{

ANSEL = 0;

//4 MHZ internal
IRCF2 = 1;
IRCF1 = 1;
IRCF0 = 0;
SCS = 1;
TRISC5 = 0;
TRISC6 = 0;
PORTC = 0;

TRISC0 = 0;
RC0 = 0;

CSE = 1; // LOW enables EEPROM...
SoftwareSPI_Initialize();

__delay_ms(150);

EEPROM_24C040_WriteByte(1, 'A');
EEPROM_24C040_WriteByte(2, 'I');
EEPROM_24C040_WriteByte(3, 'M');
EEPROM_24C040_WriteByte(511, 'G');


read[0] = EEPROM_24C040_ReadByte(0);
read[1] = EEPROM_24C040_ReadByte(1);
read[2] = EEPROM_24C040_ReadByte(2);
read[3] = EEPROM_24C040_ReadByte(3);
read[4] = EEPROM_24C040_ReadByte(511);


while(1)
{
RC0 = ~RC0;
RC1 = ~RC1;
__delay_ms(1000);


}

}
