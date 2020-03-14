/*
16MHZ kuracaðýz ona göre usartý hex dosyasýnýn frequency , I2c frekansýný 16 MHz ye göre ayarla...
Devreyi çalýþtýrmadan önce tüm eerpoma sýfýr yazan bir program çalýþtýr ve tüm eepromu sýfýrla

DHT11 RC5 pininde



*/
#include<stdio.h>


#include<htc.h>


#define DelayMs(x) __delay_ms(x)


//#define LCDPORT PORTB
#define RS RC1  //
//Rw direk ground ta
#define E RC2//
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

unsigned char _temp_ ;
unsigned char tempor_var ;

void lcd_data(unsigned char);
 void lcd_init(void);
 void lcd_write(const char *s);
 void lcd_clear(void);
 void lcd_goto(unsigned char,unsigned char);
 void lcd_command(unsigned char c); 


void lcd_command(unsigned char c)
{
	//PORTD lcd data da 
	/*
	RD4 - Data4
	RD5 - Data5
	RD6 - Data6
	RD7 - Data7
	
	
	
	
	*/
	
	
RS=0;
E=1;
	
_temp_ =  c&0xF0 ;
RD7 = _temp_ >> 7 ; //7.bit Data7
RD6 = _temp_ >> 6 ; //6. bit data6
RD5 = _temp_ >> 5 ; //5. bit data 5
RD4 = _temp_ >> 4 ; //4 .bit Data4

	
//LCDPORT =  ;
DelayMs( 2 );
E=0;
DelayMs(1);
E=1;
_temp_ = ((c & 0x0F)<<4) ;
RD7 = _temp_ >> 7 ; //7.bit Data7
RD6 = _temp_ >> 6 ; //6. bit data6
RD5 = _temp_ >> 5 ; //5. bit data 5
RD4 = _temp_ >> 4 ; //4 .bit Data4


//LCDPORT=((c & 0x0F)<<4);

DelayMs( 2 );
E=0;
DelayMs(1);
}

