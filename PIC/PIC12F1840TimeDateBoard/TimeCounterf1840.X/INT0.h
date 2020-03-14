/* 
 * File:   INT0.h
 * Author: Saim
 *
 * Created on 28 Eylül 2019 Cumartesi, 09:34
 */

#ifndef INT0_H
#define	INT0_H

#ifdef	__cplusplus
extern "C" {
#endif



void INT0_init()
{
IOCAN = 0;
IOCAP = 0;

IOCAP3 = 1; //Rising edge on RA3 interrupt  IOCAF3 interrupt flag
IOCIE = 1;
IOCIF = 0;
}



#ifdef	__cplusplus
}
#endif

#endif	/* INT0_H */

