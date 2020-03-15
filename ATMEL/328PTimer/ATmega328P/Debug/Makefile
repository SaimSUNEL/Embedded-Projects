###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = ATmega328P
COMPILER = "WinAVR"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
CCFLAGS=-Wall -gdwarf-2 -fsigned-char -MD -MP -DF_CPU=1000000 -O1 -mmcu=atmega328p
LDFLAGS=-mmcu=atmega328p

## Processing Tools
CC=avr-gcc.exe
ASM=avr-gcc.exe
LD=avr-gcc.exe
#  C:/Users/Saim/PIC-ATMELProjects/ATMEL/328PTimer/ATmega328P/Debug/Debug.elf: TOOL=LD
#  Post: $(OBJ) avr-objcopy -O ihex -R .eeprom "./Debug.elf" "./Debug.hex"
#  Post: $(OBJ) avr-objcopy -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 --no-change-warnings -O ihex "./Debug.elf" "./Debug.eep" || exit 0 
#     C:/Users/Saim/PIC-ATMELProjects/ATMEL/328PTimer/ATmega328P/Debug/AtmegaTimer.o: TOOL=CC
#        C:/Users/Saim/PIC-ATMELProjects/ATMEL/328PTimer/ATmega328P/AtmegaTimer.c

# Build tree:
all:	Debug

Debug:	Debug.elf

Debug.elf:	AtmegaTimer.o 
	$(LD) $(LDFLAGS)  -o "./Debug.elf" "AtmegaTimer.o"
	$(OBJ) avr-objcopy -O ihex -R .eeprom "./Debug.elf" "./Debug.hex"
	$(OBJ) avr-objcopy -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 --no-change-warnings -O ihex "./Debug.elf" "./Debug.eep" || exit 0 

AtmegaTimer.o:	../AtmegaTimer.c 
	$(CC) $(CCFLAGS)  -o "AtmegaTimer.o" -c "../AtmegaTimer.c"

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf ./AtmegaTimer.d

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.elf
	rm -rf AtmegaTimer.o
