/* 
 * File:   EEPROM.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 16:33
 */

#ifndef EEPROM_H
#define	EEPROM_H

#ifdef	__cplusplus
extern "C" {
#endif
//0 stored time 
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


#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM_H */

