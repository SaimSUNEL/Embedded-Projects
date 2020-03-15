###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = ATmega328P
COMPILER = "AVRASM (Proteus)"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=-fO -i"..\..\..\..\..\..\..\Program Files (x86)\Labcenter Electronics\Proteus 8 Professional\VSM Studio\Tools\AVRASM\appnotes\m328Pdef.inc"

## Processing Tools
ASM=avrasm2.exe
#  C:/Users/Saim/PIC-ATMELProjects/ATMEL/328PAssembly/ATmega328P/Debug/Debug.obj: TOOL=ASM
#     C:/Users/Saim/PIC-ATMELProjects/ATMEL/328PAssembly/ATmega328P/code.asm

# Build tree:
all:	Debug

Debug:	Debug.obj

Debug.obj:	../code.asm 
	$(ASM) $(ASMFLAGS)  -o "Debug.obj" -l Debug.lst "..\code.asm"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf Debug.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.obj
