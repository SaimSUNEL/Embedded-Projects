
//Max 16 message could be stored...
//First 3 32 byte sectors are kept for message data...
enum MESSAGE_TYPE {TEXT, IMAGE, SOUND};
struct MESSAGE
{
byte message_id;
byte message_type;
unsigned int message_size;
unsigned int start_sector_number; //In which 32 bytes vector the message is 


};

union MESS
{

struct MESSAGE message;
byte * pointer; 

};


typedef union MESS Message;



void CreateMessageHeader(MESSAGE_TYPE type, unsigned int message_size)
{
	Message mess;
	mess.message.message_size = message_size;
	mess.message_type = type;
	

}


unsigned MessageHeaderSectorStatus;
unsigned MessageHeaderTotalCount;
void checkMessageHeaderSector()
{
	byte read;
	MessageHeaderTotalCount = 0;
	MessageHeaderSectorStatus = 0;
	for(byte a=0; a<16; a++)
	{
		read = EEPROM24C64_ReadByte(a*6);
		if(read != 0xff)
		{
			MessageHeaderTotalCount++;
			MessageHeaderSectorStatus |= (1<<(15-a)); 
		}
		
	}

}
void ClearAllMessageHeaders()
{
	for(byte a=0; a<16; a++)
	{
		EEPROM24C64_WriteByte(a*6, 0xff);
				
	}
	
	MessageHeaderTotalCount = 0;
	MessageHeaderSectorStatus = 0; 
}

void DeleteMessageHeader(byte message_id)
{
		for(byte a=0; a<16; a++)
	{
		read = EEPROM24C64_ReadByte(a*6);
		if(read == message_id)
		{	
			EEPROM24C64_ReadByte(a*6, 0xff);
			MessageHeaderTotalCount--;
			MessageHeaderSectorStatus &= ~(1<<(15-a)); 
		}
		
	}

}