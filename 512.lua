gpio.mode(3, gpio.OUTPUT)
gpio.mode(7, gpio.INPUT)
while 1 do
  local pinValue = gpio.read(7)
  if pinValue == gpio.LOW then
    gpio.write(3, gpio.HIGH)
  else
    gpio.write(3, gpio.LOW)
  end
  tmr.delay(1000000)   -- wait 1,000,000 us = 1 second
end
