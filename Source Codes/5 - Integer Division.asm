; The approximate program is as follows
;
; start() {
;     int a = 5;
;     int b = 2;
;     int c = a / b;
;
;     exit(0);
; }

section .text
    global _start

_start:
    mov rax, 5
    mov rbx, 2
    div rbx                   ; rax = rax / rbx
                              ; rax = 5 / 2
                              ; rax = 2
    syscall
    
    call    _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall