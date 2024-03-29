exes:=$(shell find ! -name .git -executable -type f)
$(shell echo $(exes) >> exes.txt)
exes:=$(shell cat exes.txt)
make:
	nasm -f elf random.asm 
	ld -m elf_i386 -s -o hello random.o 
make_safe:
	nasm -f elf random_safe.asm 
	ld -m elf_i386 -s -o hello_safe random_safe.o 
clear:
	rm -f *.o hello
clear_e:
	$(shell for dir in  $(exes); do chmod -x $dir;done)

clear_b:	
	$(shell for dir in  $(exes); do chmod +x $dir;done)
	
