/* 
 * File:   I2C.h
 * Author: Saim
 *
 * Created on 18 Mart 2020 Çar?amba, 01:39
 */

#ifndef I2C_H
#define	I2C_H

#ifdef	__cplusplus
extern "C" {
#endif

/* 
 * File:   I2C.h
 * Author: Saim
 *
 * Created on 03 Eylül 2019 Sal?, 12:14
 */






/*Two pins are used for data transfer:
? Serial clock (SCL) ? RC3/SCK/SCL
? Serial data (SDA) ? RC4/SDI/SDA
The user must configure these pins as inputs or outputs
through the TRISC<4:3> bits.

Serial Receive/Transmit Buffer Register
(SSPBUF)
? MSSP Shift Register (SSPSR) ? Not directly
accessible


SSPSR is the shift register used for shifting data in or
out. SSPBUF is the buffer register to which data bytes
are written to or read from.
SSPADD register holds the slave device address
when the SSP is configured in I2C Slave mode. When
the SSP is configured in Master mode, the lower
seven bits of SSPADD act as the baud rate generator
reload value.

In receive operations, SSPSR and SSPBUF together
create a double-buffered receiver. When SSPSR
receives a complete byte, it is transferred to SSPBUF
and the SSPIF interrupt is set.


bit 0 BF: Buffer Full Status bit
In Transmit mode:
1 = Receive complete, SSPBUF is full
0 = Receive not complete, SSPBUF is empty

bit 5 SSPEN: Synchronous Serial Port Enable bit
1 = Enables the serial port and configures the SDA and SCL pins as the serial port pins
0 = Disables the serial port and configures these pins as I/O port pins

SSPM3:SSPM0: Synchronous Serial Port Mode Select bits
1111 = I2C Slave mode, 10-bit address with Start and Stop bit interrupts enabled
1110 = I2C Slave mode, 7-bit address with Start and Stop bit interrupts enabled
1011 = I2C Firmware Controlled Master mode (Slave Idle)
1000 = I2C Master mode, clock = FOSC/(4 * (SSPADD + 1))
0111 = I2C Slave mode, 10-bit address
0110 = I2C Slave mode, 7-bit address

ACKEN: Acknowledge Sequence Enable bit (Master Receive mode only)
1 = Initiate Acknowledge sequence on SDA and SCL pins and transmit ACKDT data bit.
Automatically cleared by hardware.
0 = Acknowledge sequence Idle
bit 3 RCEN: Receive Enable bit (Master mode only)
1 = Enables Receive mode for I2C
0 = Receive Idle
bit 2 PEN: Stop Condition Enable bit (Master mode only)
1 = Initiate Stop condition on SDA and SCL pins. Automatically cleared by hardware.
0 = Stop condition Idle
bit 1 RSEN: Repeated Start Condition Enabled bit (Master mode only)
1 = Initiate Repeated Start condition on SDA and SCL pins. Automatically cleared by hardware.
0 = Repeated Start condition Idle
bit 0 SEN: Start Condition Enabled/Stretch Enabled bit
In Master mode:
1 = Initiate Start condition on SDA and SCL pins. Automatically cleared by hardware.
0 = Start condition Idle

To ensure proper operation
of the module, pull-up resistors must be provided
externally to the SCL and SDA pins


The following events will cause SSP Interrupt Flag bit,
SSPIF, to be set (SSP interrupt if enabled):
? Start condition
? Stop condition
? Data transfer byte transmitted/received
? Acknowledge transmit
? Repeated Start


The master device generates all of the serial clock
pulses and the Start and Stop conditions. A transfer is
ended with a Stop condition

The
first byte transmitted contains the slave address of the
receiving device (7 bits) and the Read/Write (R/W) bit.

In this case, the R/W bit will be logic ?0?. Serial data is
transmitted 8 bits at a time. After each byte is transmitted,
an Acknowledge bit is received. Start and Stop
conditions are output to indicate the beginning and the
end of a serial transfer.

In Master Receive mode, the first byte transmitted contains
the slave address of the transmitting device
(7 bits) and the R/W bit. In this case, the R/W bit will be
logic ?1?. Thus, the first byte transmitted is a 7-bit slave
address followed by a ?1? to indicate the receive bit.
Serial data is received via SDA while SCL outputs the
serial clock. Serial data is received 8 bits at a time. After
each byte is received, an Acknowledge bit is transmitted.
Start and Stop conditions indicate the beginning
and end of transmission.

The baud rate generator used for the SPI mode operation
is used to set the SCL clock frequency for either
100 kHz, 400 kHz or 1 MHz I2C operation

In I2C Master mode, the Baud Rate Generator (BRG)
reload value is placed in the lower 7 bits of the
SSPADD register (Figure 9-17). When a write occurs to
SSPBUF, the Baud Rate Generator will automatically
begin counting. The BRG counts down to 0 and stops
until another reload has taken place.



The status of ACK is written into the ACKDT bit on
the falling edge of the ninth clock. If the master receives
an Acknowledge, the Acknowledge Status bit,
ACKSTAT, is cleared. If not, the bit is set


*/
//This function initializes I2C Master...
void I2C_initialize()
{
     
 //SSPM3:SSPM0: Synchronous Serial Port Mode Select bits
 //1000 = I2C Master mode, clock = FOSC/(4 * (SSPADD + 1))
    TRISC3 = 1;
    TRISC4 = 1;
    
 SSPM3 = 1;
 SSPM2 = 0;
 SSPM1 = 0;
 SSPM0 = 0;  
 
 SMP = 1; //disable skew rate...
  
//8MHZ 100 khz speed...
//I2C Master mode, clock = OSC/4 (SSPADD + 1)
//SSPADD = ((Fosc/BitRate)/4)-1 

SSPADD = 39;//0x27;//0xa; (tamam))
//SDAHT = 1; //SDA hold time...

 

 //Enable Module....  
 SSPEN = 1 ;
 SSPIF = 0;
   __delay_ms(5);

}
void I2C_Start()
{   

 SEN = 1;
// the SEN bit
//(SSPCON2<0>) will be automatically cleared by hardware  
 while ( SEN);
 SSPIF = 0;
}



unsigned char I2C_data_receive()
{
   RCEN = 1;

   while(BF == 0 );
	while(SSPIF==0);
    SSPIF = 0;
    return SSPBUF;
   
}



byte unnecessary = 0;

void I2C_data_send(unsigned char data)
{
  
    SSPIF = 0;
SSPBUF = data ;
while (BF);
while(SSPIF ==0){unnecessary++; if(unnecessary == 200)break;};
SSPIF = 0;
unnecessary = 0;
}




/*
ACKDT: Acknowledge Data bit (Master Receive mode only)
1 = Not Acknowledge
0 = Acknowledge
*/
void I2C_SendACK()
{
 
   /*ACKEN: Acknowledge Sequence Enable bit (Master Receive mode only)
1 = Initiate Acknowledge sequence on SDA and SCL pins and transmit ACKDT data bit.
Automatically cleared by hardware
   */
  ACKDT = 0 ;
   ACKEN = 1;
   while (ACKEN);
    SSPIF = 0;

}




void I2C_SendNACK()
{
    ACKDT = 1 ;
   ACKEN = 1;
   while (ACKEN);
    SSPIF = 0;

}



/*
  receive/transmit by setting the Stop Sequence Enable
bit, PEN (SSPCON2<2>). At the end of a receive/
transmit, the SCL line is held low after the falling edge
of the ninth clock. When the PEN bit is set, the master
will assert the SDA line low. When the SDA line is sampled
low, the Baud Rate Generator is reloaded and
counts down to 0. When the Baud Rate Generator
times out, the SCL pin will be brought high and one
TBRG (Baud Rate Generator rollover count) later, the
SDA pin will be deasserted. When the SDA pin is sampled
high while SCL is high, the P bit (SSPSTAT<4>) is
set. A TBRG later, the PEN bit is cleared and the SSPIF
bit is set (Figure 9-24). 
*/
void I2C_Stop()
{
PEN = 1;
   while(PEN);

   SSPIF = 0;
  
}


#ifdef	__cplusplus
}
#endif

#endif	/* I2C_H */

