/* 
 * File:   SoftwareUART.h
 * Author: Saim
 *
 * Created on 07 Ocak 2020 Sal?, 21:11
 */

#ifndef SOFTWAREUART_H
#define	SOFTWAREUART_H

#ifdef	__cplusplus
extern "C" {
#endif

#define TXPIN RA4
#define RXPIN RA5
#define TRISTX TRISA4
#define TRISRX TRISA5
    
    void SoftwareUART_send_byte(byte data)
    {
        
        TXPIN = 0;
        __delay_us(99);
        for(byte i = 0; i != 8; i++)
        {
            TXPIN = data >> i;
            __delay_us(92);
        }
        
        
        TXPIN = 1;
        __delay_us(99);
        __delay_us(99);

        
    }
    
    byte Software_read_byte()
    {
        byte data = 0;
        while(RXPIN);
        __delay_us(150);
        for(byte i=0;i != 8;i++)
        {
            data |= RXPIN << i;
            __delay_us(86);
        }
        __delay_us(99);
        __delay_us(99);
        return data;
    }
    
    
    
    void SoftwareUART_initialize()
    {
        
        TRISRX = 1; //Rx input
        TRISTX = 0; //Tx output
        
        TXPIN = 1;//TX is high when idle..
        
    }


#ifdef	__cplusplus
}
#endif

#endif	/* SOFTWAREUART_H */

