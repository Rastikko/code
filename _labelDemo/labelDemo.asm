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

		include	'labelDemo.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'labelDemo.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'labelDemo.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'labelDemo.consts.inc'

		include	'labelDemo.ro.inc'

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



L810_lbl1__hla_:
		lea	ebx, [L810_lbl1__hla_]	;/* lbl1 */

L811_lbl2__hla_:
		lea	eax, [L811_lbl2__hla_]	;/* lbl2 */
		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	ebx
		call	STDOUT_PUTD	; putd
		push	L854_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln
		push	L878_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L896_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_iLbl1Location__hla_+0]	; (type dword iLbl1Location)
		call	STDOUT_PUTD	; putd
		push	L916_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_iLbl2Location__hla_+0]	; (type dword iLbl2Location)
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


