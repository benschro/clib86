LDFLAGS=-L"C:\Windows\System32" -lkernel32

all: main

main: main.o memcpy.o puts.o
	ld main.o stdio/memcpy.o stdio/puts.o -o main.exe $(LDFLAGS)
	
main.o:
	gcc -c main.c -o main.o -O0 -fno-builtin -ffreestanding
	
memcpy.o:
	nasm -f win32 stdio/memcpy.s -o stdio/memcpy.o
	
puts.o:
	nasm -f win32 stdio/puts.s -o stdio/puts.o
	
clean:
	rm -rf *.o stdio/*.o main.exe