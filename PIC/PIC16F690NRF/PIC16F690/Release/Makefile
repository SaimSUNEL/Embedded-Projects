###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC16F690
COMPILER = "HI-TECH C for PIC10/12/16"
TARGET = Release
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=-C --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" --chip=16F690
CCFLAGS=--pass1 --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" -D_XTAL_FREQ=4000000 --chip=16F690
LDFLAGS=--output=intel --errformat="Error at file %%f line %%l column %%c: (%%n) %%s" --warnformat="Warning at file %%f line %%l column %%c: (%%n) %%s" --msgformat="Message at file %%f line %%l column %%c: (%%n) %%s" --chip=16F690

## Processing Tools
CC=picc.exe
ASM=picc.exe
LD=picc.exe
LIB=picc.exe
#  C:/Users/Saim/PIC-ATMELProjects/PIC16F690NRF/PIC16F690/Release/Release.hex: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC16F690NRF/PIC16F690/Release/PIC16f690NRF.p1: TOOL=CC
#        C:/Users/Saim/PIC-ATMELProjects/PIC16F690NRF/PIC16F690/PIC16f690NRF.c

# Build tree:
all:	Release

Release:	Release.hex
	cp "Release.hex" "C:/Users/Saim/PIC-ATMELProjects/PIC16F690NRF/PIC16F690.hex"

Release.hex:	PIC16f690NRF.p1 
	$(LD) $(LDFLAGS)  -O"Release.hex" "PIC16f690NRF.p1"

PIC16f690NRF.p1:	../PIC16f690NRF.c 
	$(CC) $(CCFLAGS)  -O"PIC16f690NRF.p1" "../PIC16f690NRF.c"

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
	rm -rf ./PIC16f690NRF.pre
	rm -rf ./PIC16f690NRF.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Release.hex
	rm -rf PIC16f690NRF.p1
