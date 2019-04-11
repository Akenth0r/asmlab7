%macro invoke 1-*
	%define _func %1
	%rep %0-1
		%rotate -1
		push %1	
	%endrep
	call _func
%endmacro