void lcd_data(unsigned char c)
{

RS=1;
E=1;
	
	_temp_ = (c & 0xF0) ;
	RD7 = _temp_ >> 7 ; //7.bit Data7
RD6 = _temp_ >> 6 ; //6. bit data6
RD5 = _temp_ >> 5 ; //5. bit data 5
RD4 = _temp_ >> 4 ; //4 .bit Data4

//LCDPORT=(c & 0xF0);DelayMs( 2 );
E=0;
DelayMs(1);
E=1;
	
_temp_ = 	((c & 0x0F)<<4) ;
		RD7 = _temp_ >> 7 ; //7.bit Data7
RD6 = _temp_ >> 6 ; //6. bit data6
RD5 = _temp_ >> 5 ; //5. bit data 5
RD4 = _temp_ >> 4 ; //4 .bit Data4

//LCDPORT=((c & 0x0F)<<4);DelayMs( 2 );
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
	//LCD data ve gerekli pinlerin trisleri için....
	TRISC1 = 0 ;
	TRISC2 = 0 ;
	TRISD = 0 ; 
	PORTD = 0 ;
	
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

























unsigned char ttt ;

unsigned char ar = 0 ;

typedef unsigned char byte ;


#define SANIYE_1 8
#define SANIYE_0 9

#define DAKIKA_1 6
#define DAKIKA_0 7

#define SAAT_1 4
#define SAAT_0 5

#define GUN_1 10 
#define GUN_0  11

#define AY_1 12
#define AY_0 13

#define YIL_1 14
#define YIL_0 15
#define true 1
#define false 0


char en_yakin_alarm_bulundu = false ; 




struct Alarm {
	unsigned char birinci ;
	unsigned char ikinci ;
	unsigned char ucuncu ;
	
	
};



unsigned char temporary ;
unsigned char seri_porttan_veri_al()
{
	
	if( FERR == 1 )  temporary = RCREG ;
	CREN = 1 ;
while( !RCIF );
return RCREG;
}
void seri_porta_veri_gonder(unsigned char jk)
 { 

 TXREG=jk;

	while( !TRMT );



	 }
	 
	 void seri_port_string( const char * s  )
	 { static int index = 0 ;



		 while(*s != '\0'  )
		 {
			 seri_porta_veri_gonder( *s );

s++;
		 

			 __delay_ms( 10 ) ;
			 
		 }
		 
	 }
	 
	 int pow( int a , int b )
{ int c = 1;
	for( int k = 1 ; k <= b ; k++ )
	{
	c = c * a ;
		}
	return c ;

}
void seri_portu_ayarla()
{TXSTA = 0 ;  //Bootloader UART ý kapatmýyor hata olmuþ olabilir , Error flaglerini sýfýrlýyoruz yeniden kullanabilmek için....
	 
	RCSTA = 0 ; 
	temporary = RCREG ;
	
	SPBRG=103 ; // 16mhz 9600 ;//DIVIDER;
	BRGH=1;
	
	
	SYNC=0;
	
	TX9=0;
	
	TXEN=1;
	
	RX9=0;
	
	CREN=1;
	
	
	
	SPEN=1;/*
	RC6=1;
	
	RC7=1;
*/
	}













I2C_Start(  )
{
	SEN = 1;
	while( SEN );
	SSPIF = 0;
	
	}

	I2C_Stop(  )
	{
		PEN = 1;
		while( PEN );
		SSPIF = 0;
	}
	
I2C_gonder(  unsigned char veri )
{
SSPBUF = veri;
	while( !SSPIF );
		SSPIF = 0;

	

}	


unsigned char I2C_oku (   )
{
RCEN  = 1;	//RCEN = 1;	
	while( !SSPIF );
	SSPIF = 0;
return SSPBUF;	
	
	
	
	
}


I2C_Master_ayarla (   )
{
SMP = 1;
CKE = 0;

	
	
	//Fosc/4( 0 +1 )
	//100 khz
	SSPADD = 39;//for 100 khz in 16 MHz ; 9 for 4 Mhz
	
	
	
	
	//I2C 7 bit 
SSPM3 = 1;
SSPM2 = 0;
SSPM1 = 0;;
SSPM0 = 0;	
	
	

 
SSPEN = 1;
	
	
	
}

void Send_NACK()
{
	
	ACKDT = 1;
	ACKEN = 1;
	while( ACKEN );
		SSPIF = 0;
	
	
}
unsigned char veri ;

int DS1307_saniye( )
{
	

		I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x00 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
		
		
return veri;
	
	
}

int DS1307_dakika( )
{
	
	I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x01 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );

	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	return veri;
	
	
	
}

int DS1307_saat()
 {
	 
	 I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x02 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	 
	 return veri;
 }

char DS1307_ay()
 {
	  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x05 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	 
	 return veri;
	 
	 
	 
	 }
 char DS1307_gun()
 {
	  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x04 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	 
	 return veri;
	 
	 
	 
	 }
 
 char DS1307_yil()
 {
	  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x06 );
	I2C_Stop();
	I2C_Start();
	I2C_gonder( 0b11010001 );
	veri = I2C_oku(  );
veri = ( veri >> 4 ) * 10 + ( veri & 15 ) ;
		Send_NACK();
		I2C_Stop();
	 
	 return veri;
	 
	 
	 
	 }
 
void DS1307_dakika_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x01 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}

void DS1307_saat_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x02 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}




void DS1307_saniye_ayarla( char value )
{
  
 I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x00 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
  
  
}




void DS1307_gun_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x04 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}
void DS1307_ay_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x05 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}

void DS1307_yil_ayarla( char value )
{
  I2C_Start();
	I2C_gonder( 0b11010000 );
	I2C_gonder( 0x06 );
        
        value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
        I2C_gonder( value );
	I2C_Stop();
  
 // value =  (   ( value / 10 ) << 4  ) | ( value - ( value/10 ) * 10  ) ; 
       
  
}
 


void segmente_sayi_yukle ( char segment_numarasi , char yuklenecek_sayi )
{
	PORTB = yuklenecek_sayi | segment_numarasi << 4 ;
	
	RC0 = 1 ;
	__delay_ms( 10 ) ;
	RC0 = 0 ;
	
	
	
	
	
}




