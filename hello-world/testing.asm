; Boot sector that prints using BIOS interrupt. This time programmer friendly

[org 0x7c00]

mov ah, 0x0e
mov bp, 0x8c00
mov sp, bp

mov bx, msg
call print

mov bx, msg
mov al, [bx]
;int 0x10 ; first byte of msg?

add bx, 1
mov al, [bx]
;int 0x10

add bx, 1
mov al, [bx]
;int 0x10

jmp $ ; loop

;print:
;	pusha
;	mov al, [bx]
;	int 0x10
;	popa
;	ret

print:
	pusha
	mov ah, 0x0e
	l:
		mov al, [bx]
		cmp al, 0
		je print_end
		int 0x10
		add bx, 1
		jmp l
	print_end:
		popa
		ret

printchr:
	pusha
	mov ah, 0x0e
	mov al, '.'
	int 0x10
	popa
	ret

msg:
	db '987654321', 0


times 510-($-$$) db 0 ; pad the sector

dw 0xaa55 ; sector magic number

