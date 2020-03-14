

#define LED_DATA 5

void led_on (byte led)
{
set_segment_shift(LED_DATA, led);
}