void eeprom_hazirla()
{
	//EEIF = 0;//EEPROM write operation flag bit...
	/*
	Control bits, RD and WR, initiate read and write or
erase, respectively. These bits cannot be cleared, only
set, in software.
	*/
	
	
//	EEDATA holds the 8 bit-data for read/write
	//we can access the program memory by using these registers...
	//EEADR holds the address of the eeprom location being accessed... range 00h - ffh
	//EEPGD determines whether the access will be a program or data memory access...
	//Access data memory
	
	//WR = 1; it writes set 0 by the hardware RD = 1; reads set zero by the hardware...
	
	
	EEPGD = 0;
	
	EEIE = 0;//EEPROM write operation interrupt bit...
}

void eeprom_yaz( unsigned char adres , unsigned char veri )
{	
	ttt = GIE ;
	GIE = 0 ;
	WREN = 1;
	
	EEADR = adres;
	EEDATA =veri;
	
	EECON2 = 0x055;//Nedensiz
	EECON2 = 0xAA;//...
	WR = 1;
	while( WR );
	EEIF= 0;
WREN = 0;	
	
	GIE = ttt ;
}

unsigned char eeprom_oku( unsigned char adres )
{
	ttt = GIE ;
	GIE = 0 ;
EEADR = adres;
	EEDATA = 0;
 RD = 1;
	GIE = ttt ;
return EEDATA;
		
	
	
}	

char saniye , dakika , saat , gun , yil , ay  , sicaklik , nem ;

unsigned char buffer [ 20 ] ;
unsigned char received_data = 0 ;
unsigned char buffer_index = 0 ; 



 


unsigned char temp_sayi ;
unsigned char dd ;
unsigned char ffa ;

void eepromu_resetle()
{
	int a ;
	for(  a = 0 ; a <= 255 ; a++ )
		eeprom_yaz( a , 0  );
	
	
}

struct Alarm time_to_struct (  char t_saat , char t_dakika ,   char t_gun , char t_ay , char t_yil  )
{
	struct Alarm _al ;
	_al.birinci = ( t_saat << 3  ) | (  t_dakika >> 3    ) ;
	_al.ikinci =  (( t_dakika & 7 ) << 5 ) | ( t_ay << 1  ) |  ( t_gun >> 4 ) ;
	_al.ucuncu = ( t_gun << 4 ) | ( t_yil  )  ;
	return _al ;
	
	
}
char bos_alan_bul ()
{
unsigned char ind = 0 ;
	
	for( ind = 1 ; ind < 255 ; ind = ind + 3 )
	{
		if( (eeprom_oku( ind + 2 )) == 0 ) return ind ;
			
	}
	
	
	
	return -1 ;
}

void alarm_ekle( struct Alarm yazilacak_alarm  ) 
{
unsigned char kayit_index = bos_alan_bul (); //Eklenecek uygun bir alan bul 
	
	eeprom_yaz( kayit_index  , yazilacak_alarm.birinci	) ;  //Verileri kaydet ; 
	eeprom_yaz( kayit_index + 1 , yazilacak_alarm.ikinci );
	eeprom_yaz ( kayit_index +2 , yazilacak_alarm.ucuncu ) ;
	
	eeprom_yaz ( 0 , eeprom_oku( 0 ) +1 ) ;//Kayýtta bulunan alarm sayýsýný artýr... 
	
	
}

struct Alarm _temp__ ;
void alarm_sil ( struct Alarm silinecek_alarm  ) ;

