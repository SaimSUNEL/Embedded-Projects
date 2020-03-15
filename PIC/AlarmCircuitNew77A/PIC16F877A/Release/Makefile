###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC16F877A
COMPILER = "HI-TECH C for PIC10/12/16"
TARGET = Release
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
CCFLAGS=--pass1 --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -D_XTAL_FREQ=16000000 --chip=16F877A
LDFLAGS=--output=intel --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" --chip=16F877A

## Processing Tools
CC=picc.exe
ASM=picc.exe
LD=picc.exe
LIB=picc.exe
#  C:/Users/Saim/PIC-ATMELProjects/AlarmCircuitNew77A/PIC16F877A/Release/Release.hex: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/AlarmCircuitNew77A/PIC16F877A/Release/NewCircuit.p1: TOOL=CC
#        C:/Users/Saim/PIC-ATMELProjects/AlarmCircuitNew77A/PIC16F877A/NewCircuit.c

# Build tree:
all:	Release

Release:	Release.hex
	cp "Release.hex" "C:/Users/Saim/PIC-ATMELProjects/AlarmCircuitNew77A/PIC16F877A.hex"

Release.hex:	NewCircuit.p1 
	$(LD) $(LDFLAGS)  -O"Release.hex" "NewCircuit.p1"

NewCircuit.p1:	../NewCircuit.c 
	$(CC) $(CCFLAGS)  -O"NewCircuit.p1" "../NewCircuit.c"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf ./Release.hxl
	rm -rf ./Release.lst
	rm -rf ./Release.sym
	rm -rf ./Release.obj
	rm -rf ./Release.sdb
	rm -rf ./Release.as
	rm -rf ./startup.obj
	rm -rf ./startup.rlf
	rm -rf ./startup.as
	rm -rf ./startup.lst
	rm -rf ./funclist.
	rm -rf ./NewCircuit.pre
	rm -rf ./NewCircuit.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Release.hex
	rm -rf NewCircuit.p1
