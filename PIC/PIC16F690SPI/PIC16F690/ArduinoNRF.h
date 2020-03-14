//HAcý bu son durum

/*  24 EKÝM 2016 
  DAYSO
  nRF24L01+ modül ve Arduino NANO ile denendi
  Vericiden gelen baytlarý seriporttan ekrana gönderir
    
// RC2 ---> nRF CE
// RC1 ---> nRF CSN
// RC3 ---> nRF SCK
// RC5 ---> nRF MOSI
// RC4 ---> nRF MISO
// RA5 ---> nRF IRQ
   
 */ 
 //------------------------------------------------------------- 
#define W_REGISTER 0x20 
#define R_RX_PAYLOAD 0x61 
#define W_TX_PAYLOAD 0xa0 

#define  RF24_CE    9   //9. pin chipEnable nRF24L01+ 
#define  RF24_CS    10  //10.pin  chipselect nRF24L01+ 
#define  SPI_CLK    13   //13. pin SPI) 
#define  SPI_MOSI   11   //11.pin SPI 
#define  SPI_MISO   12   //12.pin SPI
#define  RF24_IRQ   8   //8. pin interrupt nRF24L01+ 

#define RF24_xfer(xdata)   bb_xfer(xdata)  // SPI ye Gönderme/alma    
                                   
#define RTX_CSN_Low()       digitalWrite(RF24_CS, LOW); 
#define RTX_CSN_High()    digitalWrite(RF24_CS, HIGH);  
#define RTX_CE_Low()        digitalWrite(RF24_CE, LOW); 
#define RTX_CE_High()      digitalWrite(RF24_CE,HIGH);  
//#define RF24_IRQ_state()   !input(RF24_IRQ) 

 char     RF_DATA[35];         //gönderilen ve alýnan datalar için dizi
 char veri;
 //byte sayac;
/*******************************************************************************/ 
void pulse_CSN() 
{ 
    RTX_CSN_High();; 
   delayMicroseconds(20);        //  delay_us(20); 
    RTX_CSN_Low(); 
} 

//-------------------------------------------------------------

uint8_t  bb_xfer(uint8_t spi_data) 
{ 
//    SPI_MISO 
//    SPI_MOSI 
//    SPI_CLK 
    
    int rt; 
    int result = 0; 
     int d=0;  //int1 d = 0; 
     
  delayMicroseconds(50);        //   50  mikrosaniye bekle
    for(rt=0;rt<8;rt++)
    { 
       // d = bit_test(spi_data,7-rt); 
       
        if (spi_data & (1<<(7-rt)))
        //if(d) 
        { 
      digitalWrite(SPI_MOSI, HIGH);//      output_high(SPI_MOSI); 
        } 
        else 
        { 
        digitalWrite(SPI_MOSI, LOW); //     output_low(SPI_MOSI); 
        } 
      delayMicroseconds(10);        //         delay_us(10); 
          
      digitalWrite(SPI_CLK, HIGH);  //   output_high(SPI_CLK); 
         delayMicroseconds(60);        //    delay_us(60); 
        digitalWrite(SPI_CLK, LOW); // output_low(SPI_CLK); 
        delayMicroseconds(10);        //  delay_us(10); 
       
       if (rt<7)
       {
        if( digitalRead(SPI_MISO)) 
        { 
         bitSet(result,6-rt);    //    bit_set(result,6-rt); 
        } 
        else 
        { 
         bitClear(result,6-rt); //   bit_clear(result,6-rt); 
        } }
    } 
    
    digitalWrite(SPI_MOSI, LOW); // output_low(SPI_MOSI); 
    return(result); 
} 

  

//----------------------------------------- CONFIGURE RX -----------------------------------

