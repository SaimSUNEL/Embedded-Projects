#define  SPI_CLK    RB6   //13. pin SPI) 
#define  SPI_MOSI   RC7   //11.pin SPI 
#define  SPI_MISO   RB4   //12.pin SPI

void SoftwareSPI_Initialize()
 {
	
	TRISB6 = 0;//SCK output
	TRISC7 = 0;//MOSI output
	TRISB4 = 1;//MISO input...
	
	SPI_CLK = 0;
	SPI_MOSI = 0;

	TRISC1 = 0;


}

byte  SoftwareSPI_WriteByte(byte spi_data) 
{ 

//    SPI_MISO 
//    SPI_MOSI 
//    SPI_CLK 
    
    byte rt; 
    byte result = 0; 
     int d=0;  //int1 d = 0; 
     
  __delay_us(50);        //   50  mikrosaniye bekle
    for(rt=0;rt<8;rt++)
    { 
       // d = bit_test(spi_data,7-rt); 
       
        if (spi_data & (1<<(7-rt)))
        //if(d) 
        { 
      SPI_MOSI= 1;//      output_high(SPI_MOSI); 
        } 
        else 
        { 
        SPI_MOSI= 0; //     output_low(SPI_MOSI); 
        } 
      __delay_us(10);        //         delay_us(10); 
          
      SPI_CLK=1;  //   output_high(SPI_CLK); 
         __delay_us(60);        //    delay_us(60); 
        SPI_CLK = 0; // output_low(SPI_CLK); 
        __delay_us(10);        //  delay_us(10); 
       
       if (rt<7)
       {
        if( SPI_MISO) 
        { 
         result |= (1 << (6-rt));    //    bit_set(result,6-rt); 
        } 
        else 
        { 
         //bitClear(result,6-rt); //   bit_clear(result,6-rt); 
        } }
    } 
    
    SPI_MOSI = 0; // output_low(SPI_MOSI); 
    return(result); 

} 

