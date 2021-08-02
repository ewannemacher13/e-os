; prints a hexadecimal value
; input dx -> value to be printed

; include files
%include "../funct/print.asm"

; function definition
print_hex:
	pusha

	mov bx, hex+5 ; set bx to the last character

	lp:
		cmp dx, 0			; if dx is 0, all relevant bits have been added
		je print_hex_end	; in that case, print the string

		mov al, dl
		and al, 0xF  	;  'and' mask for low side of byte
		add al, 0x30 	; convert al to ascii num (will check if the value is a letter later)
		cmp al, 0x39 	; ascii char '9'
		jle num			; don't add if num
		add al, 0x27	; difference between 0x3A and 0x61
	num:
		mov [bx], al	; put val of al into memory address bx points to
		sub bx, 1		; move to next value

		shr dx, 4		; move bits in dx
		jmp lp

	print_hex_end:
		mov bx, hex
		call print
		popa
		ret
		
hex:
	db '0x0000',0