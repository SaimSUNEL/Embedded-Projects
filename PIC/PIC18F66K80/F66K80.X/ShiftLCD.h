/* 
 * File:   ShiftLCD.h
 * Author: Saim
 *
 * Created on 01 Eylül 2019 Pazar, 16:44
 */

#ifndef SHIFTLCD_H
#define	SHIFTLCD_H

#ifdef	__cplusplus
extern "C" {
#endif

#define CLK_LCD RF3
#define DATA_LCD RF4
#define STORE_LCD RF5
// RA2 da lcd
byte current_value_lcd;

void load_shift_data_lcd(unsigned char data)
{
for(signed char a = 7; a > -1;a--)
{
    DATA_LCD = (data>>a)&0x1;
    __delay_us(1);
    CLK_LCD =1;
    __delay_us(3);
    CLK_LCD = 0;
    __delay_us(3);

}

STORE_LCD = 1;
__delay_us(3);
STORE_LCD = 0;
__delay_us(3);


}
void shift_reg_set_pin_lcd(byte pin_number, byte value)
{
value = value & 0x1;
if(value)
{
current_value_lcd  |= 1 <<pin_number;
}
else
{
current_value_lcd &= ~(1<<pin_number);
}

load_shift_data_lcd(current_value_lcd);

}

void lcd_yaz(byte data);

byte CURRENT_MESSAGE;
byte SHOWN_BYTES;

extern byte EEPROM_ReadByte(byte);
void display_message()
{
byte message_len = EEPROM_ReadByte(CURRENT_MESSAGE);

for(int a = 0; a < 32; a++)
{
SHOWN_BYTES++;
if(SHOWN_BYTES > message_len)return;
lcd_yaz(EEPROM_ReadByte(CURRENT_MESSAGE+SHOWN_BYTES));
}


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


#define DATA_INFO 1
#define COMMAND_INFO 2
byte _temp_;
void lcd_info(unsigned char c, byte data_type)
{
if(data_type == COMMAND_INFO)
shift_reg_set_pin_lcd(RS, 0);
else shift_reg_set_pin_lcd(RS, 1);

shift_reg_set_pin_lcd(E, 1);	
//RS=0;
//E=1;
	
_temp_ =  c&0xF0 ;
shift_reg_set_pin_lcd(6, (_temp_ >> 7)&0x1);
shift_reg_set_pin_lcd(5, (_temp_ >> 6)&0x1);
shift_reg_set_pin_lcd(4, (_temp_ >> 5)&0x1);
shift_reg_set_pin_lcd(3, (_temp_ >> 4)&0x1);
	
//LCDPORT =  ;
__delay_ms( 4 );
shift_reg_set_pin_lcd(E, 0);
//E=0;

__delay_ms(4);
shift_reg_set_pin_lcd(E, 1);
//E=1;
_temp_ = ((c & 0x0F)<<4) ;

shift_reg_set_pin_lcd(6, (_temp_ >> 7)&0x1);
shift_reg_set_pin_lcd(5, (_temp_ >> 6)&0x1);
shift_reg_set_pin_lcd(4, (_temp_ >> 5)&0x1);
shift_reg_set_pin_lcd(3, (_temp_ >> 4)&0x1);


//LCDPORT=((c & 0x0F)<<4);

__delay_ms( 4 );
shift_reg_set_pin_lcd(E, 0);

//E=0;
__delay_ms(10);
}

void lcd_clear(void)
{

_y = 1; _x = 1;
lcd_info(sil, COMMAND_INFO);
__delay_ms(2);
lcd_goto(_y, _x);
}

void lcd_write(const char *s)
{
__delay_ms(1);
while(*s){lcd_yaz(*s++); __delay_ms(1);}
__delay_ms(3);
}
void lcd_goto(unsigned char p_1,unsigned char p_2)
{
_y = p_1;
_x = p_2;
if(p_1==1)
{lcd_info(satir_1+((p_2-1)%16), COMMAND_INFO);
}else{
lcd_info(satir_2+((p_2-1)%16), COMMAND_INFO);
}
__delay_ms(1);
}


void LCD_init()
{
shift_reg_set_pin_lcd(RS, 0);
//RS=0;
shift_reg_set_pin_lcd(E, 0);
//E=0;

lcd_info(basla, COMMAND_INFO);
__delay_ms(10);
lcd_info(cift_4bit, COMMAND_INFO);
__delay_ms(10);

lcd_info(saga, COMMAND_INFO);
__delay_ms(2);

lcd_info(imlec_yok, COMMAND_INFO);
__delay_ms(2);

lcd_clear();
__delay_ms(2);

lcd_info(satir_1, COMMAND_INFO);
__delay_ms(10);

}





void lcd_yaz(byte data)
{
	lcd_info(data, DATA_INFO);
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

byte number_array[5];
void lcd_write_number(int number)
{
itoa((char *)number_array, number, 10);
lcd_write(number_array);
}







#ifdef	__cplusplus
}
#endif

#endif	/* SHIFTLCD_H */