void interrupt FNC () 
{
	

if( RCIF )
{
	received_data = RCREG ; //RCIF sýfýrlandý...
	
	
	if( received_data == '#' ) //Telefonda program baðlandýðý anda bu mesajý gönderecek sýcaklýk nem ve zaman ve ayarlanmýþ alarmlarý...
	{
		seri_porta_veri_gonder( 'T' ) ; //Onaylama kodu...
	__delay_ms( 300  ) ;
		
		seri_porta_veri_gonder( saat );
	__delay_ms( 100 ) ;
	seri_porta_veri_gonder( dakika ) ;
	__delay_ms( 100 ) ;
	seri_porta_veri_gonder( saniye ) ;
	__delay_ms( 100 ) ;
	
		
		
		seri_porta_veri_gonder( sicaklik ) ;
	__delay_ms( 100 ) ;
	seri_porta_veri_gonder( nem ) ;
	__delay_ms( 100 ) ;
		
		
		
		seri_porta_veri_gonder( gun ) ;
	__delay_ms( 100 ) ;
	seri_porta_veri_gonder( ay ) ;
	__delay_ms( 100 ) ;
	seri_porta_veri_gonder( yil ) ;
	__delay_ms( 100 ) ;
		
		
	}
	
else if ( received_data == '$' ) //Alarm zamanlarý buradan gönderiliyor telefona...
	{
	
	
	temp_sayi = eeprom_oku ( 0 ) ;
   seri_porta_veri_gonder( temp_sayi ) ;
	__delay_ms( 100 ) ;
	ffa = 1 ;
	for( dd = 0 ; dd < temp_sayi ; dd ++ )
	{
		
		
		while( eeprom_oku ( ffa +2 ) == 0  ) ffa = ffa +3 ; 
		
		seri_porta_veri_gonder( eeprom_oku ( ffa ) );
		__delay_ms( 100 ) ;
		seri_porta_veri_gonder( eeprom_oku ( ffa+1 ) );
		__delay_ms( 100 ) ;
        seri_porta_veri_gonder( eeprom_oku ( ffa+2 ) );
		__delay_ms( 100 ) ;		
		ffa+=3;
		__delay_ms ( 500  );
	}


seri_porta_veri_gonder( 'T' ) ;
	__delay_ms( 100 ) ;
	
}

else	if( received_data == 'E' ) //yeni alarm ekleme...
		
	{
		
		buffer[ 1 ]  = seri_porttan_veri_al ( );
		buffer[ 2 ] = seri_porttan_veri_al();
		buffer[ 3 ]  = seri_porttan_veri_al ( );
		buffer[ 4 ] = seri_porttan_veri_al();
		buffer[ 5 ]  = seri_porttan_veri_al ( );
		ar = buffer[ 5 ] ;
	struct Alarm tmp =	time_to_struct( buffer[ 1 ] , buffer[ 2 ] , buffer[ 3 ] , buffer[ 4 ] , buffer[ 5]     );
		alarm_ekle( tmp  ) ;
	seri_porta_veri_gonder( 'T' ) ;
	__delay_ms( 100 ) ;
		
	}
	else if ( received_data == 'Z' ) //Telefondan saat bilgisi ayarlanýyor...
	{
	
	saniye = seri_porttan_veri_al ( ) ;
	DS1307_saniye_ayarla ( 	saniye ) ;
	dakika = seri_porttan_veri_al ( ) ;
		DS1307_dakika_ayarla (dakika ) ;
	saat = seri_porttan_veri_al ( );
		DS1307_saat_ayarla ( saat ) ;
		gun = seri_porttan_veri_al () ;
		DS1307_gun_ayarla ( gun);
		ay = seri_porttan_veri_al();
		DS1307_ay_ayarla( ay ) ;
		yil = seri_porttan_veri_al();
		DS1307_yil_ayarla ( yil ) ;
		
		seri_porta_veri_gonder( 'T' ) ;
		
		
		
		
		
	}
	else if ( received_data == 'R' )
	{
		eepromu_resetle();
		seri_porta_veri_gonder( 'T' ) ;
		__delay_ms( 100 ) ;
		
	}
else if ( received_data == '%' )
{
	
	_temp__.birinci = seri_porttan_veri_al ( ) ;
	_temp__.ikinci  = seri_porttan_veri_al ( ) ;
	_temp__.ucuncu = seri_porttan_veri_al ( ) ;
	
alarm_sil ( _temp__ ) ;	
	
}


	
	
	
//Telefondan gelen alarm tarihi , saati burada alýnacak...	
	
	
	
	
	
	
	
	
	
	
	

	
	 //RCREG i oku ;( RCIF sýfýrlanacak... )
	
}  //if RCIF

	
	
	
	
	
	
}


