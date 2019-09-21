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


#define ERROR_INVALID_FUNCTION	0x01
#define ERROR_INVALID_ADDRESS	0x02
#define ERROR_INVALID_VALUE	0x03
#define ERROR_UNRECOVERABLE	0x04
#define ERROR_PROCESSING	0x05
#define ERROR_BUSY		0x06

#define REGISTER_READ_FUNC	0x04
#define REGISTER_WRITE_FUNC	0x06

#define REGISTER_HEARTBEAT	0
#define REGISTER_POSITION	1
#define REGISTER_POSITION_INC	2
#define REGISTER_SPEED		3
#define REGISTER_INDEX		4
#define REGISTER_DIRECTION	5

#define REGISTER_MAX		6
#define REGISTER_DATA_ADDR	0x00
#define REGISTER_SETTINGS_ADDR	0xf0

// Размер буфера определяется как максимальное
// количество регистров (6 * 2 байта) + 2 байта CRC + 1 байт функция
// + 1 байт адрес + 4 байта адрес и кол-во регистров.
// Это максимальный размер посылки.
#define RECV_BUFFER_MAX		20
#define SEND_BUFFER_MAX		20
#define ERR_BUFFER_LENGTH	5

uint8_t parseDatagram(void);

#endif
