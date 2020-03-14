// 4, 5,6 pinler 0. bit-4 1. bit -5 
#define INPUTHEADER 6
byte pin_mem;
// 0 .. 8 -> first 3 bits
//remaining 4 bits...
void input_selection(byte number)
{
	pin_mem &= 0xf0;
	pin_mem += number;
	set_segment_shift(INPUTHEADER, pin_mem);

}