void alarm_sil ( struct Alarm silinecek_alarm  )
{
	char alarm_sayisi = eeprom_oku ( 0  );
	
	unsigned char ind = 1 ;
	while( alarm_sayisi > 0 ) 
   {
		
	if ( eeprom_oku ( ind ) == silinecek_alarm.birinci )
	{
		if( eeprom_oku ( ind +1 ) == silinecek_alarm.ikinci )
		{
			if( eeprom_oku( ind +2 ) == silinecek_alarm.ucuncu )
			{
				eeprom_yaz( ind  , 0 );
				eeprom_yaz( ind + 1 , 0 );
				eeprom_yaz ( ind +2 , 0  );
				eeprom_yaz( 0 , eeprom_oku (0) - 1  );
			
			
				
				} //ikinci if
			
			
			
		} //ilk if
		
		
		
		
		
	}
	
		ind = ind + 3 ;
		if( eeprom_oku ( ind +2 ) !=0 ) alarm_sayisi -- ;
		
		
	} //while
	
	
	
}//function

void alarm_ver (  ) 
{
	ADCON1 = 0x7 ;
	TRISA = 0 ;
	PORTA = 0 ;
	for ( int k = 0 ; k < 20 ;k++ )
		
	{
		RA0 = ~RA0 ;
		__delay_ms( 250  ) ;
		
	}
	
	
}





void alarm_kontrol_et  ( struct Alarm alarm )
{
	
	
	char alarm_sayisi = eeprom_oku ( 0  );
	
	unsigned char ind = 1 ;
	while( alarm_sayisi > 0 ) 
   {
		
	if ( eeprom_oku ( ind ) == alarm.birinci )
	{
		if( eeprom_oku ( ind +1 ) == alarm.ikinci )
		{
			if( eeprom_oku( ind +2 ) == alarm.ucuncu )
			{
				eeprom_yaz( ind  , 0 );  //Alarm bulundu ve bu alaný sýfýrla
				eeprom_yaz( ind + 1 , 0 );
				eeprom_yaz ( ind +2 , 0  );
				eeprom_yaz( 0 , eeprom_oku (0) - 1  );
			
				alarm_ver ( );
				
			
				
				} //ikinci if
			
			
			
		} //ilk if
		
		
		
		
		
	}
	
		ind = ind + 3 ;
		if( eeprom_oku ( ind +2 ) !=0 ) alarm_sayisi -- ;
		
		
	} //while
	
	
	
	
	
	
	
	
	
	
	
	
}

/*
void en_yakin_alarmi_bul () 
{
	char en_yakin_index  = 1 ;
	
	
	long en_yakin_fark  = -5 ;
	long fark ;
	long current_fark ;
	long temp_fark ;
	
	
	char current_hour = saat ;
	char current_minute = dakika ;
	char current_day = gun ;
	char current_month = ay ;;
	char current_year = yil-16 ;
	
	char alarm_dakika , alarm_saat , alarm_saniye , alarm_ay , alarm_yil , alarm_gun ;
	char alarm_sayisi = eeprom_oku ( 0  );
	
	char eeprom1 ,eeprom2 , eeprom3 ;
	
	unsigned char ind = 1 ;
	while( alarm_sayisi > 0 ) 
   {
		
		
	 
	   
	   
	   
		
		if( eeprom_oku ( ind +2 ) !=0 )
		{	
			eeprom1 = eeprom_oku ( ind ) ;
			eeprom2 = eeprom_oku ( ind +1  );
			eeprom3 = eeprom_oku( ind + 2  );
			
			
			
			
	alarm_saat = eeprom1 >> 5 ;
	alarm_dakika =  ((eeprom1 & 0x7 ) << 3 ) |  ( eeprom2 >> 5 ) ;
	alarm_ay =  (( eeprom2 >> 1 ) & 0xf )	;	
	alarm_gun = (( eeprom2 & 1 ) << 4  ) |  ( eeprom3 >> 4  ) ;		
	alarm_yil = eeprom3 & 0xf ;		
			
	if ( alarm_yil < current_year )
	{
	
		
		
	}	else
	{

if( alarm_ay < current_month )
{
	
}
else
{
	if( alarm_gun < current_day ) 
	 ;
	else
	{
		if( alarm_saat < current_hour  );
			else
			{
				if( alarm_dakika < current_minute );
					else
					{
						current_fark  = 365*current_year*24*60 + current_month*30*24*60 + current_day*24*60 + current_hour*60 + current_minute ;
						fark = 365*alarm_yil*24*60 + alarm_ay*30*24*60 + alarm_gun*24*60+ alarm_saat*60 + alarm_dakika ;
						if ( en_yakin_fark < 0 ){en_yakin_alarm_bulundu = true ; en_yakin_fark = fark - current_fark ; en_yakin_index = ind ; }
						else
						{
							if( en_yakin_fark > ( fark-current_fark ) )
							{
								en_yakin_fark = fark-current_fark ;
								en_yakin_index = ind ;
								en_yakin_alarm_bulundu = true ;
								
							}
							
							
						}
						
					}
				
			}
		
		
		
		
	}
	
	
	
	
	
	
	
}
		
		
		
		
		
	}		
			
			
			
		alarm_sayisi -- ;
		
		}	
		ind = ind + 3 ;
		
		
		
		
		
		
	} //while
	
	
	
	
	
	
}
*/





