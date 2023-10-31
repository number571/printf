.PHONY: default compile link run
default: compile link run
compile:
	make -C ../../
	fasm c_printf.asm
	fasm c_exit.asm
link:
	gcc -nostdlib -o main ../../printf.o c_printf.o c_exit.o main.c 
run:
	./main 
