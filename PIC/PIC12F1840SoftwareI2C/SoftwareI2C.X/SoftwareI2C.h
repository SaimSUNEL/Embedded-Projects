/* 
 * File:   SoftwareI2C.h
 * Author: Saim
 *
 * Created on 07 Ocak 2020 Sal?, 11:10
 */

#ifndef SOFTWAREI2C_H
#define	SOFTWAREI2C_H

#ifdef	__cplusplus
extern "C" {
#endif

#define SCLPIN RA5
#define SDAPIN RA2
#define TRISSCL TRISA5
#define TRISSDA TRISA2
#define  READ 2
#define WRITE 3    
    
    
    void SoftwareI2C_send_byte(byte data, byte ACK_STAT)
    {
        
        for(signed char i = 7; i !=-1; i-- )
        {
            //SCL low...
            SCLPIN = 0;
            TRISSCL = 0;
            __delay_us(15);
            
            SDAPIN = (data >> i) & 0x1;
            TRISSDA = (data >> i) & 0x1;
            __delay_us(15);
            
            
            //SCL high
            SCLPIN = 1;
            TRISSCL = 1;
            __delay_us(15);

            
        }
        //SCL low...
            SCLPIN = 0;
            TRISSCL = 0;
            
                    //8 clock completed...

            if(ACK_STAT == READ)
            {
            
        //SDA input to check ACK from slave...
        SDAPIN = 0;
        TRISSDA = 1;
        __delay_us(15);
        //SDA must be low, slave polls down for ACK....
        if(SDAPIN == 0)
        {
            
            
            
        }
        //SCL high and low for 9th clock
        SCLPIN = 1;
        TRISSCL = 1;
                    __delay_us(15);

         SCLPIN = 0;
            TRISSCL = 0;
            __delay_us(15);
            
            //SDA high
            SDAPIN = 1;
            TRISSDA = 1;
            __delay_us(15);
            //SDA low
             SDAPIN = 0;
            TRISSDA = 0;

            }
            else if(ACK_STAT == WRITE)
            {
             
                
            }
            

        
            
        
        
    }
    
    byte SoftwareI2C_read_byte()
    {
        byte data=0;
        SDAPIN = 0;
        TRISSDA = 1;
        __delay_us(5);
          for(signed char i = 7; i !=-1; i-- )
          {
              data |= SDAPIN << i;
                    SCLPIN = 1;
        TRISSCL = 1;
                    __delay_us(15);

         SCLPIN = 0;
            TRISSCL = 0;
            __delay_us(15);
              
          }
         //SDA high
             
        return data;
        
    }
    
    void SoftwareI2C_ACK()
    {
        SDAPIN = 0;
        TRISSDA = 0;
        __delay_us(15);
        
        //9th clock...
                  SCLPIN = 1;
        TRISSCL = 1;
                    __delay_us(15);

         SCLPIN = 0;
            TRISSCL = 0;
            __delay_us(15);
        
    }
    
    void SoftwareI2C_NACK()
    {
          SDAPIN = 1;
        TRISSDA = 1;
        __delay_us(15);
        
        //9th clock...
                  SCLPIN = 1;
        TRISSCL = 1;
                    __delay_us(15);

         SCLPIN = 0;
            TRISSCL = 0;
            __delay_us(15);
    }
    
    
    
    void SoftwareI2C_stop()
    {
        //when SCL=1
        SDAPIN = 0;
            TRISSDA = 0;
        
        SCLPIN = 1;
        TRISSCL = 1;
        __delay_ms(15);
        //transition of SDA 0 -> 1 Stop condition....
        SDAPIN = 1;
            TRISSDA = 1;
        
        
    }
    
    
    void SoftwareI2C_start()
    {
        SDAPIN = 0;
        SCLPIN = 0;
        
        __delay_us(3);
        
        
        //SDA LOW
        SDAPIN=0;
        TRISSDA = 0;
        __delay_us(5);
        //SCL HIGH
        
        
        
    }
    
    
    void SoftwareI2C_initialize()
    {
        //ANSEL must be set before using this function...
        
        
        
        //Both lines are high when idle...
        SCLPIN = 1;

        TRISSCL = 1;
        SDAPIN = 1;

        TRISSDA = 1;
        
        
        
    }
    



#ifdef	__cplusplus
}
#endif

#endif	/* SOFTWAREI2C_H */

