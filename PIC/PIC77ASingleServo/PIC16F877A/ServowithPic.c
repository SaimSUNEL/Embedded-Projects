
#include<htc.h>
#define DelayMs __delay_ms
#define DelayUs __delay_us
int app , wait , times ,ind;
 void servo_dondur( unsigned char angle )
{


 wait = 540 +  8* angle   ;
times = wait/ 250;
	
 for (  app = 0 ; app < 6 ; app++ )
 {
  RB0 = 1;


for( ind = 0 ; ind < times ; ind ++ )
{
  
DelayUs( 250 );


}

for(int c=0; c < wait % 250 - 10; c++)
DelayUs( 1);




RB0 = 0;
DelayMs( 19 );
 }
  
  
}




void main()
{
	TRISB = 0;
	PORTB = 0;
	int x;
	//servo_dondur( 90 );
	servo_dondur( 20 );
while( 1 )
{
/*
	for( x=0; x < 180 ; x++ )
{
	servo_dondur( x );
	DelayMs( 15 );
	
}

*/


}	
	
	
}