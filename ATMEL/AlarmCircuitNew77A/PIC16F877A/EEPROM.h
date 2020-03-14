/*Functions implemented...
void EEPROM_initialize()
unsigned char EEPROM_read_byte(unsigned char address)
void EEPROM_write_byte(unsigned char address, unsigned char data)

*/


/*
When interfacing to the data memory block, EEDATA
holds the 8-bit data for read/write and EEADR holds the
address of the EEPROM location being accessed.
These devices have 128 or 256 bytes of data EEPROM
(depending on the device), with an address range from
00h to FFh. On devices with 128 bytes, addresses from
80h to FFh are unimplemented and will wraparound to
the beginning of data EEPROM memory. When writing
to unimplemented locations, the on-chip charge pump
will be turned off.

The EEPROM data memory allows single-byte read and
write

A byte write in data
EEPROM memory automatically erases the location
and writes the new data (erase-before-write).

The EEADRH:EEADR register pair can address up to
a maximum of 256 bytes of data EEPROM or up to a
maximum of 8K words of program EEPROM. When
selecting a data address value, only the LSByte of the
address is written to the EEADR register.

Control bit, EEPGD, determines if the access will be a
program or data memory access. When clear, as it is
when reset, any subsequent operations will operate on
the data memory. When set, any subsequent
operations will operate on the program memory.

Control bits, RD and WR, initiate read and write or
erase, respectively. These bits cannot be cleared, only
set, in software. They are cleared in hardware at completion
of the read or write operation. The inability to
clear the WR bit in software prevents the accidental,
premature termination of a write operation.

Interrupt flag bit, EEIF in the PIR2 register, is set when
the write is complete. It must be cleared in software.


*/
void EEPROM_initialize()
{
   /*
   bit 7 EEPGD: Program/Data EEPROM Select bit
1 = Accesses program memory
0 = Accesses */
   
   EEPGD = 0 ;
   /*
   bit 2 WREN: EEPROM Write Enable bit
1 = Allows write cycles
0 = Inhibits write to the EEPROM
   
   */
   WREN = 0;
   
}
/*
RD: Read Control bit
1 = Initiates an EEPROM read; RD is cleared in hardware. The RD bit can only be set (not
cleared) in software.
0 = Does not initiate an EEPROM read
To read a data memory location, the user must write the
address to the EEADR register, clear the EEPGD control
bit (EECON1<7>) and then set control bit RD
(EECON1<0>). The data is available in the very next
cycle in the EEDATA register; therefore, it can be read
in the next instruction (see Example 3-1). EEDATA will
hold this value until another read or until it is written to
by the user (during a write operation).
*/
unsigned char EEPROM_read_byte(unsigned char address)
{
  EEADR  = address ;
  
   RD = 1;
   while(RD);
      return EEDATA;
   
}
/*
WR: Write Control bit
1 = Initiates a write cycle. The bit is cleared by hardware once write is complete. The WR bit
can only be set (not cleared) in software.
0 = Write cycle to the EEPROM is complete



To write an EEPROM data location, the user must first
write the address to the EEADR register and the data to
the EEDATA register

The write will not initiate if the write sequence is not
exactly followed (write 55h to EECON2, write AAh to
EECON2, then set WR bit) for each byte

Additionally, the WREN bit in EECON1 must be set to
enable write. This mechanism prevents accidental
writes to data EEPROM due to errant (unexpected)
code execution (i.e., lost programs). The user should
keep the WREN bit clear at all times, except when
updating EEPROM. The WREN bit is not cleared
by hardware

the WR bit is
cleared in hardware and the EE Write Complete
Interrupt Flag bit (EEIF) is set. The user can either
enable this interrupt or poll this bit. EEIF must be
cleared by software.


The steps to write to EEPROM data memory are:
1. If step 10 is not implemented, check the WR bit
to see if a write is in progress.
2. Write the address to EEADR. Make sure that the
address is not larger than the memory size of
the device.
3. Write the 8-bit data value to be programmed in
the EEDATA register.
4. Clear the EEPGD bit to point to EEPROM data
memory.
5. Set the WREN bit to enable program operations.
6. Disable interrupts (if enabled).
7. Execute the special five instruction sequence:
• Write 55h to EECON2 in two steps (first
to W, then to EECON2)
• Write AAh to EECON2 in two steps (first
to W, then to EECON2)
• Set the WR bit
8. Enable interrupts (if using interrupts).
9. Clear the WREN bit to disable program
operations.
10. At the completion of the write cycle, the WR bit
is cleared and the EEIF interrupt flag bit is set.
(EEIF must be cleared by firmware.) If step 1 is
not implemented, then firmware should check
for EEIF to be set, or WR to clear, to indicate the
end of the program cycle.
*/
void EEPROM_write_byte(unsigned char address, unsigned char data)
{
   EEADR = address ;
   EEDATA = data ;
   WREN = 1;
   
   EECON2 = 0x55;
   EECON2 = 0xaa;
   WR = 1;
   while(WR);
   WREN = 0 ;
   
   
}
