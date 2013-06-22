LDFLAGS=-L"C:\Windows\System32" -lkernel32

all: main

main: main.o puts.o
	ld main.o puts.o -o main.exe $(LDFLAGS)
	
main.o:
	gcc -c main.c -o main.o
	
puts.o:
	nasm -f win32 puts.s -o puts.o
	
clean:
	rm -rf *o main.exe