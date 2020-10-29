# SASM IDE

SASM (SimpleASM) - simple Open Source crossplatform IDE for NASM, MASM, GAS, FASM assembly languages. SASM has syntax highlighting and debugger. The program works out of the box and is great for beginners to learn assembly language. SASM is translated into Russian, English, Turkish (thanks Ali Goren), Chinese (thanks Ahmed Zetao Yang), German (thanks Sebastian Fischer), Italian (thanks Carlo Dapor), Polish (thanks Krzysztof Rossa), Hebrew (thanks Elian Kamal), Spanish (thanks Mariano Cordoba). Licensed under the GNU GPL v3.0. Based on the Qt. ( **Copied** )

**More Info** = [Official Website](https://dman95.github.io/SASM/english.html)

**Install SASM on Linux / Ubuntu**

```
sudo apt-get install sasm
```
 
## Configure SASM

 - Default settings may sometimes work correctly.
 - But on my computer they did not work properly.
 - SO I changed the settings as follows.

**Show all Registers in Debug** = True

**Mode** = x64

**Assembler** = NASM

**Assembly Options** = `-f elf64 $SOURCE$ -o $PROGRAM.OBJ$`

**Linking Options** = `$PROGRAM.OBJ$ -o $PROGRAM$`

**Assembler Path** = `nasm`

**Linker Path** = `ld`

**Object File Name** = `program.o`

**Build in Current Directory** = True

**Disable Linking** = False
