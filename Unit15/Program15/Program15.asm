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

		include	'Program15.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Program15.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Program15.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Program15.consts.inc'

		include	'Program15.ro.inc'

; Code begins here:
L812_swap__hla_:
		mov	dword ptr [L817_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L816_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L815_dEDXRegister__hla_+0], edx	;/* dEDXRegister */
		pop	dword ptr [L813_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	ebx
		pop	ecx
		push	dword ptr [L813_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L815_dEDXRegister__hla_+0]	;/* dEDXRegister */
		push	dword ptr [L816_dECXRegister__hla_+0]	;/* dECXRegister */
		push	dword ptr [L817_dEBXRegister__hla_+0]	;/* dEBXRegister */
		mov	edx, [ebx+0]	;/* [ebx] */
		mov	byte ptr [L814_iTemporary__hla_+0], dl	;/* iTemporary */
		mov	edx, [ecx+0]	;/* [ecx] */
		mov	[ebx+0], dl	;/* [ebx] */
		mov	dl, byte ptr [L814_iTemporary__hla_+0]	;/* iTemporary */
		mov	[ecx+0], dl	;/* [ecx] */
		pop	ebx
		pop	ecx
		pop	edx
		ret
xL812_swap__hla___hla_:
;L812_swap__hla_ endp

L818_swapper__hla_:
		mov	dword ptr [L822_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L821_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L820_dEDXRegister__hla_+0], edx	;/* dEDXRegister */
		pop	dword ptr [L819_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	ebx
		pop	ecx
		pop	edx
		mov	al, [edx+0]	;/* [edx] */
		mov	ah, [ecx+0]	;/* [ecx] */
		cmp	al, ah
		jl	L823_skipSwapXY__hla_
		push	edx
		push	ecx
		call	L812_swap__hla_

L823_skipSwapXY__hla_:
		mov	al, [edx+0]	;/* [edx] */
		mov	ah, [ebx+0]	;/* [ebx] */
		cmp	al, ah
		jl	L824_skipSwapXZ__hla_
		push	edx
		push	ebx
		call	L812_swap__hla_

L824_skipSwapXZ__hla_:
		mov	al, [ecx+0]	;/* [ecx] */
		mov	ah, [ebx+0]	;/* [ebx] */
		cmp	al, ah
		jl	L825_skipSwapYZ__hla_
		push	ecx
		push	ebx
		call	L812_swap__hla_

L825_skipSwapYZ__hla_:
		mov	ebx, dword ptr [L822_dEBXRegister__hla_+0]	;/* dEBXRegister */
		mov	ecx, dword ptr [L821_dECXRegister__hla_+0]	;/* dECXRegister */
		mov	edx, dword ptr [L820_dEDXRegister__hla_+0]	;/* dEDXRegister */
		push	dword ptr [L819_iReturnAddress__hla_+0]	;/* iReturnAddress */
		ret
xL818_swapper__hla___hla_:
;L818_swapper__hla_ endp




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


		push	L839_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_iValueX__hla_+0], al	;/* iValueX */
		pop	eax
		push	L861_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L807_iValueY__hla_+0], al	;/* iValueY */
		pop	eax
		push	L883_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L808_iValueZ__hla_+0], al	;/* iValueZ */
		pop	eax
		lea	eax, byte ptr [L806_iValueX__hla_+0]	;/* iValueX */
		mov	dword ptr [L809_xAddress__hla_+0], eax	;/* xAddress */
		push	eax
		lea	eax, byte ptr [L807_iValueY__hla_+0]	;/* iValueY */
		mov	dword ptr [L810_yAddress__hla_+0], eax	;/* yAddress */
		push	eax
		lea	eax, byte ptr [L808_iValueZ__hla_+0]	;/* iValueZ */
		mov	dword ptr [L811_zAddress__hla_+0], eax	;/* zAddress */
		push	eax
		call	L818_swapper__hla_
		push	L905_str__hla_
		call	STDOUT_PUTS	; puts
		mov	ebx, dword ptr [L809_xAddress__hla_+0]	;/* xAddress */
		mov	ch, [ebx+0]	;/* [ebx] */
		sub	esp, 4
		mov	byte ptr [ESP+0], ch
		call	STDOUT_PUTI8	; puti8
		push	L919_str__hla_
		call	STDOUT_PUTS	; puts
		mov	ebx, dword ptr [L810_yAddress__hla_+0]	;/* yAddress */
		mov	ch, [ebx+0]	;/* [ebx] */
		sub	esp, 4
		mov	byte ptr [ESP+0], ch
		call	STDOUT_PUTI8	; puti8
		push	L933_str__hla_
		call	STDOUT_PUTS	; puts
		mov	ebx, dword ptr [L811_zAddress__hla_+0]	;/* zAddress */
		mov	ch, [ebx+0]	;/* [ebx] */
		sub	esp, 4
		mov	byte ptr [ESP+0], ch
		call	STDOUT_PUTI8	; puti8
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


