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
#  C:/Users/Saim/PIC-ATMELProjects/PIC18F4550Assembly/PIC18F4550/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC18F4550Assembly/PIC18F4550/Debug/timer1.o: TOOL=ASM
#        C:/Users/Saim/PIC-ATMELProjects/PIC18F4550Assembly/PIC18F4550/timer1.asm

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	timer1.o 
	$(LD) $(LDFLAGS) /o "./Debug.cof" 18f4550_g.lkr "timer1.o"

timer1.o:	../timer1.asm 
	$(ASM) /e"./timer1.err" /l"./timer1.lst" /o"timer1.o" $(ASMFLAGS)  "..\timer1.asm"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf ./timer1.err
	rm -rf ./timer1.hex
	rm -rf ./timer1.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf timer1.o
