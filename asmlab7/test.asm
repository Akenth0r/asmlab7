extern ExitProcess, LoadLibraryA, GetProcAddress
%include "invoke.inc"
global start

section .data 
	stringz1 db "Some_string",0
	stringz2 db "Other_string",0
    libname db "DeleteDLL.DLL",0
    procname db "Delete",0
    Delete dd 0 ; func addr
    
section .code
	start:
    invoke LoadLibraryA, libname
    invoke GetProcAddress, eax, procname
    mov dword[Delete], eax
	invoke dword[Delete], stringz1, 2, 3
	invoke dword[Delete], stringz2, 1, 4
	
	invoke ExitProcess, 0