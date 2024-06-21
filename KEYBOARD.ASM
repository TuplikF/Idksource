section .data
    buffer db 0 ; place to save the input

section .text
    global _start

_start:
    ; Reading input from the keyboard
    mov eax, 3 ; syscall for read
    mov ebx, 0 ; file descriptor for stdin
    mov ecx, buffer ; a pointer to a buffer
    mov edx, 1 ; number of bytes to read
    int 0x80

    ; Listing the input to the screen
    mov eax, 4 ; syscall for write
    mov ebx, 1 ; file descriptor for stdout
    mov ecx, buffer ; a pointer to a buffer
    mov edx, 1 ; number of apartments to list
    int 0x80

    ; Ending the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
