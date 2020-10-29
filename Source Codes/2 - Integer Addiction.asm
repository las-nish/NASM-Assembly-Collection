; The approximate program is as follows
;
; start() {
;     int a = 5;
;     int b = 3;
;     int c = a + b;
;     print(c);
;
;     exit(0);
; }

section .text
    global _start

_start:
    mov rax, 5              ; Move "5" in to rax
    mov rbx, 3              ; Move "3" int to rbx
    add rax, rbx            ; rax = rax + rbx
                            ; rax = 5 + 3
                            ; rax = 8
    call    _printInteger
    syscall
    
    call    _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall

; ===========================
; ======= Print Digit =======
; ===========================

section .data
    digit db 0

; prints integer in rax
_printInteger:
    mov rcx, digit                  ; start at beginning of integer
    mov rbx, 10                     ; move newline into rbx
    mov [rcx], rbx                  ; move newline into rcx
    inc rcx                         ; increment rcx (position)

; loop to store value of integer
_loopStore:
    xor rdx, rdx                    ; zero-out rdx register
    mov rbx, 10                     ; (divide rbx
    div rbx                         ; by 10)

    add rdx, 48                     ; rdx is the remainder of rax / rbx, and add 48 to give its ASCII value

    mov [rcx], dl                   ; load the character of rdx
    inc rcx                         ; increment position

    cmp rax, 0                      ; (continue loop until
    jne _loopStore                  ; rax becomes 0)

; loop to print string backwards
_loopPrint:
    push rcx                        ; push rcx into stack
        
    ; perform sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
        
    pop rcx                        ; get back position
    dec rcx                        ; decrement position
    cmp rcx, digit                 ; (continue loop until 
    jge _loopPrint                 ; end of string)
    ret
