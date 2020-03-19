/* 
 * File:   EUART.h
 * Author: Saim
 *
 * Created on 01 Eylül 2019 Pazar, 19:20
 */

#ifndef EUART_H
#define	EUART_H

#ifdef	__cplusplus
extern "C" {
#endif
    void UART1_byte_send ( byte data )
{
   while ( !PIR1bits.TX1IF ) ;
      TXREG1 = data ;
   
   
}

byte UART1_byte_receive  ( )
{
   while ( !PIR1bits.RC1IF ) ;
     return RCREG1 ;
  
}



void UART1_init ( ) 
{
   //Rx pin digital input
 TRISC7 = 1 ; //RX1
   //Tx pini digital output...

  TRISC6 = 0 ; //TX1 
   
   //Async mode...
   TXSTA1bits.SYNC = 0 ;
   //9600 baud rate for 16MHz..
   TXSTA1bits.BRGH = 1;
   TXSTA1bits.TXEN = 1 ;
   BAUDCON1bits.BRG16 =0;
   SPBRG1 = 25 ; //4 MHZ 96000
   //continuous receive enabled...
   RCSTA1bits.CREN = 1 ;
   //Serial port enable...
   RCSTA1bits.SPEN = 1 ;
   PIR1bits.TX1IF = 0;
   


	 // RCIE = 1; //Receiver interrupt is enabled...
   RCREG1;
   
   
   
   
}

   void UART2_byte_send ( byte data )
{
   while ( !PIR3bits.TX2IF ) ;
      TXREG2 = data ;
   
   
}

byte UART2_byte_receive  ( )
{
   while ( !PIR3bits.RC2IF ) ;
     return RCREG2 ;
  
}



void UART2_init ( ) 
{
   //Rx pin digital input
 TRISG2 = 1 ; //RX2
   //Tx pini digital output...

  TRISG1 = 0 ; //TX2 
   
   //Async mode...
   TXSTA2bits.SYNC = 0 ;
   //9600 baud rate for 4MHz..
   TXSTA2bits.BRGH = 1;
   TXSTA2bits.TXEN = 1 ;
   BAUDCON2bits.BRG16 =0;
   SPBRG2 = 25 ; //4 MHZ 96000
   //continuous receive enabled...
   RCSTA2bits.CREN = 1 ;
   //Serial port enable...
   RCSTA2bits.SPEN = 1 ;
   PIR3bits.TX2IF = 0;
   


	 // RCIE = 1; //Receiver interrupt is enabled...
   RCREG2;
   
   
   
   
}

#ifdef	__cplusplus
}
#endif

#endif	/* EUART_H */

