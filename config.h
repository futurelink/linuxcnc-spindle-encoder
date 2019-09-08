#define BAUD 38400
#include <util/setbaud.h>

#ifndef __CONFIG_H
#define __CONFIG_H

#define F_CPU 		8000000UL
#define SLAVE_ID	0x85
#define RED_LED		PIN3
#define YELLOW_LED	PIN4

//#define ENCODER_REVERSE	// Изменить направление энкодера
//#define ENCODER_HAS_Z		// Есть метка Z на энкодере, если нет, то она программная
#define ENCODER_PPR	4096	// Импульсов на оборот после интерполяции (PPR * 4)
#define ENCODER_Q	500	// Коэффициент сокращения

#define TIMER1_PRESCALER    ( 1024UL )
#define TIMER1_FREQ         ( F_CPU / TIMER1_PRESCALER )
#define TIMER1_50US_TICKS   ( 20000UL )

#define TIMER0_PRESCALER    ( 1024U )
#define TIMER0_FREQ         ( F_CPU / TIMER0_PRESCALER )
#define TIMER0_PERIOD_MS    ( 32 )

#endif