void configure_RX() 
{ 
    int i; 
    RTX_CSN_Low(); 
    RTX_CE_Low();; 
    
    bb_xfer(W_REGISTER); //PRX, CRC enabled CRC 1 bayt  PWR_UP = 1
    bb_xfer(0x39); 
    pulse_CSN(); 
    delay(2);   // delay_ms(2); 
    //----------- 
    bb_xfer(0x21);  // Alici ACK göndermeyecek b?t?n kanallar
    bb_xfer(0x00); 
    pulse_CSN(); 
    //----------- 
    bb_xfer(0x23); //address width = 5 bytes 
    bb_xfer(0x03); 
    pulse_CSN(); 
    //----------- 
    bb_xfer(0x26); //data rate = 250kbps   0dBm 1 mW
    bb_xfer(0x7 ); //0x07); 
    pulse_CSN(); 
    //----------- 
    bb_xfer(0x31);  // RX_PW_P0 dan al?nacak bayt say?s? 
    bb_xfer(32);   // ---------------- ALINACAK BAYT SAYISINI BEL?RT   30 -----
    pulse_CSN(); 
    //----------- 
    
    //----------- 
    bb_xfer(0x30); //set address E7E7E7E7E7 
   
        bb_xfer( 'm' ); 
     bb_xfer( 'i' );
      bb_xfer( 'a' );
       bb_xfer( 's' );
        bb_xfer( 0xe7 );
        
        pulse_CSN(); 
    //---------------- 
    bb_xfer(W_REGISTER);   //PWR_UP = 1        PRX al?c?, CRC enabled 
    bb_xfer(0x3b); 
    RTX_CSN_High();; 
    RTX_CE_High(); 
} 

//---------------------- READ DATA --------------------------------------
void read_Data() 
{ 
    int i; 
    RTX_CSN_Low(); 
    bb_xfer(R_RX_PAYLOAD); //gelen datalar? alma komutu g?nder RX payload 
    for(i=0;i<30;i++)    //   ------- 30 BAYT  ALINACAK ---------------------
    { 
        RF_DATA[i] = bb_xfer(0x00); 
     veri=RF_DATA[i];
     Serial.print(RF_DATA[i]);//gelen datalar? seriporta g?nder
            if(veri=='K')
            digitalWrite(3,HIGH);
            if(veri=='L')
            digitalWrite(3,LOW);
    } 
     //Serial.print( "RF_DATA[i]");
  Serial.print("\r\n"); 
   //KKKKKKKKKKKKKKKKKKKKKKKKK
    
    
    pulse_CSN(); 
    //----------- 
    bb_xfer(0xe2); //Flush RX FIFO alýcý tamponunu boþalt FLUSH_RX
    pulse_CSN(); 
    //----------- 
    bb_xfer(0x27); // //Data haz?r gel al  kesme bayra??n? temizle STATUS 6.bit
    bb_xfer(0x40); 
    RTX_CSN_High(); 
} 
 
 

//----------------------------------------- START ----------------------------------------------------------
void setup() {
  Serial.begin(9600);
  pinMode(RF24_CE, OUTPUT); 
  pinMode(RF24_CS, OUTPUT);
  pinMode(SPI_CLK, OUTPUT);
  pinMode(SPI_MOSI,OUTPUT);
  pinMode(SPI_MISO,INPUT);
  pinMode(RF24_IRQ,INPUT);
  pinMode(3, OUTPUT);
  pinMode(2,OUTPUT);
}

//----------------------------
void  loop() 
{ 
// digitalWrite(10, !digitalRead(10)); //gösterge LEDÝ
   // output_toggle(PIN_A0); 
    RTX_CE_Low(); 
    RTX_CSN_High(); 
   
    delay(500); 
  //  output_toggle(PIN_A0); 
 //digitalWrite(10, !digitalRead(10)); //gösterge LEDÝ
    
    
 
    configure_RX();   //modulu ALICI olarak yapýlandýr
    delay(100); 

    while(true) 
    { 
        if(!digitalRead(RF24_IRQ)) //IRQ Kesme baca??n? kontrol et data gelmi? mi L ise gir
        { 
           read_Data();
           

       } 
   // digitalWrite(10, !digitalRead(10));  // //gösterge LEDÝ  output_toggle(PIN_A0); 
        delay(250); 
    } 
 
}
