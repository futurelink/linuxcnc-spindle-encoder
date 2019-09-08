Incremental encoder Modbus interface
====================================

This device is used to read incremental encoder meanings with Modbus.
It supports encoders from 100 to 1000PPR and interpolate position up to 4 times, 
so maximum counts is virtual 4000PPR.

Modbus
======

Device has slave ID 0x85. There are 3 16 bit analog registers starting from reference address 0x00,
containing current position, current speed in RPM and current Z-index value.

Device UART speed is 38400bps.