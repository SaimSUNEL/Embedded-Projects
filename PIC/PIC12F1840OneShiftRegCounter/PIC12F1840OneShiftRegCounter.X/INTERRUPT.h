/* 
 * File:   INTERRUPT.h
 * Author: Saim
 *
 * Created on 09 Nisan 2020 Per?embe, 23:24
 */

#ifndef INTERRUPT_H
#define	INTERRUPT_H

#ifdef	__cplusplus
extern "C" {
#endif

#define COUNT_ACTIVE 9
#define COUNT_IDLE 8

byte count_status = COUNT_IDLE;
byte timer_count = 0;
byte second_count = 0;

void interrupt FNC()
{
if(TMR1IF == 1)
{	TMR1ON = 0;
	timer_count ++;
	if(timer_count == 20)
	{
		timer_count = 0;
		second_count ++;
		if(second_count == 99)
		{
			
			TMR1ON = 0;
			count_status = COUNT_IDLE;
		}
			
		display_number(second_count);
	}
	
	TMR1 = 15535;
	TMR1IF = 0;
	if(count_status != COUNT_IDLE)
	{
		TMR1ON = 1;
	}
}
else
 
if(IOCIF == 1)
{
	if(count_status == COUNT_IDLE)
	{
		count_status = COUNT_ACTIVE;
		TMR1 = 15535;
		second_count = 0;
		TMR1ON = 1;
	}
	else if(count_status == COUNT_ACTIVE)
	{
		count_status = COUNT_IDLE;
		TMR1ON = 0;

	}

	IOCIF = 0;
	IOCAF = 0;
}

}


#ifdef	__cplusplus
}
#endif

#endif	/* INTERRUPT_H */

