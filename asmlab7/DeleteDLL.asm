global DLLMain
global Delete
export Delete

section .code
	DLLMain:
		mov al, 1
		ret 12
	Delete: ; S:pchar, start, len:byte stdcall
		push ebp
		mov ebp, esp
		push edi
		push esi
		cld
		mov edi, dword[ebp+8]
		mov ecx, -1
		mov al, 0
		repne scasb
		not ecx
		cmp dword[ebp+16], ecx
		ja exit
		sub ecx, dword[ebp+12]
		sub ecx, dword[ebp+16]
		mov esi, dword[ebp+8]
		add esi, dword[ebp+12]
		mov edi, esi
		add esi, dword[ebp+16]
		rep movsb
		exit:
			pop esi
			pop edi
			pop ebp
	ret 12
		
	