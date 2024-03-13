section .data
    buffer db 0 ; místo pro uložení vstupu

section .text
    global _start

_start:
    ; Čtení vstupu z klávesnice
    mov eax, 3 ; syscall pro read
    mov ebx, 0 ; file descriptor pro stdin
    mov ecx, buffer ; ukazatel na buffer
    mov edx, 1 ; počet bytů k přečtení
    int 0x80

    ; Výpis vstupu na obrazovku
    mov eax, 4 ; syscall pro write
    mov ebx, 1 ; file descriptor pro stdout
    mov ecx, buffer ; ukazatel na buffer
    mov edx, 1 ; počet bytů k výpisu
    int 0x80

    ; Ukončení programu
    mov eax, 1
    xor ebx, ebx
    int 0x80
