cflags = -Wall -Wextra -g -pedantic -O3
importflags = -lncurses
cc = clang

default: main.o
	$(cc) $(cflags) -o main main.o

main.o: main.c
	$(cc) $(importflags) -c main.c -o main.o
clean:
	@echo "cleaning build environment... "
	@rm main main.o

