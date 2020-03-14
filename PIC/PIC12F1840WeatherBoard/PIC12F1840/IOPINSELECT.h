//12 A 
//13 B
//14 C

void choose_input_pin(byte number)
{
CenterSetPin(11, number & 0x1);
CenterSetPin(12, (number >> 1) & 0x1);
CenterSetPin(13, (number >> 2) & 0x1);



}
