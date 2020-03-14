
//Buzzer on lcd shift reg's 7th pin
void alarm_on()
{
shift_reg_set_pin_lcd(7, 1);

}
void alarm_off()
{
shift_reg_set_pin_lcd(7, 0);
}

