; Exit Codes
EXIT_SUCCESS equ 0
EXIT_ERROR equ 1

; STD Codes
STD_IN equ 0
STD_OUT equ 1
STD_ERR equ 2

; System Calls
SYS_READ equ 0
SYS_WRITE equ 1
SYS_OPEN equ 2
SYS_CLOSE equ 3
SYS_EXIT equ 60
SYS_UNLINK equ 87
SYS_CREATE equ 85

; File Codes
O_RD_ONLY equ 0
O_WR_ONLY equ 1
O_RD_WR equ 2

; File Command Codes
O_CREAT equ 64
O_EXCL equ 128
O_NOCTTY equ 256
O_TRUNC equ 512
O_APPEND equ 1024
O_NONBLOCK equ 2048
O_NDELAY equ 2048
O_DSYNC equ 4096
O_ASYNC equ 8192
O_DIRECT equ 16384
O_DIRECTORY equ 65536
O_NOFOLLOW equ 131072
O_NOATIME equ 262144
O_CLOEXEC equ 524288
O_SYNC equ 1052672
O_PATH equ 2097152
O_TMPFILE equ 4259840

; Open File
%macro open_f 1
    mov rax, SYS_OPEN
    mov rdi, %1
    mov rsi, O_CREAT + O_WR_ONLY
    mov rdx, 0644o
    syscall
%endmacro

; Close File
%macro close_f 0
    mov rax, SYS_CLOSE
    pop rdi
    syscall
%endmacro

; Create File
%macro create_f 1
    mov rax, SYS_CREATE
    mov rdi, %1
    mov rsi,
    syscall
%endmacro

; Delete File
%macro delete_f %1
    mov rax, SYS_UNLINK
    mov rdi, %1
    syscall
%endmacro

; Write File
%macro write_f 1
%endmacro

; Append Text to File
%macro append_c_f 1
%endmacro

; Print String ( Directly )
%macro print_s 2
    mov rax, SYS_WRITE
    mov rdi, STD_OUT
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

; Exit Program
%macro exit 1
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro

; Get Character from File
get_c:
    ret

; Back One Character in File
remove_c:
    ret

; Write Character on File
print_c:
    ret

; Compare String
compare_s:
    ret

; Copy String to Another String
copy_s:
    ret

; Addiction of String
add_s:
    ret

; Addiction of Character
add_c:
    ret

; Addiction of Integer
add_i:
    ret

; Convert Character to Integer
c_to_i:
    ret

; Convert Integer to Character
i_to_c:
    ret
