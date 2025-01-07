CC := gcc
CFLAGS := -Wall -Wextra -Werror -m32
LD := ld
LDFLAGS :=
LDLIBS :=
SRC := main.c
OBJ := $(SRC:.c=.o)

all: main

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

main: $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -f $(OBJ) main
