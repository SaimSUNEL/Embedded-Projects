/* 
 * File:   OneShiftRegisterSevenSegment.h
 * Author: Saim
 *
 * Created on 09 Nisan 2020 Per?embe, 23:34
 */

#ifndef ONESHIFTREGISTERSEVENSEGMENT_H
#define	ONESHIFTREGISTERSEVENSEGMENT_H

#ifdef	__cplusplus
extern "C" {
#endif



//----------------------------------------- START ----------------------------------------------------------
#define ONEREGPIN RA0
#define delayMicroseconds __delay_us
#define delay __delay_ms

void shift_register(byte data)
{
  
  
  
  for(int a=7; a >-1 ; a--)
  {
   if((data >> a) & 0x1)
  {
    
ONEREGPIN = 0;
asm("nop");
ONEREGPIN = 1;
//delayMicroseconds(1);
   delayMicroseconds(20);
  }
  else
  {
    //asm("cbi 0xe, 3\n\t");   
    ONEREGPIN = 0;
    //digitalWrite(SHIFT_PIN, 0);
    delayMicroseconds(14);
       // asm("sbi 0xe, 3\n\t");   
      ONEREGPIN = 1;
    //    digitalWrite(SHIFT_PIN, 1);
    delayMicroseconds(30);
    
  }
    
    
  }
  //asm("cbi 0xe, 3\n\t");   
ONEREGPIN = 0;
  //  digitalWrite(SHIFT_PIN, 0);
  delayMicroseconds(204);
  //asm("sbi 0xe, 3\n\t");   
ONEREGPIN = 1;
 // digitalWrite(SHIFT_PIN, 1);
  delayMicroseconds(320); 
}


byte SHIFT_REG_DATA;
void set_shift_pin(byte pin_number, byte value)
{
  if(value == 1)
  {
   SHIFT_REG_DATA |= 1 << pin_number;   
  }
  else if(value == 0)
  {
  SHIFT_REG_DATA &= ~(1 << pin_number);   
  }
  
  shift_register(SHIFT_REG_DATA);
  
}

#define SHIFT_DATA 1
#define SHIFT_CLK 0
#define DIGIT1 2
#define DIGIT2 3



byte rakamlar [] = {0b01000000, 0b11111001, 0b00100100, 0b00110000, 0b00011001, 0b00010010, 0b00000010, 0b11111000, 0b00000000, 0b00010000};

void set_digit(byte digit_number, byte value)
{
  for(int i = 7; i > -1 ; i--)
 {
   set_shift_pin(SHIFT_DATA, (value >> (i))&0x1);
   delayMicroseconds(3);
   set_shift_pin(SHIFT_CLK, 1);
   delay(1);
   set_shift_pin(SHIFT_CLK, 0);
   delay(1);
 } 
 
 if(digit_number == 1)
 {
 set_shift_pin(DIGIT1, 1);
 delay(1);
 set_shift_pin(DIGIT1, 0);
 delayMicroseconds(5);
 }
 else if(digit_number == 2)
 {
   set_shift_pin(DIGIT2, 1);
   delay(1);
   set_shift_pin(DIGIT2, 0);
    delayMicroseconds(5);

 }
  
}//void set_digit(byte digit_number, byte value)


void display_number(byte rakam)
{
  
  set_digit(2, rakamlar[rakam%10]);
  set_digit(1, rakamlar[rakam/10]);
  
}





#ifdef	__cplusplus
}
#endif

#endif	/* ONESHIFTREGISTERSEVENSEGMENT_H */

