# Incremental encoder Modbus RTU interface

This device is used to read incremental encoder meanings with Modbus.
It supports encoders from 100 to 1000PPR and interpolate position up to 4 times, 
so maximum resolutuion is 4000PPR. 

![Device KiCAD 3D view](https://github.com/futurelink/linuxcnc-spindle-encoder/blob/devel/device/interface-v1.2.jpg)

It's tested on 1000PPR encoder and it reads correct values on about 1000RPMs on internal
ATtiny2313 RC oscillator.

## What does it do?

This small attiny2313 module and LinuxCNC component allows you to connect almost any precision encoder into LinuxCNC
and it works even if it has no Z phase output.

It allows your lathe execute G33, G33.1 (synchronized motion) and G76 (threading) canned cycles and 
use G96 (constant surface speed) spindle control strategy.

## Modbus

Device has slave ID 0x85. There are 6 16bit analog registers starting from reference address 0x00,
containing (0)heartbeat, (1)current position, (2)position increment, (3)current speed in RPM, (4)current Z-index value
and (5)encoder direction.

Device UART speed is 38400bps.

## Connection to LinuxCNC

Go to ./linuxcnc and execute:

```
$ sudo make
```

This will install component into your LinuxCNC.

Then you need this component in your HAL:


```
loadrt spindle_encoder
addf spindle-encoder.0 servo-thread
setp spindle-encoder.0.ppr 4096
net spindle-heartbeat  spindle-encoder.0.heartbeat <= mb2hal.spindle-encoder.heartbeat.int
net spindle-pos-in     spindle-encoder.0.pos-in <= mb2hal.spindle-encoder.pos-in.float
net spindle-pos-out    spindle-encoder.0.pos-out => motion.spindle-revs
net spindle-speed-rpm  spindle-encoder.0.speed-rpm <= mb2hal.spindle-encoder.speed-rpm.int
net spindle-speed      spindle-encoder.0.speed-rps => motion.spindle-speed-in
net spindle-index      spindle-encoder.0.index-in <= mb2hal.spindle-encoder.index.int
net spindle-index-ena  spindle-encoder.0.index-enable <=> motion.spindle-index-enable
net spindle-dir        spindle-encoder.0.direction <= mb2hal.spindle-encoder.direction.int
```

Also you'll need to load mb2hal module into userspace:


```
loadusr -W mb2hal config=modbus_config.ini
```

Copy modbus_config.ini from ./linuxcnc into your lathe configuration directory. Write your serial 
port device to SERIAL_PORT option in that ini file. Correct SERIAL_DELAY_MS if you need.

