section .data
    msg db "Hello, World!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    ; write syscall (syscall number 1, replaced with syscall instruction for 64-bit)
    mov rax, 1            ; syscall number for sys_write
    mov rdi, 1            ; file descriptor 1 (stdout)
    mov rsi, msg          ; pointer to the message
    mov rdx, len          ; length of the message
    syscall               ; invoke the kernel (use syscall in 64-bit)

    ; exit syscall
    mov rax, 60           ; syscall number for sys_exit in 64-bit (60)
    xor rdi, rdi          ; return 0 status
    syscall               ; invoke the kernel
