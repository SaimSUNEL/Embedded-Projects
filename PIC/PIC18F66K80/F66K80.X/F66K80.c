
#define FALSE 0
#define TRUE 1
#pragma config INTOSCSEL = LOW, SOSCSEL = DIG, XINST = OFF, RETEN = OFF, IESO = ON, FOSC = INTIO2, PLLCFG = OFF, BOREN = OFF, BORPWR = LOW, BORV = 3, PWRTEN = OFF, WDTPS = 4, WDTEN = OFF, MCLRE = OFF, STVREN = OFF, BBSIZ = BB1K, CP0 = OFF, CP1 = OFF, CP2 = OFF, CP3 = OFF, CPD = OFF, CPB = OFF, WRT0 = OFF, WRT2 = OFF, WRT3 = OFF, WRTB = OFF, WRTC = OFF, WRTD = OFF, EBTR0 = OFF, EBTR1 = OFF, EBTR2 = OFF, EBTR3 = OFF, EBTRB = OFF
#define _XTAL_FREQ 16000000UL
typedef unsigned char byte;
signed int saim = 0;

#include <htc.h>
#include<stdlib.h>
#include "DHT11.h"
#include "ShiftLCD.h"
#include "EUART.h"
#include "ADC.h"
#include "SPI.h"
#include "SDCARD.h"
#include "PWM.h"
#include "EEPROM.h"
/*
__CONFIG(1, RETEN_OFF & INTOSCSEL_LOW & SOSCSEL_LOW & XINST_OFF & FOSC_INTIO2 & PLLCFG_OFF & FCMEN_OFF & IESO_ON);
__CONFIG(2, PWRTEN_OFF & BOREN_OFF & BORV_3 & WDTEN_OFF & WDTPS_4);
__CONFIG(3, MCLRE_OFF);
__CONFIG(4, STVREN_OFF & BBSIZ_BB1K);
__CONFIG(5, CP0_OFF & CP1_OFF & CP2_OFF & CP3_OFF & CPB_OFF & CPD_OFF);
__CONFIG(6, WRT0_OFF & WRT1_OFF & WRT2_OFF & WRT3_OFF & WRTC_OFF & WRTB_OFF & WRTD_OFF);
*/
 //IntOI2 mode is selected...

void wait(byte val)
{
    for(byte k = 0; k < val; k++)__delay_ms(10);
    
}
char received, received2;
int measured_value;
byte status;
byte buff[512] = {'D', 'e', 'n', 'e', 'm', 'e', 'l', 'i', 'k'};
void main()
{
//Internal oscillator selected...
SCS1 = 1;
SCS0 = 0;
INTSRC = 1;
MFIOSEL = 0;
__delay_ms(5);
//101 4MHZ
//110 8MHZ
//111 16MHZ
//16MHZ...
IRCF2 = 1;
IRCF1 = 1;
IRCF0 = 1;
__delay_ms(10);
//PLLEN = 1;
__delay_ms(10);
PWM2_initialize();
PWM3_initialize();
PWM4_initialize();
PWM5_initialize();
PWM2_set_value(100);
PWM3_set_value(300);
PWM4_set_value(500);
PWM5_set_value(700);
EEPROM_write_byte(10, 'J');
__delay_ms(5);
TRISF3 = 0; //LCD
TRISF4=0;
TRISF5=0;
LCD_init();
lcd_write("Temp : ");
UART1_init();
for(char k =0; k < 4; k++) UART1_byte_send(EEPROM_read_byte(10+k));
TRISB6 = 0; 
TRISB5 = 0;
PORTD = 0;
TRISD = 0x0;
RD0 = 0;
PORTE = 0;
PORTF = 0;
TRISF1 = 1;
TRISE = 0;
TRISD0 = 1;
SLRF = 0;
ANCON0 =0; ANCON1 = 0;
//for(byte d = 0; d < 5 ; d++) {__delay_ms(10); saim++;}
__delay_ms(10);
__delay_ms(10);
UART2_init();
ADC_init();
SPI_init();
PWM2_initialize();
__delay_ms(15);
DHT11_get_data();
PORTD = sicaklik;
//for(byte u = 0; u < 10; u++) denemelik[u] = 10-u;
TRISC1 = 0;
#define CS RC1
wait(25);
for(int j = 0; j < 512; j++) buff[j] = j;
//SDCARD_baslat ( ) ;
wait(100);
//SDCARD_bir_sektor_yaz( 0 , buff, 512) ;
//SDCARD_bir_sektor_oku( 0 , buff) ;
EEPROM_write_byte(10, 'S');
__delay_ms(5);
EEPROM_write_byte(11, 'a');
__delay_ms(5);
EEPROM_write_byte(12, 'i');
__delay_ms(5);
EEPROM_write_byte(13, 'm');
__delay_ms(5);
int k = 0;
int add_value = 20;
while(1)
{
    lcd_clear();
    //lcd_write("Temp : ");
    //lcd_write_number(sicaklik);
    //lcd_goto(2,1);
    //lcd_write("Moist : ");
    //lcd_write_number(nem);
//DHT11_get_data();
    if(k==0)
    {
    measured_value = ADC_read(0);
    k = 1;
    }
    else {
        k = 0;
            measured_value = ADC_read(1);

    }


    lcd_write_number(measured_value);
    wait(100);//1 sec

//sicaklik = measured_value;
//SPI_write('s');
} //while(1)
} // void main
