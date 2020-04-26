from machine import Pin, I2C
import time

def DS1307_saniye():
    arr = bytearray(1)
    arr[0] = 0

    i2c.start()
    g = bytearray(1)
    g[0] = 0xd0
    i2c.write(g)
    
    g[0] = 0
    i2c.write(g)
    i2c.stop()
    time.sleep(0.1)
    i2c.start()
    g[0] = 0xd1
    i2c.write(g)
    b = bytearray(1)
    i2c.readinto(b)
    i2c.stop()
    # info = i2c.readfrom_mem(0x68, 0, 1)
    info = b[0]
    # print("info : ", info)
    veri = ( info >> 4 ) * 10 + ( info & 15 ) ;
    return veri

def DS1307_saniye_ayarla(value):
    #print("Fonksiyon value : ", value)
    value =  (   ( value // 10 ) << 4  ) | ( value - ( value//10 ) * 10  )  
    #print("Value to be set : ", arr)

    i2c.start()
    g = bytearray(1)
    g[0] = 0xd0
    i2c.write(g)

    g[0] = 0x0
    i2c.write(g)

    g[0] = value
    i2c.write(g)

    i2c.stop()
   
    time.sleep(0.2)
    
i2c = I2C(scl=Pin(5), sda=Pin(4), freq=100000)
time.sleep(0.2) 
DS1307_saniye_ayarla(30)
print(i2c.scan())

k = 50

while k > 0:
    print(str(DS1307_saniye()))
    time.sleep(1)
    k -= 1

# i2c.readfrom(0x3a, 4)   # read 4 bytes from slave device with address 0x3a
# i2c.writeto(0x3a, '12') # write '12' to slave device with address 0x3a

# buf = bytearray(10)     # create a buffer with 10 bytes
# i2c.writeto(0x3a, buf)  # write the given buffer to the slave
