/* 
 * File:   SPI.h
 * Author: Saim
 *
 * Created on 01 Eylül 2019 Pazar, 21:33
 */

#ifndef SPI_H
#define	SPI_H

#ifdef	__cplusplus
extern "C" {
#endif

byte SPI_write(byte data)
{
     SSPBUF = data;
    byte received = 0;
    while(!BF);  
    SSPIF = 0;
    return SSPBUF;
    
    
}
    
    
void SPI_init()
{
    TRISC3 =0;
            TRISC4 =1;
            TRISC5 = 0;
SMP = 0;
CKE = 1;  // FOR EEPROM it is 0 for SD car it is 1;
CKP = 0;
SSPM3 =0; SSPM2= 0; SSPM1=1;SSPM0=0; //SOSC / 64 

__delay_ms(10);
SSPEN = 1;
SSPIF = 0;
}


#ifdef	__cplusplus
}
#endif

#endif	/* SPI_H */

