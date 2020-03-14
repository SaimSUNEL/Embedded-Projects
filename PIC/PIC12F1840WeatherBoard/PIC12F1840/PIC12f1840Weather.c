#define TRUE 1
#define FALSE 0

typedef unsigned char byte;
#include <htc.h>
#include <string.h>
#include <stdlib.h>
#include "MainRegister.h"
#include "CenterRegister.h"
#include "SicaklikSegment.h"
#include "GUN.h"
#include "TARIH.h"
#include "HAVADURUMU.h"
#include "LCD.h"
#include "INTERRUPT.h"
#include "UART.h"
#include "IOPINSELECT.h"
#include "EEPROM.h"
#include "HAVASTRUCTURE.h"
#include "Requests.h"
#include "DHT11.h"


//Weather status will be stored in EEPROM and will be read from there...


void main()
{
 //Internal oscillator will be used...
	SCS1 = 1 ;
	SCS0 = 0 ; 
	
	//4 MHZ...
	IRCF3 = 1 ;
	IRCF2 = 1 ;
  	
	IRCF1 = 0;
	IRCF0 = 1 ;
	ANSELA  = 0 ;

	//WPUA = 1 <<3;
	//nWPUEN = 1;

	TRISA3 = 1;


	TRISA0 = 0;
	TRISA5 = 0; //Main register...

	TRISA2 = 0;
	TRISA4 = 0;
	//choose_input_pin(0);
	//DHT11_get_data();

	__delay_ms(20);
	LCD_init();
	UART_init();
	__delay_ms(200);
	//PEIE = 1;
	//GIE = 1;
	retrive_weather_situations();
	__delay_ms(100);

	ask_5_day_weather();
	
	if(time_exceed == FALSE)
{
	if (compareData(0, current_buffer, 40) == FALSE)
		saveToEEPROM(0, current_buffer, 40);
	
	resetBuffer();
}
	__delay_ms(100);



	ask_currency();

if(time_exceed == FALSE)
{	
	if (compareData(51, current_buffer, 6) == FALSE)
		saveToEEPROM(51, current_buffer, 6);
		resetBuffer();
}
	__delay_ms(100);
	ask_current_situation();
	
if(time_exceed == FALSE)
{
	if (compareData(40, current_buffer, 11) == FALSE)
		saveToEEPROM(40, current_buffer, 11);
		resetBuffer();
}
	__delay_ms(100);
	
	byte prev_phrase = 0;
	signed char * temporary;
	while(1)
	{
		show_currency_information();

		for(byte k = 0; k < 5 ; k++)
		{	
			temporary = (signed char*)&gunler[k];
			SetHavaDurumuPin(prev_phrase, 0);
			show_date_info(temporary);
			DisplayGun(temporary[1]);//gunler[k].day);
			DisplayAy(temporary[2]);//gunler[k].month);
			DisplayYil(temporary[3]);//gunler[k].year);
			EnYuksekDisplay(temporary[5]);//gunler[k].max_temp);
			EnDusukDisplay(temporary[4]);//gunler[k].min_temp);
			LoadGunInfo(temporary[0]);//gunler[k].week_day);
			LoadGosterilenGunInfo(temporary[7]);//gunler[k].relative_index);
			SetHavaDurumuPin(temporary[6], 1);//gunler[k].weather_phrase, 1);
			prev_phrase = temporary[6];//gunler[k].weather_phrase;
			__delay_ms(3000);
}
			}


}
