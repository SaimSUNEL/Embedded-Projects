/* 
 * File:   SoftwareSPI.h
 * Author: Saim
 *
 * Created on 07 Ocak 2020 Sal?, 16:09
 */

#ifndef SOFTWARESPI_H
#define	SOFTWARESPI_H

#ifdef	__cplusplus
extern "C" {
#endif

#define MISO RA3
#define MOSI RA4
#define SCK RA5
    
#define TRISMOSI TRISA4
#define TRISMISO TRISA3
#define TRISSCK TRISA5
    
/*
 The clock polarity and the phase clock rates depend on which peripheral device you are trying to communicate with the master.
CPHA=0, CPOL=0: The first bit starts as a lower signal ? the data is sampled at rising edge and the data changes on falling edge.

CPHA=0, CPOL=1: The first bit starts with a lower clock ? the data is sampled at falling edge and the data changes on rising edge.

CPHA=1, CPOL=0: The first bit starts with a higher clock ? the data is sampled at falling edge and the data changes on rising edge.

CPHA=1, CPOL=1: The first bit starts with a higher clock ? the data is sampled at rising edge, and the data changes on falling edge.
 
 */    
    
    byte SPI_CPHA, SPI_CPOL ;
    byte SoftwareSPI_send_data(byte data)
    {
        byte received_data = 0;
        byte mode = (SPI_CPHA <<1)+SPI_CPOL; 
        byte prev_clk = SCK;

        for(signed char i=7; i!=-1; i--)
        {
            switch(mode)
            {
                case 0:
                    MOSI = (data >> i) & 0x1;

                    __delay_us(5);
                    SCK = 1;
                    __delay_us(5);
                    received_data |= MISO << i;
                    SCK = 0;
                    break;
                    
                case 1:
                     MOSI = (data >> i) & 0x1;

                     SCK = 1;
                     __delay_us(5);
                 
                    received_data |= MISO << i;
                    SCK = 0;

                    __delay_us(5);                   
                    break;
                    
                case 2:
                    MOSI = (data >> i) & 0x1;

                    
                    __delay_us(5);
                   received_data |= MISO << i;

                    SCK = 0;
                    
                    __delay_us(5);

                    SCK = 1;       
                    break;
                    
                case 3:
                    MOSI = (data >> i) & 0x1;
                    SCK = 0;
                    
                    __delay_us(5);

                    received_data |= MISO << i;
                    SCK = 1;
                    __delay_us(5);
          
                    break;
   
            }
     
        }
        __delay_us(5);
        SCK = prev_clk;
        return received_data;
    }
    
    
    void SoftwareSPI_initialize(byte CPHA, byte CPOL)
    {
        TRISMOSI = 0; //output
        TRISMISO = 1; //input
        TRISSCK = 0; //output
        SPI_CPHA = CPHA
            ;
        SPI_CPOL = CPOL;     
        
        if(SPI_CPOL == 0)
        {
            SCK = 0; //clock starts as low
        }
        else if(SPI_CPOL == 1)
        {
            SCK = 1; //clock starts as high
        }
            
    }
    
    


#ifdef	__cplusplus
}
#endif

#endif	/* SOFTWARESPI_H */

