TITLE Dog Years    (Project01.asm)

; Author: Ian Collier
; Course / Project ID: CS271 / Project #1    Date: 1/13/2019
; Description: Takes 2 numbers as user input, then prints the result of all the basic arithmetic operations on each one

INCLUDE Irvine32.inc

; Constants

.data

; Variables
firstOp			DWORD	?
secondOp		DWORD	?

addResult		DWORD	?
subResult		DWORD	?
multResult		DWORD	?
divResult		DWORD	?
divResultRem	DWORD	?

; Prompt strings
s_dashes		BYTE	"-----------------------------------------", 0
s_title_1		BYTE	"Elementary arithmetic calc by Ian Collier", 0
s_title_2		BYTE	"Give me 2 numbers and I'll calculate the sum, difference, product, quotient (and remainder)", 0
s_prompt_1		BYTE	"Enter the first number: ", 0
s_prompt_2		BYTE	"Enter the second number: ", 0
s_results		BYTE	"Here are the results...", 0
s_end			BYTE	"Bye.", 0

; Result strings
s_sym_add		BYTE	" + ", 0
s_sym_sub		BYTE	" - ", 0
s_sym_mult		BYTE	" * ", 0
s_sym_div		BYTE	" / ", 0
s_sym_equal		BYTE	" = ", 0
s_sym_div_rem	BYTE	" remainder ", 0



.code
main PROC

; Outline

	; Print title
	mov		edx, OFFSET s_title_1
	call	WriteString	
	call	CrLf
	mov		edx, OFFSET s_dashes
	call	WriteString	
	call	CrLf
	call	CrLf
	mov		edx, OFFSET s_title_2
	call	WriteString	
	call	CrLf
	call	CrLf
	
	; Prompt for both numbers
	mov		edx, OFFSET s_prompt_1
	call	WriteString	
	call	ReadInt
	mov		firstOp, eax
	mov		edx, OFFSET s_prompt_2
	call	WriteString	
	call	ReadInt
	mov		secondOp, eax
	call	CrLf	

	; Calculate arthimetic and store
	; Add
	mov		eax, firstOp
	add		eax, secondOp
	mov		addResult, eax

	; Subtract
	mov		eax, firstOp
	sub		eax, secondOp
	mov		subResult, eax

	; Mutliply
	mov		eax, firstOp
	mov		ebx, secondOp
	mul		ebx
	mov		multResult, eax

	; Divide
	mov		eax, firstOp
	mov		ebx, secondOp
	div		ebx
	mov		divResult, eax
	mov		divResultRem, edx

	; Print results
	mov		edx, OFFSET s_results
	call	WriteString	
	call	CrLf	
	call	CrLf	

	; Print add result
	mov		eax, firstOp
	call	WriteDec
	mov		edx, OFFSET s_sym_add
	call	WriteString	
	mov		eax, secondOp
	call	WriteDec
	mov		edx, OFFSET s_sym_equal
	call	WriteString	
	mov		eax, addResult
	call	WriteDec
	call	CrLf

	; Print subtract result
	mov		eax, firstOp
	call	WriteDec
	mov		edx, OFFSET s_sym_sub
	call	WriteString	
	mov		eax, secondOp
	call	WriteDec
	mov		edx, OFFSET s_sym_equal
	call	WriteString	
	mov		eax, subResult
	call	WriteDec
	call	CrLf

	; Print multiplication result
	mov		eax, firstOp
	call	WriteDec
	mov		edx, OFFSET s_sym_mult
	call	WriteString	
	mov		eax, secondOp
	call	WriteDec
	mov		edx, OFFSET s_sym_equal
	call	WriteString	
	mov		eax, multResult
	call	WriteDec
	call	CrLf

	; Print division result
	mov		eax, firstOp
	call	WriteDec
	mov		edx, OFFSET s_sym_div
	call	WriteString	
	mov		eax, secondOp
	call	WriteDec
	mov		edx, OFFSET s_sym_equal
	call	WriteString	
	mov		eax, divResult
	call	WriteDec
	mov		edx, OFFSET s_sym_div_rem
	call	WriteString	
	mov		eax, divResultRem
	call	WriteDec
	call	CrLf

	call	CrLf

	; Print end message
	mov		edx, OFFSET s_end
	call	WriteString	
	call	CrLf	


	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
