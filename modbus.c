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

#include "config.h"
#include "modbus.h"

/* Variables */

uint8_t slaveAddr;

// Регистры данных
volatile int16_t registers[6];

// Буфер передачи данных
uint8_t sendBuffer[SEND_BUFFER_MAX];
uint8_t sendLength = 0, sentLength = 0;

// Буфер приема данных
uint8_t recvBuffer[RECV_BUFFER_MAX];
uint8_t recvLength = 0;

/* Function declarations */

static uint8_t sendRegisterValues(uint16_t regAddr, uint16_t regCount);
static uint8_t recvRegisterValues(uint16_t regAddr, uint16_t regCount, uint8_t regValues[]);
static void sendError(uint8_t funcCode, uint8_t errorCode);

/* ---------------------------------------------------------------------*/

uint8_t parseDatagram() {
    uint16_t regAddr = 0;
    uint16_t regCount = 0;
    uint16_t crc = 0;
    uint8_t err = 0;

    // Минимальная длина датаграммы 8 байт
    // Посылка адресована нам, парсим
    if ((recvLength > 7) && (recvBuffer[0] == slaveAddr)) {
	switch (recvBuffer[1]) {
	    case REGISTER_READ_FUNC: // Чтение аналоговых регистров
		crc = (recvBuffer[7] << 8) | recvBuffer[6];
		if (crc == CRC16(&recvBuffer[0], recvLength - 2)) {
		    regAddr = (recvBuffer[2] << 8) | recvBuffer[3];
		    regCount = (recvBuffer[4] << 8) | recvBuffer[5];
		    if ((regCount > 0) && (regCount <= REGISTER_MAX))
			return sendRegisterValues(regAddr, regCount);
		} else err = ERROR_INVALID_VALUE;
		break;

	    case REGISTER_WRITE_FUNC: // Запись аналоговых регистров
		regCount = (recvBuffer[4] << 8) | recvBuffer[5];
		if ((regCount > 0) && (regCount <= REGISTER_MAX)) {
		    regAddr = (recvBuffer[2] << 8) | recvBuffer[3];
		    uint8_t bytesCount = regCount * 2;
		    crc = (recvBuffer[5 + bytesCount] << 8) | recvBuffer[4 + bytesCount];
		    if (crc == CRC16(&recvBuffer[0], recvLength - 2)) {
			return recvRegisterValues(regAddr, regCount, &recvBuffer[4]);
		    } else err = ERROR_INVALID_VALUE;
		}
		break;

	    default:
		err = ERROR_INVALID_FUNCTION;
	}
    }

    sendError(recvBuffer[1], err);
    return 0;
}

uint8_t recvRegisterValues(uint16_t regAddr, uint16_t regCount, uint8_t regValues[]) {
    if ((regAddr == REGISTER_SETTINGS_ADDR) && (regCount == 1)) {}
    sendError(REGISTER_WRITE_FUNC, ERROR_INVALID_ADDRESS);
    return 0;
}

// Отправка значений регистров
uint8_t sendRegisterValues(uint16_t regAddr, uint16_t regCount) {
    uint8_t bytesCount = regCount * 2;

    // Посылаем по 2 байта на регистр
    sendBuffer[0] = slaveAddr;
    sendBuffer[1] = REGISTER_READ_FUNC;
    sendBuffer[2] = bytesCount;

    // Возвращаем настройки
    if (regAddr == REGISTER_SETTINGS_ADDR) {

    }
    // Сделано тупо, зато быстро - получить данные можно только
    // с адреса 0x00, и нужное количество регистров.
     else if (regAddr == REGISTER_DATA_ADDR) {
	do {
	    // Обрезаем знак, mb2hal требуются беззнаковые числа
	    int16_t v = registers[regCount-1];
	    uint16_t r = (v > 0) ? v : -v;
	    // Такое прокатывает для беззнаковых чисел, ну и плевали
	    // мы на strict-aliasing ;)
	    *(uint16_t *)&sendBuffer[regCount * 2 + 1] = (r >> 8) | (r << 8);
	} while (--regCount);

	// Инвертируем синхросигнал
	registers[REGISTER_HEARTBEAT] = !registers[REGISTER_HEARTBEAT];

	// Считаем CRC. Небольшой трик, чтобы сэкономить 10 байт размера
	*(uint16_t *)&sendBuffer[bytesCount + 3] = CRC16(&sendBuffer[0], bytesCount + 3);
	sendLength = bytesCount + 5;

	// Разрешаем передачу
	UCSRB |= ((1 << UDRE) | (1 << TXEN));

	return 1;
    }

    sendError(REGISTER_READ_FUNC, ERROR_INVALID_ADDRESS);
    return 0;
}

void sendError(uint8_t funcCode, uint8_t errorCode) {
    sendBuffer[0] = slaveAddr;
    sendBuffer[1] = funcCode | 0x80;
    sendBuffer[2] = errorCode;

    // Считаем CRC, такой трик экономит нам байтики размера.
    *((uint16_t *)&sendBuffer[3]) = CRC16(&sendBuffer[0], 3);
    sendLength = 5;

    // Разрешаем передачу
    UCSRB |= ((1 << UDRE) | (1 << TXEN));
}
