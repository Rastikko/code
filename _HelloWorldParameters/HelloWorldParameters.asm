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

		include	'HelloWorldParameters.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'HelloWorldParameters.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'HelloWorldParameters.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'HelloWorldParameters.consts.inc'

		include	'HelloWorldParameters.ro.inc'

; Code begins here:
L807_helloParameters__hla_:
		pop	dword ptr [L808_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	dword ptr [ebp+8]	;/* i */
		push	dword ptr [L808_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	ax
		mov	ax, 0
		inc	dword ptr [ebp+8]	;/* i */
		push	L822_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		pop	ax
		ret
xL807_helloParameters__hla___hla_:
;L807_helloParameters__hla_ endp




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


		mov	dword ptr [L806_iValue__hla_+0], 100	;/* iValue */
		mov	ax, 50
		push	L840_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTW	; putw
		call	STDOUT_NEWLN	; newln
		push	L864_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_iValue__hla_+0]	; (type int32 iValue)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	L888_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	dword ptr [L806_iValue__hla_+0]	;/* iValue */
		call	L807_helloParameters__hla_
		push	L906_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L924_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTW	; putw
		call	STDOUT_NEWLN	; newln
		push	L948_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_iValue__hla_+0]	; (type int32 iValue)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


