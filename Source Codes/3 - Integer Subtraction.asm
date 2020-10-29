; The approximate program is as follows
;
; start() {
;     int a = 8;
;     int b = 2;
;     int c = a - b;
;
;     exit(0);
; }

section .text
    global _start

_start:
    mov rax, 8
    mov rbx, 2
    sub rax, rbx              ; rax = rax - rbx
                              ; rax = 8 - 2
                              ; rax = 6
    syscall
    
    call    _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall