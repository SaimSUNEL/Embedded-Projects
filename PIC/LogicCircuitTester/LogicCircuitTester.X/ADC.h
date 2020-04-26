/* 
 * File:   ADC.h
 * Author: Saim
 *
 * Created on 05 Eylül 2019 Per?embe, 12:36
 */

#ifndef ADC_H
#define	ADC_H

#ifdef	__cplusplus
extern "C" {
#endif




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
DELAY(15);
ADON = 1;
DELAY(15);


}
int measured_adc_value;
void ADC_read(byte pin)
{
	//RA4 analog input
    //Has no effect on digital output !!!

	ANSA4 = 1;
	DELAY(100);
	byte * m = (byte*)&measured_adc_value;
    ADGO = 1;
	while(ADGO);

    *m = ADRESL;
    m++;
    *m = ADRESH;
	ADIF = 0;
	ANSA4 = 0;
	
}


#ifdef	__cplusplus
}
#endif

#endif	/* ADC_H */

