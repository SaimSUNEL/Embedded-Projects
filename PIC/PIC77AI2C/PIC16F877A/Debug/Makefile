###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC16F877A
COMPILER = "HI-TECH C for PIC10/12/16"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
CCFLAGS=--pass1 --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -D_XTAL_FREQ=1000000 -G --chip=16F877A
LDFLAGS=--output=mcof --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -G --chip=16F877A

## Processing Tools
CC=picc.exe
ASM=picc.exe
LD=picc.exe
LIB=picc.exe
#  C:/Users/Saim/PIC-ATMELProjects/PIC77AI2C/PIC16F877A/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC77AI2C/PIC16F877A/Debug/I2CMaster.p1: TOOL=CC
#        C:/Users/Saim/PIC-ATMELProjects/PIC77AI2C/PIC16F877A/I2CMaster.c

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	I2CMaster.p1 
	$(LD) $(LDFLAGS)  -O"Debug.cof" "I2CMaster.p1"

I2CMaster.p1:	../I2CMaster.c 
	$(CC) $(CCFLAGS)  -O"I2CMaster.p1" "../I2CMaster.c"

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
	rm -rf ./I2CMaster.pre
	rm -rf ./I2CMaster.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf I2CMaster.p1
