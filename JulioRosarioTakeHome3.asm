COMMENT*
		Create a array of 100 random numbers from [-10,10]
		print the array out
		print the array backwards
		copy to the array  and array called target and then print it out.
*COMMENT

INCLUDE irvine32.inc
.data
array dword 5 DUP(0)
target dword 5 DUP(0)
.code
main PROC
	call createRandom

	call printArray

	call printBackwards

	call copyArray

	call printCopy

	;NOTE : Created it an extra function called copyArrayBackwards.
	;The wording for the last statement was confusing, So just to make sure.

	call copyArrayBackwards
	call printCopy
exit
main ENDP

createRandom PROC USES ESI ECX EAX
	call Randomize

	MOV ECX,lengthof array
	MOV ESI,offset array
	L1:
		MOV EAX,21		;0-20
		call RandomRange   ;Create random int
		sub EAX,10         ;-10 to 10
		
		MOV [ESI],EAX
		add ESI,type array
	LOOP L1
ret
createRandom  ENDP

printArray PROC

	MOV ESI,offset array
	MOV ECX,lengthof array
	
	L1:
		MOV EAX,[ESI]
		call writeInt
		
		MOV AL," "		;Create space in between
		call writechar

		add ESI,type array
	LOOP L1

	call crlf
	call crlf
ret
printArray ENDP

printBackwards PROC

	MOV ESI,offset array
	add ESI,sizeof array -type array
	MOV ECX,lengthof array

	L1:
		MOV EAX,[ESI]
		call writeInt

		MOV AL," "		;Create space in between
		call writechar

		sub ESI,type array
	LOOP L1
	call crlf
	call crlf
ret
printBackwards ENDP

copyArray PROC USES ECX ESI EDI
	MOV ECX,lengthof array
	MOV ESI,offset array
	MOV EDI,offset target

	L1:
		MOV EAX,[ESI]
		MOV [EDI],EAX
		add ESI,type array
		add EDI,type target
	LOOP L1
ret
copyArray ENDP

copyArrayBackwards PROC USES ESI ECX EDI EAX

	MOV ESI,offset array
	add ESI,sizeof array -type array
	MOV ECX,lengthof array
	MOV EDI,offset target

	L1:
		MOV EAX,[ESI]
		MOV [EDI],EAX
		sub ESI,type array
		add EDI,type target
	LOOP L1

ret
copyArrayBackwards ENDP

printCopy PROC USES ECX ESI EDI

	MOV ECX,lengthof target
	MOV ESI,offset target

	L1:
		MOV EAX,[ESI]
		call writeInt

		MOV AL," "		;Create space in between
		call writechar

	     add ESI,type target

	LOOP L1
	call crlf
	call crlf

ret
printCopy ENDP

END main


