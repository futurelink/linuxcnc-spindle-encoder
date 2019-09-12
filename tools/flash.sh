#!/bin/sh
avrdude -pattiny2313 -cstk500 -P/dev/ttyUSB0 -v -b115200 -e -D -Ulfuse:w:0xe4:m
avrdude -pattiny2313 -cstk500 -P/dev/ttyUSB0 -v -b115200 -e -D -Uhfuse:w:0xdf:m
#avrdude -pattiny2313 -cstk500 -P/dev/ttyUSB1 -v -b115200 -e -D -Uflash:w:encoder-modbus.hex:i
