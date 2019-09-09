#include "config.h"
#include "modbus.h"

// Состояние кодера
volatile uint8_t encPhases = 0,
		 encPhasesPrev = 0,
		 encIndex = 0,
		 encDirection = 0,
		 heartbeat = 0;

volatile uint16_t encSpeed = 0,
		  encDirectionMeasure = 0;

volatile int16_t encIncrement = 0,
		 encPrevPosition = 0,
		 encPosition = 0;

uint8_t sendBuffer[SEND_BUFFER_MAX];
volatile uint8_t sendLength = 0;
volatile uint8_t sentLength = 0;

uint8_t recvBuffer[RECV_BUFFER_MAX];
uint8_t recvLength = 0;

void parseDatagram() {
    uint16_t regAddr = 0;
    uint16_t regCount = 0;
    uint16_t crc = 0;

    // Минимальная длина датаграммы 8 байт
    // Посылка адресована нам, парсим
    if ((recvLength > 4) && (recvBuffer[0] == SLAVE_ID)) {
	// Чтение аналоговых регистров
	if (recvBuffer[1] == 0x04) {
	    // Проверяем контрольную сумму
	    crc = (recvBuffer[7] << 8) | recvBuffer[6];
	    if (crc == CRC16(&recvBuffer[0], recvLength - 2)) {
		regAddr = (recvBuffer[2] << 8) | recvBuffer[3];
		regCount = (recvBuffer[4] << 8) | recvBuffer[5];
		if (regCount > 0) sendRegisterValues(regAddr, regCount);
	    } else sendError(recvBuffer[1], ERROR_INVALID_VALUE);
	} else sendError(recvBuffer[1], ERROR_INVALID_FUNCTION);
    }
}

void sendRegisterValues(uint16_t regAddr, uint16_t regCount) {
    uint8_t bytesCount = (regCount * 2);
    uint16_t r;

    if (regAddr == 0) {
	// Посылаем по 2 байта на регистр
	sendBuffer[0] = SLAVE_ID;
	sendBuffer[1] = 0x04;
	sendBuffer[2] = bytesCount;

	do {
	    switch (regCount) {
	    case 1:
		r = heartbeat; break;
	    case 2:
		// Не выдаем отрицательные значения, т.к. mb2hal понимает только беззнаковые
		r = (encPosition > 0) ? encPosition : -encPosition; break;
	    case 3:
		// и тут тоже самое...
		r = (encIncrement > 0) ? encIncrement : -encIncrement; break;
	    case 4:
		r = encSpeed; break;
	    case 5:
		r = encIndex; break;
	    case 6:
		r = encDirection; break;
	    default:
		r = 0;
	    }
	    sendBuffer[regCount * 2 + 1] = r >> 8;
	    sendBuffer[regCount * 2 + 2] = r & 0xff;
	} while (--regCount);

	// Инвертируем синхросигнал
	heartbeat = !heartbeat;

	// Считаем CRC
	uint16_t crc = CRC16(&sendBuffer[0], bytesCount + 3);
	sendBuffer[bytesCount + 3] = (crc & 0xff);
	sendBuffer[bytesCount + 4] = (crc >> 8);
	sendLength += bytesCount + 5;

	// Разрешаем передачу
	UCSRB |= ((1 << UDRE) | (1 << TXEN));

	return;
    }

    sendError(0x04, ERROR_INVALID_ADDRESS);
}

void sendError(uint8_t funcCode, uint8_t errorCode) {
    sendBuffer[0] = SLAVE_ID;
    sendBuffer[1] = funcCode | 0x80;
    sendBuffer[2] = errorCode;

    // Считаем CRC
    uint16_t crc = CRC16(&sendBuffer[0], 3);
    sendBuffer[3] = (crc & 0xff);
    sendBuffer[4] = (crc >> 8);
    sendLength += 5;

    // Разрешаем передачу
    UCSRB |= ((1 << UDRE) | (1 << TXEN));
}
