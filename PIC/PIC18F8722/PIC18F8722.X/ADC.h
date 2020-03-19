/* 
 * File:   ADC.h
 * Author: Saim
 *
 * Created on 01 Eylül 2019 Pazar, 20:32
 */

#ifndef ADC_H
#define	ADC_H

#ifdef	__cplusplus
extern "C" {
#endif


int ADC_read(byte channel_number);


int TempIndicator_read()
{
__delay_ms(1);
//AN3 - RA4
CHS3 = 1;
CHS2 = 1;
CHS1 = 0;
CHS0 = 1;
__delay_ms(1);
int temp = ADC_read(0);
__delay_ms(1);
CHS3 = 0;
CHS2 = 0;
CHS1 = 1;
CHS0 = 1;
__delay_ms(1);


}


//RA5 ofr both dht11 and analog sensors... Also as digital input...




void ADC_init()
{
    
    TRISA0 = 1;
    TRISA1 = 1;
CHS3 = 0;
CHS2 = 0;
CHS1 = 0;
CHS0 = 0;

//Right adjusted...
ADFM = 1;

//16MHZ....
ADCS2 = 1;
ADCS1 = 1;
ADCS0 = 0;


/*
 
 If desired, the ACQTx bits can be set to select a programmable
acquisition time for the A/D module. When
the GO/DONE bit is set, the A/D module continues to
sample the input for the selected acquisition time, then
automatically begins a conversion. Since the acquisition
 
 **/
ACQT2=1; ACQT1=1; ACQT0=0; //16TAD
PCFG3 = PCFG2 = PCFG1 = PCFG0 = 0; //All analog pins are analog...
VCFG1=0; VCFG0 = 0; 
__delay_ms(15);
ADON = 1;
__delay_ms(15);


}

int ADC_read(byte channel_number)
{
    
    
    ADCON0 = (channel_number<<2) | (ADCON0 & 0b00000011);
	//RA4 analog input
    //Has no effect on digital output !!!
	__delay_ms(3);
	int val;
	GODONE = 1;
	while(GODONE);
	val = (ADRESH << 8) | ADRESL;
	ADIF = 0;
	__delay_ms(3);
	return val;
}



#ifdef	__cplusplus
}
#endif

#endif	/* ADC_H */

