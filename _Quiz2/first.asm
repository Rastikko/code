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
L806_fib__hla_ :
		mov	dword ptr [L808_iRegisterValue__hla_+0], ebx	;/* iRegisterValue */
		pop	dword ptr [L809_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	ebx
		mov	byte ptr [ebp+8], bl	;/* value */
		mov	byte ptr [L813_originalValue__hla_+0], bl	;/* originalValue */
		mov	dword ptr [L810_resultValue__hla_+0], 1	;/* resultValue */
		mov	dword ptr [L811_one__hla_+0], 1	;/* one */
		mov	dword ptr [L812_two__hla_+0], 1	;/* two */

L814_WhileLp__hla_:

L815_WhileLpTermination__hla_:
		cmp	byte ptr [ebp+8], 3	;/* value */
		jl	L816_WhileLpDone__hla_

L817_WhileLpBody__hla_:
		mov	ebx, 0
		add	ebx, dword ptr [L811_one__hla_+0]	;/* one */
		add	ebx, dword ptr [L812_two__hla_+0]	;/* two */
		mov	dword ptr [L810_resultValue__hla_+0], ebx	;/* resultValue */
		push	dword ptr [L812_two__hla_+0]	;/* two */
		pop	dword ptr [L811_one__hla_+0]	;/* one */
		push	dword ptr [L810_resultValue__hla_+0]	;/* resultValue */
		pop	dword ptr [L812_two__hla_+0]	;/* two */
		dec	byte ptr [ebp+8]	;/* value */
		jmp	L814_WhileLp__hla_

L816_WhileLpDone__hla_:
		push	L831_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L813_originalValue__hla_+0]	; (type int8 originalValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L842_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L810_resultValue__hla_+0]	; (type int32 resultValue)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		mov	ebx, dword ptr [L808_iRegisterValue__hla_+0]	;/* iRegisterValue */
		push	dword ptr [L809_iReturnAddress__hla_+0]	;/* iReturnAddress */
		ret
xL806_fib__hla___hla_:
;L806_fib__hla_  endp




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


		push	L866_str__hla_
		call	STDOUT_PUTS	; puts
		mov	ebx, 0
		push	eax
		call	STDIN_GETD	; getd
		mov	ebx, eax
		pop	eax
		push	ebx
		call	L806_fib__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