unsigned char data [ 5 ] = { 0 , 0  , 0 , 0 , 0 } ;


static int index = 0 ;
static int count ;
 int temp ;
int saim ;
unsigned char rakam[ 5 ] ;
int fa = 0 ;
int  sayi ;
char _ind ;
void start_signal()
{
	for( fa =  0; fa < 5 ; fa++ )
	data[ fa ] = 0 ;	
//	TRISB0 = 0 ;//DDRB |= 1 ;//trisb.RB0 = 1 ;
//	RB0 = 1 ; //PORTB = 1 ;//portb.RB0 = 1 ;
//	__delay_ms( 250 ) ; //iþlemci baþlayýnca biraz bekle line is high pull up tan ötürü
	 // PB0 pini output ve low line is low
//	TRISB0=0;
	TRISC5 = 0 ;
	RC5 = 0 ; //PORTB = 0 ;//portb.RB0 = 0 ;
	__delay_ms( 25 ) ; //Start signal için...
	RC5 = 1 ; //PORTB = 1 ;//portb.RB0 = 1 ; //PB0 high line is high
	
	__delay_us( 30 ) ;
	RC5 = 0 ; //PORTB = 0 ; //portb.RB0 = 0 ;
	//Bundan sonra input edilip
//	nRBPU=1;
	//OPTION_REG |= ( 1 << 7 );
	TRISC5 = 1 ; //DDRB = 0 ; //trisb.RB0 = 0 ; //PB0 input
	sayi = 0 ;

while(  !RC5 ){ sayi ++ ; if( sayi == 200 ) {lcd_goto( 1 , 1  ); lcd_write( "ilk low response hata\n" ) ; return;}    }  ; //DHT responsu tamam....
saim = sayi ;


sayi = 0 ;
	while( RC5  ) { sayi ++ ; if( sayi == 200 ) { lcd_goto( 1 , 1  ); lcd_write( "ilk high response hata\n" ) ; return ;}    }  ;  


	for ( _ind = 0 ; _ind < 5 ; _ind++ )
	{
			for( index = 0 ; index < 8 ; index ++ )
			{
				
				count = 0 ;
				while( !RC5 ) 
					{ count ++  ; 
						if( count > 100 ) { 
							lcd_goto( 1 , 1) ;
							
							lcd_write( "ilkbithatalow\n" );return ;  
							}  
							} 
				temp = count;
				count = 0 ;
				while( RC5 ){ 
					count ++  ; 
					if( count > 100 ) 
						
						{  lcd_goto( 1 , 1 ) ;
							lcd_write( "ilkbithatagigh\n" );
							
							return ;  }   
							}
				if( count > temp ) data[ _ind ] |= 1 << (7- (index ) ) ;
			}
		}
			
			
			


}

void data_gonder( )
{
for( int f = 0 ; f < 5 ; f++ )
{
sprintf( rakam  , "%d" , data[ f ]  );
seri_port_string( rakam );
seri_porta_veri_gonder( '\n' ) ;
__delay_ms( 10 ) ;
	
}
	
	
}


