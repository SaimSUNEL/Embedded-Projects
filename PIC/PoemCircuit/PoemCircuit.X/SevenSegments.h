/* 
 * File:   SevenSegments.h
 * Author: Saim
 *
 * Created on 07 Eylül 2019 Cumartesi, 17:10
 */

#ifndef SEVENSEGMENTS_H
#define	SEVENSEGMENTS_H

#ifdef	__cplusplus
extern "C" {
#endif






byte count = 0;


byte rakamlar [] = {0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110, 0b01101101, 
					0b01111101, 0b00000111, 0b01111111, 0b01101111};


#define SICAKLIK 2
#define NEM 3
#define NONE 5



#define FIRST_DIGIT 4
#define SECOND_DIGIT 5

//temp or moisture led indicator...
byte what_to_display = 0;

void display_number()
{
    byte number;
    if(what_to_display){
        number = sicaklik;
    }
        else number = nem;
    
	byte digit = rakamlar[number / 10];
	if(what_to_display)
		digit |= 1 << 7;
	   	LoadDataCenter(FIRST_DIGIT, digit);
	//display_digit(1, number / 10);
	digit = rakamlar[number % 10];
	if(what_to_display == 0)
		digit |= 1 << 7;
	   	LoadDataCenter(SECOND_DIGIT, digit);
	//display_digit(SECOND_DIGIT, rakamlar[number % 10]);
}




#ifdef	__cplusplus
}
#endif

#endif	/* SEVENSEGMENTS_H */

