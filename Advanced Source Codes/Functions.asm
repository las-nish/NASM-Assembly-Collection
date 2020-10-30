; Functions

section .text
    global _start

; start() {
;     exit(0);
; }
_start:
    push    rbp
    mov     rbp, rsp
    
    ; Function Content
    
    call _exit
    
    nop
    pop     rbp
    syscall      ; Linux requires you to use the exit "syscall". Not "ret"

; function() {
;     ...
; }
function:
    push    rbp
    mov     rbp, rsp
    
    ; Function Parameters
    
    ; Function Content
    
    jmp     .L0

.L0:
    nop
    pop     rbp
    syscall

; parameter(int a) {
;     ....
;     return a;
; }
parameter:
    push    rbp
    mov     rbp, rsp
    
    mov     DWORD[rbp - 4], edi
    
    mov     eax, DWORD[rbp - 4]
    pop     rbp
    syscall

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
