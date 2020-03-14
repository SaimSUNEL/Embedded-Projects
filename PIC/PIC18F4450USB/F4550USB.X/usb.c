#ifndef MAIN_C
#define MAIN_C

// PIC 18F4550 fuse configuration:
// Config word 1 (Oscillator configuration)
// 20Mhz crystal input scaled to 48Mhz and configured for USB operation


#include<htc.h>

#include "usb.h"
#include "HardwareProfile.h"
#include "usb_function_hid.h"
#include "genericHID.h"
__CONFIG(1, USBPLL & IESODIS & FCMDIS & HSPLL & CPUDIV1 & PLLDIV5);
// Config word 2
__CONFIG(2, VREGEN & PWRTDIS & BOREN & BORV20 & WDTDIS & WDTPS32K);
// Config word 3
__CONFIG(3, PBDIGITAL & LPT1DIS & MCLREN);
// Config word 4
__CONFIG(4, XINSTDIS & STVREN & LVPDIS & ICPORTDIS & DEBUGDIS);
// Config word 5, 6 and 7 (protection configuration)
__CONFIG(5, UNPROTECT);
__CONFIG(6, UNPROTECT);
__CONFIG(7, UNPROTECT);




int sayi=0;




static void InitialiseSystem(void);
void ProcessIO(void);
void main()
{
	
	
	InitialiseSystem();

 USBDeviceTasks();
  ProcessIO();  
   while(1)
    {
		// Check bus status and service USB interrupts.
        USBDeviceTasks();
ProcessIO(); 
		// Application-specific tasks.
            
    }
	
	
	
	
	
	
	
	}



static void InitialiseSystem(void)
{
    ADCON1 = 0x0F; // Default all pins to digital

	// Configure ports as inputs (1) or outputs(0)
	TRISA = 0xFF;
	TRISB = 0b00000000;
	TRISC = 0b00000000;
	TRISD = 0b00000000;
	TRISE = 0b00000001;

	// Clear all ports
	PORTB = 0b00000000;
	PORTC = 0b00000000;
	PORTD = 0b00000000;
	PORTE = 0b00000000;
 
  
    // Initialize the variable holding the handle for the last
    // transmission
    USBOutHandle = 0;
    USBInHandle = 0;

    
    
    USBDeviceInit();


}

// Process input and output
void delayMs()
{
int i,j;
for(i=0;i<=300;i++)
{
for(j=0;j<=50;j++);
}
}
void ProcessIO(void)
{   
    // If we are not in the configured state just return
    if((USBDeviceState < CONFIGURED_STATE)||(USBSuspendControl==1)) return;
    
	// We support the following commands:
	//
	// 0x80 Toggle the LED
	// 0x81 Read the push-switch status
	// 0x82 Read the LED status

	//Check if data was received from the host.
    if(!HIDRxHandleBusy(USBOutHandle))
    {   
if(sayi<4)
{



        switch(ReceivedDataBuffer[0])
		{
    
case '#':

RB1=1;
ToSendDataBuffer[0]='S';
ToSendDataBuffer[1]='a';
ToSendDataBuffer[2]='i';
ToSendDataBuffer[3]='m';
ToSendDataBuffer[4]=' ';
ToSendDataBuffer[5]='S';
ToSendDataBuffer[6]='U';
ToSendDataBuffer[7]='N';
ToSendDataBuffer[8]='E';
ToSendDataBuffer[9]='L';
 if(!HIDTxHandleBusy(USBInHandle))
				{
					USBInHandle = HIDTxPacket(HID_EP,ToSendDataBuffer,64);
				}




break;
case '-':

RB1=0;

break;



 
         
        }
       
 // Re-arm the OUT endpoint for the next packet

}
else
{
if(ReceivedDataBuffer[1]==73)RB0=1;
}
        USBOutHandle = HIDRxPacket(HID_EP,(BYTE*)&ReceivedDataBuffer,64);




 }  
}



#endif