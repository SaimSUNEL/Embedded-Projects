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
void pulse_CSN0() 
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

  
#define SPI_WriteByte bb_xfer
#define BUFFER 10
//----------------------------------------- CONFIGURE RX -----------------------------------

//Komutlar high to low olmasý gerekir önce

void NRF_initialize() 
{ 
    
    RTX_CE_Low();
    
    
    RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
    
    
    
    //Config register...
    bb_xfer(W_REGISTER); //PRX, CRC enabled CRC 1 bayt  PWR_UP = 1
    bb_xfer(0b00001011); 
//    pulse_CSN(); 
    delay(2);   // delay_ms(2); 
    //----------- 
 
 //read written config reg...
 RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();

    Serial.print("W_reg : ");
    bb_xfer(0x0);
    Serial.println(bb_xfer(0x0));



//Enable auto ack on data pipe 0
 RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
    //Config register...
    bb_xfer(0x21); //PRX, CRC enabled CRC 1 bayt  PWR_UP = 1
    bb_xfer(1);



 RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();

 //EN_RXADDR - ativa o PIPE0 //Enable PIPE 0 receiver address
    bb_xfer(0x22);//Write to 0x2
   bb_xfer(0x01);



RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();

 bb_xfer(0x23); //address width = 5 bytes 
    bb_xfer(0x03); 
   



RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();

 bb_xfer(0x24); //auto retransmit delay 1ms, max 15 try  
    bb_xfer(0x3f); 




RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
bb_xfer(0x25); //RF channel freq 
bb_xfer(2);



RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
bb_xfer(0x26); //data rate = 250kbps   0dBm 1 mW
    bb_xfer(0b00100110 ); //0x07);



RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
//RX_ADDR_P0 - Receiver name is set....
    SPI_WriteByte(0x2A); // Write reg at 0xa
 SPI_WriteByte(0xe7);
   SPI_WriteByte(0xe7);
   SPI_WriteByte(0xe7);
   SPI_WriteByte(0xe7);
   SPI_WriteByte(0xe7);


RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
  //tx address
   bb_xfer(0x30);//Write to 0x10
  SPI_WriteByte(0xe7);
   SPI_WriteByte(0xe7);
   SPI_WriteByte(0xe7);
   SPI_WriteByte(0xe7);
   SPI_WriteByte(0xe7);
  

   RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
    //----------- 
    bb_xfer(0x31);  // RX_PW_P0 dan al?nacak bayt say?s? 
    bb_xfer(10);   // ---------------- ALINACAK BAYT SAYISINI BEL?RT   30 -----
        
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();


  



//Rx enabled but waits...
  } 




unsigned char ReceiveData[BUFFER];

int NRF_ReceiveData()
{
   RTX_CE_Low();

RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
    //Config register...
    bb_xfer(W_REGISTER); //PRX, CRC enabled CRC 1 bayt  PWR_UP = 1
    bb_xfer(0b00001011); 
    

RTX_CE_High();
//When data comes IRQ pin will be 0
  
  while(digitalRead(RF24_IRQ) == 1);




  byte status;

//Read status...
 //STATUS - leitura do registrador
   
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0x07);
   status=SPI_WriteByte(0);
   
  
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();  
   bb_xfer(0x27);
   bb_xfer(0x70);
 
  //verifica o bit de recep??o de dados
if(((status >> 5)&0x1 == 0))
return 0;
  

//R_RX_PAYLOAD - recebe os dados do buffer FIFO RX
  
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0x61);
   for(int i=0;i<BUFFER;i++)ReceiveData[i]=SPI_WriteByte(0);

   Serial.print("Received : ");
   Serial.println((char *)ReceiveData);

RTX_CSN_High(); //flush tx buffer...
    delayMicroseconds(10);
    RTX_CSN_Low();
    SPI_WriteByte(0xe2);
   
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
  bb_xfer(0x27); // //Data haz?r gel al  kesme bayra??n? temizle STATUS 6.bit
    bb_xfer(0x40); 
      RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();

return 1;



}
unsigned char status;
unsigned char read_reg(unsigned char address, unsigned char size=1)
{delay(2);
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
    bb_xfer(address); //PTX, CRC enabled CRC 1 bayt  PWR_UP = 1
  Serial.print(address);
  Serial.print ( " = " );
  status = bb_xfer(0);
  Serial.print(status);
  for(int a = 1; a < size; a++)
  Serial.print(bb_xfer(0));
  Serial.println("");
  
return status;
  
}

