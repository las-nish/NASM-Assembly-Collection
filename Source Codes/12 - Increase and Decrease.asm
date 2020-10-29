section .text
    global _start

_start:
    mov rax, 10      ; rax = 10
    inc rax          ; rax = 10 + 1 = 11
    syscall
    
    mov rbx, 10      ; rbx = 10
    dec rax          ; rbx = 10 - 1 = 9
    syscall
    
    call    _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall