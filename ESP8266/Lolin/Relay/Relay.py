from machine import Pin
import time
pin1 = Pin(5, Pin.OUT)
pin2 = Pin(4, Pin.OUT)

while True:
    pin1.value(1)
    pin2.value(0)
    time.sleep(1)
    pin1.value(0)
    pin2.value(1)
    time.sleep(1)