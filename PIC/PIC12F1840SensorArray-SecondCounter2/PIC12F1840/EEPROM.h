
void EEPROM_WriteByte(byte address, byte value)
{
EEPGD = 0;
CFGS = 0;
EEDATL = value;
EEADRL = address;

WREN = 1;

EECON2 = 0x55;
EECON2 = 0xaa;

WR = 1;

while(WR);



EEIF = 0;
WREN = 0;
}

byte EEPROM_ReadByte(byte address)
{
EEPGD = 0;
CFGS = 0;
EEADRL = address;
RD = 1;
while(RD);
EEIF = 0;
return EEDATL;
}