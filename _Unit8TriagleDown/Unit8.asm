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

		include	'Unit8.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Unit8.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Unit8.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Unit8.consts.inc'

		include	'Unit8.ro.inc'

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


		push	L820_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_iValue__hla_+0], eax	;/* iValue */
		pop	eax

L829_TriangleWhileLp__hla_:

L830_TriangleWhileLpTermination__hla_:
		cmp	dword ptr [L806_iValue__hla_+0], 0	;/* iValue */
		jbe	L831_TriangleWhileLpDone__hla_

L832_TriangleWhileLpBody__hla_:
		mov	eax, dword ptr [L806_iValue__hla_+0]	;/* iValue */

L833_RepeatWhileLp__hla_:

L834_RepeatWhileLpTermination__hla_:
		cmp	eax, 0
		jbe	L835_RepeatWhileLpDone__hla_

L836_RepeatWhileLpBody__hla_:
		push	dword ptr [L806_iValue__hla_+0]	; (type int32 iValue)
		call	STDOUT_PUTI32	; puti32
		dec	eax
		jmp	L833_RepeatWhileLp__hla_

L835_RepeatWhileLpDone__hla_:
		call	STDOUT_NEWLN	; newln

L852_TriangleWhileLpBody2__hla_:
		dec	dword ptr [L806_iValue__hla_+0]	;/* iValue */
		jmp	L829_TriangleWhileLp__hla_

L831_TriangleWhileLpDone__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


