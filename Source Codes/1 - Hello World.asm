; The approximate program is as follows
;
; start() {
;     print("Hello World !\n");
;     exit(0);
; }

section .data                           ; Section to define Memory
    message db "Hello World !", 10      ; Define string to the name "message" and 10 is new line ascii code ( db = Define Bytes )
    message_length equ $ - message      ; Assign the length of the string to the name "message_length"

section .text                           ; Section to put code
    global _start                       ; A global label to be declared for the linker ( GNU LD )

_start:                                 ; Main global label ( Linker entry point )
    mov rax, 1                          ; SYS_WRITE System call
    mov rdi, 1                          ; STDOUT File descriptor
    mov rsi, message                    ; Address of the string to write
    mov rdx, message_length             ; Length of the string
    syscall                             ; Call kernal
    
    call    _exit                       ; Call "_exit" label

_exit:                                  ; "_exit" label
    mov rax, 60                         ; SYS_EXIT System call
    mov rdi, 0                          ; Error code "0"
    syscall                             ; Call kernal