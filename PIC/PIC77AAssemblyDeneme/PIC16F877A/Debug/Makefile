###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC16F877A
COMPILER = "MPASM (Proteus)"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=/q+ /p16f877a
LDFLAGS=/x /p16f877a

## Processing Tools
ASM=MPASMWIN.exe
LD=mplink.exe
LIB=mplib.exe
#  C:/Users/Saim/PIC-ATMELProjects/77AAssemblyDeneme/PIC16F877A/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/77AAssemblyDeneme/PIC16F877A/Debug/deneme.o: TOOL=ASM
#        C:/Users/Saim/PIC-ATMELProjects/77AAssemblyDeneme/deneme.asm

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	deneme.o 
	$(LD) $(LDFLAGS) /o "./Debug.cof" 16f877a_g.lkr "deneme.o"

deneme.o:	../../deneme.asm 
	$(ASM) /e"./deneme.err" /l"./deneme.lst" /o"deneme.o" $(ASMFLAGS)  "..\..\deneme.asm"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf ./deneme.err
	rm -rf ./deneme.hex
	rm -rf ./deneme.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf deneme.o
