#ifndef MAIN_C
#define MAIN_C

// Global includes
#include <htc.h>
#define DelayMs __delay_ms
#define DelayUs __delay_us
#pragma config PLLDIV=1
#pragma config CPUDIV = OSC4_PLL6
#pragma config USBDIV = 2
#pragma config FOSC = XTPLL_XT
#pragma config FCMEN = OFF
#pragma config PWRT = OFF
#pragma config BORV = 3
#pragma config VREGEN = ON
#pragma config WDT = OFF
#pragma config WDTPS = 32768
#pragma config PBADEN = OFF
#pragma config MCLRE = ON
#define XTAL_FREQ 48MHZ
// Local includes
#include "usb.h"
#include "HardwareProfile.h"
#include "usb_function_hid.h"
#include "genericHID.h"

//void delayMs();



// local prototypes
static void InitialiseSystem(void);
void ProcessIO(void);
int index=0;
char gelen_veri[8];char uyan[]="01010101";
int bolum=0;
int a=0;



int sayi=0;
// Main function
void main(void)
{DelayMs(10);
//	ADCON1=0x06;
//PORTA=0x01;
	TRISB = 0b00000000;
	TRISC = 0b00000000;
ADCS2=1;
ADCS1=0;
ADCS0=1;	
	
	
PCFG3=1; 
PCFG2=1;
PCFG1=1;
PCFG0=0;
ADFM=1; //Saga dayal� ADRESL ve ADRESH
ADON=1;	
	
	
	int tempature;

	CHS2=0; //AN0 kanal� se�iliyor
CHS1=0;
CHS0=0;
DelayMs(15);
GO_DONE=1;
while(!GO_DONE);
tempature=(int)((ADRESH*256+ADRESL)/2); //ADRESL ve ADRESH �deki degerler uygun bi�imde
tempature=(tempature%100)/10;

	// Clear all ports
	PORTB = 0b00000000;
	PORTC = 0b00000000;

	

    #if defined(USE_SELF_POWER_SENSE_IO)
    tris_self_power = INPUT_PIN;
    #endif
	
	USBOutHandle = 0;
USBInHandle = 0;

	

	USBDeviceInit();

 USBDeviceTasks();


if((USBDeviceState < CONFIGURED_STATE)||(USBSuspendControl==1));




int say=0;
	
   while(1)
    {


		// Check bus status and service USB interrupts.
 USBDeviceTasks();
	
		
		if((USBDeviceState < CONFIGURED_STATE)||(USBSuspendControl==1))continue;
if(!HIDRxHandleBusy(USBOutHandle))
    {  
    
    if(ReceivedDataBuffer[0]=='0')
{


    RC0 = ~RC0;

}else
if(ReceivedDataBuffer[0]=='1')
{


    RC1 = ~RC1;

} else
if(ReceivedDataBuffer[0]=='2')
{

    RC2 = ~RC2;
    
    
}
if(ReceivedDataBuffer[0]=='3')
{
if(RB2)RB2=0;
else RB2=1;
}


if(ReceivedDataBuffer[0]=='t')
{
    
    ToSendDataBuffer[0]=' ';


    
CHS2=0; //AN0 kanal� se�iliyor
CHS1=0;
CHS0=0;
DelayMs(15);
GO_DONE=1;
while(!GO_DONE);
tempature=(int)((ADRESH*256+ADRESL)/2); //ADRESL ve ADRESH �deki degerler uygun bi�imde
tempature=(tempature%100);
ToSendDataBuffer[0]=tempature;


if(!HIDTxHandleBusy(USBInHandle))
USBInHandle = HIDTxPacket(HID_EP,ToSendDataBuffer,64);
}


USBOutHandle=HIDRxPacket(HID_EP,ReceivedDataBuffer,64);

}




}
}




#endif
