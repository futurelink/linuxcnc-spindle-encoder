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

Connection to LinuxCNC
======================

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
net spindle-heartbeat  spindle-encoder.0.heartbeat <= mb2hal.spindle-encoder.00.int
net spindle-pos-in     spindle-encoder.0.pos-in <= mb2hal.spindle-encoder.02.float
net spindle-pos-out    spindle-encoder.0.pos-out => motion.spindle-revs
net spindle-speed-rpm  spindle-encoder.0.speed-rpm <= mb2hal.spindle-encoder.03.int
net spindle-speed      spindle-encoder.0.speed-rps => motion.spindle-speed-in
net spindle-index      spindle-encoder.0.index-in <= mb2hal.spindle-encoder.04.int
net spindle-index-ena  spindle-encoder.0.index-enable <=> motion.spindle-index-enable
net spindle-dir        spindle-encoder.0.direction <= mb2hal.spindle-encoder.05.int
```

Also you'll need to load mb2hal module into userspace:

```
loadusr -W mb2hal config=modbus_config.ini
```

