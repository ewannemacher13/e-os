; testing ground to implement new features

[org 0x7c00]

mov bp, 0x8000 ; set stack pointer bottom
mov sp, bp ; set stack pointer start

mov dx, 0x6400
call print_hex

jmp $


; include files
%include "../funct/print_hex.asm"

times 510-($-$$) db 0 ; pad the sector
dw 0xaa55 ; sector magic number