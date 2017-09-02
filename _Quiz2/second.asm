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

		include	'second.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'second.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'second.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'second.consts.inc'

		include	'second.ro.inc'

; Code begins here:
L806_collatzRec__hla_:
		mov	dword ptr [L808_iRegisterValue__hla_+0], ebx	;/* iRegisterValue */
		pop	dword ptr [L807_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	ebx
		mov	byte ptr [ebp+8], bl	;/* value */
		mov	ebx, dword ptr [L808_iRegisterValue__hla_+0]	;/* iRegisterValue */
		push	dword ptr [L807_iReturnAddress__hla_+0]	;/* iReturnAddress */
		cmp	byte ptr [ebp+8], 1	;/* value */
		je	L810_finishLabel__hla_
		mov	ax, 0
		mov	al, byte ptr [ebp+8]	;/* value */
		div	byte ptr [L809_modtwo__hla_+0]	;/* modtwo */
		cmp	ah, 0
		je	L811_equalZero__hla_
		jmp	L812_notEqualZero__hla_

L811_equalZero__hla_:
		sar	byte ptr [ebp+8], 1	;/* value */
		mov	eax, 0
		mov	al, byte ptr [ebp+8]	;/* value */
		push	eax
		call	L806_collatzRec__hla_
		jmp	L813_exitFunction__hla_

L812_notEqualZero__hla_:
		mov	eax, 0
		mov	al, byte ptr [ebp+8]	;/* value */
		add	al, byte ptr [ebp+8]	;/* value */
		add	al, byte ptr [ebp+8]	;/* value */
		add	al, 1
		push	eax
		call	L806_collatzRec__hla_
		jmp	L813_exitFunction__hla_

L810_finishLabel__hla_:
		push	L827_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L813_exitFunction__hla_:
		ret
xL806_collatzRec__hla___hla_:
;L806_collatzRec__hla_ endp




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


		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		mov	ebx, 0
		push	eax
		call	STDIN_GETD	; getd
		mov	ebx, eax
		pop	eax
		push	ebx
		call	L806_collatzRec__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


