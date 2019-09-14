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

#include <avr/io.h>
#include <avr/interrupt.h>

#include "config.h"

#define PARITY_NONE	0
#define PARITY_ODD	1
#define PARITY_EVEN	2

static void initPorts(void);
static void initUSART(uint8_t parity);
static void initTimer1(uint8_t timeout50usTicks);
static void initTimer0(void);

extern uint8_t slaveAddr;
extern volatile uint8_t sentLength;
extern volatile uint8_t sendLength;
extern uint8_t sendBuffer[];

int main(void) {
    initUSART(PARITY_NONE);
    initTimer1(35);
    initTimer0();
    initPorts();

    sei();

    while (1) asm volatile("nop" ::);

    return 0;
}

void initPorts() {
    GIMSK |= (1 << PCIE);					// Разрешаем прерывания PCINT
    PCMSK |= (1 << PCINT2) | (1 << PCINT1) | (1 << PCINT0);	// Срабатывает на PCINT0, PCINT1 и PCINT2
    DDRB = (1 << RED_LED) | (1 << YELLOW_LED);			// Выходы на индикацию

    // Считаем смещение адреса слейва
    slaveAddr = (PIND & (1 << PD6) & (1 << PD5) & (1 << PD4) & (1 << PD3)) >> PD3;
}

void initUSART(uint8_t parity) {
    UBRRH = UBRRH_VALUE;
    UBRRL = UBRRL_VALUE;
    UCSRB |= ((1 << TXEN) | (1 << RXEN) | (1 << RXCIE));	// Включаем прием, передачу и прерывание по приему
    UCSRC |= ((1 << UCSZ0) | (1 << UCSZ1));			// 8 бит данных (может будет убрать, т.к. по-умолчанию)

    // Настройка четности
    switch (parity) {
        case PARITY_EVEN: UCSRC |= (1 << UPM1); break;
        case PARITY_ODD: UCSRC |= (1 << UPM1) | (1 << UPM0); break;
        case PARITY_NONE: break;
    }
}

// Инициализация таймера тишины, таймер должен срабатывать после определенного
// интервала, но после приема каждого байта зануляться. По нему определяется
// конец посылки от мастера. Сразу не запускаем, он запускается по приему байта.
// -----------------------------------------------------------------------------
// Таймаут задается параметром в 50-миллисекундных интервалах.
void initTimer1(uint8_t timeout50usTicks) {
    OCR1A = (TIMER1_FREQ * timeout50usTicks) / (TIMER1_50US_TICKS);
    TCCR1A = 0;
    TCCR1B = (1 << CS12) | (1 << CS10); // Делитель 1024
    TCCR1C = 0;
    TCNT1 = 0;				// Сбрасываем счетчик
    TIMSK |= (1 << OCIE1A);		// Разрешаем прерывание TIMER1_COMPA_vect
}

// Инициализация таймера счета скорости, таймер на 20мс (0.02с). Считает кол-во меток,
// проходящих за период, чтобы определить скорость вращения энкодера.
void initTimer0() {
    // Таймер восьмибитный, поэтому OCR0A не более 255 должен быть
    OCR0A =  (TIMER0_FREQ * TIMER0_PERIOD_MS) / 1000; // При 16мс это работает нормально.
    TCCR0A = 0;
    TCCR0B = (1 << CS02) | (1 << CS00); // Делитель 1024 при 8МГц T = 128мкс, при 16МГц T = 64мкс
    TCNT0 = 0;				// Сбрасываем счетчик
    TIMSK |= (1 << OCIE0A);		// Разрешаем прерывание TIMER1_COMPA_vect
}
