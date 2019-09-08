#ifndef __CRC_H
#define __CRC_H

#include <avr/pgmspace.h>

uint16_t CRC16(uint8_t *pucFrame, uint16_t usLen);

#endif
