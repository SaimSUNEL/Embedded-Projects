###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC18F4550
COMPILER = "MPASM (Proteus)"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=/q+ /p18f4550
LDFLAGS=/x /p18f4550

## Processing Tools
ASM=MPASMWIN.exe
LD=mplink.exe
LIB=mplib.exe
#  C:/Users/Saim/PIC-ATMELProjects/PIC18F4550BootLoaderAssembly/PIC18F4550/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC18F4550BootLoaderAssembly/PIC18F4550/Debug/PIC18B~1.o: TOOL=ASM
#        C:/Users/Saim/PIC-ATMELProjects/PIC18F4550BootLoaderAssembly/PIC18F4550/../PIC18F4550_/PIC18BootloaderInAssembly.asm

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	PIC18B~1.o 
	$(LD) $(LDFLAGS) /o "./Debug.cof" 18f4550_g.lkr "PIC18B~1.o"

PIC18B~1.o:	../../PIC18F4550_/PIC18BootloaderInAssembly.asm 
	$(ASM) /e"./PIC18B~1.err" /l"./PIC18B~1.lst" /o"PIC18B~1.o" $(ASMFLAGS)  "..\..\PIC18F4550_\PIC18BootloaderInAssembly.asm"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf ./PIC18B~1.err
	rm -rf ./PIC18B~1.hex
	rm -rf ./PIC18B~1.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf PIC18B~1.o
