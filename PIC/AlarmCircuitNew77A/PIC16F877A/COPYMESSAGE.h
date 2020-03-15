
/*
One could consist of at most 64 characters (2 page 32byte per page)

first 6 pages are stored for root table... max 47 messages could be saved(1 for info for root table)...
first 4 byte 0,1,2,3 will be used as information for the root table...
	message count -> 0. byte
Message counts start from 1...
*/

struct MES {
byte message_number;
byte block_number; //location = (block_number-1) * 64 + 6*32
byte message_length;
//Starts from 1
byte related_alarm_number ;
};

union MESS
{
struct MES message_info;
byte value[4];
};
typedef union MESS MESSAGE;




byte get_message_count()
{return EEPROM24C32_read_byte(0);} //message count is stored in 0. byte of the EEPROM

MESSAGE load_message_descriptor(byte message_number)
{ 
	MESSAGE temp;
	//First search the message number in the root table...

	for(int j =1; j < 47;j++)
		{	//If found 
			if(EEPROM24C32_read_byte((j)*4) == message_number)
			{
				message_number = j;
				break;
			}
		}
	
	
	//Read its record....
	EEPROM24C32_read_bytes(message_number*4, SET_LOCATION);
	for(byte j=0; j<4;j++)
	{
		temp.value[j] = EEPROM24C32_read_bytes(0, READ);
	}
	EEPROM24C32_read_bytes(0, FINISH);
	return temp;
}

MESSAGE current_message;
#define START 1
#define READ 2
#define STOP 3
byte read_message(byte message_number, byte action)
{ 
	static byte read_character_count = 0;
	if(action==START)
	{
		current_message = load_message_descriptor(message_number);
		EEPROM24C32_read_bytes((current_message.message_info.block_number -1) * 64 + 6*32  , SET_LOCATION);
		read_character_count = 0;
		return 0;
	}
	else if(action==READ)
	{
		if(read_character_count == current_message.message_info.message_length)
			return 0;
		read_character_count ++;
		return EEPROM24C32_read_bytes(0 , READ);

	}
	else
	{
		EEPROM24C32_read_bytes(0 , FINISH);
		return 0;
	
	}
}
#define WRITE_DATA 6
MESSAGE write_message;
byte sss;
byte loc;
void save_message(byte action, byte data, byte len, byte alarm_number)
{
	if(action == START)
	{
		byte count = get_message_count();
		sss = count;
		write_message.message_info.message_length = len;
		write_message.message_info.message_number = count+1;
		write_message.message_info.related_alarm_number = alarm_number;
		
		for(int j =1; j < 47;j++)
		{
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
	}
	else if(action == WRITE_DATA)
	{
		EEPROM24C32_write_bytes(0, WRITE, data);
	}
	else
	{
		EEPROM24C32_write_bytes(0, FINISH, 0);
		__delay_ms(10);
		EEPROM24C32_write_byte(0, get_message_count()+1);
	}
}
#define SEGMENT_COUNT 4096/32
void EEPROM24C32_resetle()
{
	for(byte count = 0; count < 15;count ++)
	{
		UART_send_byte(count);
		EEPROM24C32_write_bytes(count*32, SET_LOCATION, 0);
		for(byte j=0;j<32;j++)
			//EEPROM24C32_write_byte( count*32 +j, 0);
			EEPROM24C32_write_bytes(0, WRITE, 255);
		EEPROM24C32_write_bytes(0, FINISH, 255);
	}
	
	EEPROM24C32_write_byte(0 , 0);
	
	//UART_send_string("son");
	
}

