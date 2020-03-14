/* 
 * File:   INTERRUPT.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 14:32
 */

#ifndef INTERRUPT_H
#define	INTERRUPT_H

#include "UART.h"
#include "INSELECT.h"
#include "ADC.h"
#include "EEPROM.h"
#include "LCD.h"
#include "ALARM.h"



#ifdef	__cplusplus
extern "C" {
#endif
       byte received_data;
    byte message_id ;
    byte alarm_id = 1;
    byte current_alarm_count;
    byte global_index, global_index2;
    unsigned int byte_count;
    byte * pp = (byte *)&byte_count;

    byte eeprom_index = 0;
    unsigned int message_location;
    byte komut;
    byte start;
    byte UPDATE_NEAREST_ALARM = false;
    byte EXTRA_INFO_SHOW = false;

    byte data_sent;

    byte PINS = 0;
    
    
    void pinControl()
    {
        INSELECT_select(3);
        if(RA4)  {shift_reg_set_pin_lcd(7, 0); }//Buzzer in 7
        
        INSELECT_select(2);
        if(RA4){DISPLAY_POEM = true; }
        INSELECT_select(4);
        if(RA4){  //lcd led on 0. pin
            
            LCD_LED_ON ^= 1;
            shift_reg_set_pin_lcd(0, LCD_LED_ON);
           
        }
        }


    void commondUART()
    {
         UART_byte_send(data_sent);
           DELAY(2);
       
    }
    
    void sendT()
    {
        UART_byte_send('T');
           DELAY(2);
    }
       void receiveStruct()
    {
        received_data = UART_byte_receive(); //Get which pin to read...
                sendT();
    }
    void interrupt FNC(void)
    {
                
        
        if(RCIF)
        {
            komut = UART_byte_receive();
            sendT();
            current_alarm_count = EEPROM_ReadByte(0);
            if(komut == 'R')
            {
                
                data_sent = current_alarm_count;
                    commondUART();
                    
                    
                    UART_byte_receive();

                    start = 1;
                    global_index = 0;
                    while( global_index != current_alarm_count )
                    {
                        while(EEPROM_ReadByte(start) ==0x00) start += 7;
                        global_index2= 0;
                        while( global_index2 != 7)
                        {
                            // if(l ==6) UART_byte_send(EEPROM_ReadByte(l+start)&0xf); //message count
                            
                            data_sent = EEPROM_ReadByte(global_index2+start);
                            commondUART();
                            UART_byte_receive();
                            global_index2++;
                        }
                        start += 7;
                    global_index++;
                    }
                    
            }//komut = 'R'
            else if(komut == 'S')        
            {
                
                    
                  //Message read...
                    message_id = UART_byte_receive();//receive Alarm id...
                    //UART_byte_send('T');
                    //__delay_ms(3);
                    //data_sent = 'T';
                     //       commondUART();
                                sendT();

                    
                   message_location = (message_id-1)*(320);
                    byte message_count = EEPROM_ReadByte((message_id)*7) & 0xf;
                    
                    data_sent = message_count;
                    commondUART();
                    //UART_byte_send(message_count); //send how many messages will be sent...
                    //__delay_ms(3);
                    
                    UART_byte_receive();
                    byte mes_id = 1;
                    byte leng;
                    for(global_index=0; global_index != message_count ; global_index++)
                    {
                        while((leng = EEPROM24C32_read_byte(message_location)) == 0){message_location +=64; mes_id++;}
                        data_sent = mes_id;
                        commondUART();
                        
                        //UART_byte_send(mes_id); //message id sent...
                        //__delay_ms(3);
                        
                        UART_byte_receive();
                        //byte leng = EEPROM24C32_read_byte(message_location);
                        data_sent = leng;
                        commondUART();
                        
                        //UART_byte_send(leng); //message len...
                        //__delay_ms(3);
                        UART_byte_receive();

                        for(global_index2=1; global_index2 != leng+1; global_index2++) //Message itself...
                        {
                            data_sent = EEPROM24C32_read_byte(message_location+global_index2);
                            commondUART();
                            
                            //UART_byte_send();
                            //__delay_ms(3);
                            UART_byte_receive();
                        }
                        message_location +=64; mes_id++;
                    }
                    
            }
            else if(komut == '#' || komut == 'U' || komut == 'N' || komut == 'M' || komut == 'A' || komut == 'P' || komut == 'L' )       
            {
                //case 'U': //set time  
                //case 'N'://set date...
                //case 'M'://Message add
                //case 'A'://alarm add
                //case 'P'://Poem addd...
                   
                  if(komut=='M')
                    {
                        //message belongs to which alarm id..... Each alarm can have at most 5 messages....
                        message_id = UART_byte_receive();
                        message_location = (message_id-1)*(320);
                       while(EEPROM24C32_read_byte(message_location) != 0)message_location += 64;
                        byte temp2 = (message_id)*7;
                 
                        EEPROM_WriteByte(temp2 , EEPROM_ReadByte(temp2)+1);//message count increase...
                        
                        sendT();
                        //data_sent = 'T';
                        //commondUART();
                        //UART_byte_send('T');
                        //__delay_ms(2);
                    }
                    
                    
                    *(pp+1) = UART_byte_receive();
                    if(komut == 'P')EEPROM24C64_write_byte(0, received_data);
                   // data_sent = 'T';
                     //   commondUART();
                    //UART_byte_send('T');
                    sendT();
                    received_data = UART_byte_receive();
                    if(komut == 'P')EEPROM24C64_write_byte(1, received_data);
                    *pp =received_data;
                    if( komut == 'A') //alarm add...
                    {
                        eeprom_index= 1;
                        alarm_id = 1;
                        current_alarm_count +=1; 
                        EEPROM_WriteByte(0, current_alarm_count); //increase alarm count...
                        while(EEPROM_ReadByte(eeprom_index) != 0){ eeprom_index += 7; alarm_id += 1;}
                        EEPROM_WriteByte(eeprom_index, alarm_id);
                    }
                    
                    if(komut=='M') //Writing message lenght...
                    {
                        EEPROM24C32_write_byte(message_location, byte_count);
                    }
                    //data_sent = 'T';
                     //   commondUART();
                    sendT();
                    //UART_byte_send('T');
                    for(measured_adc_value=0; measured_adc_value != byte_count; measured_adc_value++)
                    {
                        received_data = UART_byte_receive();
                        if(komut == 'P')EEPROM24C64_write_byte(measured_adc_value+2, received_data);
                        else if(komut == 'A') EEPROM_WriteByte(eeprom_index+measured_adc_value+1, received_data);   
                        else if(komut == 'M') EEPROM24C32_write_byte(message_location+measured_adc_value+1, received_data);
                        else if(komut == 'U' ||komut == 'N') time_array[measured_adc_value] = received_data;
                        else if(komut == 'L') EEPROM_WriteByte(248+measured_adc_value, received_data); 
                        else if(komut == '#')if(received_data != 0xff)EEPROM_WriteByte(232+measured_adc_value, received_data);
                        //data_sent = 'T';
                        //commondUART();
                        sendT();
                        //UART_byte_send('T');
                        //__delay_ms(3);
                        

                    }
                    
                    if(komut == 'U')DS1307_set_shared(0);
                    else if(komut == 'N') DS1307_set_shared(4);
                    else if(komut == '#')
                        EXTRA_INFO_SHOW = true;
        
            }
            else if(komut == 'C' )
            {
                //Clear EEPROM...
                    for(global_index = 0; global_index !=248 ; global_index++)
                        EEPROM_WriteByte(global_index, 0);
                    for(global_index=0; global_index !=30; global_index++)
                        EEPROM24C32_write_byte(global_index*64, 0);
            }
            else if(komut == 'J')
            {
                 message_id = UART_byte_receive();//receive Alarm id...
                        //data_sent = 'T';
                        //commondUART();
                     sendT();
                     //UART_byte_send('T');
                    //__delay_ms(3);
                    byte m_id = UART_byte_receive();
                    sendT();

                    
                     message_location = (message_id-1)*(320)+(m_id-1)*64;
                    start = (message_id)*7;
                    EEPROM_WriteByte(start, EEPROM_ReadByte(start)-1); 
                    EEPROM24C32_write_byte(message_location, 0);
                    
            }
            else if(komut == 'D')
            {
               // case 'D': //Delete a alarm..
                 message_id = UART_byte_receive();//receive Alarm id...
                                       
                    message_location = (message_id-1)*(320);
                    EEPROM_WriteByte((message_id-1)*7+1, 0); 
                    for(global_index = 0; global_index != 5;global_index++)
                    {
                        EEPROM24C32_write_byte(message_location+global_index*64, 0); //Clear messages...
                    }
                    EEPROM_WriteByte(0, current_alarm_count-1);
            }
            else if(komut=='V') //Send ADC result...
            {
                
                receiveStruct();
                
                ADC_read(received_data);
                byte * l = (byte *)&measured_adc_value;
                data_sent = *l;
                commondUART();
                UART_byte_receive();
                l++; 
                data_sent = *l;
                commondUART();
                UART_byte_receive();

            }
            else if(komut=='B') //Send sicaklik, nem result...
            {
                data_sent = sicaklik;
                commondUART();
                UART_byte_receive();
               
                data_sent = nem;
                commondUART();
                UART_byte_receive();

            }
            else if(komut == 'Y') //for sending thresholds....
            {
                for(eeprom_index=0; eeprom_index != 8;eeprom_index++)
                {
                    data_sent = EEPROM_ReadByte(248+eeprom_index);
                    commondUART();
                    UART_byte_receive();
                }
            }
            else if( komut == '!')
            {
               // received_data = UART_byte_receive();
                     //           sendT();
                receiveStruct();
                
               if(received_data == 1)LCD_LED_ON = 1;                 
               shift_reg_set_pin_lcd((received_data >> 4)&0xf, received_data&0xf);
                
            }
            else if(komut=='*')
            {
                // received_data = UART_byte_receive();
                                //sendT();
                receiveStruct();
                PINS = received_data;
                                LoadDataCenter(6, received_data);
            }
            else if(komut=='-')
            {
                data_sent = PINS;
                    commondUART();
                    UART_byte_receive();
            }
             /* else if(komut == '#') //for sending infos.......
            {
                    for(global_index = 0; global_index < 16;global_index++)
                     {
                         extra_info[global_index] = UART_byte_receive();
                         
                         sendT();
                     }
                    EXTRA_INFO_SHOW = true;
            }
            */
            
               // findClosestAlarm();
            UPDATE_NEAREST_ALARM = true;
        //UART_byte_send('T');
         //           __delay_ms(3);
            sendT();
        }
        
         
        if(IOCIF)
        {
                      pinControl();
                      IOCIF = 0; //clear flag...
        }
        
          
        }
        
    


#ifdef	__cplusplus
}
#endif

#endif	/* INTERRUPT_H */

