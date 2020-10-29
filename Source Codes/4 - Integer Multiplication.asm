; The approximate program is as follows
;
; start() {
;     int a = 5;
;     int b = 3;
;     int c = a * b;
;
;     exit(0);
; }

section .text
    global _start

_start:
    mov rax, 5
    mov rbx, 3
    mul rbx                   ; rax = rax * rbx
                              ; rax = 5 * 3
                              ; rax = 15
    syscall
    
    mov rax, 6                ; rax = 6
    mul rax                   ; rax = rax * rax = 6 * 6
    syscall
    
    call    _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall