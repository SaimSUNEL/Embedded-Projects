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
void uyandir()
{
	for(int a=0;a<8;a++)
	{RD0=uyan[a]-48;
		DelayUs(1500);
		
	}
	
RD0=0;
	DelayUs(1500);
	
	
	
	}
	char senk[]="00000000";
	char senk1[]="11111111";
	void senkron()
{
	for(int a=0;a<8;a++)
	{RD0=senk[a]-48;
		DelayUs(1500);
		
	}
	for(int a=0;a<8;a++)
	{RD0=senk1[a]-48;
		DelayUs(1500);
		
	}
	RD0=0;
	DelayUs(1500);
	
	
	
	}
	
	
	
	
kodla_gonder(int sayi)

{index=0;
	while(index!=8)
 {
     gelen_veri[7-index]=sayi%2;
    bolum=sayi/2;
    sayi=bolum;
     index++;
 }
RD0=1;
DelayUs(2000-1); 
 RD0=0;
 DelayUs(1200-1);
 
 for(int a=0;a<8;a++)
 {
	 RD0=gelen_veri[a];
	 DelayUs(1500);
	
 }
 DelayUs(1000);
 RD0=0;
	
	
	
}


int sayi=0;
// Main function
void main(void)
{DelayMs(10);
//	ADCON1=0x06;
//PORTA=0x01;
	TRISB = 0b00000000;
	TRISC = 0b00000000;
	TRISD = 0b00000000;
	TRISE = 0b00000001;
ADCS2=1;
ADCS1=0;
ADCS0=1;	
	
	
PCFG3=1; 
PCFG2=1;
PCFG1=1;
PCFG0=0;
ADFM=1; //Saga dayalý ADRESL ve ADRESH
ADON=1;	
	
	
	int tempature;

	CHS2=0; //AN0 kanalý seçiliyor
CHS1=0;
CHS0=0;
DelayMs(15);
GO_DONE=1;
while(!GO_DONE);
tempature=(int)((ADRESH*256+ADRESL)/2); //ADRESL ve ADRESH ‘deki degerler uygun biçimde
tempature=(tempature%100)/10;

	// Clear all ports
	PORTB = 0b00000000;
	PORTC = 0b00000000;
	PORTD = 0b00000000;
	PORTE = 0b00000000;
	uyandir();
	uyandir();
	senkron();
	kodla_gonder(33);





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

ToSendDataBuffer[1]='S';
ToSendDataBuffer[2]='a';
ToSendDataBuffer[3]='i';
ToSendDataBuffer[4]='m';

ToSendDataBuffer[5]=' ';
ToSendDataBuffer[6]='T';
ToSendDataBuffer[7]='o';
ToSendDataBuffer[8]='s';
ToSendDataBuffer[9]='b';
ToSendDataBuffer[10]='a';
ToSendDataBuffer[11]='g';
ToSendDataBuffer[12]='a';
ToSendDataBuffer[13]=' ';
ToSendDataBuffer[14]='N';
ToSendDataBuffer[15]='i';
ToSendDataBuffer[16]='s';
ToSendDataBuffer[17]='a';
 CHS2=0; //AN0 kanalý seçiliyor
CHS1=0;
CHS0=0;
DelayMs(15);
GO_DONE=1;
while(!GO_DONE);
tempature=(int)((ADRESH*256+ADRESL)/2); //ADRESL ve ADRESH ‘deki degerler uygun biçimde
tempature=(tempature%100);
ToSendDataBuffer[18]=tempature;


if(!HIDTxHandleBusy(USBInHandle))
USBInHandle = HIDTxPacket(HID_EP,ToSendDataBuffer,64);
}


USBOutHandle=HIDRxPacket(HID_EP,ReceivedDataBuffer,64);

}




}
}




#endif
