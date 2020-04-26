/*
 * File:   PIC12F184016ChannelPWM.c
 * Author: Saim
 *
 * Created on 25 Mart 2020 Çar?amba, 16:46
 */

#define _XTAL_FREQ 4000000
#define true 1
#define false 0
typedef unsigned char byte;
;


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
#include "I2C.h"
#include "PCA9685.h"
void main()
{
    ANSELA = 0; //All ADC inputs are disabled...
    
    TRISA = 0b00111110;
 
    SPLLEN = 0;
//16 mhz 1111 internal oscillator
//8MHZ 1110
    //1101 4 MHZ    
//8MHZ - 1110
IRCF3 = 1;
IRCF2 = 1;
IRCF1 = 0;
IRCF0 = 1;

SCS1 = 1 ; //Internel oscillator
SCS0 = 0;
I2C_initialize();
DELAY(120);
PCA9685_init(); // init driver...
PCA9684_set_pwm(1, 1024);
PCA9684_set_pwm(2, 3072);
PCA9684_set_pwm(3, 4096);




//PCA9685 Adress 1A5A4A3A2A1A0R/W
//0b00000110 reset call
while(true)
{
    for(int a = 0; a < 4096; a += 100 )
    {
        PCA9684_set_pwm(0, a);
        __delay_ms(25);
        __delay_ms(25);
        __delay_ms(25);
        __delay_ms(25);
    }
 
     for(int a = 4095; a > 0; a -= 100 )
    {
        PCA9684_set_pwm(0, a);
        __delay_ms(25);
        __delay_ms(25);
        __delay_ms(25);
         __delay_ms(25);

    }
    
    
    DELAY100(10);
}

}
