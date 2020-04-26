/* 
 * File:   INTERRUPT.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 14:32
 */

#ifndef INTERRUPT_H
#define	INTERRUPT_H

#include "UART.h"
#include "EEPROM.h"
#include "EEPROMAT24C1024B.h"
#include "PCF8574.h"
#include "EEPROM24C64.h"



#ifdef	__cplusplus
extern "C" {
#endif

    byte input_count;
    byte output_count;
byte received_data;
unsigned int pass_count = 0, fail_count = 0;

void check_circuit(byte send_data)
{
    pass_count = fail_count = 0;
    input_count = EEPROM_ReadByte(0);
    output_count = EEPROM_ReadByte(0);
    
    if(send_data)
    {
                      UART_byte_receive();//dummy read
                           UART_byte_send(input_count);
                           __delay_ms(1);   
                           
                            UART_byte_receive();
                           UART_byte_send(output_count);
                           __delay_ms(1);
                           UART_byte_receive();
        
    }
    
    
    
    unsigned int configuration_count = (EEPROM_ReadByte(2) << 8) + EEPROM_ReadByte(3);
    
    if(send_data)
    {
                    UART_byte_send(configuration_count>> 8);
                           __delay_ms(1);   
                           
                            UART_byte_receive();  
        UART_byte_send(configuration_count & 0xff);
                           __delay_ms(1);   
                           
                            UART_byte_receive();
    }
    
    byte output1 = 0, output2 = 0, correct1, correct2;
    
    //8bit can hold 8 configurations...
    byte result_byte = 0;
    for (unsigned int i = 0; i < configuration_count; i++)
    {
        //Configuration 
        PCF8574_value[0] = i & 0xff;
        PCF8574_value[1] = (i >> 8) & 0xff;
       
        PCF8574_load_data(0, PCF8574_value[0]);
        PCF8574_load_data(1, PCF8574_value[1]);
        __delay_ms(25);
     
        if (output_count > 8)
        {
            for(byte j=0; j < 5; j++)
            output1 = PCF8574_read(2); //lower byte
            for(byte j=0; j < 5; j++)
            output2 = PCF8574_read(3);//higher byte
            correct1 = EEPROMAT24C1024B_read_byte(i*2);
            correct2 = EEPROMAT24C1024B_read_byte(i*2+1);
            
            for(byte k = output_count - 8; k < 8; k++)
            {
                output2 &= ~(1 << k);
            }
            
            if(send_data)
            {
                UART_byte_send(output1);
                __delay_ms(1);
                UART_byte_receive();
                UART_byte_send(correct1);
                __delay_ms(1);
                UART_byte_receive();
                UART_byte_send(output2);
                __delay_ms(1);
                UART_byte_receive();
                UART_byte_send(correct2);
                __delay_ms(1);
                UART_byte_receive();
                
                
            }
            
            
            
            if(output1 == correct1 && output2 == correct2){ pass_count ++;
            result_byte |= 1 << (7-i%8);
            }
            else{ fail_count ++;
            
            }
            
            
             if (i % 8 == 7)
            {
                EEPROM24C64_start_write_page((i+1)/8);

                EEPROM24C64_write_page(result_byte);
                result_byte = 0;
                
                EEPROM24C64_stop_write_page();  
                __delay_ms(6);
                
            }
            
        }
        else
        {
            for(byte j=0; j < 5; j++)
            output1 = PCF8574_read(2); //lower byte
            
            correct1 = EEPROMAT24C1024B_read_byte(i);
            
            
            for(byte k = output_count; k < 8; k++)
            {
                output1 &= ~(1 << k);
            }
            
            if(send_data)
            {
                  UART_byte_send(output1);
                __delay_ms(1);
                UART_byte_receive();
                UART_byte_send(correct1);
                __delay_ms(1);
                UART_byte_receive();
                
                
            }
            
            
            if(output1 == correct1) {pass_count ++;
            result_byte |= 1 << (7-i%8);
            
            /*
               EEPROM24C64_start_write_page(i+256);

                EEPROM24C64_write_page(1);
                
                EEPROM24C64_stop_write_page();  
                __delay_ms(6);
              */  
            
            
            }
            else {fail_count ++;
            
           /* EEPROM24C64_start_write_page(i+256);

                EEPROM24C64_write_page(0);
                
                EEPROM24C64_stop_write_page();  
                __delay_ms(6);
            */
            }
            
            if (i % 8 == 7)
            {
                EEPROM24C64_start_write_page((i)/8);

                EEPROM24C64_write_page(result_byte);
                result_byte = 0;
                
                EEPROM24C64_stop_write_page();  
                __delay_ms(6);
                
            }
            
        
        }
        
        
        
        
        
        
    }//for loop
    

    
    
}




unsigned int configuration_count; 
void interrupt FNC(void)
    {        
        if(RCIF)
        {
            received_data = UART_byte_receive();
            __delay_ms(1);
            UART_byte_send('T');
            __delay_ms(10);
            
            received_data = UART_byte_receive();
            if (received_data == 'T') //if hand shake occurs...
            {
                       __delay_ms(1);
                       UART_byte_send('T');
                       received_data = UART_byte_receive();
                       
                       if(received_data == 'N') //new configuration will be sent...
                       {
                           __delay_ms(1);
                           UART_byte_send('T');
                           input_count = UART_byte_receive();
                           
                           
                           EEPROM_WriteByte(0, input_count);
                           __delay_ms(1);
                           UART_byte_send('T');
                           output_count = UART_byte_receive();
                           EEPROM_WriteByte(1, output_count);
                           __delay_ms(1);
                           UART_byte_send('T');
                           
                           received_data = UART_byte_receive();
                                                      
                           configuration_count = received_data << 8;
                           EEPROM_WriteByte(2, received_data);
                           UART_byte_send('T');

                           received_data = UART_byte_receive();

                           configuration_count |= received_data;
                           EEPROM_WriteByte(3, received_data);
                           UART_byte_send('T');
                           unsigned int byte_location;
                           EEPROMAT24C1024B_start_write_page(0);
                           for(unsigned int i=0; i < configuration_count ; i++ )
                           {
                               received_data = UART_byte_receive();
                               
                               if(output_count < 9)
                               {
                                   byte_location = i+2;
                                   EEPROMAT24C1024B_write_page(received_data);
                                   __delay_ms(1);
                                    UART_byte_send('T');
                                                                     
                               }
                               else
                               {
                                   byte_location = i*2+2;
                                   EEPROMAT24C1024B_write_page(received_data);
                                   __delay_ms(1);
                                    UART_byte_send('T');
                                    received_data = UART_byte_receive();
                                    byte_location+=1;
                                     EEPROMAT24C1024B_write_page(received_data);
                                   __delay_ms(1);
                                    UART_byte_send('T');
                                    
                                    
                               }
                           }
                           
                           EEPROMAT24C1024B_stop_write_page();
                           __delay_ms(10);
                           //UART_byte_send('T');
                           
} // 'N'
                       else if (received_data == 'S') //Test and return results via UART
            {
                            __delay_ms(1);
                           UART_byte_send('T');
                           __delay_ms(1);
                           
                           check_circuit(true);
                           
                
                                                      
                           
                           UART_byte_send('T');
                           __delay_ms(1);

                
            }

                
                
            }
            else ;
            
            
        }
        
         
        if(IOCIF)
        {
            RA4 = ~RA4;
            DELAY100(5);
            IOCAF = 0;

            IOCIF = 0; //clear flag...
            check_circuit(false);
        }
        
          
        }
        
    


#ifdef	__cplusplus
}
#endif

#endif	/* INTERRUPT_H */

