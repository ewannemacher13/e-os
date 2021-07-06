; Boot sector that prints using BIOS interrupt.

mov ah, 0x0e

mov al, 'H'
int 0x10

mov al, 'e'
int 0x10

mov al, 'l'
int 0x10

mov al, 'l'
int 0x10

mov al, 'o'
int 0x10

jmp $ ; loop

times 510-($-$$) db 0 ; pad the sector

dw 0xaa55 ; sector magic number

