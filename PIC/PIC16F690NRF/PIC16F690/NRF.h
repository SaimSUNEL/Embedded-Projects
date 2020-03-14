#define ENDTX    75  // 1 a 255
#define ENDRX    75  // 1 a 255
#define CANAL 107
#define BUFFER 10  // 1 a 32
#define W_REGISTER 0x20

#define CSN RF24_CS
#define CE RF24_CE
unsigned char SendData[BUFFER];
unsigned char ReceiveData[BUFFER];
 
#define delay __delay_ms
#define delayMicroseconds __delay_us

#define  RTX_CE_Low() CE=0
#define RTX_CE_High() CE=1

#define RTX_CSN_Low() CSN=0
#define RTX_CSN_High() CSN=1

#define bb_xfer SPI_WriteByte

void NRF_Initialize()
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
int espera_ack;
byte status;
#define IRQ RF24_IRQ

byte i;

int NRF_SendData()
{

	CE = 0;//output_low(CE);
	__delay_ms(10);
   //STATUS - reseta registrador STATUS

	//Reset interrupt flags...
   CSN = 0;//output_low(CSN);
	__delay_ms(10);

   SPI_WriteByte(0x27);//Write to 0x7
   SPI_WriteByte(0x70);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);
	
	// W_TX_PAYLOAD - envia os dados para o buffer FIFO TX 
	//Write data to TX buffer...
   CSN = 0;//output_low(CSN);
		__delay_ms(10);

   SPI_WriteByte(0xA0);
   for (i=0;i<BUFFER;i++)SPI_WriteByte(SendData[i]);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	//PTX, CRC 2byte enabled...
	 //CONFIG - ativa modo de transmiss?o
   CSN = 0;//output_low(CSN);
	__delay_ms(10);

   SPI_WriteByte(0x20);//Write to 0x0
   SPI_WriteByte(0x02);
   CSN = 1; //output_high(CSN);
	

UART_SendString("CONFIG \0");
	CSN = 0;
	SPI_WriteByte(0x0);
	
		UART_SendByte(SPI_WriteByte(0));
		__delay_ms(10);
	

	CSN = 1;




	//TX transmits data...
	  //pulso para transmitir os dados
   CE = 1;//output_high(CE);
   __delay_us(15);
   CE = 0;//output_low(CE);

	espera_ack=0;

   while(IRQ==1){
      espera_ack++;
      //espera 5ms, pela recep?ao do pacote ACK
      if(espera_ack==400){
      break;
      }
   }

	 //STATUS - leitura do registrador

	//Read status register...
   CSN = 0; //output_low(CSN);
	__delay_ms(10);

   SPI_WriteByte(0x07);
   status=SPI_WriteByte(0);
   CSN = 1;//output_high(CSN);
	
	__delay_ms(10);
	UART_SendString("\nStatus : \n\0");
	UART_SendByte(status);
	__delay_ms(10);


	//Reset status reg...interrupts...
	//STATUS - limpa registrador
   CSN = 0;//output_low(CSN);
	__delay_ms(10);

   SPI_WriteByte(0x27);
   SPI_WriteByte(0x70);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	//Flush tx buffer...
	//TX_FLUSH - limpa o buffer FIFO TX
   CSN = 0;//output_low(CSN);
	__delay_ms(10);
   SPI_WriteByte(0xE1);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	



/*
	//sen?o recebeu ACK em 5ms retorna 0
   if(espera_ack==500){
   clear_interrupt(int_ext);
   enable_interrupts(GLOBAL);
   return(0);
   }
   //se recebeu ACK retorna 1
   else{
   enable_interrupts(GLOBAL);
   clear_interrupt(int_ext);
   return(1);
   }
*/



}



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
  
  while((IRQ) == 1);




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

   //Serial.print("Received : ");
   //Serial.println((char *)ReceiveData);

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



