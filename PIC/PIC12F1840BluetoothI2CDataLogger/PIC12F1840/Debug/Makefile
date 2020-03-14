###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC12F1840
COMPILER = "HI-TECH C for PIC10/12/16"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
CCFLAGS=--pass1 --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -D_XTAL_FREQ=4000000 -G --chip=12F1840
LDFLAGS=--output=mcof --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -G --chip=12F1840

## Processing Tools
CC=picc.exe
ASM=picc.exe
LD=picc.exe
LIB=picc.exe
#  C:/Users/Saim/PIC-ATMELProjects/PIC12F1840BluetoothI2CDataLogger/PIC12F1840/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC12F1840BluetoothI2CDataLogger/PIC12F1840/Debug/DataLogger.p1: TOOL=CC
#        C:/Users/Saim/PIC-ATMELProjects/PIC12F1840BluetoothI2CDataLogger/PIC12F1840/DataLogger.c

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	DataLogger.p1 
	$(LD) $(LDFLAGS)  -O"Debug.cof" "DataLogger.p1"

DataLogger.p1:	../DataLogger.c 
	$(CC) $(CCFLAGS)  -O"DataLogger.p1" "../DataLogger.c"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf ./Debug.hxl
	rm -rf ./Debug.lst
	rm -rf ./Debug.sym
	rm -rf ./Debug.obj
	rm -rf ./Debug.sdb
	rm -rf ./Debug.as
	rm -rf ./startup.obj
	rm -rf ./startup.rlf
	rm -rf ./startup.as
	rm -rf ./startup.lst
	rm -rf ./funclist.
	rm -rf ./Debug.hex
	rm -rf ./DataLogger.pre
	rm -rf ./DataLogger.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf DataLogger.p1
