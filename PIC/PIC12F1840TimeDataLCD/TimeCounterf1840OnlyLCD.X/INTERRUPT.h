/* 
 * File:   INTERRUPT.h
 * Author: Saim
 *
 * Created on 28 Eylül 2019 Cumartesi, 09:38
 */

#ifndef INTERRUPT_H
#define	INTERRUPT_H

#ifdef	__cplusplus
extern "C" {
#endif



void interrupt FNC()
{
    
if(TMR1IF)
{
	

TMR1IF = 0;
}
else
if(IOCIF == 1)
{
		

	IOCIF = 0;
}

}


#ifdef	__cplusplus
}
#endif

#endif	/* INTERRUPT_H */

