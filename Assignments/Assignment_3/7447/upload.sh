echo "avra $1.asm"
avra $1.asm
echo "avrdude -p atmega328p -c arduino -P /dev/ttyACM0 -b 115200 -U flash:w:$1.hex"
avrdude -p atmega328p -c arduino -P /dev/ttyACM0 -b 115200 -U flash:w:$1.hex
