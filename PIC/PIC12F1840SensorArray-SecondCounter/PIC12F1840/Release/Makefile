###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC12F1840
COMPILER = "HI-TECH C for PIC10/12/16"
TARGET = Release
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=-C --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" --chip=12F1840
CCFLAGS=--pass1 --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -D_XTAL_FREQ=16000000 --chip=12F1840
LDFLAGS=--output=intel --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" --chip=12F1840

## Processing Tools
CC=picc.exe
ASM=picc.exe
LD=picc.exe
LIB=picc.exe
#  C:/Users/Saim/PIC-ATMELProjects/PIC12F1840SensorArray-SecondCounter/PIC12F1840/Release/Release.hex: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC12F1840SensorArray-SecondCounter/PIC12F1840/Release/PIC12f1840CandAssembly.p1: TOOL=CC
#        C:/Users/Saim/PIC-ATMELProjects/PIC12F1840SensorArray-SecondCounter/PIC12F1840/PIC12f1840CandAssembly.c

# Build tree:
all:	Release

Release:	Release.hex
	cp "Release.hex" "C:/Users/Saim/PIC-ATMELProjects/PIC12F1840SensorArray-SecondCounter/PIC12F1840.hex"

Release.hex:	PIC12f1840CandAssembly.p1 
	$(LD) $(LDFLAGS)  -O"Release.hex" "PIC12f1840CandAssembly.p1"

PIC12f1840CandAssembly.p1:	../PIC12f1840CandAssembly.c 
	$(CC) $(CCFLAGS)  -O"PIC12f1840CandAssembly.p1" "../PIC12f1840CandAssembly.c"

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
	rm -rf ./PIC12f1840CandAssembly.pre
	rm -rf ./PIC12f1840CandAssembly.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Release.hex
	rm -rf PIC12f1840CandAssembly.p1
