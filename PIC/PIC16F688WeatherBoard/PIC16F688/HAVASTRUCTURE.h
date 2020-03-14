

struct HAVA {
char week_day; //[0-6]¦
char day; //[0-31]
char month; //[1-12]
char year; //[0-99]
signed char min_temp;
signed char max_temp;
char weather_phrase;
char relative_index; //[1-5]
};


struct BUGUNSTRUCTURE {
char week_day; //[0-6]¦
char day; //[0-31]
char month; //[1-12]
char year; //[0-99]
signed char min_temp;
signed char max_temp;
char weather_phrase;
char relative_index; //[1-5]
//signed char current_temp_0;
//char current_temp_1;
//char current_phrase;
};



struct HAVA gunler[5];

char CURRENCY[6];

char kl[2];
byte number_array[5];
extern struct BUGUNSTRUCTURE bugun;
void show_date_info(signed char * day)
{
lcd_clear();
lcd_goto(1, 1);

const char * p;
switch(day[0])
{
	case 0:
		p = "Pazar";
		break;
	case 1:
		p = "Pazarte.";
		break;

	case 2:
		p = "Sali";
		break;
	case 3:
		p = "Carsamba";
		break;
	case 4:
		p = "Persembe";
		break;
	case 5:
		p = "Cuma";
		break;
	case 6:
		p = "Cumarte.";
		break;
}
lcd_write(p);
if(day[0] == ((char*)&bugun)[0])
	lcd_write("(B)");
signed char k = 0, l;
k = day[4]; 
l = day[5];
byte temp_count ;
if(k/10 == 0) temp_count = 1;
else temp_count = 2;
// for - sign...
if(k < 0) temp_count++;

if(l/10 == 0) temp_count += 1;
else temp_count += 2;
// for - sign...
if(l< 0) temp_count++;

lcd_goto(1, 16-temp_count);
itoa((char *)number_array, k, 10);
lcd_write(number_array);
//lcd_write_number(k);
lcd_write("-");
itoa((char *)number_array, l, 10);
lcd_write(number_array);
//lcd_write_number(l);

lcd_goto(2, 1);
k = 57;
l=1;
while(EEPROM_ReadByte(k) != day[6])k++;
k++;
while(1)
{
	kl[0] = EEPROM_ReadByte(k++);
	if(kl[0] ==0) break;
	lcd_write(kl);
}


}

void show_currency_info(char * cur, char * value)
{
lcd_write(cur);
//;
//lcd_write(".");
//

}
void show_currency_information()
{
lcd_clear();
const  unsigned char * p [] = { "Dolar:", "EURO:", "AUD:"};
for(byte k = 0; k < 3 ; k++)
{
itoa((char *)number_array,  CURRENCY[2*k], 10);
lcd_write(p[k]);
lcd_write(number_array);
lcd_write(".");
itoa((char *)number_array,  CURRENCY[2*k+1], 10);
lcd_write(number_array);
lcd_write(" ");
}

}

//[0-39] 40 bytes for 5 day informations...
//[40-50] 11 bytes current day info...
//[51, 56] 6 bytes for currency...
//57 -> 255 weather situations...
//For all CURRENCY and HAVA saving we will use it to save program space...
void saveToEEPROM(byte address, char * p, byte size)
{
byte i = 0;
for(; i < size; i++)
{
	EEPROM_WriteByte(address+i, p[i]-48);
	__delay_ms(2);
}

}
void loadFromEPPROM(byte address, char * p, byte size)
{
byte i = 0;
for(; i < size; i++)
{
	p[i] = EEPROM_ReadByte(address+i);
	__delay_ms(2);
}


}
byte compareData(byte address, char * p, byte size)
{
	byte i=0;
	for(;i< size; i++)
	{
		if(EEPROM_ReadByte(address+i) != p[i]-48)
			return FALSE;
	}

	return TRUE;
}

