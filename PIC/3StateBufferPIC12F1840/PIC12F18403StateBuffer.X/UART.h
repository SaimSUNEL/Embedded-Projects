/* 
 * File:   UART.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 11:12
 */

#ifndef UART_H
#define	UART_H

#ifdef	__cplusplus
extern "C" {
#endif



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
 //TRISA5 = 1 ;
   //Tx pini digital output...
  //TRISA0 = 0 ; 
   
   //Async mode...
   SYNC = 0 ;
   //9600 baud rate for 16MHz..
   BRGH = 0;
   BRG16 = 0 ;
   SPBRG = 12;//25 ;
   //continuous receive enabled...
   CREN = 1 ;
   //Serial port enable...
   SPEN = 1 ;
   TXEN = 1 ;


	RCIE = 1; //Receiver interrupt is enabled...
   RCREG;
   
   
   
   
}


#ifdef	__cplusplus
}
#endif

#endif	/* UART_H */

