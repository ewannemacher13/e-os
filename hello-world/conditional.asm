; learning conditional operators

mov bx, 2

; if bx < 4
cmp bx, 4
jle less_equal

cmp bx, 40
jl less

jmp else

less_equal:
	mov al, 'A' 
	jmp end

less: 
	mov al, 'B'
	jmp end

else:
	mov al, 'C'
	jmp end

end:
	mov ah, 0x0e
	int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55

