global loader
extern sum_of_three

MAGIC_NUMBER equ 0x1BADB002
FLAGS        equ 0x0
CHECKSUM equ -MAGIC_NUMBER

KERNEL_STACK_SIZE equ 4096

section .bss
align 4
kernel_stack:
        resb KERNEL_STACK_SIZE

section .text
align 4
        dd MAGIC_NUMBER
        dd FLAGS
        dd CHECKSUM

loader:
        push dword 3            ; arg3
        push dword 2            ; arg2
        push dword 1            ; arg1
        call sum_of_three       ; call the function, the result will be in eax
        jmp $
