/* 
 * File:   otherI2C.h
 * Author: Saim
 *
 * Created on 20 Mart 2020 Cuma, 11:37
 */

#ifndef OTHERI2C_H
#define	OTHERI2C_H

#ifdef	__cplusplus
extern "C" {
#endif

#define _XTAL_FREQ 8000000UL                   //Frequency of external oscillator in Hz
void i2c_init(unsigned long int clock_freq)
{
  TRISB |= 0x03;  //Configuring SDA and SCL as input pins
  SSPCON1 = 0x28;  //Configuring as I2C Master mode with SCL clock frequency= FOSC/(4 * (SSPADD + 1))
  SSPADD = (_XTAL_FREQ/(4*clock_freq))-1;  //Setting SCL frequency with value in clock_freq
  SSPSTAT = 0x00;  //Resetting SSPSTAT register
  SSPIF = 0;  //Resetting MSSP interrupt flag
}
    
void i2c_idle(void)
{
  // Wait for Status Idle (i.e. ACKEN, RCEN, PEN, RSEN, SEN) and I2C Bus stop detection
  while (( SSPCON2 & 0x1F ) || ( SSPSTAT & 0x04 ));
}
void mssp_wait(void)
{
  while(!SSPIF);  //wait till SSPIF flag is set
  SSPIF=0;
}
void i2c_start(void)
{
  i2c_idle();  //Check if the I2C bus is idle
  SEN=1;  //Initiate start condition
  mssp_wait();  //Wait till completion of event
}

void i2c_restart(void);

int i2c_write(unsigned char data)
{
  L1: SSPBUF=data;  //Input data to buffer
  mssp_wait();  //Wait till completion of event
  while(ACKSTAT)  //check if acknowledgement signal received 
  {
  i2c_restart();  //If no acknowledgement received, give restart signal and transmit data again
  goto L1;
  }
}
    
unsigned char i2c_read(void)
{
  RCEN=1;  //Enable reception in Master device 
  while(!BF);  //Wait till buffer is full
  RCEN=0;  //Enable reception in Master device 
  return SSPBUF;  //return received data
  
}

void i2c_stop(void)
{
  PEN=1;  //Initiate Stop condition
  mssp_wait();  //Wait till completion of event
  SSPEN=0;  //Disable I2C operation
}

void i2c_restart(void)
{
  RSEN=1;  //Initiate restart condition
  mssp_wait();  //Wait till completion of event
}


#ifdef	__cplusplus
}
#endif

#endif	/* OTHERI2C_H */

