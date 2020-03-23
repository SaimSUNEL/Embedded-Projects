###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC18F2550
COMPILER = "HI-TECH C for PIC18"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
CCFLAGS=--pass1 --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -D_XTAL_FREQ=8000000 -G --chip=18F2550
LDFLAGS=--output=mcof -G --chip=18F2550

## Processing Tools
CC=picc18.exe
ASM=picc18.exe
LD=picc18.exe
LIB=picc18.exe
#  C:/Users/Saim/PIC-ATMELProjects/PIC/PIC18F2550I2C/PIC18F2550/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC/PIC18F2550I2C/PIC18F2550/Debug/PIC18F~1.p1: TOOL=CC
#        C:/Users/Saim/PIC-ATMELProjects/PIC/PIC18F2550I2C/PIC18F2550/PIC18F2550.c

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	PIC18F~1.p1 
	$(LD) $(LDFLAGS)  -O"Debug.cof" "PIC18F~1.p1"

PIC18F~1.p1:	../PIC18F2550.c 
	$(CC) $(CCFLAGS)  -O"PIC18F~1.p1" "../PIC18F2550.c"

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
	rm -rf PIC18F~1.pre
	rm -rf PIC18F~1.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf PIC18F~1.p1
