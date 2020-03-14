/*Functions implemented...
void Segments_initialize()
void display_digit(byte number, byte segment_number)
void display_number(byte number)
*/

/*
Tamamlandý...
*/

/*All operations related to 7 segments will be performed here
*/

#define STORE1 RD4
#define STORE2 RD5 

void Segments_initialize()
{
TRISD = 0 ;
PORTD = 0;
}

void display_digit(byte number, byte segment_number)
{
PORTD = (PORTD&0xf0) + number;

if(segment_number ==1 ){STORE1=1;__delay_ms(1);STORE1=0; }
else {STORE2=1;__delay_ms(1);STORE2=0; }
}

void display_number(byte number)
{
display_digit( number / 10 , 1);
display_digit( number%10, 2);
}

/*******For 74hc595****
#define DATA RD1
#define SHIFT_CLOCK RD0
#define STORE1 RD2
#define STORE2 RD3 

byte  rakamlar []  = { 63 , 6 , 255 - ( (1 << 2) + (1 << 5) ) , 
 255 - (  + (1 << 4) + (1 << 5) ) , 255 - ( (1 << 0) + ( 1 << 3 ) + ( 1 << 4 ) ) ,
255 - ( 1 << 1 ) - ( 1 << 4  ) ,  255 - ( 1 << 1 ) ,  7 , 255 , 255 - ( 1 << 4 ) }   ; 	

void display_digit(byte number, byte segment_number)
{

for(int k=7; k >-1 ;k--)
{
DATA = (rakamlar[number] >> k)&0x1;
__delay_ms(1); 
SHIFT_CLOCK = 1;
__delay_ms(2);
SHIFT_CLOCK = 0;
}

if(segment_number ==1 ){STORE1=1;__delay_ms(1);STORE1=0; }
else {STORE2=1;__delay_ms(1);STORE2=0; }
}

void display_number(byte number)
{
display_digit( number / 10 , 1);
display_digit( number%10, 2);
}
*/