unsigned char  buffer_status_reg()
{
delay(2);

  RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0x17);
   status = SPI_WriteByte(0);
    Serial.print("Buffer status : ");
    Serial.println(status  );
    
   delay(200);
   return status;
}

unsigned char status_reg()
{delay(2);
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0x07);
   status = SPI_WriteByte(0);
    Serial.print("status : ");
    Serial.println(status  );
    
   delay(200);
   return status;
}


unsigned char SendData[30] = "1ais is a try";

int NRF_SendData()
{

Serial.println("Beginning Sending...");
buffer_status_reg();

    RTX_CE_Low();



Serial.println("buffer is being filled...");
//Load data into TX buffer
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0xA0);
   for (int i=0;i<BUFFER;i++)SPI_WriteByte(SendData[i]);
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
delay(2); 
Serial.println("After fill");
buffer_status_reg();



 RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
 //Config register...
    bb_xfer(W_REGISTER); //PTX, CRC enabled CRC 1 bayt  PWR_UP = 1
    bb_xfer(0b00001010); 

read_reg(0);
delay(10);

RTX_CE_High();

 RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
  //TX transmits data...
    //pulso para transmitir os dados

int  espera_ack=0;

   while(digitalRead(RF24_IRQ)==1){
//
//  espera_ack ++;
//  delayMicroseconds(1000);
//  if(espera_ack == 8000)
//  break;
buffer_status_reg();
  if(read_reg(0) == 8)
  {
    RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
 SPI_WriteByte(0x27);
   SPI_WriteByte(0x70);
return -1;
  }
  read_reg(0x0);
   }

Serial.println("IRQ Set...\n\n");
for(int j = 0 ; j < 5; j ++)
{
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0x08);
   status = SPI_WriteByte(0);
    Serial.print("Counts : ");
    Serial.print(status >> 4 );
    Serial.print(" ");
    Serial.println (status & 0xf);
   delay(50);
    }
RTX_CE_Low();
   //STATUS - leitura do registrador

  RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0x07);
   status=SPI_WriteByte(0);

Serial.print("Status : ");
Serial.println(status);
   
  if(status & (1 << 5))
  ;
  else
  Serial.println("ACK receive hata...");

if(status & ( 1 << 4 ))
{
Serial.println("Max retransmit flag set...");
  RTX_CE_Low();
   //STATUS - leitura do registrador

  RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0x27);
   status=SPI_WriteByte(0x70 );
   return -1;
}


//Switch to stand by  
RTX_CE_Low();


 

  RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
   SPI_WriteByte(0xE1); //flush tx buffer...



 RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
    //Config register...
    bb_xfer(W_REGISTER); //PRX, CRC enabled CRC 1 bayt  PWR_UP = 1
    bb_xfer(0b00001011); 

 
RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();
 SPI_WriteByte(0x27);
   SPI_WriteByte(1 << 5);
    RTX_CSN_High();
    delayMicroseconds(10);
    RTX_CSN_Low();

return 1;
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
  
   
    delay(500); 
  //  output_toggle(PIN_A0); 
 //digitalWrite(10, !digitalRead(10)); //gösterge LEDÝ
    
    
 
    NRF_initialize();   //modulu ALICI olarak yapýlandýr
    delay(100); 
String receive;
    int rakam = 0;
    while(true) 
    { 
     /* while(Serial.available() <= 0);
      
        receive = Serial.readString();
        for(int a = 0; a < receive.length() ; a++)
        SendData[a] = receive.c_str()[a];        
         //modulu ALICI olarak yapýlandýr
      NRF_initialize();   //modulu ALICI olarak yapýlandýr
      
      */
     NRF_initialize();   //modulu ALICI olarak yapýlandýr
    

    
      rakam ++;
      SendData[0] = '0';
      SendData[1] = rakam;
      SendData[2] = 'S';
      SendData[3] = 'a';
      SendData[4] = 'i';
      SendData[5] = 'm';
      
      
     int success;
     while( (success = NRF_SendData()) != 1 )NRF_initialize();
       
   // digitalWrite(10, !digitalRead(10));  // //gösterge LEDÝ  output_toggle(PIN_A0); 
        delay(1000); 
    } 
 
}