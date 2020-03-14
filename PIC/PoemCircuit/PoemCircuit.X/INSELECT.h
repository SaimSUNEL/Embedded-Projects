/* 
 * File:   INSELECT.h
 * Author: Saim
 *
 * Created on 05 Eylül 2019 Per?embe, 06:38
 */

#ifndef INSELECT_H
#define	INSELECT_H

#ifdef	__cplusplus
extern "C" {
#endif

    byte inselect; //ON p3....
/*
    void INSELECT_set_pin(byte pin_number, byte pin_value)
{

	if(pin_value)
	{
		inselect |= 1 << (pin_number);
	}
	else 	inselect &= ~(1 << (pin_number));

	LoadDataCenter(3, inselect);

}
*/
void INSELECT_select(byte input_number)
{
    inselect =(inselect & 0xf0) |input_number;
   	LoadDataCenter(3, inselect);

}


#ifdef	__cplusplus
}
#endif

#endif	/* INSELECT_H */

