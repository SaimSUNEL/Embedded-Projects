// 4 mhz fosc
/*
ACKSTAT 
ACKDT
*/
void I2C_NACK()
{
	ACKDT = 1;
	ACKEN = 1;
	while(ACKEN);
	SSP1IF = 0;

}

void I2C_ACK()
{
	ACKDT = 0;
	ACKEN = 1;
	while(ACKEN);
	SSP1IF = 0;
}
void I2C_SendByte(byte value)
{
	SSPBUF = value;
	while(SSP1IF ==0);
	SSP1IF = 0;

}

byte I2C_ReadByte()
{
	RCEN = 1;
	while(RCEN);
	SSP1IF = 0;
	return SSPBUF;

}

void I2C_Start()
{
	SEN = 1;
	while(SEN);
	SSP1IF = 0;
}

void I2C_Stop()
{
	PEN = 1;
	while(PEN);
	SSP1IF = 0;
	
}

void I2C_Initialize()
{
TRISA1 = 1;
TRISA2 = 1;
//100 khz
SMP = 1;


SSPADD = 0x9;//100khz
//Master mode...
SSPM3 = 1;
SSPM2 = 0;
SSPM1 = 0;
SSPM0 = 0;

SSPEN = 1;

}
