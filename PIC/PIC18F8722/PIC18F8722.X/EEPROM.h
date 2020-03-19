/* 
 * File:   EEPROM.h
 * Author: Saim
 *
 * Created on 02 Eylül 2019 Pazartesi, 22:56
 */

#ifndef EEPROM_H
#define	EEPROM_H

#ifdef	__cplusplus
extern "C" {
#endif


//0 stored time 
unsigned char EEPROM_read_byte(int address)
{
EEPGD = 0;
CFGS = 0;
EEADRH = (address >> 8)&0xff;
EEADR = address &0xff;
RD = 1;
while(RD);
EEIF = 0;
return EEDATA;
}
void EEPROM_write_byte(int address, byte value)
{
    EEDATA = value;
EEPGD = 0;
CFGS = 0;
EEADRH = (address>>8)&0xff;
EEADR = address&0xff;

WREN = 1;

EECON2 = 0x55;
EECON2 = 0xaa;

WR = 1;

while(WR);

EEIF = 0;
WREN = 0;
}




#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM_H */

