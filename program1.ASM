section .text
    global _start

_start:
    ; Write a welcome message
    mov eax, 4
    mov ebx, 1
    mov ecx, welcome
    mov edx, welcome_len
    int 0x80

    ; Waiting for user input
    mov eax, 3
    mov ebx, 0
    mov ecx, command
    mov edx, command_len
    int 0x80

    ; Compare the input with the program name
    mov eax, command
    cmp eax, 'program1'
    je program1

    jmp end

program1:
    ; Here would be the code to run program1
    jmp end

end:
    ; Ending the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    welcome db 'Welcome! This is name by: Tuplik_F, Chat GPT / copilot, designer.', 0xA
    welcome_len equ $-welcome
    command db 80 ; place for user input
    command_len equ $-command
