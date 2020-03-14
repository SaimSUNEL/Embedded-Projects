#define ENDTX    75  // 1 a 255
#define ENDRX    75  // 1 a 255
#define CANAL 107
#define BUFFER   10  // 1 a 32


#define CSN CSE
#define CE RC4
unsigned char SendData[BUFFER];
unsigned char ReceiveData[BUFFER];

void NRF_Initialize()
{
   //RX_ADDR_P0 - Receiver name is set....
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x2A); // Write reg at 0xa
   SPI_WriteByte(ENDRX);
   SPI_WriteByte(0xC2);
   SPI_WriteByte(0xC2);
   SPI_WriteByte(0xC2);
   SPI_WriteByte(0xC2);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);
	//TX_ADDR - transmitter address
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x30);//Write to 0x10
   SPI_WriteByte(ENDTX);
   SPI_WriteByte(0xC2);
   SPI_WriteByte(0xC2);
   SPI_WriteByte(0xC2);
   SPI_WriteByte(0xC2);
   CSN = 1;//output_high(CSN);


	__delay_ms(10);
	//EN_AA - habilita autoACK no PIPE0//Enable auto acknowledgement on PIPE 0
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x21);//write to 0x1
   SPI_WriteByte(0x01);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);
	 //EN_RXADDR - ativa o PIPE0 //Enable PIPE 0 receiver address
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x22);//Write to 0x2
   SPI_WriteByte(0x01);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	 //SETUP_AW - define o endereço com tamanho de 5 Bytes
	//RX/TX Adress with here 5 byte adress
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x23);//Write to 0x3
   SPI_WriteByte(0x03);
   CSN = 1;//output_high(CSN);
	__delay_ms(10);

	 //SETUP_RETR - configura para nao retransmitir pacotes
	//No retransmit....
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x24);// Write to 0x4
   SPI_WriteByte(0x00);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	 //RF_CH - define o canal do modulo (TX e RX devem ser iguais)
	//Frequency channell --- errort!....
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x05);
   SPI_WriteByte(CANAL);
   CSN = 1;//output_high(CSN);
	
	__delay_ms(10);

	//RF_SETUP - ativa LNA, taxa em 250K, e maxima potencia 0dbm
	//0 DB, 250KBps
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x26); //Write to 0x6
   SPI_WriteByte(0b00100110);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	 //STATUS - reseta o resgistrador STATUS

	//Reset interrupt flags...
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x27); //Write to 0x7
   SPI_WriteByte(0x70);
   CSN = 1;//output_high(CSN);
	
	__delay_ms(10);
	 //RX_PW_P0 - tamanho do buffer PIPE0
	//RX buffer size is 10(BUFFER)
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x31);//Write reg to 0x11
   SPI_WriteByte(BUFFER);
   CSN = 1;//output_high(CSN);
	
	__delay_ms(10);
	 //CONFIG - coloca em modo de recepção, e define CRC de 2 Bytes
	//Enable CRC(2byte) Power Up PRX

   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x20);//Write to 0x0
   SPI_WriteByte(0x0F);
   CSN = 1;//output_high(CSN);

	//RX mode...
	__delay_ms(2);
   CE = 1;//output_high(CE);
   __delay_us(150);

//Both rx and tx will produce interrupt... because mask is 0


}
int espera_ack;
byte status;
#define IRQ RC5

byte i;

int NRF_SendData()
{

	CE = 0;//output_low(CE);

   //STATUS - reseta registrador STATUS

	//Reset interrupt flags...
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x27);//Write to 0x7
   SPI_WriteByte(0x70);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);
	
	// W_TX_PAYLOAD - envia os dados para o buffer FIFO TX 
	//Write data to TX buffer...
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0xA0);
   for (i=0;i<BUFFER;i++)SPI_WriteByte(SendData[i]);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	//PTX, CRC 2byte enabled...
	 //CONFIG - ativa modo de transmissão
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x20);//Write to 0x0
   SPI_WriteByte(0x0E);
   CSN = 1; //output_high(CSN);
	
	//TX transmits data...
	  //pulso para transmitir os dados
   CE = 1;//output_high(CE);
   __delay_us(15);
   CE = 0;//output_low(CE);

	espera_ack=0;

   while(IRQ==1){
      espera_ack++;
      //espera 5ms, pela recepçao do pacote ACK
      if(espera_ack==400){
      break;
      }
   }

	 //STATUS - leitura do registrador

	//Read status register...
   CSN = 0; //output_low(CSN);
   SPI_WriteByte(0x07);
   status=SPI_WriteByte(0);
   CSN = 1;//output_high(CSN);
	
	__delay_ms(10);
	//Reset status reg...interrupts...
	//STATUS - limpa registrador
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x27);
   SPI_WriteByte(0x70);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	//Flush tx buffer...
	//TX_FLUSH - limpa o buffer FIFO TX
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0xE1);
   CSN = 1;//output_high(CSN);

	__delay_ms(10);

	



/*
	//senão recebeu ACK em 5ms retorna 0
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


	//Receiver moduna geçiyor...

 //CONFIG - configura para modo de recepção
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x20);//Write to 0x0
   SPI_WriteByte(0x0F);
   CSN = 1;//output_high(CSN);

   CE = 1;//output_high(CE);
	//When data comes IRQ pin will be 0
	while(IRQ == 1);




	byte status;

//Read status...
 //STATUS - leitura do registrador
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x07);
   status=SPI_WriteByte(0);
   CSN = 1;//output_high(CSN);
	
	__delay_ms(10);
//Reset status...
//STATUS - limpa registrador
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x27);
   SPI_WriteByte(0x70);
   CSN = 1;//output_high(CSN);

	//verifica o bit de recepção de dados
if(((status >> 5)&0x1 == 0))
return 0;
	
/*
   if(bit_test(status,6)==0){
   return(0);
   }
*/

//R_RX_PAYLOAD - recebe os dados do buffer FIFO RX
   CSN = 0;//output_low(CSN);
   SPI_WriteByte(0x61);
   for(i=0;i<BUFFER;i++)ReceiveData[i]=SPI_WriteByte(0);
   CSN = 1;//output_high(CSN);
   
  /* //habilita interrupção
   clear_interrupt(int_ext);
   enable_interrupts(GLOBAL);
   __delay_ms(10);
   */

	//Flush RX buffer...
	CSN = 0;//output_low(CSN);
    SPI_WriteByte(0xe2);
    CSN = 1;//output_high(CSN);

	__delay_ms(10);

	

   return 1;



}



