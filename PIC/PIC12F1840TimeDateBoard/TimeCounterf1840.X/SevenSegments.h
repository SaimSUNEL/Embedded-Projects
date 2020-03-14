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

#define STR_PIN RA5
#define DATA_PIN RA4
#define CLK_PIN RA0
    
byte rakamlar [] = {~0b00111111, ~0b00000110, ~0b01011011, ~0b01001111, ~0b01100110, ~0b01101101, 
					~0b01111101, ~0b00000111, ~0b01111111, ~0b01101111};

void LoadMainShift(byte data)
{

	for(signed char index = 7; index != -1; index--)
	{
		DATA_PIN =  (data>>index) & 0x1;
		//__delay_us(50);
		CLK_PIN =  0x1;
		__delay_us(30);
		CLK_PIN =  0;
		//__delay_us(20);
	}
	STR_PIN = 1;
    __delay_us(30);
    STR_PIN = 0;
}

byte MAIN_SHIFT_DATA;
void SetMainShiftPin(byte pin_number, byte pin_value)
{

	if(pin_value)
	{
		MAIN_SHIFT_DATA |= 1 << (pin_number);
	}
	else 	MAIN_SHIFT_DATA &= ~(1 << (pin_number));

	LoadMainShift(MAIN_SHIFT_DATA);

}


#define MAIN_SHIFT_CLK_PIN 0
#define MAIN_SHIFT_DATA_PIN 1

void LoadDataCenter(byte center_no, byte center_data)
{

	for(signed char index = 7; index != -1; index--)
	{
		SetMainShiftPin(MAIN_SHIFT_DATA_PIN, (center_data>>index) & 0x1);
		//__delay_us(50);
		SetMainShiftPin(MAIN_SHIFT_CLK_PIN, 0x1);
		//__delay_us(30);
		SetMainShiftPin(MAIN_SHIFT_CLK_PIN, 0);
		//__delay_us(20);
	}
	SetMainShiftPin(center_no, 1);
	SetMainShiftPin(center_no, 0);
}

byte CENTER_DATA[5];

void SetDataCenterPin(byte pin_number, byte pin_value)
{
    byte center_no = pin_number / 8;
    pin_number %= 8;
    byte * p = (byte *)(CENTER_DATA+center_no);
    
    if(pin_value)
         *p |= (1 << pin_number);
     else
         *p &= ~(1<<pin_number);
    
    LoadDataCenter(center_no+2, *p);
    
}

#define SEGMENT_DATA 1
#define SEGMENT_CLK 0


void LoadSevenSegment(byte segment_no, byte value)
{
    segment_no += 2;
    for(signed char index = 7; index != -1; index--)
	{
		SetDataCenterPin(SEGMENT_DATA, (value>>index) & 0x1);
		//__delay_us(50);
		SetDataCenterPin(SEGMENT_CLK, 0x1);
		//__delay_us(30);
		SetDataCenterPin(SEGMENT_CLK, 0);
		//__delay_us(20);
	}
	SetDataCenterPin(segment_no, 1);
	SetDataCenterPin(segment_no, 0);
    
}


void DisplayNumber(byte s, byte value)
{
    LoadSevenSegment(s, rakamlar[value/10]);
    LoadSevenSegment(s+1, rakamlar[value%10]);
}

void DisplayDate()
{
    for(signed char k = 3; k != -1; k--)
    {
        DisplayNumber(2*(3-k), zaman[k]);
    }
}

void DisplayTime()
{
    for(char k = 4; k < 7; k++)
    {
        DisplayNumber(2*k, zaman[k]);
    }
    
}

#ifdef	__cplusplus
}
#endif

#endif	/* SEVENSEGMENTS_H */

