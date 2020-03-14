/* 
 * File:   POEM.h
 * Author: Saim
 *
 * Created on 05 Eylül 2019 Per?embe, 02:56
 */

#ifndef POEM_H
#define	POEM_H

#include "EEPROM24C64.h"


#ifdef	__cplusplus
extern "C" {
#endif
    
    unsigned int poem_size, poe;
    byte * poem_size_point = (byte *)&poem_size;
    void showPoem()
    {
        lcd_clear(); 
        *(poem_size_point+1) = EEPROM24C64_read_byte(0);
        *poem_size_point = EEPROM24C64_read_byte(1);
        for(poe=1; poe != poem_size+1; poe++)
        {

            lcd_yaz(EEPROM24C64_read_byte(poe+1));
            if(poe % 32 == 0)
            {
                DELAY100(40);
                lcd_clear(); 
            }
            
        }
        
    }



#ifdef	__cplusplus
}
#endif

#endif	/* POEM_H */

