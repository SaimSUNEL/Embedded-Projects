#define COUNT_ACTIVE 9
#define COUNT_IDLE 8

byte count_status = COUNT_IDLE;
byte timer_count = 0;
byte second_count = 0;

byte received_byte ;

byte message_len;
byte timer_closed;
byte message_type;


void interrupt FNC()
{
	if(RCIF)
	{
		if (TMR1IF)
			{
				TMR1IF = 0;
			}
		if(TMR1ON)
{
timer_closed = 1;
}
else timer_closed = 0;

		TMR1ON = 0; //Stop timer while receiving message...
		received_byte = UART_byte_receive();
		switch(received_byte)
		{
			case 'M':
			message_len = UART_byte_receive();
			__delay_ms(10);
			UART_byte_send('T');
			__delay_ms(5);
			message_type = UART_byte_receive();
			__delay_ms(5);
			UART_byte_send('T');
			__delay_ms(5);
			EEPROM_WriteByte(message_type, message_len);//200th location message len
			

			
			//16x2 lcd 32 characters
			for(byte a = 0; a <message_len ;a++)
			{
				received_byte = UART_byte_receive();
				EEPROM_WriteByte(a+message_type+1, received_byte);
				__delay_ms(6);
				UART_byte_send('T');
				__delay_ms(6);

			}
			
			UART_byte_send('T'); //Success indicator for communication
			__delay_ms(6);
			break;

		}

//Reopen timer if it is closed here...
if(timer_closed == 1)
	TMR1ON = 1;




	}

else 
if(TMR1IF)
{
	timer_count ++;
	if(timer_count == 20)
	{
		
		timer_count = 0;
		if(second_count == 0)
		{
			second_count = EEPROM_ReadByte(0);
			//EPPROM might accomodate rediculuous data at start...
			if(second_count > 95)
				second_count = 0;

		}
		
		second_count ++;

		//In every 5 sec save current count to EEPROM incase electricity cut off
		//It will continue from where it has stayed....
		if(second_count % 5 ==0)
			EEPROM_WriteByte(0, second_count);
		if(second_count == 99)
		{
			EEPROM_WriteByte(0, 0);
			TMR1ON = 0;
			count_status = COUNT_IDLE;
		}
		what_to_display = NONE;
		display_number(second_count);
	}

TMR1IF = 0;
}
else
 
if(IOCIF == 1)
{
	if(count_status == COUNT_IDLE)
	{
		CURRENT_MESSAGE = ACTIVATE;
		SHOWN_BYTES = 0;
		display_message();

		count_status = COUNT_ACTIVE;
		TMR1 = 15535;
		second_count = 0;
		TMR1ON = 1;
	}
	else if(count_status == COUNT_ACTIVE)
	{
		EEPROM_WriteByte(0, 0);

		count_status = COUNT_IDLE;
		TMR1ON = 0;

	}

	IOCIF = 0;
}

}