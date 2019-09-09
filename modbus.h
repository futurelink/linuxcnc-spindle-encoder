/*

Copyright 2019 Pavlov Denis <futurelink.vl@gmail.com>

This is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

It is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this project.  If not, see <http://www.gnu.org/licenses/>.

*/

#ifndef __MODBUS_H
#define __MODBUS_H

#include <avr/io.h>
#include <avr/interrupt.h>

#include "crc.h"

#define RECV_BUFFER_MAX		24
#define SEND_BUFFER_MAX		24
#define ERR_BUFFER_LENGTH	5

#define ERROR_INVALID_FUNCTION	0x01
#define ERROR_INVALID_ADDRESS	0x02
#define ERROR_INVALID_VALUE	0x03
#define ERROR_UNRECOVERABLE	0x04
#define ERROR_PROCESSING	0x05
#define ERROR_BUSY		0x06

uint8_t parseDatagram(void);

#endif