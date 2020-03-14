





//RA5 ofr both dht11 and analog sensors... Also as digital input...




void ADC_init()
{
#asm

banksel _ADCON1
movlw 0x60
movwf 0x1f

banksel _ADCON0
movlw 0x81
movwf 0x1f

#endasm
__delay_ms(15);


}
int ADC_Result;

void ADC_read()
{
	//RA4 analog input
    //Has no effect on digital output !!!
	ANS0 = 1;
	__delay_ms(3);
	int val;
	//GO_DONE = 1;
	
	#asm
	banksel _ADCON0
	bsf _ADCON0, 1
	wait:
	btfsc _ADCON0, 1
	goto wait
	movlw _ADC_Result
	movwf _FSR
	banksel _ADRESL
	movf 0x1e, W
	movwf indf
	incf _FSR
	banksel _ADRESH
	movf _ADRESH, W
	movwf indf

	#endasm

	//while(GO_DONE);

	//val = (ADRESH << 8) | ADRESL;
	ADIF = 0;
	ANS0 = 0;
	__delay_ms(3);

}