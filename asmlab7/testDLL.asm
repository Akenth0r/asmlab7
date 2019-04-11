extern ExitProcess, Delete
%include "invoke.inc"
global start

section .data 
	stringz1 db "Some_string",0
	stringz2 db "Other_string"
section .code
	start:
	invoke Delete, stringz1, 2, 3
	invoke Delete, stringz2, 1, 4
	
	invoke ExitProcess, 0