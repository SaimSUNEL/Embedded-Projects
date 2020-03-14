


byte current_buffer_index = 0;
byte current_buffer[50];
byte available_byte_count = 0;
/*

void interrupt FNC()
{
if(RCIF)
{
	current_buffer[current_buffer_index] = RCREG;
	current_buffer_index ++;
	available_byte_count ++;
	UART_byte_send(RCREG);
}


}
*/