.PHONY: default compile link run
default: compile link run
compile:
	fasm main.asm
	make -C ../../
link:
	ld main.o ../../printf.o -o main 
run:
	./main 
