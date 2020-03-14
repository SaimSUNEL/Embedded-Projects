/*Functions implemented...

byte alarm_sayisi()
void  alarm_kaydet(ALARM alarm)
ALARM alarm_yukle(byte alarm_numarasi)
void alarm_resetle()
void alarm_aktif()
void alarm_sustur()

*/

/*
All Alarm operations are performed in this file...
-alarm saving, reading, erasing
-Alarm checkings will be done here
		The routine that will compare current time and the saved alarm times is written here...

*/

/*

Mem structure 0. index is the count of the alarm
for each alarm 5 bytes are used...
if first byte is 255 in the alarm block, it meanst that this blok is empty...

*/



extern byte UART_receive_byte();

struct Alarm
{  
	byte alarm_dakikasi;
	byte alarm_saati;
 
// byte alarm_saniyesi:6;
	byte alarm_gunu;
	byte alarm_ayi;
	byte alarm_yili; 
   
   
};

union ALAN
{
	struct Alarm alarm;
	byte value[5]; 
   
};
typedef union ALAN ALARM;

byte alarm_compare(ALARM * first, ALARM * second);
extern ALARM temp;
extern ALARM closest_alarm;
extern void EEPROM24C32_write_byte(unsigned int address, byte data);
extern void EEPROM24C32_write_bytes(unsigned int address, byte action, byte data);
extern byte EEPROM24C32_read_byte(unsigned int address);
extern byte EEPROM24C32_read_bytes(unsigned int address, byte action);
ALARM get_closest_alarm();
//in the 0. address total count number is stored


void  alarm_kaydet(ALARM alarm)
{//Every Alarm fits in 4 bytes, 0.is the count number...
//Total alarm count should be checked not to exceed 50 alarms....
	byte sayi = 1;
//255 is the first byte of the empty alarms... we are finding the most closest available alarm location...
	for(; (sayi < 236) && (EEPROM_read_byte(sayi) !=255);sayi +=5);

	for(byte a = 0; a<sizeof(ALARM);a++)
		EEPROM_write_byte(sayi+a, alarm.value[a]);
   
	EEPROM_write_byte(0, EEPROM_read_byte(0)+1);
}

//Alarm numbers start from 1
ALARM alarm_yukle(byte alarm_numarasi)
{//Every Alarm fits in 4 bytes, 0.is the count number...
	byte current_alarm_count = 0;   
	byte sayi = 1;
	for(;sayi < 236 ; sayi +=5)
	{
		if(EEPROM_read_byte(sayi) != 255) current_alarm_count++;
		if(current_alarm_count == alarm_numarasi ) break;
	}

	ALARM temp={0};

	for(byte index = 0; index<sizeof(ALARM);index++)
	{
		temp.value[index] = EEPROM_read_byte(sayi+index);
	}
 	return temp ;
}

void alarm_resetle()
{
	EEPROM_write_byte(0, 0);
	for(int j=1; j<240;j++)
		EEPROM_write_byte(j, 255);
//Erase all the alarm notes....
for(int j =1; j < 47;j++)
		{  
			EEPROM24C32_write_byte(j*4, 0xff);
			EEPROM24C32_write_byte(j*4+3, 0xff);
			
		}

}

void alarm_sil(byte alarm_numarasi)
{//Every Alarm fits in 4 bytes, 0.is the count number...
	byte current_alarm_count = 0;   
	byte sayi = 1;
	for(;sayi < 236 ; sayi +=5)
	{
		if(EEPROM_read_byte(sayi) != 255) current_alarm_count++;
		if(current_alarm_count == alarm_numarasi ) break;
	}

	for(byte index = 0; index<sizeof(ALARM);index++)
	{
		EEPROM_write_byte(sayi+index, 255);
	}
	EEPROM_write_byte(0, EEPROM_read_byte(0)-1);
}
byte is_alarm_aktif = FALSE;
void alarm_aktif()
{
	



}
void alarm_sustur()
{
	RD6 = 0 ;
}

