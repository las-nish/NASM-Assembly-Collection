> More details will be added in the future if necessary.\
> Follow me on twitter : [@las_nish](https://twitter.com/las_nish)

<hr>

# NASM Assembly Tutorials

> Assembly Type :: **NASM**\
> Architecture :: **x86_64**\
> Platform :: **Linux 64bit**\
> OS :: **[Parrot OS](https://parrotsec.org/)** and **WSL**\
> Date :: **27 October 2020** @ **06:19 P.M.**\
> Note :: **Everything here is very bries**

### Required Tools

**Main Tools**

 - NASM Assembler
 - Gnu Linker
 - Text Editor ( like **Vim** / **VS Code** / **Atom Editor** )

**Optional Tools**

 - IDE for Assembly ( [SASM](https://en.wikipedia.org/wiki/SASM) )
 - Hex Editor ( like **XXD** Hex Editor )
 - Debugger ( like [DDD Debugger](https://www.gnu.org/software/ddd/) )

Install Tools in Linux
```
sudo apt-get update
sudo apt-get install nasm
sudo apt-get install build-essential
sudo apt-get install vim-gtk3

# Hex Editor
sudo apt-get install xxd

# Debugger
sudo apt-get install ddd

# SASM IDE
sudo apt-get install sasm
```

### Compile NASM Files in Linux ( 64bit )

```
nasm -f elf64 [ASM_FILE] -o [OBJ_FILE]
ld [OBJ_FILE] -o [EXE_FILE]
./[EXE_FILE]

[ASM_FILE] :: Assembly File Name
[OBJ_FILE] :: Object File Name
[EXE_FILE] :: Exe File Name

i.e.
nasm -f elf64 file.asm -o file.o
ld file.o -o file
./file
```

[More Information](https://www.nasm.us/doc/nasmdoc2.html#section-2.1)

### Folders
 - **Document** :: Guides for Assembly
 - **Resources** :: Resources for learn NASM Assembly
 - **Source** :: Assembly Source Codes

# First NASM Assembly Program ( **Sample** )

```assembly
section .text
    global _start

_start:
    mov rax, 60 ------- ( 1 )
    mov rdi, 0 -------- ( 2 )
    syscall ----------- ( 3 )
```

**( 1 )** :: This is the linux kernal command number ( **Syscall** ) for **EXISTING** a program..

**( 2 )** :: This is the status number we will retuen to the operation system.

**( 3 )** :: This wakes up the kernal to turn the exit.

This can be expressed in C language as follows.

```c
start() {
    exit(0);
}
```

# Short Note

## Data Storage Sizes

| Storage | Size ( bits ) | Size ( Bytes ) |
| ------- | ------------- | -------------- |
| Byte | 8 bits | 1 bytes |
| Word | 16 bits | 2 bytes |
| Double Word bits | 32 | 4 bytes |
| Quad Word | 64 bits | 8 bytes |
| Double Quad Word | 128 bits | 16 bytes |

**Examples** :: C/C++ declarations are mapped as follows

```
char ---------------> Byte
short --------------> Word
int ----------------> Double Word
unsigned int -------> Double Word
long ---------------> Quad Word
long long ----------> Quad Word
char * -------------> Quad Word
int * --------------> Quad Word
float --------------> Double Word
double -------------> Quad Word
```

## General Purpose Registers ( **GPR**'s )

| 128 bit | 64 bit | 32 bit | 16 bit | 8 bit |
| ------- | ------ | ------ | ------ | ----- |
| xmm0 | rax | eax | ax | al |
| xmm1 | rbx | ebx | bx | bl |
| xmm2 | rcx | ecx | cx | cl |
| xmm3 | rdx | edx | dx | dl |
| xmm4 | rsi | esi | si | sil |
| xmm5 | rdi | edi | di | dil |
| xmm6 | rbp | ebp | bp | bpl |
| xmm7 | rsp | esp | sp | spl |
| xmm8 | r8 | r8d | r8w | r8b |
| xmm9 | r9 | r9d | r9w | r9b |
| xmm10 | r10 | r10d | r10w | r10b |
| xmm11 | r11 | r11d | r11w | r11b |
| xmm12 | r12 | r12d | r12w | r12b |
| xmm13 | r13 | r13d | r13w | r13b |
| xmm14 | r14 | r14d | r14w | r14b |
| xmm15 | r15 | r15d | r15w | r15b |

**Layout Example**

```
                          <-- ax -->
                               <-al->
|----------------|--------|----|----|
|                |        |    |    |
|----------------|--------|----|----|
                  <------ eax ------>
<--------------- rax --------------->
```

**RSP Register ( Stack Pointer Register )**

 - `RSP` is used to point to the current top of the stack.
 - The `rsp` register should not be used for data or other uses.

**RBP Register ( Base Pointer Register )**

 - `RBP` register is used as a base pointer during function calls.
 - The `rbp` register should not be used for data and other uses.

**RIP Register ( Instruction Pointer Register )**

 - This is a special register.
 - `RIP`, which is used by the CPU to point to the *next instruction to be executed*.
 - Specially, since the `rip` points to the next instruction, that means the instruction being pointed to by `rip`, and shown in the debugger, has not yet been executed.
 - This is an important distinction which can be confusing when reviewing code in a debugger.

## Memory Layout ( **Stack Layout** )

The general memory layout for a program is as shown.

```
|--------------------------| .... High Memory   
| Stack                    |
|                          |
|                          |
|                          |
|                          |
| Heap                     |
|--------------------------|
| BSS - Uninitialized Data |
|--------------------------|
| Data                     |
|--------------------------|
| Text ( Code )            |
|--------------------------|
| Reserved                 |
|--------------------------| .... Low Memory
```

## Ranges associated with typical sizes

| Size | Size ( Short ) | Unsigned Range | Signed Range |
| ---- | -------------- | -------------- | ------------ |
| Bytes | 2^8 | 0 to 255 | -128 to +127 |
| Words | 2^16 | 0 to 65,535 | −32,768 to +32,767 |
| Double Words | 2^32 | 0 to 4,294,967,295 | −2,147,483,648 to +2,147,483,647 |
| Quad Word | 2^64 | 0 to 2^64 - 1 | -(2^63 ) to 2^63 - 1 |
| Double Quad Word | 2^128 | 0 to 2^128 - 1 | -(2^127 ) to 2^127 - 1 |

## Assembly Program Format

A properly formatted source file consits of several main parts
 - Data Section `section .data`
 - BSS Section `section .bss`
 - Text Section `section .text`

### Defining Constants

```assembly
<nama> equ <value>

i.e.
length equ 1000
```

### Data Section

```assembly
<variable_name> <data_type> <initial_value>

i.e.
var1 db 10              ; Byte Variable
var2 db "A"             ; String Character
var3 dw 1000            ; 16bit Variable
var4 dd 10, 20, 30      ; 3 Element Array
```

**Supported Data Types**

| Declaration | Variable(s) |
| ----------- | ----------- |
| `db` | 8bit |
| `dw` | 16bit |
| `dd` | 32bit |
| `dq` | 64bit |
| `ddq` | 128bit ( Integer ) |
| `dt` | 128bit ( Float ) |

### BSS Section

```assembly
<variable_name> <res_type> <count>

i.e.
array_b resb 10     ; 10 Element byte array
array_w resw 50     ; 50 Element word array
array_d resd 100    ; 100 element double array
array_q resq 200    ; 200 element quad array
```

**Supported Data Types**

| Declaration | Variable(s) |
| ----------- | ----------- |
| `resb` | 8bit |
| `resw` | 16bit |
| `resd` | 32bit |
| `resq` | 64bit |
| `resdq` | 128bit |

### Text Section

```assembly
global _start

_start:
    ....
```

## Instruction Set Overview

### Data Movement

```assembly
mov <destination> , <source>

mov rax, dword [VARIABLE]

mov        = What to do
rax        = Where to place
dword      = How much to get
[VARIABLE] = Memory Location

i.e.
mov rax, 100       ; rax = 0x00000064
mov rcx, -1        ; rcx = 0xffffffffffffffff
```

### Addresses and Values

The only way to access memory is with the ( `[]` ) brackets. Omitting the brackets will not access memory and instead obtain the address of the item.

```assembly
mov rax, qword[VAR_B]       ; Value of the VAR_B in rax
mov rax, VAR_B              ; Address of the VAR_B in rax
```

In addition, the address of a variable can be obtained with the load effective address, or
**lea**, instruction.

```assembly
lea <reg_64>, <memory>

i.e.
lea rcx, byte[VAR_B]
lea rsi, dword[VAR_D]
```

### Conversion Instructions

#### Narrowing Conversions

 - Narrowing conversions are converting from a larger type to a smaller type.
 - No special instructions are needed for narrowing conversions.
 - The lower portion of the memory location or register may be accessed directly.

```
i.e.

Word -> Byte
Double Word -> Word
```

#### Unsigned Conversion

 - For unsigned widening conversion, the upper part of memory location or register must be set to **zero**.
 - Since an unisgned value can only be **positive**, the upper-order bits can only be **zero**.

```assembly
movzx   <destination> , <source>

i.e.
Convert the byte value of 50 in the al register, to a quad word value in rbx, the following operations can be performed.

mov al, 50
mov rbx, 0
mov bl, al
```

### Signed Conversion

 - For signed widening conversions, the upper-order bits must be set to either 0's or 1's depending on if the original value was positive or negative.
 - A more generalized signed conversion from a smaller size to a larger size can also be performed with some special move intructions.
 - Which will perform the sign extension operation on the source argument. The **movsx** instruction is the general form and the **movsxd** instruction is used to allow a quadword destination operand with a double-word source operand.

```assembly
movsx   <destination> , <source>
movsxd  <destination> , <source>
```

**Instructions that perform the signed widening conversion**

| Instruction | Explanation | Note ( **Only works for** ) |
| ----------- | ----------- | ---- |
| `cbw` | Convert byte in **al** into word in **ax**. | **al** to **ax** register |
| `cwd` | Convert word in **ax** into double word in **dx:ax** | **ax** to **dx:ax** registers |
| `cwde` | Convert word in **ax** into double word in **eax** | **ax** to **eax** register |
| `cdq` | Convert double word in**eax** into quadword in **edx:eax** | **eax** to **edx:eax** registers |
| `cdqe` | Convert double word in **eax** into quadword in **rax** | **rax** registee |
| `cqo` | Convert quad word in **rax** into word in double quad word in **rdx:rax** | **rax** to **rdx:rax** registers |

### Integer Arithmetic Instructions

**Integer Addiction**

```assembly
add <destination> , <source>
```

**Integer Subtraction**

```assembly
sub <destination> , <source>
```

**Integer Increment**

```assembly
inc <operand>
```

**Integer Decrement**

```assembly
dec <operand>
```

**Integer Addiction With Carry**

```assembly
adc <dec> , <source>
```

**Integer Multiplication**

```assembly
mul <source>
```

**Signed Multiplication**

```assembly
imul    <source>
imul    <destination> , <source / immediate>
imul    <destination> , <source> , <immediate>
```

**Integer Division**

 - Different instructions are used for unsigned ( **div** ) division and signed ( **idiv** ) division.

```assembly
div <source>

idiv <source>
```

### Logical Instructions

**AND Operator**

```assembly
and <destination> , <source>
```

**OR Operator**

```assembly
or  <destination> , <source>
```

**XOR Operator**

```assembly
xor <destination> , <source>
```

**NOT Operator**

```assembly
not <operand>
```

**Logical Shift Left**

```assembly
shl <destination> , <immediate>
shl <destination> , cl
```

**Logical Shift Right**

```assembly
shr <destination> , <immediate>
shr <destination> , cl
```

**Arithmetic Left Shift**

```assembly
ssl <destination> , <immediate>
ssl <destination> , cl
```

**Arithmetic Right Shift**

```assembly
sar <destination> , <immediate>
sar <destination> , cl
```

**Rotate Left Operation**

```assembly
rol <destination> , <immediate>
rol <destination> , cl
```

**Rotate Right Operation**

```assembly
ror <destination> , <immediate>
ror <destination> , cl
```

### Unconditional Control Instructions

```assembly
jmp <label>       ; Jump to specified label
```

### Conditional Control Instructions

**Compare Instruction**

```assembly
cmp <operation_1> , <operation_2>
```

**Jump Conditional Instructions**

```assembly
jn  <label>         ; if <operation_1> == <operation_2>
jne <label>         ; if <operation_1> != <operation_2>

jl  <label>         ; signed if <operation_1> < <operation_2>
jle <label>         ; signed if <operation_1> <= <operation_2>
jg  <label>         ; signed if <operation_1> > <operation_2>
jge <label>         ; signed if <operation_1> >= <operation_2>

jb  <label>         ; unsigned if <operation_1> < <operation_2>
jbe <label>         ; unsigned if <operation_1> <= <operation_2>
ja  <label>         ; unsigned if <operation_1> > <operation_2>
jae <label>         ; unsigned if <operation_1> >= <operation_2>
```

## Addressing Modes

Basic addressing modes
 - Register
 - Immediate
 - Memory

### Address and Values

```assembly
mov rax, qword[VAR_1]       ; Value of VAR_1 in rax
mov rax, VAR_1              ; Address of VAR_1 in rax
```

**General format of memory addressing is as follows**

```assembly
[ base_address + ( index_register * scale_value ) + displacement ]
```

Where **base_address** is a register or a variable name. The **index_register** must be a register. The **scale_value** is an immediate value of 1, 2, 4, 8. The **displacement** must be an immediate value. The total represents a 64-bit address.

## Process Stack

 - A **stack** is a type of data structure where items are added and then removed from the stack in reverse folder. That is, the most recently added item is the very first one that is removed.
 - Adding an item to a stack is referred to as a **push** or push operation. Removing an item from a stack is referred to as a **pop** or pop operation.

```assembly
push    <operation_64>
pop     <operation_64>
```

**Example**

```assembly
a = { 7, 19, 37 };

push    a[0]
push    a[1]
push    a[2]

pop a[0]
pop a[1]
pop a[2]
```

## Macros

**Single Line Macros**

```assembly
%define ... ...
```

**Multi Line Macros**

```assembly
%macro <name> <number_of_arguments>
    ...
%endmacro
```

## Functions

### Function Declaration

```assembly
global <function_name>

<function_name> :
    ...
    ret
```

**Linkage**

```assembly
call    <function_name>       ; Push the 64bit rip register and jump to the <function_name>
ret                           ; Return from a function
```

## Floating Point Instructions

**Data movement in floating points**

```assembly
movss   <destination> , <source>    ; 32bit
movdd   <destination> , <source>    ; 64bit

i.e.
section .data
    fs_var_1 dd 3.14
    fs_var_2 dd 0.0

movsd   xmm1, QWORD[fs_var_1]
movsd   QWORD[fs_var_2], xmm1
```

**Floating Point Data Conversion**

 - Convert 32-bit floating-point source operand to the 64-bit floating-point destination operand.

```assembly
cvtss2sd    <RX-destination> , <source>
```

 - Convert 64-bit floating-point source operand to the 32-bit floating-point destination operand.

```assembly
cvtss2ss    <RX-destination> , <source>
```

 - Convert 32-bit floating-point source operand to the 32-bit integer destination operand.

```assembly
cvtss2si    <register> , <source>
```

 - Convert 64-bit floating-point source operand to the 32-bit integer destination operand.

```assembly
cvtsd2si    <register> , <source>
```

 - Convert 32-bit integer source operand to the 32bit floating-point destination operand.

```assembly
cvtsi2ss    <RX-destination> , <source>
```

 - Convert 32-bit integer source operand to the 64bit floating-point destination operand.

```assembly
cvtsi2sd    <RX-destination> , <source>
```

**Floating Point Arithmetic Instructions**

```assembly
addss  <RX_destination> , <source>

addsd  <RX_destination> , <source>

subss  <RX_destination> , <source>

subsd  <RX_destination> , <source>

mulss  <RX_destination> , <source>

mulsd  <RX_destination> , <source>

divss  <RX_destination> , <source>

divsd  <RX_destination> , <source>

sqrtss  <RX_destination> , <source>

sqrtsd  <RX_destination> , <source>
```

**Floating Point Control Instructions**

```assembly
ucomiss <RX_source> , <source>

ucomisd <RX_source> , <source>
```

**Extra Links**

 - [Configure VIM Editor](https://github.com/las-nish/vim-config-and-theme) ( **Ad** )
 - [Compare C and NASM Assembly](https://nasm.godbolt.org/)
 - [Online x86_64 NASM Assembler](https://www.mycompiler.io/new/asm-x86_64)
 - [http://en.wikipedia.org/wiki/X86-64](http://en.wikipedia.org/wiki/X86-64)
 - [http://en.wikipedia.org/wiki/Complex_instruction_set_computing](http://en.wikipedia.org/wiki/Complex_instruction_set_computing)
 - [http://en.wikipedia.org/wiki/Reduced_instruction_set_computing](http://en.wikipedia.org/wiki/Reduced_instruction_set_computing)
 - [NASM Document](https://www.nasm.us/doc/)
 - [ASCII Table](http://www.asciitable.com/)

**Resources**
 - [Assembly Tutorials](https://asmtutor.com/)
 - [PDF - Tutorials Point](https://www.tutorialspoint.com/assembly_programming/assembly_tutorial.pdf)
 - [PDF - Assembly with Ubuntu](http://www.egr.unlv.edu/~ed/assembly64.pdf)
 - [Assembly Basics](https://fliphtml5.com/lnym/tzcv/basic/351-368)
 - [Wikibooks](https://en.wikibooks.org/wiki/X86_Disassembly)

**Extra Tips**
 - Generate clean MASM-INTEL Assembly from C File
 ```
 gcc -m64 -S -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm -masm=intel [C_FILE.C]
 ```

**Thank You ^-^**
