section .text
    global _start

_start:
    ; Vypište uvítací zprávu
    mov eax, 4
    mov ebx, 1
    mov ecx, welcome
    mov edx, welcome_len
    int 0x80

    ; Čekání na vstup uživatele
    mov eax, 3
    mov ebx, 0
    mov ecx, command
    mov edx, command_len
    int 0x80

    ; Porovnejte vstup s názvem programu
    mov eax, command
    cmp eax, 'program1'
    je program1

    jmp end

program1:
    ; Zde by byl kód pro spuštění programu1
    jmp end

end:
    ; Ukončení programu
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    welcome db 'Welcome! This is name by: Tuplik_F, Chat GPT / copilot, designer.', 0xA
    welcome_len equ $-welcome
    command db 80 ; místo pro vstup uživatele
    command_len equ $-command
