
TIMER1_init()
 {
TMR1H = 0;
TMR1L = 0;


//timer1 source fosc/4 
TMR1CS1 = 0;
TMR1CS0 = 0;


//Prescaler 1/4
T1CKPS1 = 1;
T1CKPS0 = 0;


//Each interrupt will be rised in every 50000 us, 50 ms
TMR1ON = 0;
TMR1 = 15535;
TMR1IF = 0;
TMR1IE = 1; //Timer1 interrupt enabled...
}