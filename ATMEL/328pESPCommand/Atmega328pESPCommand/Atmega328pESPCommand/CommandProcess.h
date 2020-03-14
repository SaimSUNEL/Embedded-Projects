/*
 * CommandProcess.h
 *
 * Created: 11.07.2019 22:42:22
 *  Author: Saim
 */ 


#ifndef COMMANDPROCESS_H_
#define COMMANDPROCESS_H_



/************************************************************************/
// Custom command : S-custom_komut-komut_id   
// DigitalWrite, AnalogWrite, AnalogRead, Digitalread : A-pin_number-pin_value-komut_id
// E-0 : Error, Z-1 : No Command, Z-2 : Command Succes, Z-3 : Message Success                                                                  */
/************************************************************************/


char command[2]; //Command...
char pin_number[4];
char komut_id[7];
char custom_command[50];

void ProcessCommand()
{
	// clean previous data...
	memset(command, 0, 2);
	memset(pin_number, 0, 4);
	memset(komut_id, 0, 7);
	memset(custom_command, 0, 50);
	
	
	byte index = 0;
	command[0] = string_characters[0];
	index += 2;
	switch (command[0])
	{
		case 'A':
		
		break;
		
		case 'P':
		
		break;
		
		case 'E':
		sprintf((char*)string_characters, "Error in command\r\n");
		SerialPortSendString();
		break;
		
		case 'Z':
		
		break;	
		
		case 'S':
		
		
		
		break;
		
		
		
	}
	
	
}


#endif /* COMMANDPROCESS_H_ */