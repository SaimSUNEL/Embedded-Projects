
/* Main.c file generated by New Project wizard
 *
 * Created:   Cum Oca 23 2015
 * Processor: PIC16F877
 * Compiler:  HI-TECH C for PIC10/12/16
 */
 char gelen_veri[8];
#include <htc.h>
#define XTAL_FREQ 4MHZ
#define DelayMs __delay_ms
#define DelayUs __delay_us
#define TRUE 1
#define FALSE 0
#define SAG 2
#define SOL 3
int motor_suresi = 0;
char ortala = FALSE;
char motor_aktif = FALSE;
char motor_yon = 0;
int sayi=0;
int i;int j;
int kk = 0;
int sonuc=0;
int a=0;
char code[4];
volatile int temp=0;	
char array[50];
void kodu_coz()
{
sonuc=64*gelen_veri[1]+32*gelen_veri[2]+16*gelen_veri[3]+8*gelen_veri[4]+4*gelen_veri[5]+2*gelen_veri[6]+gelen_veri[7];
array[a++]=sonuc;
if(sonuc=='2'){RB1=1; RC0 = 1; RC2 = 1; RC1 = 0; RC3 = 0;  }
if(sonuc==22)RB1=~RB1;
if(sonuc==33)RB2=~RB2;
if(sonuc=='4'){
for(int b=0;b<3;b++)
	{
		RC7 = 1;
		 DelayUs( 1498 );
		 RC7 = 0;
		 DelayMs(19);
		DelayMs( 1 );	} 
	 
		

	}
if(sonuc=='5'){ 
for(int a=0;a<3;a++)
 {
	   RC7=1;
	 	  DelayUs(998);
		  RC7=0;
	   DelayMs(19);
	   DelayMs( 2 );
 }


	}
	if(sonuc=='7'){ RC0 = 0; RC2 = 0; RC1 = 1; RC3 = 1;  };
	
if(sonuc=='b'){ RB1 = 0; RC0 = 0; RC2 = 0; }
if(sonuc =='d' || sonuc  == 'e' ){
for(int b=0;b<4;b++)
	{
		RC7 = 1;
		 DelayUs( 1998 );
		 RC7 = 0;
		 DelayMs(19);
		DelayMs( 1 );	} 
	 
	 }


if(sonuc  == 'e' ){
for(int b=0;b<4;b++)
	{
		RC7 = 1;
		 DelayUs( 1998 );
		 RC7 = 0;
		 DelayMs(19);
		DelayMs( 1 );	} 
	 
	 }


if(sonuc=='g') {RC0 = 0; RC2 = 0; RC1 = 0; RC3 = 0; }
}


void coz()
{sayi=0;

	while( RB0 == 1 ) sayi++;
		temp = sayi;
	

	
	
	if( sayi > 150 && sayi < 162 )
{

	DelayUs( 250 -1 );
		DelayUs( 250 -1 );
	
	if( RB0 == 0 )
	{
	DelayUs( 240 -1 );
		DelayUs( 230 -1 );
	RC5 = RB0;
	RB7=1;
	
		
for( kk = 0 ; kk < 8 ; kk ++ )
{
	DelayUs( 250 );
	DelayUs( 120 );
	
	//RB5 = 1;
	gelen_veri[ kk ] = RB0;
	RC5 = RB0 ;
	DelayUs( 250 );
	DelayUs( 120 );
	//RB5 = 0;
	RC5 = RB0;
	DelayUs( 250 - 1 );
	DelayUs( 230 - 1 );
	DelayUs( 220 - 1 );
	
}
	
	
 
 
 kodu_coz();	
 
 
 
 
 
	}
	
	
			

	
	
	
	
	}
	
	
	

	
	
	
	
	
	
	}
void main(void)
 {
   TRISB=0b00000001;
	 PORTB=0;
	 
	 TRISC=0;
	 PORTC=0;
	 
	
	 
	 // Write your code here
   while (1)
   {
	 

	  
	  
	   
	   
	 
	   if(RB0==1)
	   {
		   coz();
		  }
		  
		 
		  
		 
		  
		 
	  } 
	  
 
 }
