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

#include <avr/interrupt.h>

#include "config.h"
#include "modbus.h"

extern int16_t encoderPPR;
extern int16_t registers[];

extern uint8_t recvLength;
extern uint8_t recvBuffer[];

extern uint8_t sentLength, sendLength;
extern uint8_t sendBuffer[];

// Локальные для данного файла
int16_t encDirectionMeasure;
uint8_t  encPhases, encPhasesPrev;
uint16_t encSpeedMeasure;

// Таблица приращений
static const int8_t incTable[16] = {0,-1,1,0,1,0,0,-1,-1,0,0,1,0,1,-1,0};

/* ---------------------------------------------------------------------*/

//
// Тут происходит отправка данных посылки
//
ISR(USART_UDRE_vect) {
    if (sentLength == sendLength) {
	UCSRB &= ~((1 << UDRE) | (1 << TXEN));	// Запрещаем передачу
	PORTB &= ~(1 << YELLOW_LED);		// Погасим светодиод, передали сообщение
	sendLength = sentLength = 0;
    } else {
	PORTB |= (1 << YELLOW_LED);		// Зажжем светодиод, передаем сообщение
	UDR = sendBuffer[sentLength++];
    }
}

//
// Тут происходит заполнение данными нашей посылки
//
ISR(USART_RX_vect) {
    if (UCSRA & (1 << RXC)) {
	if (recvLength < RECV_BUFFER_MAX) {
	    recvBuffer[recvLength++] = UDR;
	}

	// Включаем таймер тишины
	TCNT1 = 0;
	TCCR1B = (1 << CS12) | (1 << CS10);
    }
}

// В прерывании таймера если он таки сработал, значит прием данных завершен.
// Нужно очистить обрбаотать принятые данные, очистить буфер и сбросить таймер.
ISR(TIMER1_COMPA_vect) {
    // Выключаем таймер тишины, он сработал
    TCCR1B &= ~((1 << CS12) | (1 << CS10));

    // Если что-то принято, надо обработать
    if (recvLength > 0) {
	if (registers[REGISTER_INDEX]) PORTB |= (1 << RED_LED);	// Зажжем светодиод метки индекса
	if (parseDatagram()) {		// Обработаем посылку
	    recvLength = 0;		// Сбрасыаем приемный буфер
	    registers[REGISTER_POSITION_INC] = 0;		// Сбрасываем инкремент
	    registers[REGISTER_INDEX] = 0;			// Сбрасываем метку индекса
	    PORTB &= ~(1 << RED_LED);	// Погасим светодиод метки индекса
	}
    }
}

//
// Таймер счетчика скорости оборотов
//
ISR(TIMER0_COMPA_vect) {
    // Определяем направление вращения. Определение направления
    // возможно толькое если у нас не сбросилась позиция, то есть
    // мы не прошил полный оборот. То есть пока выставлена метка
    // мы просто пропускаем этот замер.
    if (!registers[REGISTER_INDEX]) {
	// 0 - вращение в положительную сторону, 1 - в отрицательную
	registers[REGISTER_DIRECTION] = (encDirectionMeasure > registers[REGISTER_POSITION]); 
    }
    encDirectionMeasure = registers[REGISTER_POSITION];

    // Cчитаем обороты в минутуENCODER_Q нужен, чтобы знать насколько сократить
    // числа, чтобы все влазило в 16 бит
    registers[REGISTER_SPEED] = (encSpeedMeasure * 60 / TIMER0_PERIOD_MS * (1000 / ENCODER_Q)) /  (ENCODER_PPR / ENCODER_Q / 4);
    encSpeedMeasure = 0;
}

//
// Обработка сигналов энкодера
//
ISR(PCINT_vect) {
    // Считаем позицию по фазовому сдвигу
    uint8_t encPhases = PINB & 0x03; // PCINT0 + PCINT1
    int8_t inc = incTable[encPhasesPrev * 4 + encPhases];
    registers[REGISTER_POSITION] += inc;  // Позиция энкодера в метках
    registers[REGISTER_POSITION_INC] += inc; // Количество пройденных меток с момента последней передачи данных
    encPhasesPrev = encPhases;

    // Замер позиции для счетчика скорости по фазе А
    // Считаем только когда фаза А меняется с 0 на 1
    if ((PINB & 0x07) == 0x01)  {
	++encSpeedMeasure;
    }

#ifdef ENCODER_HAS_Z
    if (PINB & 0x04) {
	registers[REGISTER_POSITION] = 0;	// Метка Z сбрасывает позицию на 0
	registers[REGISTER_INDEX] = 1;		// Сохраняем данные что прошли метку Z
    }
#else
    // Метка Z эмулируется при переходе
    // через полный оборот или при переходе черео 0.
    int16_t pos = registers[REGISTER_POSITION];
    if ((pos >= ENCODER_PPR) || (pos <= -ENCODER_PPR) || (pos == 0)) {
	registers[REGISTER_POSITION] = 0;
	registers[REGISTER_INDEX] = 1;
    }
#endif
}
