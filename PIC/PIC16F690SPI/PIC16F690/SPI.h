



void SPI_Initialize()
{


CKP = 0; //SCK is GND when idle...
CKE = 1; //Data sample at rising edge...
SMP = 0; //sampled at the middle

// FOSC/4
SSPM3 = 0;
SSPM2 = 0;
SSPM1 = 0;
SSPM0 = 0;

TRISB6 = 0;//SCK output
TRISC7 = 0;//SDO output
TRISB4 = 1;//SDI input...
SSPEN = 1; //Serial port enable....
}

byte SPI_WriteByte(byte value)
{
SSPBUF = value;
while(BF==0);
while(SSPIF == 0 );


SSPIF = 0;
return SSPBUF;
}