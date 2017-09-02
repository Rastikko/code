; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'first.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'first.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'first.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'first.consts.inc'

		include	'first.ro.inc'

; Code begins here:
L806_gets__hla_:
		mov	dword ptr [L812_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L811_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L810_dEAXRegister__hla_+0], eax	;/* dEAXRegister */
		mov	word ptr [L809_wDXRegister__hla_+0], dx	;/* wDXRegister */
		mov	word ptr [L808_wDIRegister__hla_+0], di	;/* wDIRegister */
		pop	dword ptr [L807_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	di
		pop	ebx
		push	dword ptr [L807_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	word ptr [L808_wDIRegister__hla_+0]	;/* wDIRegister */
		push	word ptr [L809_wDXRegister__hla_+0]	;/* wDXRegister */
		push	dword ptr [L812_dECXRegister__hla_+0]	;/* dECXRegister */
		push	dword ptr [L811_dEBXRegister__hla_+0]	;/* dEBXRegister */
		push	dword ptr [L810_dEAXRegister__hla_+0]	;/* dEAXRegister */
		call	STDIN_FLUSHINPUT	; flushInput
		call	STDIN_A_GETS	; a_gets
		mov	dword ptr [L813_sData__hla_+0], eax	;/* sData */
		mov	dx, 0
		mov	ecx, 0

L814_getsRepeatLoop__hla_:
		cmp	di, 0
		je	L815_getsEndLoop__hla_
		cmp	[eax+ecx*1+0], dh	;/* [eax+ecx] */
		je	L815_getsEndLoop__hla_
		mov	dl, [eax+ecx*1+0]	;/* [eax+ecx] */
		mov	byte ptr [ebx+0], dl	;/* (type char [ebx]) */
		inc	ecx
		inc	ebx
		dec	di
		jmp	L814_getsRepeatLoop__hla_

L815_getsEndLoop__hla_:
		mov	byte ptr [ebx+0], dh	;/* (type char [ebx]) */
		push	dword ptr [L813_sData__hla_+0]	; sData
		call	STR_FREE	; strfree
		pop	eax
		pop	ebx
		pop	ecx
		pop	dx
		pop	di
		ret
xL806_gets__hla___hla_:
;L806_gets__hla_ endp

L816_puts__hla_:
		mov	dword ptr [L819_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	word ptr [L818_wDXRegister__hla_+0], dx	;/* wDXRegister */
		pop	dword ptr [L817_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	ebx
		push	dword ptr [L817_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L819_dEBXRegister__hla_+0]	;/* dEBXRegister */
		push	word ptr [L818_wDXRegister__hla_+0]	;/* wDXRegister */
		mov	dx, 0

L820_putsRepeatLoop__hla_:
		cmp	[ebx+0], dh	;/* [ebx] */
		je	L821_putsEndLoop__hla_
		push	dword 00h
		push	eax
		mov	al, byte ptr [ebx+0]	; [ebx]
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTC	; putc
		inc	ebx
		jmp	L820_putsRepeatLoop__hla_

L821_putsEndLoop__hla_:
		pop	dx
		pop	ebx
		ret
xL816_puts__hla___hla_:
;L816_puts__hla_ endp

L823_getLargest__hla_:
		mov	dword ptr [L827_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L826_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L826_dECXRegister__hla_+0], edx	;/* dECXRegister */
		pop	dword ptr [L824_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	ebx
		mov	eax, 0
		mov	ecx, 0
		push	L842_str__hla_
		call	STDOUT_PUTS	; puts
		push	ebx
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln

L853_WhileLp__hla_:

L854_WhileLpTermination__hla_:
		cmp	ecx, dword ptr [L828_iMaxLenght__hla_+0]	;/* iMaxLenght */
		je	L855_WhileLpDone__hla_

L856_WhileLpBody__hla_:
		mov	edx, 0
		mov	dh, [ebx+ecx*1+0]	;/* [ebx+ecx] */
		cmp	dh, al
		jl	L857_notGreater__hla_
		mov	al, dh

L857_notGreater__hla_:
		inc	ecx
		jmp	L853_WhileLp__hla_

L855_WhileLpDone__hla_:
		push	dword ptr [L824_dReturnAddress__hla_+0]	;/* dReturnAddress */
		mov	ebx, dword ptr [L827_dEBXRegister__hla_+0]	;/* dEBXRegister */
		mov	ecx, dword ptr [L826_dECXRegister__hla_+0]	;/* dECXRegister */
		mov	edx, dword ptr [L825_dEDXRegister__hla_+0]	;/* dEDXRegister */
		ret
xL823_getLargest__hla___hla_:
;L823_getLargest__hla_ endp




;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L871_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	al, 1
		mov	bl, 80
		inc	bl
		mul	bl
		mov	ebx, 0
		mov	bx, ax
		push	ebx
		call	MEM_ALLOC	; malloc
		mov	dword ptr [L822_stringData__hla_+0], eax	;/* stringData */
		mov	eax, dword ptr [L822_stringData__hla_+0]	;/* stringData */
		push	eax
		mov	cx, 80
		push	cx
		call	L806_gets__hla_
		push	L889_str__hla_
		call	STDOUT_PUTS	; puts
		mov	eax, dword ptr [L822_stringData__hla_+0]	;/* stringData */
		push	eax
		call	L816_puts__hla_
		call	STDOUT_NEWLN	; newln
		push	eax
		mov	eax, 0
		call	L823_getLargest__hla_
		push	L903_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


