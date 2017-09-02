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

		include	'Quiz1_1.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Quiz1_1.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Quiz1_1.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Quiz1_1.consts.inc'

		include	'Quiz1_1.ro.inc'

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


		push	L822_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_iFirstValue__hla_+0], eax	;/* iFirstValue */
		pop	eax
		push	L844_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L807_iSecondValue__hla_+0], eax	;/* iSecondValue */
		pop	eax
		cmp	dword ptr [L806_iFirstValue__hla_+0], 1	;/* iFirstValue */
		jl	L853_invalidParameters__hla_
		cmp	dword ptr [L807_iSecondValue__hla_+0], 1	;/* iSecondValue */
		jl	L853_invalidParameters__hla_
		mov	ebx, 1

L854_forLoopTerminationCondition__hla_:
		cmp	ebx, dword ptr [L807_iSecondValue__hla_+0]	;/* iSecondValue */
		jg	L855_forLoopEnd__hla_

L856_forLoopBody__hla_:
		cmp	byte ptr [L808_bFirstIteration__hla_+0], 1	;/* bFirstIteration */
		je	L857_skipUnderscoreLabel__hla_
		push	L871_str__hla_
		call	STDOUT_PUTS	; puts

L857_skipUnderscoreLabel__hla_:
		mov	byte ptr [L808_bFirstIteration__hla_+0], 0	;/* bFirstIteration */
		push	dword ptr [L806_iFirstValue__hla_+0]	; (type int32 iFirstValue)
		call	STDOUT_PUTI32	; puti32
		push	dword ptr [L807_iSecondValue__hla_+0]	; (type int32 iSecondValue)
		call	STDOUT_PUTI32	; puti32

L893_forLoopIncrement__hla_:
		inc	ebx
		jmp	L854_forLoopTerminationCondition__hla_

L855_forLoopEnd__hla_:

L853_invalidParameters__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


