/* 
 * File:   PWM.h
 * Author: Saim
 *
 * Created on 02 Eylül 2019 Pazartesi, 21:26
 */

#ifndef PWM_H
#define	PWM_H

#ifdef	__cplusplus
extern "C" {
#endif
    
     void PWM2_set_value(int value)
    {
        TMR2ON = 0;
        CCPR2L = value >> 2;
        DC2B1 = value >> 1;
        DC2B0 = value &0x1;
        TMR2ON = 1;

    }
    void PWM2_initialize()
    {
        
        // PWM period = [(PR2+1)*4*TOSC*(TM2 Presc Value)]
        //PWM Duty Cycle = (CCPR2L:CCP2CON<5:4>)*TOSC*(TMR2 Presc)
        // PWM period 1000 us
        //CCP2L:CCP2CON<5:4> <=1000;
        C2TSEL = 0; //TMR2 for CCP2
        TRISC2 = 0; //CPP2 is output...
        PR2 = 249; //FOR 16mhz 1000 hz pwm freq...
        T2CKPS1=0; T2CKPS0 = 1; //presc 4
        CCP2M3 = 1;
        CCP2M2 = 1;
        
        PWM2_set_value(500);
        
    }
    
    
     void PWM3_set_value(int value)
    {
        TMR2ON = 0;
        CCPR3L = value >> 2;
        DC3B1 = value >> 1;
        DC3B0 = value &0x1;
        TMR2ON = 1;

    }
    
    void PWM3_initialize()
    {
         // PWM period = [(PR2+1)*4*TOSC*(TM2 Presc Value)]
        //PWM Duty Cycle = (CCPR2L:CCP2CON<5:4>)*TOSC*(TMR2 Presc)
        // PWM period 1000 us
        //CCP2L:CCP2CON<5:4> <=1000;
        C3TSEL = 0; //TMR2 for CCP3
        TRISC6 = 0; //CPP3 is output...
        PR2 = 249; //FOR 16mhz 1000 hz pwm freq...
        T2CKPS1=0; T2CKPS0 = 1; //presc 4
        CCP3M3 = 1;
        CCP3M2 = 1;
        
        PWM3_set_value(500);
    }
    
    
     void PWM4_set_value(int value)
    {
        TMR2ON = 0;
        CCPR4L = value >> 2;
        DC4B1 = value >> 1;
        DC4B0 = value &0x1;
        TMR2ON = 1;

    }
    
    void PWM4_initialize()
    {
         // PWM period = [(PR2+1)*4*TOSC*(TM2 Presc Value)]
        //PWM Duty Cycle = (CCPR2L:CCP2CON<5:4>)*TOSC*(TMR2 Presc)
        // PWM period 1000 us
        //CCP2L:CCP2CON<5:4> <=1000;
        C4TSEL = 0; //TMR2 for CCP3
        TRISC7 = 0; //CPP4 is output...
        PR2 = 249; //FOR 16mhz 1000 hz pwm freq...
        T2CKPS1=0; T2CKPS0 = 1; //presc 4
        CCP4M3 = 1;
        CCP4M2 = 1;
        
        PWM4_set_value(500);
    }
    
     void PWM5_set_value(int value)
    {
        TMR2ON = 0;
        CCPR5L = value >> 2;
        DC5B1 = value >> 1;
        DC5B0 = value &0x1;
        TMR2ON = 1;

    }
    
    void PWM5_initialize()
    {
         // PWM period = [(PR2+1)*4*TOSC*(TM2 Presc Value)]
        //PWM Duty Cycle = (CCPR2L:CCP2CON<5:4>)*TOSC*(TMR2 Presc)
        // PWM period 1000 us
        //CCP2L:CCP2CON<5:4> <=1000;
        C5TSEL = 0; //TMR2 for CCP3
        TRISB5 = 0; //CPP5 is output...
        PR2 = 249; //FOR 16mhz 1000 hz pwm freq...
        T2CKPS1=0; T2CKPS0 = 1; //presc 4
        CCP5M3 = 1;
        CCP5M2 = 1;
        
        PWM3_set_value(500);
    }
   


#ifdef	__cplusplus
}
#endif

#endif	/* PWM_H */

