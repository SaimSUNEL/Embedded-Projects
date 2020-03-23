
/* 
 * File:   LCD.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 13:06
 */

#ifndef LCD_H
#define	LCD_H

#include "PCF8574.h"


#ifdef	__cplusplus
extern "C" {
#endif

//LCD reg on 7. pin on main register
#define LCD_REG 2

byte LCDData;
#define MAINDATA 1
#define MAINCLOCK 0

void LoadDataCenter(byte center_no, byte center_data)
{

	for(signed char index = 7; index != -1; index--)
	{
		PCF8574_set_pin(MAINDATA, (center_data>>index) & 0x1);
		//__delay_us(50);
		PCF8574_set_pin(MAINCLOCK, 0x1);
		//__delay_us(30);
		PCF8574_set_pin(MAINCLOCK, 0);
		//__delay_us(20);
	}
	PCF8574_set_pin(center_no, 1);
	PCF8574_set_pin(center_no, 0);
}


void shift_reg_set_pin_lcd(byte pin_number, byte pin_value)
{

	if(pin_value)
	{
		LCDData |= 1 << (pin_number);
	}
	else 	LCDData &= ~(1 << (pin_number));

	LoadDataCenter(LCD_REG, LCDData);

}

//#define LCDPORT PORTB
#define RS 1  //
//Rw direk ground ta
#define E 2//
#define sil 0x01
#define basla 0x02
#define sola 0x04
#define saga 0x06
#define kapat 0x08
#define imlec_yok 0x0C
#define imlec_var 0x0F
#define imlec_sola 0x10
#define imlec_saga 0x14
#define display_sola 0x18
#define display_saga 0x1C
#define satir_1 0x80
#define satir_2 0xC0
#define cift_4bit 0x28
#define cift_8bit 0x38
#define tek_4bit 0x3C
#define tek_8bit 0x30

byte _x=1, _y = 1;

void lcd_data(unsigned char);
 void lcd_init(void);
 void lcd_write(const char *s);
 void lcd_clear(void);
 void lcd_goto(unsigned char,unsigned char);
 void lcd_command(unsigned char c); 
void lcd_yaz(byte data);


#define DATA_INFO 1
#define COMMAND_INFO 2
byte _temp_;
byte saim;
void lcd_info(unsigned char c, byte data_type)
{
if(data_type == COMMAND_INFO)saim =0;
else saim=1;
shift_reg_set_pin_lcd(RS, saim);


shift_reg_set_pin_lcd(E, 1);	
//RS=0;
//E=1;
	
_temp_ =  (c&0xF0) >> 1 ;

LCDData = LCDData & 0x87;
LCDData |= _temp_;

//shift_reg_set_pin_lcd(6, (_temp_ >> 7) & 0x1);
//shift_reg_set_pin_lcd(5, (_temp_ >> 6) & 0x1);
//shift_reg_set_pin_lcd(4, (_temp_ >> 5) & 0x1);
//shift_reg_set_pin_lcd(3, (_temp_ >> 4) & 0x1);
LoadDataCenter(LCD_REG, LCDData);
	

//LCDPORT =  ;
DELAY( 4 );
shift_reg_set_pin_lcd(E, 0);
//E=0;

DELAY(4);
shift_reg_set_pin_lcd(E, 1);
//E=1;
_temp_ = ((c & 0x0F)<<3) ;

LCDData = LCDData & 0x87;
LCDData |= _temp_;

//shift_reg_set_pin_lcd(6, (_temp_ >> 7) & 0x1);
//shift_reg_set_pin_lcd(5, (_temp_ >> 6) & 0x1);
//shift_reg_set_pin_lcd(4, (_temp_ >> 5) & 0x1);
//shift_reg_set_pin_lcd(3, (_temp_ >> 4) & 0x1);
LoadDataCenter(LCD_REG, LCDData);

//shift_reg_set_pin_lcd(6, (_temp_ >> 7)&0x1);
//shift_reg_set_pin_lcd(5, (_temp_ >> 6)&0x1);
//shift_reg_set_pin_lcd(4, (_temp_ >> 5)&0x1);
//shift_reg_set_pin_lcd(3, (_temp_ >> 4)&0x1);


//LCDPORT=((c & 0x0F)<<4);

DELAY( 4 );
shift_reg_set_pin_lcd(E, 0);

//E=0;
DELAY(10);
}

void lcd_clear(void)
{

_y = 1; _x = 1;
lcd_info(sil, COMMAND_INFO);
lcd_goto(_y, _x);
}

void lcd_yaz(byte s)
{
    lcd_info(s, DATA_INFO);
	_x++;
	if(_x == 17)
{
		_x = 1;
		_y++;
		if(_y == 3)
        {	
			_y = 1;
	}

lcd_goto(_y, _x);
}
    
}

void lcd_write(const char *s)
{
while(*s){

    lcd_yaz(*s);
    s++;

DELAY(1);}

}
void lcd_goto(unsigned char p_1,unsigned char p_2)
{
_y = p_1;
_x = p_2;
if(p_1==1)
{lcd_info(satir_1+((p_2-1)), COMMAND_INFO);
}else{
lcd_info(satir_2+((p_2-1)), COMMAND_INFO);
}
}


void LCD_init()
{
shift_reg_set_pin_lcd(RS, 0);
//RS=0;
shift_reg_set_pin_lcd(E, 0);
//E=0;

lcd_info(basla, COMMAND_INFO);
DELAY(10);
lcd_info(cift_4bit, COMMAND_INFO);
DELAY(10);

lcd_info(saga, COMMAND_INFO);

lcd_info(imlec_yok, COMMAND_INFO);

lcd_clear();

lcd_info(satir_1, COMMAND_INFO);
DELAY(10);

}






#ifdef	__cplusplus
}
#endif

#endif	/* LCD_H */

