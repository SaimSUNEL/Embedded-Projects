

#define CURR_DATE 'C'
#define CURR_CURRENCY 'M'
#define CURR_CURRENT 'S'
#define WAIT_TIME 1000

struct BUGUNSTRUCTURE bugun;

//used for requests...
byte COMMAND[3]= {CURR_DATE, '\r', '\n'} ;

byte buff_index;

void resetBuffer()
{

memset(current_buffer, 0, 50);
	current_buffer_index = 0 ;
	__delay_ms(200);
}


int time_counter; 
byte time_exceed = FALSE;

void common_request_function(byte komut, char * point, byte start, byte size_of)
{
time_counter = 0;
time_exceed = FALSE;

COMMAND[0] = komut;
	
	UARTSendString(COMMAND);
	__delay_ms(100);
	if(!RCIF) //no response...
{
	loadFromEPPROM(start, point, size_of);

}
else
{
UARTReadString();	
	buff_index = 0;
	
	for(;buff_index < size_of; buff_index++)
	{
		point[buff_index] = current_buffer[buff_index]-48;
	}

	if (compareData(0, current_buffer, size_of) == FALSE)
		saveToEEPROM(0, current_buffer, size_of);
}

	//If there is no response comes after 3 seconds, use previously stored data...

		resetBuffer();

}


void ask_5_day_weather()
{

	common_request_function(CURR_DATE, (char*)gunler, 0, 40);

}

void ask_currency()
{
	common_request_function(CURR_CURRENCY, CURRENCY, 51, 6);

}

//char current_temp[2];
//char current_phrase;

void ask_current_situation()
{
	common_request_function(CURR_CURRENT, (char *)&bugun, 40, 8);

}

//57 -> 255 weather situations...

void retrive_weather_situations()
{
	time_counter = 0;
	time_exceed = FALSE;
	if(EEPROM_ReadByte(57) == 0) return;
	COMMAND[0] = 'L';
	
	UARTSendString(COMMAND);
	__delay_ms(50);
	if(!RCIF)return;




char received_data;
byte index=0;
	while((received_data = UART_byte_receive()) != '#')
	{
		EEPROM_WriteByte(57+index, received_data);
		__delay_ms(2);
		UART_byte_send(received_data);
		__delay_ms(2);
		index++;
	}
	UART_byte_send(received_data);


}


void makeRequest()
{
retrive_weather_situations();
	ask_5_day_weather();
	ask_currency();
	ask_current_situation();


}





/*


void ask_5_day_weather()
{

COMMAND[0] = CURR_DATE;
	
	UARTSendString(COMMAND);

	UARTReadString();	
	byte var = 0;
	buff_index = 0;

	for(char say=0; say < 5; say++)
	{
		var = current_buffer[buff_index]-48;
		buff_index += 1;
		gunler[say].day = var;
		var = current_buffer[buff_index]-48;
		buff_index += 1;
		gunler[say].month = var;
		var = current_buffer[buff_index]-48;
		buff_index += 1;
		gunler[say].year = var;
		
		var = current_buffer[buff_index]-48;
		buff_index += 1;
		gunler[say].week_day = var;

		var = current_buffer[buff_index]-48;
		buff_index += 1;
		gunler[say].min_temp = var;

		var = current_buffer[buff_index]-48;
		buff_index += 1;
		gunler[say].max_temp = var;
		
		var = current_buffer[buff_index]-48;
		buff_index += 1;
		gunler[say].weather_phrase = var;

		var = current_buffer[buff_index]-48;
		buff_index += 1;
		gunler[say].relative_index = var;
	}

	memset(current_buffer, 0, 50);
	current_buffer_index = 0 ;
	available_byte_count = 0 ;
	__delay_ms(20);

}


*/