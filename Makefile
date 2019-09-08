## General Flags
PROJECT = encoder-modbus
#MCU = atmega328
MCU = attiny2313
TARGET = encoder-modbus

CC=avr-gcc
OBJCOPY=avr-objcopy
AVRDUDE=avrdude

## Options common to compile, link and assembly rules
COMMON = -mmcu=$(MCU)

## Compile options common for all C compilation units.
CFLAGS = $(COMMON) -std=gnu99
CFLAGS += -Wall -gstabs -DF_CPU=8000000UL  -Os -Wall -Wstrict-prototypes -fno-exceptions -ffunction-sections -fdata-sections
#CFLAGS += -Wp,-M,-MP,-MT,$(*F).o,-MF,dep/$(@F).d 

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

##Link
$(TARGET).elf: $(OBJECTS)
	 $(CC) $(LDFLAGS) $(OBJECTS) $(LIBDIRS) $(LIBS) -o $(TARGET).elf

%.hex: $(TARGET).elf
	$(OBJCOPY) -O ihex $(HEX_FLASH_FLAGS)  $< $@

.o: $(SOURCES)
	$(CC) $(INCLUDES) $(CFLAGS) -c  $<

clean:
	rm -f *.o