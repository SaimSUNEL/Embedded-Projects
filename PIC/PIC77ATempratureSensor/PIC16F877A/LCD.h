#define LCDPORT PORTB
#define RS RC3
#define RW RC4
#define E RC2
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

extern void lcd_data(unsigned char);
extern void lcd_init(void);
extern void lcd_write(const char *s);
extern void lcd_clear(void);
extern void lcd_goto(unsigned char,unsigned char);
extern void lcd_command(unsigned char c); 


void lcd_command(unsigned char c)
{
RW=0;
RS=0;
E=1;
LCDPORT = c&0xF0 ;
DelayMs( 2 );
E=0;
DelayMs(1);
E=1;
LCDPORT=((c & 0x0F)<<4);DelayMs( 2 );
E=0;
DelayMs(1);
}

void lcd_data(unsigned char c)
{
RW=0;
RS=1;
E=1;
LCDPORT=(c & 0xF0);DelayMs( 2 );
E=0;
DelayMs(1);
E=1;
LCDPORT=((c & 0x0F)<<4);DelayMs( 2 );
E=0;
DelayMs(1);
}
void lcd_clear(void)
{


lcd_command(sil);
DelayMs(2);
}

void lcd_write(const char *s)
{
DelayMs(1);
while(*s)lcd_data(*s++);
}
void lcd_goto(unsigned char p_1,unsigned char p_2)
{

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
RW=0;
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








