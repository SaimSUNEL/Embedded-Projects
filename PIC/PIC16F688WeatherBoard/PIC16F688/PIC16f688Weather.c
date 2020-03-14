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
#include "ADC.h"


/*
DHT11
ADC reading...



*/



//byte regs[2];
//Weather status will be stored in EEPROM and will be read from there...
byte tt = TRUE;
byte refresh_counter ;
void main()
{
 //Internal oscillator will be used...
	SCS = 1 ; 
	
	//	//8 MHZ...
	IRCF2 = 1 ;
  	
	IRCF1 = 1;
	IRCF0 = 1;//1 ;

	ANSEL  = 0 ;


	//RA3 analog input
	ANS3 =1;
	TRISA3 = 1;

	ADC_init();
	TRISA0 = 1;
	TRISA5 = 0; //Main register...

	TRISA2 = 0; 
	TRISA4 = 0;
	TRISA1 = 1;//DHT11
	TRISC0 = 0;
	TRISC1 = 0;
	TRISC2 = 0;
	PORTA = 0;



	choose_input_pin(0);
	
	

	ADC_read();
	LCD_init();
	UART_init();
	__delay_ms(20);
	lcd_write("Saim");
	//PEIE = 1;
	//GIE = 1;
	byte ss;
	makeRequest();
	byte prev_phrase = 0;
	signed char * temporary;
	while(1)
	{
		show_currency_information();
		DHT11_get_data();
		if(tt)
		{
			ss = sicaklik;

			tt = FALSE;
		}
		else
		{
			ss = nem;
			tt = TRUE;
		}
			CurrentTempNemDisplay(ss, tt);


		
		for(byte k = 0; k < 6 ; k++)
		{	
			if(k == 0) temporary = (signed char*)&bugun;
			else temporary = (signed char*)&gunler[k-1];
			
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
refresh_counter++;
if(refresh_counter > 2)
{
	makeRequest();
	refresh_counter = 0;
}


			}


}

