# 512

personal IoT project

## Hardware

BOM

- [Adafruit HUZZAH ESP8266 Breakout](https://www.adafruit.com/products/2471)
- [FTDI friend](https://www.adafruit.com/products/284) or some other USB-to-UART adapter
- three LEDs
- three push buttons
- 3.3V regulated power supply

### Power supply

eps8266 uses max 350mA at 3V3 when transmitting?

runs on anything from 2.8 to 3.5 volts, so a couple of AA batteries will work.
Maximum current draw is 300 mA,

## connect

$ screen /dev/cu.usbserial-AJ030T8C 

wifi.sta.config("Airport","yourpassword")
wifi.sta.connect()
tmr.delay(1000000)   -- wait 1,000,000 us = 1 second
print(wifi.sta.status())
print(wifi.sta.getip())


## Software

$ node -v
v0.10.12

$ npm -v
1.2.32

sudo npm install npm -g

$ npm -v
3.5.0


npm install esp8266 -g

$ esp file list
      22 bytes  init.lua
$ esp file read init.lua
print("Hello World!")



esp port set /dev/cu.usbserial-AJ030T8C 
esp port get

esp file execute init.lua
esp restart

$ esp run "print 'Mechanisms, not policy.'"
Mechanisms, not policy.

esp file write 512.lua 
esp file execute 512.lua 


$ esp run "= wifi.sta.status()"
5
$ esp run "= wifi.sta.getip()"
192.168.178.69	255.255.255.0	192.168.178.1
$ esp run "= node.heap()"
20560


### Client

### Server

$ curl 192.168.178.89:8080/jim.php
ok



# Snippets

local pin = 3            --> GPIO2
local value = gpio.LOW
local duration = 1000    --> 1 second

-- Initialise the pin
gpio.mode(pin, gpio.OUTPUT)
gpio.write(pin, value)

-- Create an interval
tmr.alarm(0, duration, 1, function ()
    if value == gpio.LOW then
        value = gpio.HIGH
    else
        value = gpio.LOW
    end

    gpio.write(pin, value)
end)

sk=net.createConnection(net.TCP, 0)
sk:on("receive", function(sck, c) print(c) end )
sk:connect(8080,"192.168.178.89")
sk:send("GET /jim.php HTTP/1.1\r\nHost: 192.168.178.89\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")



local pin = 4            --> GPIO2
local value = gpio.LOW
local duration = 1000    --> 1 second


-- Function toggles LED state
function toggleLED ()
    if value == gpio.LOW then
        value = gpio.HIGH
    else
        value = gpio.LOW
    end

    gpio.write(pin, value)
end


-- Initialise the pin
gpio.mode(pin, gpio.OUTPUT)
gpio.write(pin, value)


-- Create an interval
tmr.alarm(0, duration, 1, toggleLED)


<?php
header("Content-type: text/plain");
echo "ok";