void verileri_lcdye_yaz( ) 
{
	
	
	lcd_goto( 1  , 7 ) ;
	lcd_data ( saniye / 10 + 48 ) ;

	lcd_data ( saniye %10 +48 ) ;


	lcd_goto( 1  , 4 ) ;
	lcd_data ( dakika / 10 + 48 ) ;
	
	lcd_data ( dakika %10 +48 ) ;	

	
	
		lcd_goto( 2  , 4 ) ;
	lcd_data ( ay / 10 + 48 ) ;
	
	lcd_data ( ay %10 +48 ) ;
	

	lcd_goto( 2  , 7 ) ;
	lcd_data ( yil / 10 + 48 ) ;
	
	lcd_data ( yil %10 +48 ) ;	


lcd_goto( 1  , 1 ) ;
	lcd_data ( saat / 10 + 48 ) ;
	
	lcd_data ( saat %10 +48 ) ;
	
	lcd_goto( 1 , 3 ) ;
	lcd_data( ':' );
	lcd_goto ( 1 , 6 );
	lcd_data ( ':' );
	
	lcd_goto( 2 , 3 ) ;
	lcd_data( '/' );
lcd_goto( 2 , 6   );
	lcd_data ( '/' );


	lcd_goto( 2  , 1 ) ;
	lcd_data ( gun / 10 + 48 ) ;
	
	lcd_data ( gun %10 +48 ) ;
	


//Sýcaklýk ve nem bilgileri de gösterilecek...


}


void sensor_bilgilerini_yaz ( )

{
	lcd_goto  ( 1 , 9 ) ;
    lcd_write( "-SCKL:22" ) ;	
	lcd_goto ( 2 , 9 ) ;
	lcd_write( "-NEM:%" ) ;
	lcd_goto( 1 , 15 ) ;
	lcd_data  ( data[2] /10 + 48    ) ;
	sicaklik  = data[2] ;
	lcd_data( data[2] %10 + 48 ) ;
	lcd_goto( 2 , 15) ;
	lcd_data( data[0 ] /10 + 48 ) ;
	nem = data[ 0 ] ;
	lcd_data( data[ 0 ]  %10 + 48 ) ;
	
	
	
}



void main () 

