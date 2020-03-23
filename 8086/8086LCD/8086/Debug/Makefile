###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = 8086
COMPILER = "MASM32"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
ASMFLAGS=/c /Zd /Zi
LDFLAGS=/CODEVIEW

## Processing Tools
ASM=ml.exe
LD=link16.exe
#  C:/Users/Saim/PIC-ATMELProjects/8086/8086LCD/8086/Debug/Debug.exe: TOOL=LD
#     C:/Users/Saim/PIC-ATMELProjects/8086/8086LCD/8086/Debug/8086LCD.obj: TOOL=ASM
#        C:/Users/Saim/PIC-ATMELProjects/8086/8086LCD/8086/8086LCD.asm

# Build tree:
all:	Debug

Debug:	Debug.exe

Debug.exe:	8086LCD.obj 
	$(LD) $(LDFLAGS) 8086LCD.obj,Debug.exe,nul.map,,,

8086LCD.obj:	../8086LCD.asm 
	$(ASM) $(ASMFLAGS) ../8086LCD.asm

# tidy - delete all temporary files which are not involved in the target generation
tidy:

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.exe
	rm -rf 8086LCD.obj
