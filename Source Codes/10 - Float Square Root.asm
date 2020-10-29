; The approximate program is as follows
;
; start() {
;     float a = 3.14^(1/2);
;
;     exit(0);
; }

section .data
    fs_var_1 dd 3.14

section .text
    global _start

_start:
    sqrtsd   xmm1, QWORD[fs_var_1]
    syscall
    
    call    _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall