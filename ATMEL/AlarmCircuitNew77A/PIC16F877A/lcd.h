/* Funtions implemented
extern void lcd_data(unsigned char);
extern void lcd_init(void);
extern void lcd_write(const char *s);
extern void lcd_clear(void);
extern void lcd_goto(unsigned char,unsigned char);
extern void lcd_command(unsigned char c); 
void tarihi_goster()
void saati_goster()

*/



//#define LCDPORT PORTB
#define RS RB1
#define RW RB2
#define E RB3
#define sil 0x01
#define basla 0x02
#define sola 0x04
#define saga 0x06
#define kapat 0x08
#define imlec_yok 0x0C
#define imlec_var 0x0F
#define imlec_sola 0x10
#define imlec_saga 0x14
#define display_sola 0x18
#define display_saga 0x1C
#define satir_1 0x80
#define satir_2 0xC0
#define cift_4bit 0x28
#define cift_8bit 0x38
#define tek_4bit 0x3C
#define tek_8bit 0x30

#define DelayMs(x) __delay_ms(x)
extern void lcd_data(unsigned char);
extern void lcd_init(void);
extern void lcd_write(const char *s);
extern void lcd_clear(void);
extern void lcd_goto(unsigned char,unsigned char);
extern void lcd_command(unsigned char c); 
void show_information();//first 8 characters of first and second row will be used to show general information

byte cursor_x=1, cursor_y=1 ;

unsigned char __temp ;
void lcd_command(unsigned char c)
{
RS=0;
E=1;
   
__temp = c&0xF0 ;   
RB4 = __temp >> 4 ;
RB5 = __temp >> 5 ;
RB6 = __temp >> 6 ;
RB7 = __temp >> 7 ;   
   
//LCDPORT = c&0xF0 ;

DelayMs( 2 );
E=0;
DelayMs(1);
E=1;

__temp = ((c & 0x0F)<<4) ;
RB4 = __temp >> 4 ;
RB5 = __temp >> 5 ;
RB6 = __temp >> 6 ;
RB7 = __temp >> 7 ;     
   
//LCDPORT=;

DelayMs( 2 );
E=0;
DelayMs(1);
}

void lcd_data(unsigned char c)
{

RS=1;
E=1;
   
__temp = (c & 0xF0) ; 
//LCDPORT=;
RB4 = __temp >> 4 ;
RB5 = __temp >> 5 ;
RB6 = __temp >> 6 ;
RB7 = __temp >> 7 ;
   
   
DelayMs( 2 );
E=0;
DelayMs(1);
E=1;
__temp = ((c & 0x0F)<<4) ;   
//LCDPORT=;
RB4 = __temp >> 4 ;
RB5 = __temp >> 5 ;
RB6 = __temp >> 6 ;
RB7 = __temp >> 7 ;

DelayMs( 2 );
E=0;
DelayMs(1);
cursor_x ++;
if(cursor_x == 17)
{
	cursor_x = 1;
	cursor_y = 2;
}
}
void lcd_clear(void)
{
lcd_command(sil);
DelayMs(2);
cursor_x = 1;
cursor_y = 1;
}

void lcd_write(const char *s)
{
DelayMs(1);
while(*s)lcd_data(*s++);
}

void lcd_goto(unsigned char p_1,unsigned char p_2)
{
cursor_x = p_2;
cursor_y = p_1;
if(p_1==1)
{lcd_command(satir_1+((p_2-1)%16));

}else{
lcd_command(satir_2+((p_2-1)%16));
}

}


void lcd_init()
{
RS=0;
E=0;

DelayMs(1);
E=1;
lcd_command(basla);
DelayMs(2);
lcd_command(cift_4bit);
lcd_command(saga);

lcd_command(saga);

lcd_command(imlec_yok);

lcd_clear();

lcd_command(satir_1);
}

//9 because lcd function does not care about the length of the string, compiler allocates
//these arrays sequentially so it displays both of them wrongly...
char tarih_str[9], saat_str[9];


void tarihi_goster()
{
DS1307_date();
sprintf(tarih_str, "%d%d/%d%d/%d%d", tarih[GUN]/10, tarih[GUN]%10, 
									 tarih[AY]/10, tarih[AY]%10, 
									 tarih[YIL]/10, tarih[YIL]%10);
	
	lcd_goto(2,9);
	lcd_write(tarih_str);

}
void saati_goster()
{
DS1307_time();
 sprintf(saat_str, "%d%d:%d%d:%d%d", zaman[SAAT]/10, zaman[SAAT]%10, 
										zaman[DAKIKA]/10, zaman[DAKIKA]%10, 
										zaman[SANIYE]/10, zaman[SANIYE]%10 );
lcd_goto(1,9);
	lcd_write(saat_str);
}
//first 8 characters of first and second row will be used to show general information
byte _i;
extern unsigned char EEPROM_read_byte(unsigned char address);
void show_information()
{
lcd_goto(1, 1);
for(_i=0; _i<8;_i++)
lcd_data(EEPROM_read_byte(248+_i));

lcd_goto(2, 1);
for(_i=0; _i<8;_i++)
lcd_data(EEPROM_read_byte(240+_i));

}
extern void EEPROM_write_byte(unsigned char address, unsigned char data);
void save_information(byte * data, byte index)
{ 
for(byte jk=0; jk <8; jk++)
	EEPROM_write_byte(256-8*index+jk, data[jk]);

}

