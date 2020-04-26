from machine import Pin, I2C
import time

def PCA9685_write1Byte_memory(address, data):
        #I2C_Start();
        i2c.start()
        g = bytearray(1)
        g[0] = 0x80
        i2c.write(g)
        # I2C_data_send(10000000); //Write command to A5=A4=A3=A2=A1=A0=0
        g[0] = address
        i2c.write(g)
        # I2C_data_send(address);
        g[0] = data
        i2c.write(g)
        # I2C_data_send(data);
        i2c.stop()
        #I2C_Stop();

    
def PCA9684_set_pwm(led_number, pwm_value):
    address = led_number*4+6 ;
    g = bytearray(1)
    i2c.start()
    # I2C_Start();
    g[0] = 0x80
    i2c.write(g)
    # I2C_data_send(10000000);
    g[0] = address
    i2c.write(g)    
    
    # I2C_data_send(address);
    g[0] = 0
    i2c.write(g)
    g[0] = 0
    i2c.write(g)
    # I2C_data_send(0);
    # I2C_data_send(0);
    g[0] = pwm_value & 0xff
    i2c.write(g)
    
    # I2C_data_send(pwm_value & 0xff);
    g[0] = (pwm_value >> 8) & 0xff;
    i2c.write(g)
    # I2C_data_send((pwm_value >> 8)&0xff);
    i2c.stop()
    # I2C_Stop();        
        

    
def PCA9684_read_byte(address):
        data = bytearray(1)
        g = bytearray(1)
        
        i2c.start()
        # I2C_Start();
        
        g[0] = 0x80
        i2c.write(g)
        # I2C_data_send(10000000); //Write command to A5=A4=A3=A2=A1=A0=0
        
        g[0] = address
        i2c.write(g)
        # I2C_data_send(address);

        i2c.stop()
        # I2C_Stop();

        time.sleep(0.02)
        #__delay_ms(15); 
        
        i2c.start()
        # I2C_Start();
        g[0] = 0x81
        i2c.write(g)
        
        # I2C_data_send(10000001); //Write command to A5=A4=A3=A2=A1=A0=0

        i2c.readinto(data)
        
        # data = I2C_data_receive();
        # I2C_SendNACK();
        
        i2c.stop()
        # I2C_Stop();
        
        
        return data[0]        

    
# update_rate = frequency...
# prescale_value = round(25 MHZ / (4096 / update_rate)) - 1
def PCA9684_set_prescaler(value):
    # Prescaler should be set when oscialltor off...
    dat = PCA9684_read_byte(0);
    dat |= 1 << 4;
    PCA9685_write1Byte_memory(0, dat);       

    time.sleep(0.02)
    # __delay_ms(20);
    PCA9685_write1Byte_memory(254, value);       
    time.sleep(0.02)
    # __delay_ms(25);
    dat &= ~(1 << 4);
    PCA9685_write1Byte_memory(0, dat);       

    time.sleep(0.01)
    # __delay_ms(1);
            
    
def PCA9685_init():

    # RESTART disabled, external clock disabled, register auto increment enabled, normal mode osciallator on, sub calls and all call are disabled... ...
    PCA9685_write1Byte_memory(0xfa, 0);
    PCA9685_write1Byte_memory(0xfb, 0);
    PCA9685_write1Byte_memory(0xfc, 0);
    PCA9685_write1Byte_memory(0xfd, 0);
    command = (0 << 7) | (0 << 6) | ( 1 << 5) | (0 << 4 ) +0;
    PCA9685_write1Byte_memory(0, command);
      
    # Output logic is inverted, output change on Stop, OUTDRV = 1, OUTNE= 01
    command = (0 <<4) | (0 << 3) | 0b101;
    PCA9685_write1Byte_memory(1, command);
    # PCA9684_set_prescaler(30);//200 hz
    PCA9684_set_prescaler(11); # 500 hz
    time.sleep(0.01)
    # __delay_ms(25);


    
i2c = I2C(scl=Pin(5), sda=Pin(4), freq=100000)
time.sleep(0.2) 
print(i2c.scan())

PCA9685_init();

PCA9684_set_pwm(1, 1024);
PCA9684_set_pwm(2, 3072);
PCA9684_set_pwm(3, 4096);

k = 20
pwm = 0
incr = 1

pwm2 = 4095
incr2 = 0

while k > 0:

    if incr:
        pwm += 500
    else:
        pwm -= 500

    if pwm >= 4095:
        incr = 0
        pwm = 4095
    elif pwm < 0:
        incr = 1
        pwm = 0


    if incr2:
        pwm2 += 500
    else:
        pwm2 -= 500

    if pwm2 >= 4095:
        incr2 = 0
        pwm2 = 4095
    elif pwm2 < 0:
        incr2 = 1
        pwm2 = 0


    PCA9684_set_pwm(1, pwm);
    PCA9684_set_pwm(2, pwm2);
    time.sleep(0.1)


  