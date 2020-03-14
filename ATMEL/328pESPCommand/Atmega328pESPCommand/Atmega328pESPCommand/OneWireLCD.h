/*
 * OneWireLCD.h
 *
 * Created: 11.07.2019 15:59:25
 *  Author: Saim
 */ 


#ifndef ONEWIRELCD_H_
#define ONEWIRELCD_H_

#include <util/delay.h>
void lcd_yaz(byte data);
// RA2 da lcd
byte current_value_lcd;

byte _x, _y;

void assembly_pin()
{
	//5th pin...
	asm volatile("ldi r19, 32\n"
	"ldi r17, 4\n"
	"lds r18, 43\n"
	"eor r18, r19\n"
	"sts 0x2b, r18\n"
	
	"den: \n"
	"dec r17\n"
	"nop\n"
	"nop\n"
	"nop\n"
	"brne den\n"
	
	"lds r18, 43\n"
	"ori r18, 32\n"
	"sts 0x2b, r18\n"
	
	);
	
}


void assembly_pin2()
{
	//5th pin...
	//5th pin...
	asm volatile("ldi r19, 32\n"
	"ldi r17, 61\n"
	"lds r18, 43\n"
	"eor r18, r19\n"
	"sts 0x2b, r18\n"
	
	"dene: \n"
	"dec r17\n"
	"nop\n"
	"nop\n"
	"brne dene\n"
	
	"lds r18, 43\n"
	"ori r18, 32\n"
	"sts 0x2b, r18\n"
	
	);
}



void load_shift_data_lcd(byte data)
{
	

	for(int a=7; a >-1 ; a--)
	{
		if((data >> a) & 0x1)
		{
			//PORTD &= ~(1 << SHIFT_LCD_PIN);

			assembly_pin();


			//jj++;jj++;
			//jj++;jj++;
			//jj++;jj++;
			//jj++;jj++;

			//PORTD |= 1 <<SHIFT_LCD_PIN ;
			delayMicroseconds(250);
		}
		else
		{
			//PORTD &= ~(1 <<SHIFT_LCD_PIN);
			//digitalWrite(SHIFT_PIN, 0);
			//delayMicroseconds(14);
			assembly_pin2();
			
			
			//PORTD |= 1 <<SHIFT_LCD_PIN;
			//    digitalWrite(SHIFT_PIN, 1);
			delayMicroseconds(250);
			
		}
	}
	PORTD &= ~(1 <<SHIFT_LCD_PIN);
	//  digitalWrite(SHIFT_PIN, 0);
	delayMicroseconds(199);
	PORTD |= 1 <<SHIFT_LCD_PIN;

	// digitalWrite(SHIFT_PIN, 1);
	delayMicroseconds(100);

}


void shift_reg_set_pin_lcd(byte pin_number, byte value)
{
	value = value & 0x1;
	pin_number --;
	if(value)
	{
		current_value_lcd  |= 1 <<(pin_number);
	}
	else
	{
		current_value_lcd &= ~(1<<(pin_number));
	}

	load_shift_data_lcd(current_value_lcd);

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
	shift_reg_set_pin_lcd(6, _temp_ >> 7);
	shift_reg_set_pin_lcd(5, _temp_ >> 6);
	shift_reg_set_pin_lcd(4, _temp_ >> 5);
	shift_reg_set_pin_lcd(3, _temp_ >> 4);

	//LCDPORT =  ;
	
	delay_ms(2);
	shift_reg_set_pin_lcd(E, 0);
	//E=0;

	__delay_ms(1);
	shift_reg_set_pin_lcd(E, 1);
	//E=1;
	_temp_ = ((c & 0x0F)<<4) ;

	shift_reg_set_pin_lcd(6, _temp_ >> 7);
	shift_reg_set_pin_lcd(5, _temp_ >> 6);
	shift_reg_set_pin_lcd(4, _temp_ >> 5);
	shift_reg_set_pin_lcd(3, _temp_ >> 4);


	//LCDPORT=((c & 0x0F)<<4);

	__delay_ms( 2 );
	shift_reg_set_pin_lcd(E, 0);

	//E=0;
	__delay_ms(10);
}

void lcd_clear(void)
{


	lcd_info(sil, COMMAND_INFO);
	__delay_ms(2);
}

void lcd_write(const char *s)
{
	while(*s){lcd_yaz(*s++); __delay_ms(1);}
	delay(10);
}
void lcd_goto(unsigned char p_1,unsigned char p_2)
{

	_y = p_1; _x = p_2;
	
	if(p_1==1)
	{lcd_info(satir_1+((p_2-1)%16), COMMAND_INFO);
		}else{
		lcd_info(satir_2+((p_2-1)%16), COMMAND_INFO);
	}

	delay(1);
}


void LCD_init()
{
	shift_reg_set_pin_lcd(RS, 0);
	//RS=0;
	shift_reg_set_pin_lcd(E, 0);
	//E=0;

	lcd_info(basla, COMMAND_INFO);
	__delay_ms(2);
	lcd_info(cift_4bit, COMMAND_INFO);
	lcd_info(saga, COMMAND_INFO);

	lcd_info(saga, COMMAND_INFO);

	lcd_info(imlec_yok, COMMAND_INFO);

	lcd_clear();

	lcd_info(satir_1, COMMAND_INFO);
	delay(10);
}





void lcd_yaz(byte data)
{
	lcd_goto(_y, _x);
	lcd_info(data, DATA_INFO);
	_x++;
	if(_x == 16)
	{
		_x = 1;
		_y++;
		if(_y == 3)
		{

			_x = 1;
			_y = 1;
		}

		
	}
	delay(1);
}
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




byte number_array[5];
void lcd_write_number(int number)
{
	itoa(number, (char *)number_array, 10);
	lcd_write((char *)number_array);
}





#endif /* ONEWİRELCD_H_ */