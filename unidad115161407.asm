
segment .bss
	res resb 1 ;Variable para guardar el resultado
	res2 resb 1 ;Variable para almacenar el valor del segundo limite
section .data

	msg db "El resultado de la integral es: ",10,13
	longitud equ $-msg
	x1 db 2;primer imite
	x2 db 0;segundo limite
section .text

GLOBAL _start
_start:

	mov ebx, [x1];Guardando el primer limite
	mov eax, 1;Guardando el coeficiente de x
	mul ebx
	mul ebx		;Elevando al cubo el primer termino
	mul ebx

	;Guardandolo temporalmente en res
	mov [res], eax

	;Obteninedo el valor del segunfo termino
	mov eax, [x1]
	mov ebx, [x1]
	mul ebx
	mov ecx, 3
	mul ecx
	mov ecx, 2
	div ecx
	mov ecx, eax	;Guardando el  segundo termino en ecx
	
	mov eax, [x1]
	mov ebx, 4
	mul ebx	;Obteniendo el valor del tercer termino
	
	mov ebx, [res]	;Recuperando valor temporal de res
	add eax, ecx	;Primer suma
	sub eax, ebx	;Restando el priemer termino
	;add eax, 48
	mov [res], eax 	;Guardando resultado de primer limite


	;Hacer lo mismo para el segundo limite

	mov ebx, [x2];Guardando el segundo limite
	mov eax, 1;Guardando el coeficiente de x
	mul ebx
	mul ebx		;Elevando al cubo el primer termino
	mul ebx

	;Guardandolo temporalmente en res
	mov [res2], eax

	;Obteninedo el valor del segunfo termino
	mov eax, [x2]
	mov ebx, [x2]
	mul ebx
	mov ecx, 3
	mul ecx
	mov ecx, 2
	div ecx
	mov ecx, eax	;Guardando el  segundo termino en ecx
	
	mov eax, [x2]
	mov ebx, 4
	mul ebx	;Obteniendo el valor del tercer termino
	
	mov ebx, [res2]	;Recuperando valor temporal de res
	add eax, ecx	;Primer suma
	sub eax, ebx	;Restando el priemer termino
	;add eax, 48
	mov [res2], eax 	;Guardando resultado de segundo limite


	;Haciendo reesta final
	
	mov eax, [res]
	mov ecx, [res2]
	
	sub eax, ecx
	add eax, 48
	mov [res], eax

	mov eax, 4
	mov ebx, 1
	mov	ecx, msg
	mov edx, longitud
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov	ecx, res;Imprimiendo resultado
	mov edx, 1
	int 0x80

	mov eax, 1

	int 0x80

