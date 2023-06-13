CC= /opt/trendchip/buildroot-gcc493_glibc222_arm32_32bServer/usr/bin/./arm-buildroot-linux-gnueabi-gcc
CFLAGS= -c -Wall
AR= /opt/trendchip/buildroot-gcc493_glibc222_arm32_32bServer/usr/bin/./arm-buildroot-linux-gnueabi-gcc-ar

all: prog

prog: main.o libhello.a libfactorial.so
	$(CC) main.o -o prog -L. -lhello -lfactorial

main.o: main.c
	$(CC) $(CFLAGS) main.c -o main.o

hello.o: hello.c hello.h
	$(CC) $(CFLAGS) hello.c -o hello.o

libhello.a: hello.o
	$(AR) rcs libhello.a hello.o

factorial.o: factorial.c factorial.h
	$(CC) $(CFLAGS) factorial.c -o factorial.o

libfactorial.so: factorial.o
	$(CC) -shared factorial.o -o libfactorial.so

.PHONY: clean
clean:
	rm -rf *.o
	rm -rf prog