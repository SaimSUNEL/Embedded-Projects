/*
 * _328pSDCARD.cpp
 *
 * Created: 02.09.2019 19:42:50
 *  Author: Saim
 */ 
typedef unsigned char byte;
byte buff[512];
#include <avr/atmega328.h>
#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include "SPI.h"
#include "SDCARD.h"




int main(void)
{

	DDRB = 0b00101100;
	SPI_ayarla();
	_delay_ms(5);
	SDCARD_baslat();
	_delay_ms(10);
	SDCARD_bir_sektor_oku( 0 , buff) ;
    while(1)
    {
        //TODO:: Please write your application code 
    }
}