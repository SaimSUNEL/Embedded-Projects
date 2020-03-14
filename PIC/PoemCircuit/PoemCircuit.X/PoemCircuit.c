#define _XTAL_FREQ 8000000
#define true 1
#define false 0
typedef unsigned char byte;
byte nisa[2];
byte start;
unsigned int measured_adc_value;
byte DISPLAY_POEM = false;
byte LCD_LED_ON = false;
byte saniye, dakika, saat ;


#include <htc.h>
void DELAY(byte number)
{
    for(byte k=0; k != number; k++)
        __delay_ms(1);
}
void DELAY100(byte number)
{
    for(byte k=0; k != number; k++)
        __delay_ms(100);
}
#include <stdlib.h>
#include "UART.h"
#include "I2C.h"
#include "DS1307.h"
#include "PCF8574.h"
#include "LCD.h"
#include "EEPROM24C32.h"
#include "EEPROM24C64.h"
#include "EEPROM.h"
#include "ALARM.h"
#include "POEM.h"
#include "DHT11Sensor.h"
#include "INSELECT.h"
#include "ADC.h"
#include "INTFUNCTIONS.h"
#include "INTERRUPT.h"
#include "SevenSegments.h"



void main()
{
    ANSELA = 0;
    
    TRISA = 0b00111110;
 
    SPLLEN = 0;
//16 mhz 1111 internal oscillator
//8MHZ 1110
    //1101 4 MHZ    
//8MHZ
IRCF3 = 1;
IRCF2 = 1;
IRCF1 = 1;
IRCF0 = 0;

SCS1 = 1 ; //Internel oscillator
SCS0 = 0;

IOCAN = 0;
IOCAP = 0;

IOCAP3 = 1; //Rising edge on RA3 interrupt  IOCAF3 interrupt flag
IOCIE = 1;
IOCIF = 0;
RXDTSEL = 1; //Rx pini RA5 te...e o
DELAY(120);

UART_init();
I2C_initialize();
ADC_init();
DELAY(100);
//if(false)
LCD_init();
DELAY(100);
 DS1307_date();
    DS1307_time();
PEIE = 1;


  

    INSELECT_select(1); 
 DHT11_get_data();
    findClosestAlarm();
display_number();
EXTRA_INFO_SHOW = false;

        // for(;;);
    while(1)
    {
        
        GIE = 0;
        DS1307_time();
         disp_time_info();

         if(saniye %10 == 0) //In every 10 seconds... display temp or moisture...
         {
             what_to_display ^= 1;
             display_number();
         }
        if(saniye %30 == 0){
                checkSensors();

            INSELECT_select(1);
            DHT11_get_data();
    }
        if(saniye == 0)
        {
            if(compareAlarms(zaman, closest_alarm) == ARRAY_EQUAL)
            {   
                shift_reg_set_pin_lcd(7, 1);
                showAlarmMessage();
                shift_reg_set_pin_lcd(7, 0);

            }
                
        if(saat==0 && dakika == 0) //Update date...
           DS1307_date(); 
        }
        
         GIE = 1;
        //interrupt might come....
        for(unsigned int k = 0 ; k != 1000 ; k++)
        {   
            if(UPDATE_NEAREST_ALARM){UPDATE_NEAREST_ALARM = false;findClosestAlarm();} //Update closest alarm
            if(DISPLAY_POEM){GIE=0; DISPLAY_POEM = false;showPoem(); GIE=1;} //Update closest alarm
            if(EXTRA_INFO_SHOW){
                EXTRA_INFO_SHOW = false;
                for(start=0;start != 16; start++)
                {
                    if(start % 8==0)lcd_goto(start/8+1, 9);
                    lcd_yaz(EEPROM_ReadByte(232+start));
                }
            }
            DELAY(1);
        }
        
    }
    
    
    
}
