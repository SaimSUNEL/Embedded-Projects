###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC18F4550
COMPILER = "HI-TECH C for PIC18"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
CCFLAGS=--pass1 --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -D_XTAL_FREQ=1000000 -G --chip=18F4550
LDFLAGS=--output=mcof -G --chip=18F4550

## Processing Tools
CC=picc18.exe
ASM=picc18.exe
LD=picc18.exe
LIB=picc18.exe
#  C:/Users/Saim/PIC-ATMELProjects/UpdatedRemoteCarProject/PIC18F4550/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/UpdatedRemoteCarProject/PIC18F4550/Debug/UPDATE~1.p1: TOOL=CC
#        C:/Users/Saim/PIC-ATMELProjects/UpdatedRemoteCarProject/PIC18F4550/UpdatedUSBKumandaTrasmitter.c
#     C:/Users/Saim/PIC-ATMELProjects/UpdatedRemoteCarProject/PIC18F4550/Debug/USB_DE~1.p1: TOOL=CC
#        C:/Tc/usb_descriptors.c
#     C:/Users/Saim/PIC-ATMELProjects/UpdatedRemoteCarProject/PIC18F4550/Debug/USB_DE~2.p1: TOOL=CC
#        C:/Tc/usb_device.c
#     C:/Users/Saim/PIC-ATMELProjects/UpdatedRemoteCarProject/PIC18F4550/Debug/USB_FU~1.p1: TOOL=CC
#        C:/Tc/usb_function_hid.c
#     C:/Users/Saim/PIC-ATMELProjects/UpdatedRemoteCarProject/PIC18F4550/Debug/USBCAL~1.p1: TOOL=CC
#        C:/Tc/usbcallback.c

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	UPDATE~1.p1 USB_DE~1.p1 USB_DE~2.p1 USB_FU~1.p1 USBCAL~1.p1 
	$(LD) $(LDFLAGS)  -O"Debug.cof" "UPDATE~1.p1" "USB_DE~1.p1" "USB_DE~2.p1" "USB_FU~1.p1" "USBCAL~1.p1"

UPDATE~1.p1:	../UpdatedUSBKumandaTrasmitter.c 
	$(CC) $(CCFLAGS)  -O"UPDATE~1.p1" "../UpdatedUSBKumandaTrasmitter.c"

USB_DE~1.p1:	../../../../../../Tc/usb_descriptors.c 
	$(CC) $(CCFLAGS)  -O"USB_DE~1.p1" "../../../../../../Tc/usb_descriptors.c"

USB_DE~2.p1:	../../../../../../Tc/usb_device.c 
	$(CC) $(CCFLAGS)  -O"USB_DE~2.p1" "../../../../../../Tc/usb_device.c"

USB_FU~1.p1:	../../../../../../Tc/usb_function_hid.c 
	$(CC) $(CCFLAGS)  -O"USB_FU~1.p1" "../../../../../../Tc/usb_function_hid.c"

USBCAL~1.p1:	../../../../../../Tc/usbcallback.c 
	$(CC) $(CCFLAGS)  -O"USBCAL~1.p1" "../../../../../../Tc/usbcallback.c"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf Debug.hxl
	rm -rf Debug.lst
	rm -rf Debug.sym
	rm -rf Debug.obj
	rm -rf Debug.sdb
	rm -rf Debug.as
	rm -rf ./startup.obj
	rm -rf ./startup.rlf
	rm -rf ./startup.as
	rm -rf ./startup.lst
	rm -rf ./funclist.
	rm -rf Debug.hex
	rm -rf UPDATE~1.pre
	rm -rf UPDATE~1.lst
	rm -rf USB_DE~1.pre
	rm -rf USB_DE~1.lst
	rm -rf USB_DE~2.pre
	rm -rf USB_DE~2.lst
	rm -rf USB_FU~1.pre
	rm -rf USB_FU~1.lst
	rm -rf USBCAL~1.pre
	rm -rf USBCAL~1.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf UPDATE~1.p1
	rm -rf USB_DE~1.p1
	rm -rf USB_DE~2.p1
	rm -rf USB_FU~1.p1
	rm -rf USBCAL~1.p1
