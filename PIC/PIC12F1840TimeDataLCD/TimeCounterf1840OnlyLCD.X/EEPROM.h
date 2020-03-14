/* 
 * File:   EEPROM.h
 * Author: Saim
 *
 * Created on 28 Eylül 2019 Cumartesi, 09:26
 */

#ifndef EEPROM_H
#define	EEPROM_H

#ifdef	__cplusplus
extern "C" {
#endif


//0 stored time 

//[200-255] message - message that will be shown when sensor is activated
//[1,65] opening message
//[66,130] periodical message 
//[131, 195] message for retriggering sensor after first...
#define ACTIVATE 200
#define DEACTIVATE 131
#define PERIODIC 66
#define OPEN 1

/*
void EEPROM_WriteByte(byte address, byte value)
{
EEPGD = 0;
CFGS = 0;
EEDATL = value;
EEADRL = address;

WREN = 1;

EECON2 = 0x55;
EECON2 = 0xaa;

WR = 1;

while(WR);



EEIF = 0;
WREN = 0;
}

byte EEPROM_ReadByte(byte address)
{
EEPGD = 0;
CFGS = 0;
EEADRL = address;
RD = 1;
while(RD);
EEIF = 0;
return EEDATL;
}
*/

#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM_H */

