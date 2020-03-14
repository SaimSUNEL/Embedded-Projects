

#define DelayMs(x) _delay_ms(x)
#define LCDPORT PORTB //B portu veri göndermek için
#define RS portd.RD2 
#define RW portb.RB0
#define E portd.RD4  //Komut kullanýmýný anlaþýlýr ve kolay kullanýlabilir yapmak için tanýmlamalar yapýlýyor
#define Erase 0x01 // Display temizlenir
#define Start 0x02 //0x03 Baslangýc noktasýna gidilir
#define ToLeft 0x04 // Her karakterden sonra Imlec sola kaydýrýlýr
#define ToRight 0x06 // Her karakterden sonra Imlec saga kaydýrýlýr
#define Close 0x08 //Ekran Kapanýr
#define No_Cursor 0x0C //Imlec görünmez
#define Cursor_Enabled 0x0F //Imlec yanýp söner
#define CursorToLeft 0x10 // Imlec sola kaydýrýlýr
#define CursorToRight 0x14 // Imlec saga kaydýrýlýr
#define Display_ToLeft 0x18 // Display sola kaydýrýlýr
#define Display_ToRight 0x1C // Display saga kaydýrýlýr
#define Row_1 0x80 //1.Satýra gidilir
#define Row_2 0xC0 //2.satýra gidilir
#define Even_4bit 0x28
#define Even_8bit 0x38 //0x20
#define Odd_4bit 0x3C
#define Odd_8bit 0x30
extern void lcd_data(unsigned char ); //data gönderimi için fonksiyon
extern void lcd_init(void); //baslangýc ayarý için
extern void lcd_write(const char *s); //Ekrana yazý yazmak için
extern void lcd_clear(void); //Ekraný temizlemek için
extern void lcd_goto (unsigned char ,unsigned char );//Ýstenilen satýr ve sütuna gitmek için
extern void lcd_command(unsigned char );//Komut yollamak için


void lcd_command(unsigned char c){ //Komut gönderimi için
RW=0; //Yazma ve okuma kapalý
RS=0;
E=1; //Datasheete göre E=1 ‘den E=0’a olmasý gerekiyor
//LCDPORT=(c & 0xF0); //Ýlk 4 bit
portb.RB1 = c >> 4  & 1;
portb.RB4 = c >> 5 & 1;
portb.RB5 = c >> 6 & 1;
portd.RD7 = c >> 7 & 1;


E=0; //Yüksek deðerlikli bitler //Düþen Kenar
DelayMs(1);
E=1;
//LCDPORT=((c & 0x0F)<<4); //Son 4 bit Gönderilen bitler de üst üste
portb.RB1 = c   & 1;
portb.RB4 = c >> 1 & 1;
portb.RB5 = c >> 2 & 1;
portd.RD7 = c >> 3 & 1;
E=0; //Gelmemesi için kaydýrma yapýlýyor <<4
DelayMs(1);
}
void lcd_data(unsigned char c){ //Veri gönderimi data ile tek farký yazma iþlemi için
RW=0;
RS=1;
E=1;
//LCDPORT=(c & 0xF0);
portb.RB1 = c >> 4  & 1;
portb.RB4 = c >> 5 & 1;
portb.RB5 = c >> 6 & 1;
portd.RD7 = c >> 7 & 1;


E=0;
DelayMs(1);
E=1;
//LCDPORT=((c & 0x0F)<<4);
portb.RB1 = c   & 1;
portb.RB4 = c >> 1 & 1;
portb.RB5 = c >> 2 & 1;
portd.RD7 = c >> 3 & 1;

E=0;
DelayMs(1);
}
void lcd_clear(void){ //Displayi temizlemek için
lcd_command(Erase);
DelayMs(2);
}
void lcd_write(const char * s){ //Yazýlacak yazý karakter vs için
DelayMs(1);
while(*s)
lcd_data(*s++);
}
void lcd_goto (unsigned char p_1,unsigned char p_2){ //Ýstenen satýr ve sütuna gitmek için
if(p_1==1) //Ýlk satýr
lcd_command(Row_1+((p_2 - 1)%16));
else //2.satýr
lcd_command(Row_2+((p_2 - 1)%16));
}
void lcd_init(){

trisd.RD2 = 1;
trisb.RB0 = 1;
trisd.RD4 = 1;
trisb.RB1 = 1;
trisb.RB4 = 1;
trisb.RB5 = 1;
trisd.RD7 = 1 ;

RS=0; //Datasheete göre ilk ayarlar yapýlýyor
E=0;
RW=0;
DelayMs(1);
E=1;
lcd_command(Start); //Basla Komutu
DelayMs(2);
lcd_command(Even_4bit); //2 kere 4 bit gidecek
lcd_command(ToRight);
lcd_command(No_Cursor);
lcd_clear();
lcd_command(Row_1);
}
