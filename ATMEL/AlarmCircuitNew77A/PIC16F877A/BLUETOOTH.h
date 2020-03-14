/*Functions implemented...

void handle_bluetooth_message()
	Commands implemented
		set time (implemented...
		set date (implemented..
		save alarm (implemented...
		//Get all alarms...(All the alarms stored in PIC will be sent.... (implemented
	
		//Delete Alarm ( index will be sent by the user... ) (implemented...
		//Alarmlarý resetle... (implemented...
		//Stop alarm
		//Activate Alarm
		//Temp and humidity...
		

*/


/*
All communication routines are in this file...

*/



extern ALARM closest_alarm;
extern ALARM get_closest_alarm();
byte nisa_saim;
byte dolar_info[8];
byte head_info[8];

byte l [10];
void handle_bluetooth_message()
{ byte received_data = UART_receive_byte();
__delay_ms(10);

byte receive_array [6]={0};
ALARM alarm;
switch(received_data)
 {

//If the first byte is 1, we will set the time information....
case '1':
UART_send_byte('T');
//Hour
receive_array[0] = UART_receive_byte();
//Minute
receive_array[1] = UART_receive_byte();
//Second
receive_array[2] = UART_receive_byte();
UART_send_byte('T');
DS1307_set_time(receive_array[0], receive_array[1], receive_array[2]);
break;

//Tarihi ayarlama
case '2':
UART_send_byte('T');
//Gün
receive_array[0] = UART_receive_byte();
//Ay
receive_array[1] = UART_receive_byte();
//Yil
receive_array[2] = UART_receive_byte();
UART_send_byte('T');
DS1307_set_date(receive_array[0], receive_array[1], receive_array[2]);
break;

//Save Alarm
case '3':
UART_send_byte('T');
//Hour
alarm.alarm.alarm_saati = UART_receive_byte();
//Minute
alarm.alarm.alarm_dakikasi = UART_receive_byte();
//Gün
alarm.alarm.alarm_gunu = UART_receive_byte();
//Ay
alarm.alarm.alarm_ayi = UART_receive_byte();
//Yýl
alarm.alarm.alarm_yili = UART_receive_byte();
alarm_kaydet(alarm);
UART_send_byte('T');
//After new alarm edition check for the closest
//It will cause to update the closest alarm....
is_alarm_aktif = TRUE;	

break;

//Get all alarms...(All the alarms stored in PIC will be sent....
case '4':
UART_send_byte('T');
//Hour
byte count = EEPROM_read_byte(0);
ALARM temp;
for(byte index=1; index <= count; index++)
{temp = alarm_yukle(index);

//for( byte j=0; j < 5;j++)
//UART_send_byte(temp.value[j]);
UART_send_byte(temp.alarm.alarm_saati);
UART_send_byte(temp.alarm.alarm_dakikasi);
UART_send_byte(temp.alarm.alarm_gunu);
UART_send_byte(temp.alarm.alarm_ayi);
UART_send_byte(temp.alarm.alarm_yili);

UART_send_byte('T');
}


UART_send_byte('T');


break;

//Delete Alarm ( index will be sent by the user... )
case '5':
UART_send_byte('T');
//Hour
byte silinecek_index = UART_receive_byte();
alarm_sil(silinecek_index);
//alarm's all notes will be deleted also...

//Alarm note number starts from 1
byte recorded_alarm_number  ;

//We are recording the alarm notes according to their list index...
//But when one element is erased, its succossors alarm note numbers should be decreased by one to
// keep them as alarm note of the successers.... 
for(byte j=1; j<47; j++)
{
	recorded_alarm_number = EEPROM24C32_read_byte(j*4+3);
	if(recorded_alarm_number == silinecek_index)
	{
		for(byte k=0; k <4;k++)
			EEPROM24C32_write_byte(j*4+k, 0xff);
	}
	else if( recorded_alarm_number > silinecek_index)
	{
		 EEPROM24C32_write_byte(j*4+3, recorded_alarm_number-1);
	}
	
}

UART_send_byte('T');
break;

//Alarmlarý resetle...
case '6':
UART_send_byte('T');
alarm_resetle();
UART_send_byte('T');


break;

/*
//Alarmý sustur 
case '7':
UART_send_byte('T');
alarm_sustur();
UART_send_byte('T');


break;
*/
/*//Alarmý çalýþtýr... 
case '8':
UART_send_byte('T');
alarm_aktif();
UART_send_byte('T');


break;
*/
//Sýcaklý ve nem gönder...
case '9':
UART_send_byte('T');
DHT11_get_data();
UART_send_byte(sicaklik);
UART_send_byte(nem);

UART_send_byte('T');


break;
//Alarm çalýþtýr...
case 'A':
UART_send_byte('T');
RD6=1;
UART_send_byte('T');


break;

//Alarm sustur.......
case 'B':
UART_send_byte('T');
RD6=0;
UART_send_byte('T');


break;

//Alarm note will be received....
case 'C':
UART_send_byte('T');
__delay_ms(10);
byte received_byte = 0;
byte related_alarm = UART_receive_byte();
UART_send_byte('T');
__delay_ms(10);
byte message_length = UART_receive_byte();

UART_send_byte('T');
__delay_ms(10);
byte received_byte_count =0;
MESSAGE write_message;

for(;;)
{
	received_byte = UART_receive_byte();
	//if byte 250, means start writing...
	if(received_byte == 250)
	{

		 byte count = EEPROM24C32_read_byte(0);
		
		write_message.message_info.message_length = message_length;
		write_message.message_info.message_number = count+1;
		write_message.message_info.related_alarm_number = related_alarm;
		
		for(int j =1; j < 47;j++)
		{   //if 4 bytes blocks starts with 0xff, it means that location is free to add...
			if(EEPROM24C32_read_byte((j)*4) == 255)
			{
				write_message.message_info.block_number = j;
				
				
				break;
			}
		}
		for(int j=0; j<4;j++)
		{
			EEPROM24C32_write_byte(write_message.message_info.block_number*4+j, write_message.value[j]);
		}
		EEPROM24C32_write_bytes((write_message.message_info.block_number-1)*64+ 6*32, SET_LOCATION, 0); 


		//save_message(START, 0, message_length, related_alarm);
	}
	//32 byte filled, stop
	else if(received_byte == 251)
	{
		EEPROM24C32_write_bytes(0, FINISH, 0);
		__delay_ms(10);
		
	}//For second 32 byte page start
	else if(received_byte == 252)
	{
		EEPROM24C32_write_bytes((write_message.message_info.block_number-1)*64+ 6*32 + 32, SET_LOCATION, 0); 
	}//all transfer finished...
	else if(received_byte == 253)
	{
		UART_send_byte('T');
		__delay_ms(10);
		break;
	}
	else
	{
		EEPROM24C32_write_bytes(0, WRITE, received_byte );
		//save_message(WRITE_DATA, received_byte, 9, 1);
	}
	__delay_ms(10);
	UART_send_byte('T');
}
EEPROM24C32_write_byte(0, EEPROM24C32_read_byte(0)+1);
UART_send_byte('T');
break;


//Alarm note read...
case 'D':
nisa_saim = 0 ;
UART_send_byte('T');
//Okunacak alarm numarasýný alýyoruz...
byte alarm_number = UART_receive_byte();
UART_send_byte('T');
//lcd_goto(1, 1);
byte _temp;
for(byte j=1; j<47; j++)
{	//if(j<30)
	//lcd_data(48+EEPROM24C32_read_byte(j*4+3));
	_temp = EEPROM24C32_read_byte(j*4+3);
	//lcd_data(_temp + 48);
	
	if(_temp == alarm_number)
	{
		byte message_length = EEPROM24C32_read_byte(j*4+2);
		
		byte block_number = EEPROM24C32_read_byte(j*4+1);
		
		UART_send_byte( message_length);
		

		UART_receive_byte();
	
		for(byte okunan = 0; okunan<message_length;okunan++)
		{
			if(okunan == 0)
			{
				EEPROM24C32_read_bytes((block_number-1) * 64 + 6*32, SET_LOCATION);
			}
			else if(okunan == 32)
			{
				EEPROM24C32_read_bytes(0, FINISH);
				EEPROM24C32_read_bytes((block_number-1) * 64 + 7*32, SET_LOCATION);
				
			}
			

			UART_send_byte(EEPROM24C32_read_bytes(0, READ));
			UART_receive_byte();
		}
		EEPROM24C32_read_bytes(0, FINISH);
	
		
	}
}


UART_send_byte('T');
break;

//Alarm note erase
case 'E':
__delay_us(1);
UART_send_byte('T');
byte alarm_number = UART_receive_byte();
UART_send_byte('T');
__delay_ms(5);
byte alarm_note_number = UART_receive_byte();
UART_send_byte('T');
__delay_ms(5);
byte current_count = 0 ;
//Alarm note number starts from 1
for(byte j=1; j<47; j++)
{
	if(EEPROM24C32_read_byte(j*4+3) == alarm_number)
	{
		current_count++;
	}
	if(current_count == alarm_note_number)
	{   //We are just erasing the root table not the actual message...
		for(byte k=0; k <4;k++)
			EEPROM24C32_write_byte(j*4+k, 0xff);
		
		break;
	}

}


UART_send_byte('T');
//We are decreasing the count...
EEPROM24C32_write_byte(0 , EEPROM24C32_read_byte(0)-1);
break;

case 'O':
RD7 = 1;
UART_send_byte('T');
break;

case 'S':
RD7 = 0;
UART_send_byte('T');
break;

//First 8 character of second row used for information
case 'K':
UART_send_byte('T');



for(byte i = 0; i < 8;i++)
{
dolar_info[i] = UART_receive_byte();
}

UART_send_byte('T');
save_information(dolar_info, 2);
is_alarm_aktif = TRUE;
break;

//First 8 character of first row used for information
case 'L':
UART_send_byte('T');

for(byte i = 0; i < 8;i++)
{
head_info[i] = UART_receive_byte();
}
UART_send_byte('T');
save_information(head_info, 1);
is_alarm_aktif = TRUE;
break;


default:
break;
}


}