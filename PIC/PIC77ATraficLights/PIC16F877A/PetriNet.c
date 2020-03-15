
#include<htc.h>
#define DelayMs __delay_ms
#define DelayUs __delay_us

#define KIRMIZI 0b00000001
   #define SARI 0b00000010
#define YESIL_1 0b00000100
#define YESIL_2 0b00001000

#define LAMP1 PORTB
#define LAMP2 PORTC
#define LAMP3 PORTD
#define LAMP4 PORTA


void main()
{
	
	TRISB = 0; 
	PORTB = 0;
	 TRISC = 0;
	PORTC = 0;
	TRISD = 0;
	TRISA = 0;
	PORTA = 0;
	PORTD = 0;
	
	
	
	while( 1 )
	{
	
		
		
		
		
		
		LAMP1 = YESIL_1 | YESIL_2;
	
		LAMP3 = YESIL_1 | YESIL_2;
	
	
	
	
		LAMP2 = KIRMIZI;
		LAMP4 = KIRMIZI;
		
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		
		
		LAMP1 = 0;
		LAMP3 = 0;
		
		
		DelayMs( 250 );
		
		LAMP1 = YESIL_1 | YESIL_2;
	
		LAMP3 = YESIL_1 | YESIL_2;
		DelayMs( 250 );
		
		
		
		LAMP1 = 0;
		LAMP3 = 0;
		
		
		DelayMs( 250 );
		
		
		
		LAMP1 = YESIL_1 | YESIL_2;
	
		LAMP3 = YESIL_1 | YESIL_2;
		
		
		
		DelayMs( 250 );
		
		
		LAMP1 = SARI;
		LAMP3 = SARI;
		LAMP2 = SARI;
		LAMP4 = SARI;
		
		
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		
		LAMP1 = KIRMIZI;
		LAMP3 = KIRMIZI;
		LAMP2 = YESIL_1 | YESIL_2;
		LAMP4 = YESIL_1 | YESIL_2;
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		LAMP2 = 0;
		LAMP4 = 0;
		
		
		DelayMs( 250 );
		
		LAMP2 = YESIL_1 | YESIL_2;
		LAMP4 = YESIL_1 | YESIL_2;
		
		DelayMs( 250 );
LAMP2 = 0;
		LAMP4 = 0;

		DelayMs( 250 );
		
		LAMP2 = YESIL_1 | YESIL_2;
		LAMP4 = YESIL_1 | YESIL_2;
DelayMs( 250 );
LAMP1 = SARI;
		LAMP3 = SARI;
		LAMP2 = SARI;
		LAMP4 = SARI;
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );
		DelayMs( 250 );




}
	
	
	
	
	
	
	
}