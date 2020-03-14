

INT0_init()
{
IOCAN = 0;
IOCAP = 0;

IOCAP3 = 1; //Rising edge on RA3 interrupt  IOCAF3 interrupt flag
IOCIE = 1;
IOCIF = 0;
}
