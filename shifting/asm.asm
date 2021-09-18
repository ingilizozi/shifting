.data
lastFlags dq 0 ;64 Bit copy of flags register
.code
RestoreFlags proc
	push qword ptr [lastFlags]
	popfq
	ret
RestoreFlags endp

SaveFlags proc
	pushfq
	pop qword ptr [lastFlags]
	ret
SaveFlags endp

ShiftTest proc
	mov rdx, qword ptr [rcx] ;P parameter
	call RestoreFlags ;Load the last flags

	shl rdx, 1	;Perform opertion,Rotate left hand side, bits will come right side.
	;ror rdx, 1 ;Rotate right hand side, bits will come left side.
	;shl rdx, 1 ;Shift left side
	;shr rdx, 1 ;Shift right side
	;rcl rdx, 1 ;Rotate left hand side bits with carry flag, bits will come right side.
	;rcr rdx, 1 ;Rotate right hand side bits with carry flag, bits will come left side.
	;sal rdx, 1
	;sar rdx, 1
	mov qword ptr [rcx], rdx
	mov eax, 0				;Assume there's no carry
	mov ecx, 1				;Move 1 into ecx
	cmovc eax, ecx			;If the carry flag is set, move this 1 into EAX

	call SaveFlags			;Save flags
	ret
ShiftTest endp

ShiftDoubleTest proc
push rbx; Save RBX
mov rax, qword ptr [rcx]
mov rbx, qword ptr [rdx]

;shrd rax, rbx, 12 ;Perform operation, Shift right double position
shld rax, rbx, 12 ;Perform operation, Shift left double position

;Place result in *RCX
mov qword ptr [rcx], rax
pop rbx ;Restore caller's RBX
ret
ShiftDoubleTest endp

end