###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC16F877A
COMPILER = "MPASM (MPLAB)"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=/q+ /p16f877a
LDFLAGS=/x /p16f877a

## Processing Tools
ASM=MPASMWIN.exe
LD=mplink.exe
LIB=mplib.exe
#  C:/Users/Saim/PIC-ATMELProjects/PIC77ABootloader/PIC16F877A/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC77ABootloader/PIC16F877A/Debug/PICBOO~1.o: TOOL=ASM
#        C:/Users/Saim/PIC-ATMELProjects/PIC77ABootloader/PIC16F877A/PICBootInAssembly.asm

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	PICBOO~1.o 
	$(LD) $(LDFLAGS) /o "./Debug.cof" 16f877a_g.lkr "PICBOO~1.o"

PICBOO~1.o:	../PICBootInAssembly.asm 
	$(ASM) /e"./PICBOO~1.err" /l"./PICBOO~1.lst" /o"PICBOO~1.o" $(ASMFLAGS)  "..\PICBootInAssembly.asm"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf ./PICBOO~1.err
	rm -rf ./PICBOO~1.hex
	rm -rf ./PICBOO~1.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf PICBOO~1.o
