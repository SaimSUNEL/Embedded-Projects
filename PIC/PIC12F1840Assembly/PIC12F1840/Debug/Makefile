###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = PIC12F1840
COMPILER = "MPASM (MPLAB)"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=/q+ /p12f1840
LDFLAGS=/x /p12f1840

## Processing Tools
ASM=MPASMWIN.exe
LD=mplink.exe
LIB=mplib.exe
#  C:/Users/Saim/PIC-ATMELProjects/PIC/PIC12F1840Assembly/PIC12F1840/Debug/Debug.cof: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/PIC/PIC12F1840Assembly/PIC12F1840/Debug/PICF18~1.o: TOOL=ASM
#        C:/Users/Saim/PIC-ATMELProjects/PIC/PIC12F1840Assembly/PIC12F1840/PICf1840Assembly.asm

# Build tree:
all:	Debug

Debug:	Debug.cof

Debug.cof:	PICF18~1.o 
	$(LD) $(LDFLAGS) /o "./Debug.cof" 12f1840_g.lkr "PICF18~1.o"

PICF18~1.o:	../PICf1840Assembly.asm 
	$(ASM) /e"./PICF18~1.err" /l"./PICF18~1.lst" /o"PICF18~1.o" $(ASMFLAGS)  "..\PICf1840Assembly.asm"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf ./PICF18~1.err
	rm -rf ./PICF18~1.hex
	rm -rf ./PICF18~1.lst

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.cof
	rm -rf PICF18~1.o
