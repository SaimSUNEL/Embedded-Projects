

void UART_byte_send ( byte data )
{
   while ( !TXIF ) ;
      TXREG = data ;
   
   
}

byte UART_byte_receive  ( )
{
   while ( !RCIF ) ;
 return RCREG ;
  
}



void UART_init ( ) 
{
   //Rx pin digital input
 ANSA1 = 0 ;
 TRISA1 = 1 ;
   //Tx pini digital output...
   ANSA0 = 0 ;
  TRISA0 = 0 ; 
   
   //Async mode...
   SYNC = 0 ;
   //9600 baud rate for 16MHz..
   BRGH = 0;
   BRG16 = 0 ;
   SPBRG = 25 ;
   //continuous receive enabled...
   CREN = 1 ;
   //Serial port enable...
   SPEN = 1 ;
   TXEN = 1 ;


	RCIE = 1; //Receiver interrupt is enabled...
   RCREG;
   
   
   
   
}