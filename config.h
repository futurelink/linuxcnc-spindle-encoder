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

#define BAUD 38400
#include <util/setbaud.h>

#ifndef __CONFIG_H
#define __CONFIG_H

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
#define TIMER0_PERIOD_MS    ( 16 )

#endif