CC=gcc
AS=nasm
LD=ld
LDFLAGS=-L"C:\Windows\System32" -lkernel32
CCFLAGS=-O0 -fno-builtin -ffreestanding

all: main

main: main.o memcpy.o puts.o
	$(LD) main.o stdio/memcpy.o stdio/puts.o -o main.exe $(LDFLAGS)
	
main.o:
	$(CC) -c main.c -o main.o $(CCFLAGS)
	
memcpy.o:
	$(AS) -f win32 stdio/memcpy.s -o stdio/memcpy.o
	
puts.o:
	$(AS) -f win32 stdio/puts.s -o stdio/puts.o
	
clean:
	rm -rf *.o stdio/*.o main.exe