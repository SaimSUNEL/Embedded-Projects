/*Functions implemented....

void UART_initialize()
void UART_send_byte(unsigned char data)
unsigned char UART_receive_byte()
*/

/*
The USART can be
configured as a full-duplex asynchronous system that
can communicate with peripheral devices, such as
CRT terminals and personal computers, or it can be
configured as a half-duplex synchronous system that
can communicate with peripheral devices, such as A/D
or D/A integrated circuits, serial EEPROMs, etc

The USART can be configured in the following modes:
• Asynchronous (full-duplex)
• Synchronous – Master (half-duplex)
• Synchronous – Slave (half-duplex)
Bit SPEN (RCSTA<7>) and bits TRISC<7:6> have to be
set in order to configure pins RC6/TX/CK and RC7/RX/DT
as the Universal Synchronous Asynchronous Receiver
Transmitter.
The USART module also has a multi-processor
communication capability using 9-bit address detection.


bit 7 CSRC: Clock Source Select bit
Asynchronous mode:
Don’t care.
Synchronous mode:
1 = Master mode (clock generated internally from BRG)
0 = Slave mode (clock from external source)


In this mode, the USART uses standard Non-Returnto-
Zero (NRZ) format (one Start bit, eight or nine data
bits and one Stop bit).

The most common data format
is 8 bits. An on-chip, dedicated, 8-bit Baud Rate
Generator can be used to derive standard baud rate
frequencies from the oscillator. The USART transmits
and receives the LSb first. The transmitter and receiver
are functionally independent but use the same data
format and baud rate.

*/
void UART_initialize()
{
  TRISC6 = 0 ; //TX output
   TRISC7 = 1 ; //RC input
/*
bit 5 TXEN: Transmit Enable bit
1 = Transmit enabled
0 = Transmit disabled

*/   
   TXEN = 1 ;


  /*
   bit 4 SYNC: USART Mode Select bit
1 = Synchronous mode
0 = Asynchronous mode
  */ 
   SYNC = 0 ;
   /*
   bit 2 BRGH: High Baud Rate Select bit
Asynchronous mode:
1 = High speed
0 = Low speed
Synchronous mode:
Unused in this mode.
   
   */
   BRGH = 1 ;
   
   //4MHZ FOSC 9600BAUDRATE
   SPBRG = 103;//25 ;
   /*
   CREN: Continuous Receive Enable bit
Asynchronous mode:
1 = Enables continuous receive
0 = Disables continuous receive
Once Asynchronous mode is selected, reception is
enabled by setting bit CREN (RCSTA<4>).  
   */
   CREN = 1;
   
   /*
   
   */
   
   
   
   
   /*
   SPEN: Serial Port Enable bit
1 = Serial port enabled (configures RC7/RX/DT and RC6/TX/CK pins as serial port pins)
0 = Serial port disabled */
SPEN = 1 ;
}
/*

The USART transmitter block diagram is shown in
Figure 10-1. The heart of the transmitter is the Transmit
(Serial) Shift Register (TSR). The shift register obtains
its data from the Read/Write Transmit Buffer, TXREG.
The TXREG register is loaded with data in software.
The TSR register is not loaded until the Stop bit has
been transmitted from the previous load. As soon as
the Stop bit is transmitted, the TSR is loaded with new
data from the TXREG register (if available). Once the
TXREG register transfers the data to the TSR register
(occurs in one TCY), the TXREG register is empty and
flag bit, TXIF (PIR1<4>), is set.

Flag bit TXIF will be set regardless of the
state of enable bit TXIE and cannot be cleared in software.
It will reset only when new data is loaded into the
TXREG register

While flag bit TXIF indicates the status
of the TXREG register, another bit, TRMT (TXSTA<1>),
shows the status of the TSR register. Status bit TRMT
is a read-only bit which is set when the TSR register is
empty. No interrupt logic is tied to this bit so the user
has to poll this bit in order to determine if the TSR
register is empty.

The TSR register is not mapped in data
memory so it is not available to the user.
2: Flag bit TXIF is set when enable bit TXEN
is set. TXIF is cleared by loading TXREG.

Transmission is enabled by setting enable bit, TXEN
(TXSTA<5>). The actual transmission will not occur
until the TXREG register has been loaded with data
and the Baud Rate Generator (BRG) has produced a
shift clock (Figure 10-2)

The transmission can also be
started by first loading the TXREG register and then
setting enable bit TXEN. Normally, when transmission
is first started, the TSR register is empty. At that point,
transfer to the TXREG register will result in an immediate
transfer to TSR, resulting in an empty TXREG. A
back-to-back transfer is thus possible (Figure 10-3).
Clearing enable bit TXEN during a transmission will
cause the transmission to be aborted and will reset the
transmitter
*/
void UART_send_byte(unsigned char data)
{/*
   While flag bit TXIF indicates the status
of the TXREG register, another bit, TRMT (TXSTA<1>),
shows the status of the TSR register. Status bit TRMT
is a read-only bit which is set when the TSR register is
empty. No interrupt logic is tied to this bit so the user
has to poll this bit in order to determine if the TSR
register is empty.
   
   */
   TXREG = data ;
   while(TRMT==0);
}
/*
The heart of the receiver is the Receive (Serial) Shift
Register (RSR). After sampling the Stop bit, the
received data in the RSR is transferred to the RCREG
register (if it is empty). If the transfer is complete, flag
bit, RCIF (PIR1<5>), is set. The actual interrupt can be
enabled/disabled by setting/clearing enable bit, RCIE
(PIE1<5>). Flag bit RCIF is a read-only bit which is
cleared by the hardware. It is cleared when the RCREG
register has been read and is empty.

The RCREG is a
double-buffered register (i.e., it is a two-deep FIFO)
is possible for two bytes of data to be received and
transferred to the RCREG FIFO and a third byte to
begin shifting to the RSR register

On the detection of
the Stop bit of the third byte, if the RCREG register is
still full, the Overrun Error bit, OERR (RCSTA<1>), will
be set. The word in the RSR will be lost. The RCREG
register can be read twice to retrieve the two bytes in
the FIFO.


Overrun bit OERR has to be cleared in software.
This is done by resetting the receive logic (CREN
is cleared and then set). If bit OERR is set, transfers
from the RSR register to the RCREG register are inhibited
and no further data will be received.

It is, therefore,
essential to clear error bit OERR if it is set. Framing
error bit, FERR (RCSTA<2>), is set if a Stop bit is
detected as clear. Bit FERR and the 9th receive bit are
buffered the same way as the receive data. Reading
the RCREG will load bits RX9D and FERR with new
values, therefore, it is essential for the user to read the
RCSTA register before reading the RCREG register in


*/
unsigned char UART_receive_byte()
{
 while (RCIF == 0);
    return RCREG ;
}
void UART_send_string(const char * str)
{
   while(*str !='\0')
   { 
      UART_send_byte(*str);
      str ++;
      }
      }