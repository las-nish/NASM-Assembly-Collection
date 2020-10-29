; The approximate program is as follows
;
; int start() {
;     int a = 'A';
;     int b = 'B';
;
;     int c = a + b;
; }

section .data
    ASCII_A db 65    ; ASCII Code of 'A'
    ASCII_B db 66    ; ASCII Code of 'B'

section .text
    global _start

_start:
    mov rax, QWORD[ASCII_A]
    mov rbx, QWORD[ASCII_B]
    add rax, rbx
    syscall
    
    call    _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall