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

		include	'unit13.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'unit13.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'unit13.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'unit13.consts.inc'

		include	'unit13.ro.inc'

; Code begins here:
L807_multitap__hla_:
		mov	dword ptr [L809_iRegisterValue__hla_+0], eax	;/* iRegisterValue */
		pop	dword ptr [L808_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	ax
		cmp	ax, 96
		JL	L812_isCapitalizedCharacter__hla_
		sub	ax, 32

L812_isCapitalizedCharacter__hla_:
		sub	ax, 65
		div	byte ptr [L811_iThree__hla_+0]	;/* iThree */
		add	al, 2
		push	L826_str__hla_
		call	STDOUT_PUTS	; puts

L827_DoWhileLpBody__hla_:
		dec	ah
		push	eax
		call	STDOUT_PUTI8	; puti8
		cmp	ah, -1
		jng	L828_DoWhileLpDone__hla_
		jmp	L827_DoWhileLpBody__hla_

L828_DoWhileLpDone__hla_:
		mov	eax, dword ptr [L809_iRegisterValue__hla_+0]	;/* iRegisterValue */
		push	dword ptr [L808_iReturnAddress__hla_+0]	;/* iReturnAddress */
		ret
xL807_multitap__hla___hla_:
;L807_multitap__hla_ endp




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


		push	L842_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_FLUSHINPUT	; flushInput
		call	STDIN_GETC	; getc
		mov	byte ptr [L806_inputChar__hla_+0], al	;/* inputChar */
		mov	bx, 0
		mov	bl, byte ptr [L806_inputChar__hla_+0]	;/* inputChar */
		push	bx
		call	L807_multitap__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


