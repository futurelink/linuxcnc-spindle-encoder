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

void parseDatagram(void);

static void sendError(uint8_t funcCode, uint8_t errorCode);
static void sendRegisterValues(uint16_t regAddr, uint16_t regCount);
void sendBufferContents(void);

#endif