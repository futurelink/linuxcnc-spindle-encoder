#include <avr/interrupt.h>

#include "config.h"
#include "modbus.h"

extern uint8_t recvLength;
extern uint8_t recvBuffer[];

extern volatile uint8_t sentLength;
extern volatile uint8_t sendLength;
extern uint8_t sendBuffer[];

volatile uint8_t encBusy;
volatile uint16_t encSpeedMeasure;
extern volatile int16_t encPosition, encDirectionMeasure, encSpeed, encIncrement;
extern volatile int8_t encDirection;
extern volatile uint8_t encIndex, encPhases, encPhasesPrev;

// Таблица приращений
static const int8_t incTable[4][4] = {{0,-1,1,0}, {1,0,0,-1}, {-1,0,0,1}, {0,1,-1,0}};

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
    // Если прием байта закончен - добавляем его в нашу датаграмму
    if (UCSRA & (1 << RXC)) {
	if (recvLength < RECV_BUFFER_MAX) {
	    recvBuffer[recvLength++] = UDR;
	}
        TCNT1 = 0;

	// Включаем таймер тишины
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
	parseDatagram();	// Обработаем посылку
	recvLength = 0;		// Сбрасыаем приемный буфер
	encIncrement = 0;	// Сбрасываем инкремент
	encIndex = 0;		// Сбрасываем метку Z
	PORTB &= ~(1 << RED_LED);	// Погасим светодиод метки Z
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
    if (!encIndex) {
	PORTB &= ~(1 << RED_LED);	// Погасим светодиод метки индекса
	// 0 - вращение в положительную сторону, 1 - в отрицательную
	encDirection =  (encDirectionMeasure > encPosition); 
    } else {
	PORTB |= (1 << RED_LED);	// Зажжем светодиод метки индекса
    }
    encDirectionMeasure = encPosition;

    // Cчитаем обороты в минутуENCODER_Q нужен, чтобы знать насколько сократить
    // числа, чтобы все влазило в 16 бит
    encSpeed = (encSpeedMeasure * 60 / TIMER0_PERIOD_MS * (1000 / ENCODER_Q)) / (ENCODER_PPR / ENCODER_Q / 4);
    encSpeedMeasure = 0;
}

//
// Обработка сигналов энкодера
//
ISR(PCINT_vect) {
    // Считаем позицию по фазовому сдвигу
    uint8_t encPhases = PINB & 0x03; // PCINT0 + PCINT1
    int8_t inc = incTable[encPhases][encPhasesPrev];
    encPosition += inc;  // Позиция энкодера в метках
    encIncrement += inc; // Количество пройденных меток с момента последней передачи данных
    encPhasesPrev = encPhases;

    // Замер позиции для счетчика оборотов по фазе А
    // Считаем только когда фаза А меняется с 0 на 1
    if ((PINB & 0x07) == 0x01)  {
	++encSpeedMeasure;
    }

    // Расчет позиции метки Z
#ifdef ENCODER_HAS_Z
    if (PINB & 0x04) {
	encPosition = 0;	// Метка Z сбрасывает позицию на 0
	encIndex = 1;		// Сохраняем данные что прошли метку Z
    }
#else
    // Метка Z эмулируется при переходе 
    // через полный оборот или при переходе черео 0.
    if ((encPosition >= ENCODER_PPR) ||
	(encPosition <= -ENCODER_PPR) ||
	(encPosition == 0)) {
	encPosition = 0;
	encIndex = 1;
    }
#endif
}