void alarm_check()
{
if(zaman[SANIYE] == 0 || zaman[SANIYE] == 1 || zaman[SANIYE] == 2 )
{
temp.alarm.alarm_saati = zaman[SAAT];
temp.alarm.alarm_dakikasi = zaman[DAKIKA];
temp.alarm.alarm_gunu = tarih[GUN];
temp.alarm.alarm_ayi = tarih[AY];
temp.alarm.alarm_yili = tarih[YIL];

//If the closest alarm and current date time matches...
if(alarm_compare(&temp, &closest_alarm) == EQUAL)
{

is_alarm_aktif = TRUE;
RD6 = 1;
lcd_clear();
byte alarm_number;

//We are getting the alarm number...
for(byte j=1; j< 47;j++)
{
	temp = alarm_yukle(j);
   if( alarm_compare(&closest_alarm, &temp) == EQUAL)
	{
		alarm_number = j ;
		break;
	}
}
byte display_count = 0;
byte note_found = FALSE;
for(;;)
{
	for(byte j=1; j<47; j++)
	{	//if(j<30)
		//lcd_data(48+EEPROM24C32_read_byte(j*4+3));
	
		//lcd_data(_temp + 48);
	
		if(EEPROM24C32_read_byte(j*4+3) == alarm_number)
		{	
			note_found = TRUE;
			lcd_clear();
			lcd_goto(cursor_y, cursor_x);
			byte message_length = EEPROM24C32_read_byte(j*4+2);
		
			byte block_number = EEPROM24C32_read_byte(j*4+1);
		
	
			for(byte okunan = 0; okunan<message_length;okunan++)
			{
				if(okunan == 0)
				{
					EEPROM24C32_read_bytes((block_number-1) * 64 + 6*32, SET_LOCATION);
				}
				else if(okunan == 32)
				{
					
					EEPROM24C32_read_bytes(0, FINISH);
					__delay_ms(2000);
					lcd_clear();
					lcd_goto(cursor_y , cursor_x);
					display_count++;
					if(display_count ==12)break;
				
					EEPROM24C32_read_bytes((block_number-1) * 64 + 7*32, SET_LOCATION);
				
				}
			

				lcd_data(EEPROM24C32_read_bytes(0, READ));
				lcd_goto(cursor_y, cursor_x);
			
			}
			
			EEPROM24C32_read_bytes(0, FINISH);
			if(display_count ==12)break;
			__delay_ms(2000);
			display_count++;
			if(display_count ==6)break;
	
		
		}
		

	}
	if(note_found == FALSE)
	{ 
		for(byte hh=0;hh<20;hh++)__delay_ms(1000);
		break;
	}
	if(display_count ==6)break;
}










lcd_clear();
RD6 = 0;
}//if

}

}
extern void UART_send_byte(unsigned char data);
byte alarm_compare(ALARM *first, ALARM *second)
{
	second->value[3] = (*second).alarm.alarm_ayi;
	second->value[4] = (*second).alarm.alarm_yili;
	second->value[2] = (*second).alarm.alarm_gunu;
	second->value[1] = (*second).alarm.alarm_saati;
	second->value[0] = (*second).alarm.alarm_dakikasi;
	
	
	byte compare=LESS;
	for(int arr_index = 4; arr_index>=0; arr_index--)
	{
		if((first)->value[arr_index] < (second)->value[arr_index])
		{
			
			//lcd_data(second->value[arr_index]+48);
			compare = LESS;
	
			break;
		}
		else if((first)->value[arr_index] > (second)->value[arr_index])
		{
			

//lcd_data(first->value[arr_index]+48);
			//lcd_data(second->value[arr_index]+48);
			compare = BIGGER;
			
			break;
		}
		else
		{


			//lcd_data(first->value[arr_index]+48);
			//lcd_data(second->value[arr_index]+48);
			compare = EQUAL;
			
		}
	}
	


	return compare;

}

ALARM simdi;
ALARM get_closest_alarm()
{
	
	ALARM en_kucuk_alarm = {59, 23, 31, 12,62};
	DS1307_time();
	DS1307_date();
	ALARM simdi;

	simdi.alarm.alarm_dakikasi = zaman[DAKIKA];
	simdi.alarm.alarm_saati = zaman[SAAT];
	simdi.alarm.alarm_gunu = tarih[GUN];
	simdi.alarm.alarm_ayi = tarih[AY];
	simdi.alarm.alarm_yili = tarih[YIL];
	
	

	byte alarm_count = EEPROM_read_byte(0);
	
	byte kucuk = FALSE;
	ALARM current_alarm;
	for(byte alarm_index = 1; alarm_index <= alarm_count; alarm_index ++)
	{
		current_alarm = alarm_yukle(alarm_index);

		//Eðer alarm þimdiden büyük ve en küçükten küçükse deðiþtir....
		if((alarm_compare(&current_alarm, &simdi)==BIGGER) &&(alarm_compare(&current_alarm, &en_kucuk_alarm)==LESS))
		{	
			
			en_kucuk_alarm = current_alarm;
			
		} 
	}
	

	return en_kucuk_alarm;
}

/*
ALARM get_closest_alarm()
{
byte en_kucuk_alarm_index = 1;
double smallest_value = 60*60*24*100;

DS1307_time();
DS1307_date();
struct tm now, alarm_tm;

now.tm_hour = zaman[SAAT];
now.tm_sec = zaman[SANIYE];
now.tm_min = zaman[DAKIKA];


now.tm_mday = tarih[GUN];
now.tm_mon = tarih[AY];
now.tm_year = tarih[YIL] + 100; //tm_year year since 1900
now.tm_isdst = 0;

time_t now_t = mktime(&now), alarm_t;
/*tm_isdst is positive if Daylight Saving Time is in effect, 
0 if Daylight Saving Time is not in effect

byte min_index = 0;
byte alarm_count = alarm_sayisi ();
ALARM current_alarm;
for(byte alarm_index = 1; alarm_index <= alarm_count; alarm_index ++)
{
current_alarm = alarm_yukle(alarm_index);

alarm_tm.tm_hour = current_alarm.alarm.alarm_saati;
alarm_tm.tm_sec = 0;
alarm_tm.tm_min = current_alarm.alarm.alarm_dakikasi;

alarm_tm.tm_year = current_alarm.alarm.alarm_yili + 100;
alarm_tm.tm_mon = current_alarm.alarm.alarm_ayi ;
alarm_tm.tm_mday = current_alarm.alarm.alarm_gunu ;
alarm_tm.tm_isdst = 0;

alarm_t = mktime(&alarm_tm);

double diff = difftime(&alarm_t, &now_t);
if(diff > 0) 
if( diff < smallest_value)
{
smallest_value = diff ;
en_kucuk_alarm_index = alarm_index ;
}


}

return alarm_yukle(en_kucuk_alarm_index);
}

*/
