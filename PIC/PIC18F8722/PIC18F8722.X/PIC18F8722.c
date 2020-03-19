
#define _XTAL_FREQ 4000000

#include <xc.h>

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

// CONFIG1H
#pragma config OSC = INTIO67    // Oscillator Selection bits (Internal oscillator block, port function on RA6 and RA7)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config IESO = ON       // Internal/External Oscillator Switchover bit (Two-Speed Start-up disabled)

// CONFIG2L
#pragma config PWRT = OFF       // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bits (Brown-out Reset disabled in hardware and software)
#pragma config BORV = 3         // Brown-out Voltage bits (Minimum setting)

// CONFIG2H
#pragma config WDT = OFF        // Watchdog Timer (WDT disabled (control is placed on the SWDTEN bit))
#pragma config WDTPS = 32768    // Watchdog Timer Postscale Select bits (1:32768)

// CONFIG3L
#pragma config MODE = MC        // Processor Data Memory Mode Select bits (Microcontroller mode)
#pragma config ADDRBW = ADDR20BIT// Address Bus Width Select bits (20-bit Address Bus)
#pragma config DATABW = DATA16BIT// Data Bus Width Select bit (16-bit External Bus mode)
#pragma config WAIT = OFF       // External Bus Data Wait Enable bit (Wait selections are unavailable for table reads and table writes)

// CONFIG3H
#pragma config CCP2MX = PORTC   // CCP2 MUX bit (ECCP2 input/output is multiplexed with RC1)
#pragma config ECCPMX = PORTE   // ECCP MUX bit (ECCP1/3 (P1B/P1C/P3B/P3C) are multiplexed onto RE6, RE5, RE4 and RE3 respectively)
#pragma config LPT1OSC = OFF    // Low-Power Timer1 Oscillator Enable bit (Timer1 configured for higher power operation)
#pragma config MCLRE = OFF      // MCLR Pin Enable bit (RG5 input pin enabled; MCLR disabled)

// CONFIG4L
#pragma config STVREN = OFF     // Stack Full/Underflow Reset Enable bit (Stack full/underflow will not cause Reset)
#pragma config LVP = OFF        // Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
#pragma config BBSIZ = BB2K     // Boot Block Size Select bits (1K word (2 Kbytes) Boot Block size)
#pragma config XINST = OFF      // Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

// CONFIG5L

// CONFIG5H
#pragma config CPB = OFF        // Boot Block Code Protection bit (Boot Block (000000-0007FFh) not code-protected)
#pragma config CPD = OFF        // Data EEPROM Code Protection bit (Data EEPROM not code-protected)

// CONFIG6L

// CONFIG6H

// CONFIG7L

// CONFIG7H
#pragma config EBTRB = OFF      // Boot Block Table Read Protection bit (Boot Block (000000-007FFF, 000FFF or 001FFFh) not protected from table reads executed in other blocks)
typedef unsigned char byte;

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

#define FALSE 0
#define TRUE 1

#include "ShiftLCD.h"
#include "ADC.h"
#include "EEPROM.h"
#include "PWM.h"
#include "SPI.h"
#include "I2C.h"
#include "DS1307.h"
#include "SDCARD.h"
#include "EUART.h"
int temp1, temp2;
int dat;    byte buff[64]={0};

void main()
{
    //INTSRC: Internal Oscillator Low-Frequency Source Select bit
    //1 = 31.25 kHz device clock derived from 8 MHz INTOSC source (divide-by-256 enabled)
    INTSRC = 1;
    //PLLEN: Frequency Multiplier PLL for INTOSC Enable bit(1)
    //1 = PLL enabled for INTOSC (4 MHz and 8 MHz only)
    //0 = PLL disabled
    PLLEN = 0;
    
    /*
     SCS<1:0>: System Clock Select bits(4)
1x = Internal oscillator block
01 = Secondary (Timer1) oscillator
00 = Primary oscillator
     */
    //SCS1 = 1;
   
    /*
     
     IRCF<2:0>: Internal Oscillator Frequency Select bits(5)
111 = 8 MHz (INTOSC drives clock directly)
110 = 4 MHz
101 = 2 MHz
100 = 1 MHz(3)
     */
    IRCF2 = 1; IRCF1 = 1; IRCF0 = 0;
    TRISB0 = 0;
    TRISE = 0;
    TRISC1 = 0; //SS pin
    RC1 = 1;
    ADC_init();
    LCD_init();
    PWM4_initialize();
    PWM5_initialize();
    I2C2_initialize(); //I2C is problemic with PIC18 on Proteus, needs to conduct real life testing...
    SPI_init();
    UART1_init();
    UART2_init();
    
    DELAY(150);
    DELAY100(6);
    PWM4_set_value(750);
    PWM5_set_value(500);
    lcd_write("Nisa & Saim");
    for(int c = 0; c < 15;c++)
        EEPROM_write_byte(c, c);
    
    dat = EEPROM_read_byte(14);
    
    //for(int j = 0; j < 64; j++) buff[j] = j;
    SDCARD_baslat ( ) ;
    //SDCARD_bir_sektor_yaz( 0 , buff, 64) ;
    SDCARD_bir_sektor_oku( 0 , buff) ;
    
    
    while(1)
    {
        
        
        temp1 = ADC_read(0);
        temp2 = ADC_read(1);
        RB0 = ~RB0;
        UART1_byte_send('S');
        UART2_byte_send('N');
       
        //DS1307_date();
        I2C2_Start();
        __delay_ms(1);
        I2C2_data_send(0b01010101);
        __delay_ms(1);
        I2C2_Stop();
        __delay_ms(1);
        
        
        DELAY100(10);
        
    }
    
    
    
}
        
        
        