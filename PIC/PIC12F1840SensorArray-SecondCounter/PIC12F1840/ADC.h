

int ADC_read();


int TempIndicator_read()
{
__delay_ms(1);
//AN3 - RA4
CHS4 = 1;
CHS3 = 1;
CHS2 = 1;
CHS1 = 0;
CHS0 = 1;
__delay_ms(1);
int temp = ADC_read();
__delay_ms(1);
CHS4 = 0 ;
CHS3 = 0;
CHS2 = 0;
CHS1 = 1;
CHS0 = 1;
__delay_ms(1);


}


//RA5 ofr both dht11 and analog sensors... Also as digital input...




void ADC_init()
{

#asm


#endasm

//AN3 - RA4
CHS3 = 0;
CHS2 = 0;
CHS1 = 1;
CHS0 = 1;

//Right adjusted...
ADFM = 1;

//Fosc/64 
ADCS2 = 1;
ADCS1 = 1;
ADCS0 = 0;
__delay_ms(15);
ADON = 1;
__delay_ms(15);


}

int ADC_read()
{
	//RA4 analog input
    //Has no effect on digital output !!!
	ANSA4 = 1;
	__delay_ms(3);
	int val;
	ADGO = 1;
	while(ADGO);

	val = (ADRESH << 8) | ADRESL;
	ADIF = 0;
	ANSA4 = 0;
	__delay_ms(3);

	return val;
}