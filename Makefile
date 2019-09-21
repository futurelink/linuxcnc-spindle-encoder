## General Flags
PROJECT = encoder-modbus
MCU = attiny2313
TARGET = encoder-modbus

# Fuses for external oscillator 16Mhz
F_CPU = 16000000UL
LFUSE = 0xDE
HFUSE = 0xCF

# Toolchain
CC=avr-gcc
OBJCOPY=avr-objcopy
AVRDUDE=avrdude -P /dev/ttyUSB0
MODPOLL=mbpoll -p none /dev/ttyUSB1

COMMON = -mmcu=$(MCU)

## Compile options common for all C compilation units.
CFLAGS = $(COMMON) -std=gnu99
CFLAGS += -Wall -gstabs -DF_CPU=$(F_CPU)  -Os -Wall -Wstrict-prototypes -fno-exceptions -ffunction-sections -fdata-sections

## Assembly specific flags
ASMFLAGS = $(COMMON)
ASMFLAGS += -x assembler-with-cpp -Wa,-gstabs

## Linker flags
LDFLAGS = $(COMMON)
LDFLAGS += -w -Os -g -flto -Wl,-Map=$(TARGET).map,--cref -Wl,--gc-sections

## Intel Hex file production flags
HEX_FLASH_FLAGS = -R .eeprom

SOURCES = main.c interrupts.c crc.c modbus.c
OBJECTS = $(SOURCES:.c=.o)

## Build
all: $(TARGET).elf $(TARGET).hex

flash: $(TARGET).hex
	$(AVRDUDE) -p $(MCU) -c stk500 -v -b 115200 -e -U flash:w:$(TARGET).hex:i -U lfuse:w:$(LFUSE):m -U hfuse:w:$(HFUSE):m

poll:
	$(MODPOLL) -m rtu -a 0x85 -c 6 -t 3 -l 100 -b 38400

##Link
$(TARGET).elf: $(OBJECTS)
	 $(CC) $(LDFLAGS) $(OBJECTS) $(LIBDIRS) $(LIBS) -o $(TARGET).elf

%.hex: $(TARGET).elf
	$(OBJCOPY) -O ihex $(HEX_FLASH_FLAGS)  $< $@

.o: $(SOURCES)
	$(CC) $(INCLUDES) $(CFLAGS) -c  $<

clean:
	rm -f *.o