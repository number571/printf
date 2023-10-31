.PHONY: default compile link run
default: compile link run
compile:
	fasm main.asm
	make -C printf
link:
	ld main.o printf/printf.o -o main 
run:
	./main 
