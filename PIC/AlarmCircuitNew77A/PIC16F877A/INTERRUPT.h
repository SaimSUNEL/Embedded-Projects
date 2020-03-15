/*
Function implemented
	Interrup function
Implemented Interrupts
	UART receive interrupt...


*/


/*
All the communication part with Bluetooth will be implemented here...
After first byte arrives, we will be receiving the remaining bytes without getting out the interrupt function... 
End of messages will be denoted a character will be never used in communication...

*/
extern void handle_bluetooth_message();
void interrupt INTER()
{

//If any data has arrived...Process it....
if(RCIF == 1)
{

handle_bluetooth_message();
}


}
