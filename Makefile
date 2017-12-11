OBJECTS = loader.o kmain.o
CC = gcc
CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector \
	 -nostartfiles -nodefaultlibs -Wall -Wextra -Werror -c -ggdb
LDFLAGS = -T link.ld -melf_i386
AS = nasm
ASFLAGS = -f elf -Fdwarf -g

all: os.iso

os.iso: kernel.elf
	mkdir -p img/boot/grub
	cp kernel.elf img/boot/
	cp grub.cfg img/boot/grub/
	grub-mkrescue -o os.iso img

kernel.elf: $(OBJECTS)
	mkdir -p img/boot
	ld $(LDFLAGS) $(OBJECTS) -o kernel.elf

%.o: %.c
	$(CC) $(CFLAGS)  $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf *.o img os.iso
