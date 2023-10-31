.PHONY: default compile link run
default: compile link run
compile:
	make -C ../../
	fasm c_printf.asm
link:
	gcc -no-pie -o main ../../printf.o c_printf.o main.c 
run:
	./main 
