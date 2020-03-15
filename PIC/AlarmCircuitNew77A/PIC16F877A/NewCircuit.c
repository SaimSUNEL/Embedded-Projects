//Önemli iþlemler yapýlýrken Interruptlar kapatýlacak...
//Türkçe karakterler olacak bazý yerlerde....
typedef unsigned char byte;
#define TRUE 1
#define FALSE 0
#define EQUAL 2
#define BIGGER 3
#define LESS 4

#define SET_LOCATION 1
#define READ 2
#define FINISH 3

#include<htc.h>
#include<time.h>
#include<stdio.h>

#include "I2C.h"
#include "DS1307.h"
#include "lcd.h"
#include "DHT11.h"
#include "EEPROM.h"  
#include "ALARM.h"
#include "UART.h"

#include "INTERRUPT.h"
#include "SEVENSEGMENTS.h"  
#include "24C32EEPROM.h"
#include "MESSAGE.h"
#include "BLUETOOTH.h"
ALARM temp ;
ALARM closest_alarm;

void main()
{



TRISD7 = 0;
TRISD6 = 0;


   //All pin on port b are output
   TRISB = 0;
   PORTB = 0;
    //Initialize the LCD device
   lcd_init();
__delay_ms(100);
DHT11_initialize();
lcd_clear();
lcd_goto(1,1); 
lcd_write("DTH11 tamam...");
__delay_ms(1000);
  
   //Configure I2C 100khz master

  Segments_initialize();
 I2C_initialize();
lcd_clear();
lcd_goto(1,1); 
lcd_write("I2C tamam...");
__delay_ms(1000);
 EEPROM_initialize();

   UART_initialize();
lcd_clear();
lcd_goto(1,1);
lcd_write("UART tamam...");
__delay_ms(1000);
//EEPROM_write_byte(0, 0);   

RCIE = 1 ; //UART receive interrupt is enabled...As soon as the message arrives we will process it..
PEIE = 1; //Peripheral interrupt enable for UART
GIE=1; //Global Interrupt Enable for enabling all interrupts...


closest_alarm = get_closest_alarm();
lcd_clear();
show_information();


//EEPROM24C32_resetle();

//lcd_write("");


//DS1307_set_time( 3, 43, 33);
//DS1307_set_date(5, 11, 109);

   while(1)
   {

GIE=1;
__delay_ms(750);
GIE=0;
saati_goster();
tarihi_goster();
alarm_check();


if(zaman[SANIYE] % 10 == 0)
{
DHT11_get_data();
display_number( sicaklik  );
}

if(is_alarm_aktif == TRUE)
{ 
	is_alarm_aktif = FALSE;
	closest_alarm = get_closest_alarm();
	show_information();
}
 
   }
   
}