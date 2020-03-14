/* 
 * File:   Alarm.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 17:21
 */

#ifndef ALARM_H
#define	ALARM_H

#include "EEPROM.h"
#include "EEPROM24C32.h"
#include "UART.h"
#include "LCD.h"
#include "INSELECT.h"
#include "ADC.h"


#ifdef	__cplusplus
extern "C" {
#endif

/*
 1 byte - id
 1 byte - yil
 1 byte - ay
 1 byte - gun
 1 byte - hour
 1 byte - minute
1 byte - message count
 
 
 */
    

    byte extra_info[16];

    unsigned int threshold;
    byte * threshold_point = (byte *)&threshold;
    byte ALARM_SET = false;
void checkSensors()
{tekrar_olc:;
    byte any = false;
    for(start=0; start != 4; start++)
    {
        INSELECT_select(start);
        ADC_read(start);
        
        *threshold_point =EEPROM_ReadByte(248+start*2);;
               
        *(threshold_point+1) =  EEPROM_ReadByte(248+start*2+1); ;
        if(measured_adc_value >= threshold)
        {
            any = true;
            lcd_clear();
            lcd_write("Sensor ");
            lcd_yaz(49+start);
            lcd_write(" ALARM");
            shift_reg_set_pin_lcd(7, 1); //Buzzer in 7
            inselect |= 1 << (3+start);
           	LoadDataCenter(3, inselect);
           
            ALARM_SET = true;
        }
        
    }
    if(!any) {ALARM_SET = false;shift_reg_set_pin_lcd(7, 0); inselect &= 0x7;
           	LoadDataCenter(3, inselect);}
    else goto tekrar_olc;
    
}
    
    byte closest_alarm[5];
     byte closes_alarm_index,  closest_alarm_start_loc=1;

extern unsigned int message_location;     
void showAlarmMessage()
{
  byte mes_count =   EEPROM_ReadByte(closes_alarm_index*7) & 0xf;
  message_location = (closes_alarm_index-1)*(64*5);
  byte kk = 0;
  for(char l=0; l != mes_count ; l++)
  {
      lcd_clear();
      while((kk = EEPROM24C32_read_byte(message_location)) == 0) message_location += 64;
      for(char j = 1; j != kk+1; j++)
      {
         lcd_yaz(EEPROM24C32_read_byte(j+message_location));
         if(j % 32 == 0)
         {
             DELAY100(30);
             lcd_clear();
         }
      }
      DELAY100(30);
               
  }
    
    
}





byte data_time_array[8];
// For 
byte tempor ;



extern byte sicaklik, nem;

void disp_time_info()
{
    lcd_goto(1, 1);
    for(char k=0; k != 6; k++)
    {
        tempor = zaman[k];
        lcd_yaz(tempor/10 +48);
        lcd_yaz(tempor%10 +48);
        
        if(k < 2)lcd_yaz('/');
        else if(k == 2)lcd_goto(2, 1);
        else {
            if(k <5)lcd_yaz(':');
        }
        }
    
}

/*
 
 void disp_time_info()
{
    lcd_goto(1, 1);
    for(signed char k=2; k > -1; k--)
    {
        tempor = zaman[k];
        nisa[0] = tempor/10 +48;
        lcd_write(nisa);
        nisa[0] = tempor%10 +48;
        lcd_write(nisa);
        
        if(k !=0)lcd_write("/");
    }
    
    
    lcd_goto(2, 1);
    for(char k=3; k < 6; k++)
    {
        tempor = zaman[k];
        nisa[0] = tempor/10 +48;
        lcd_write(nisa);
        nisa[0] = tempor%10 +48;
        lcd_write(nisa);
        
        if(k !=5)lcd_write(":");
    }
    
}


 
 
 
 
 
 
 
 */
#define ARRAY_EQUAL 1
#define ARRAY_SMALL 2
#define ARRAY_BIG 3
byte compareAlarms(byte * arr1, byte * arr2)
{
    
    for(char j=0; j != 5; j++)
    {
        if(arr1[j] > arr2[j]) return ARRAY_BIG;
        else if(arr1[j] == arr2[j]);
        else
            return ARRAY_SMALL;
    }
    return ARRAY_EQUAL;
}
     
    byte time_index=0;
    byte den = 0;
    byte passed = 0;


byte  current_diff[5];
byte global_diff[5];
byte current_diff_index, current_diff_value;
byte global_diff_index, global_diff_value;
void findClosestAlarm()
{
    global_diff_value = 100;
    global_diff_index = 0;
    byte alarm_count =  EEPROM_ReadByte(0);
   
                byte none = true;;
                
  
       byte start= 1; byte alarm_id4=1;
        byte valid ;
        byte temp;
      
    for(char k =0; k != alarm_count; k++)
    {
        
        while( EEPROM_ReadByte(start)==0){ start += 7; alarm_id4++;}
        valid = true;
        //passed =  EEPROM_ReadByte(start+6);
        
        for(time_index = 0; time_index != 5;time_index++)
    {
            if(k ==0) global_diff[k] = 100;
       current_diff[time_index] = EEPROM_ReadByte(start+time_index+1);;
  
    }
        //If bigger than now and smaller than global
        if(compareAlarms(zaman, current_diff) == ARRAY_SMALL && compareAlarms(current_diff, global_diff) == ARRAY_SMALL)
        {
            none = false;
            for(char j=0; j < 5; j++)
            {
                byte k = current_diff[j];
                global_diff[j] = k;
                closest_alarm[j] = k; 
            }
        }
        
     start += 7; alarm_id4++;
           
    }
           
     
}
    
    /*
     
     
       
void findClosestAlarm()
{
                    byte check_pass = true;

   restart_again:;
    byte alarm_count =  EEPROM_ReadByte(0);
   
    byte time_index=0;
    byte passed = 0;
    byte den = 0;
                byte none = true;;
                
    start= 1; byte alarm_id4=1;
            byte equal_count = 0;
            byte diff_value = 100;
    for(; time_index != 5;time_index++)
    {
        start= 1; alarm_id4=1;
        equal_count = 0;
        diff_value = 100;
     none = true;
        
     
      
    for(char k =0; k != alarm_count; k++)
    {
        
        while( EEPROM_ReadByte(start)==0){ start += 7; alarm_id4++;}
        
     
       
        den =  EEPROM_ReadByte(start+time_index+1);
            //If alarm is past than now discard...
                  
            passed =  EEPROM_ReadByte(start+6);
            

            if(passed &(1 << 7))
            {
               
            }
            
            else
            if(zaman[time_index] > den)
            {

                EEPROM_WriteByte(start+6, passed | (1<<7)); //mark alarm...
            }
            else //if(zaman[time_index] < den)
            {

                byte df = den-zaman[time_index];
                none = false;

               
                 if(df < diff_value)
                {

                     
                    closes_alarm_index = alarm_id4;
                    closest_alarm_start_loc = start;
                    diff_value = df;
                    equal_count = 1;
                 }else
                if(df == diff_value)
                {
                    equal_count +=1;
                }
               //if bigger discard...
              
            }
        start += 7; alarm_id4++;
    }
         if(none)
             break;
            
                if(!check_pass)
        if(equal_count == 1)
        {
            break;
        } 
        
}
            if(check_pass){check_pass = false;goto restart_again;}
            
            if(!none)
            {
    for(char j = 0; j != 5; j++)
    {
       
        closest_alarm[j] =   EEPROM_ReadByte(closest_alarm_start_loc+1+j);
    }
            }
}
     
     
     
     
     
     
     */

#ifdef	__cplusplus
}
#endif

#endif	/* ALARM_H */

