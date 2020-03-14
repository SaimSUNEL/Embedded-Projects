

#define DelayMs(x) _delay_ms(x)
#define LCDPORT PORTB //B portu veri g�ndermek i�in
#define RS portd.RD2 
#define RW portb.RB0
#define E portd.RD4  //Komut kullan�m�n� anla��l�r ve kolay kullan�labilir yapmak i�in tan�mlamalar yap�l�yor
#define Erase 0x01 // Display temizlenir
#define Start 0x02 //0x03 Baslang�c noktas�na gidilir
#define ToLeft 0x04 // Her karakterden sonra Imlec sola kayd�r�l�r
#define ToRight 0x06 // Her karakterden sonra Imlec saga kayd�r�l�r
#define Close 0x08 //Ekran Kapan�r
#define No_Cursor 0x0C //Imlec g�r�nmez
#define Cursor_Enabled 0x0F //Imlec yan�p s�ner
#define CursorToLeft 0x10 // Imlec sola kayd�r�l�r
#define CursorToRight 0x14 // Imlec saga kayd�r�l�r
#define Display_ToLeft 0x18 // Display sola kayd�r�l�r
#define Display_ToRight 0x1C // Display saga kayd�r�l�r
#define Row_1 0x80 //1.Sat�ra gidilir
#define Row_2 0xC0 //2.sat�ra gidilir
#define Even_4bit 0x28
#define Even_8bit 0x38 //0x20
#define Odd_4bit 0x3C
#define Odd_8bit 0x30
extern void lcd_data(unsigned char ); //data g�nderimi i�in fonksiyon
extern void lcd_init(void); //baslang�c ayar� i�in
extern void lcd_write(const char *s); //Ekrana yaz� yazmak i�in
extern void lcd_clear(void); //Ekran� temizlemek i�in
extern void lcd_goto (unsigned char ,unsigned char );//�stenilen sat�r ve s�tuna gitmek i�in
extern void lcd_command(unsigned char );//Komut yollamak i�in


void lcd_command(unsigned char c){ //Komut g�nderimi i�in
RW=0; //Yazma ve okuma kapal�
RS=0;
E=1; //Datasheete g�re E=1 �den E=0�a olmas� gerekiyor
//LCDPORT=(c & 0xF0); //�lk 4 bit
portb.RB1 = c >> 4  & 1;
portb.RB4 = c >> 5 & 1;
portb.RB5 = c >> 6 & 1;
portd.RD7 = c >> 7 & 1;


E=0; //Y�ksek de�erlikli bitler //D��en Kenar
DelayMs(1);
E=1;
//LCDPORT=((c & 0x0F)<<4); //Son 4 bit G�nderilen bitler de �st �ste
portb.RB1 = c   & 1;
portb.RB4 = c >> 1 & 1;
portb.RB5 = c >> 2 & 1;
portd.RD7 = c >> 3 & 1;
E=0; //Gelmemesi i�in kayd�rma yap�l�yor <<4
DelayMs(1);
}
void lcd_data(unsigned char c){ //Veri g�nderimi data ile tek fark� yazma i�lemi i�in
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
void lcd_clear(void){ //Displayi temizlemek i�in
lcd_command(Erase);
DelayMs(2);
}
void lcd_write(const char * s){ //Yaz�lacak yaz� karakter vs i�in
DelayMs(1);
while(*s)
lcd_data(*s++);
}
void lcd_goto (unsigned char p_1,unsigned char p_2){ //�stenen sat�r ve s�tuna gitmek i�in
if(p_1==1) //�lk sat�r
lcd_command(Row_1+((p_2 - 1)%16));
else //2.sat�r
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

RS=0; //Datasheete g�re ilk ayarlar yap�l�yor
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
