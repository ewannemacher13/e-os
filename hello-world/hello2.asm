; Boot sector that prints using BIOS interrupt. This time programmer friendly

[org 0x7c00] ; set up address offset

mov bp, 0x8000 ; set stack pointer bottom
mov sp, bp ; set stack pointer start

mov bx, msg ; move message into register
call print ; print the message

jmp $ ; loop

; function definitions
print:
	pusha ; store register values on the stack
	mov ah, 0x0e 
	l:
		mov al, [bx]
		cmp al, 0
		je print_end
		int 0x10
		add bx, 1
		jmp l
	print_end:
		popa ; return stored register values
		ret ; return to ip

; variables
msg:
	db 'Hello world', 0

; fill boot sector
times 510-($-$$) db 0 ; pad the sector

dw 0xaa55 ; sector magic number