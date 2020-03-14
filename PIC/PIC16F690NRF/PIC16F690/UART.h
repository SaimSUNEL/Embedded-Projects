

UART_SendByte(byte value)
{
	TXREG = value;

	while(TRMT == 0);


}

byte UART_ReadByte()
{	
	while(RCIF==0);

	return RCREG;
}


void UART_Initialize()
{

	BRGH = 1;
	SYNC = 0;
	BRG16 = 0;
	SPBRG = 25;//9600 baudrate

	


	TXEN = 1;
	CREN = 1;
	TXIF = 0;
	RCIF = 0;
	RCIE = 1;
	PEIE = 1;
	
	
	SPEN = 1;
	GIE = 1;
}


void UART_SendString(const char * data)
{

for(byte a=0; data[a] != '\0'; a++)
{
	UART_SendByte(data[a]);
	__delay_ms(3);
}

}