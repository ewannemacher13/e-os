; prints null-terminated string
; input bx -> location of first char
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