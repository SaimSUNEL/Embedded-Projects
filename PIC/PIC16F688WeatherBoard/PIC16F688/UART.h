



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
 TRISC5 = 1 ;
   //Tx pini digital output...
  TRISC4 = 0 ; 
   
   //Async mode...
   SYNC = 0 ;
   //9600 baud rate for 4MHz..
   BRGH = 1;
   BRG16 = 0 ;
   SPBRG = 51;//25 ;
   //continuous receive enabled...
   CREN = 1 ;
   //Serial port enable...
   SPEN = 1 ;
   TXEN = 1 ;


	RCIE = 0; //Receiver interrupt is enabled...
   RCREG;
   
   
   
   
}


void UARTReadString()
{
byte * curr = current_buffer;
byte index = 0 ;
byte data;
while( (data = UART_byte_receive()) != '\n')
{
curr[index] = data;
index++;
__delay_ms(2);

UART_byte_send(data);
__delay_ms(2);
}
curr[index] = data;
UART_byte_send(data);
__delay_ms(2);



}
/*
void UARTReadString()
{
	tekrar:;
	byte * curr = current_buffer;
	byte index = 0 ;
	while(curr[index] != '\r' && curr[index+1] != '\n' && index < available_byte_count)
		index++;
	if(index == available_byte_count) goto tekrar;
}
*/
void UARTSendString(byte * p )
{
while(*p != '\n')
{
UART_byte_send(*p);
__delay_ms(1);
p++;

}
UART_byte_send(*p);




}