{
	lcd_init ( ) ; //LCD yi baþlattýk...
	
	__delay_ms( 100 ) ;
	lcd_write( "Saim SUNEL" ) ;
	
	eeprom_hazirla();
	/*
	for ( int k = 0 ; k < 256 ;k++ )
	{
		eeprom_yaz ( k , 0  );
		
	}
	
	while( 1  );
	*/
	
	
seri_portu_ayarla();
	/*
	RCIE = 1 ; 
	RCIE enabled et
	GIE = 1;
	PEIE = 1 ;
*/	
	
	RCIE = 1 ;
	PEIE = 1 ;
	GIE = 1 ;
	
TRISB = 0 ;  //PortB 7 segmentlerin deðerlerini ayarlamak için kullanýlacak...
PORTB = 0 ;  //RB7 pini clock olarak kullanýlacak....	
TRISC0 = 0 ; //RC0 pini registerlara veri yüklemek için....
RC0 = 0 ;	
	
	TRISC3 = 1 ;//I2C pinleri input
	TRISC4 = 1 ; 
	RC3 = 0 ;
	RC4 = 0 ;
	I2C_Master_ayarla();
	
	
	/*
	*/
	__delay_ms ( 100  );
	saniye = DS1307_saniye();
	__delay_ms ( 1000 ) ;
	if ( saniye == DS1307_saniye () ) 
	{	
		DS1307_saniye_ayarla( 52 );
		saniye = 52 ;
	DS1307_dakika_ayarla( 0 );
	DS1307_saat_ayarla( 0);
	DS1307_gun_ayarla( 1);
	DS1307_ay_ayarla( 1 );
	DS1307_yil_ayarla( 2016 );
	}
	
dakika = DS1307_dakika ( );
saat = DS1307_saat () ;
ay = DS1307_ay();
gun = DS1307_gun();
yil = DS1307_yil();	
	
	
	segmente_sayi_yukle( SANIYE_1 , saniye / 10 );
	segmente_sayi_yukle( SANIYE_0 , saniye % 10 );
	

	
	
	
	segmente_sayi_yukle( DAKIKA_1 , dakika / 10 );
	segmente_sayi_yukle( DAKIKA_0 , dakika % 10 );
	

	
	
	segmente_sayi_yukle( AY_1 , ay / 10 );
	segmente_sayi_yukle( AY_0 , ay % 10 );
	
	
	
	
	
	
	segmente_sayi_yukle( YIL_1 , yil / 10 );
	segmente_sayi_yukle( YIL_0 , yil % 10 );
	


	
	segmente_sayi_yukle( GUN_1 , gun /	10 );
	segmente_sayi_yukle( GUN_0 , gun % 10 );
	
	
	
	
	
	
	segmente_sayi_yukle( SAAT_1 , saat / 10 );
	segmente_sayi_yukle( SAAT_0 , saat % 10 );

verileri_lcdye_yaz( );
struct Alarm alarm ;
start_signal () ;
sensor_bilgilerini_yaz() ;
/*	
	char t_saat = 02 ;
	char t_dakika = 32  ;
	char t_gun = 2 ;
	char t_ay = 7 ;
	char t_yil = 0 ; //16+t_yil set edilmiþ alarm yýlý
	
	
		
	alarm = time_to_struct( t_saat , t_dakika , t_gun , t_ay , t_yil ) ;
	
	//alarm_ekle( alarm ) ;
//alarm_sil( alarm ) ;
	
	*/
	
int sayi = 0 ;
	
	char sensor_check = 0 ;
	
	
	
	
	while( 1 ) 
{

	saniye = DS1307_saniye();
	segmente_sayi_yukle( SANIYE_1 , saniye / 10 );
	segmente_sayi_yukle( SANIYE_0 , saniye % 10 );
	
	verileri_lcdye_yaz();  
	
	
	__delay_ms( 400 );
	
	if( saniye == 59 ) //dakikayý güncelle
	{
		
		sensor_check ++ ;
		if( sensor_check == 30 ) //30 saniyede bir kontrol et sýcaklýðý ve nemi
		{
			sensor_check = 0 ;
			start_signal() ;
			sensor_bilgilerini_yaz();
			
		}
	dakika = DS1307_dakika ( );
		segmente_sayi_yukle( DAKIKA_1 , dakika / 10 );
	segmente_sayi_yukle( DAKIKA_0 , dakika % 10 );
		
		
		verileri_lcdye_yaz();  
	
		alarm = time_to_struct ( saat , dakika , gun , ay , yil-16  ) ;
		alarm_kontrol_et (  alarm ) ;
		
		
		
		
		
		if( dakika == 0 ) //saati güncelle
		{
			saat = DS1307_saat () ;
			segmente_sayi_yukle( SAAT_1 , saat / 10 );
	        segmente_sayi_yukle( SAAT_0 , saat % 10 );
	verileri_lcdye_yaz();   
			if( saat == 0 ) //Günü güncelle
		 {
			 
			 gun = DS1307_gun();
			 segmente_sayi_yukle( GUN_1 , gun / 10 );
	segmente_sayi_yukle( GUN_0 , gun % 10 );
verileri_lcdye_yaz();  
			 if( gun == 1 ) //ayý güncelle
	{
	ay = DS1307_ay();
	segmente_sayi_yukle( AY_1 , ay / 10 );
	segmente_sayi_yukle( AY_0 , ay % 10 );
	verileri_lcdye_yaz();  
		if( ay == 1 ) //yýlý güncelle
	{
	
	yil = DS1307_yil();	
	segmente_sayi_yukle( YIL_1 , yil /	10 );
	segmente_sayi_yukle( YIL_0 , yil % 10 );
		verileri_lcdye_yaz();  
		
	}	
		
		
		
	}	
			 
			 
			 
		 }
			
			
			
		}
		
		
		
	}
	
	
	
	
}
	
	
	
	
	
}