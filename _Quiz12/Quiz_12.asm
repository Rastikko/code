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

		include	'Quiz_12.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Quiz_12.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Quiz_12.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Quiz_12.consts.inc'

		include	'Quiz_12.ro.inc'

; Code begins here:



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


		push	L821_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_iValue__hla_+0], eax	;/* iValue */
		pop	eax
		cmp	dword ptr [L806_iValue__hla_+0], 1	;/* iValue */
		jl	L830_invalidParameters__hla_
		mov	ebx, 1

L831_forLoopTerminationCondition__hla_:
		cmp	ebx, dword ptr [L806_iValue__hla_+0]	;/* iValue */
		jg	L832_forLoopEnd__hla_

L833_forLoopBody__hla_:
		cmp	byte ptr [L807_bFirstIteration__hla_+0], 1	;/* bFirstIteration */
		je	L834_printBeginOrEnd__hla_
		call	STDOUT_NEWLN	; newln
		cmp	ebx, dword ptr [L806_iValue__hla_+0]	;/* iValue */
		je	L834_printBeginOrEnd__hla_
		jmp	L848_printBody__hla_

L834_printBeginOrEnd__hla_:
		mov	byte ptr [L807_bFirstIteration__hla_+0], 0	;/* bFirstIteration */
		mov	eax, dword ptr [L806_iValue__hla_+0]	;/* iValue */

L849_checkPrintBeginOrEnd__hla_:
		cmp	eax, 0
		je	L850_forLoopIncrement__hla_
		push	dword ptr [L806_iValue__hla_+0]	; (type int32 iValue)
		call	STDOUT_PUTI32	; puti32
		dec	eax
		jmp	L849_checkPrintBeginOrEnd__hla_

L848_printBody__hla_:
		push	dword ptr [L806_iValue__hla_+0]	; (type int32 iValue)
		call	STDOUT_PUTI32	; puti32
		mov	eax, dword ptr [L806_iValue__hla_+0]	;/* iValue */
		sub	eax, 2

L881_checkPrintBody__hla_:
		cmp	eax, 0
		jle	L882_printBodyEnd__hla_
		push	L896_str__hla_
		call	STDOUT_PUTS	; puts
		dec	eax
		jmp	L881_checkPrintBody__hla_

L882_printBodyEnd__hla_:
		push	dword ptr [L806_iValue__hla_+0]	; (type int32 iValue)
		call	STDOUT_PUTI32	; puti32

L850_forLoopIncrement__hla_:
		inc	ebx
		jmp	L831_forLoopTerminationCondition__hla_

L832_forLoopEnd__hla_:

L830_invalidParameters__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


