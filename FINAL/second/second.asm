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
L809_isNotFactor__hla_:
		pop	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		mov	dword ptr [L813_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L812_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L812_dECXRegister__hla_+0], edx	;/* dECXRegister */
		pop	bx
		pop	cx
		mov	eax, 1
		cmp	bx, 0
		jng	L815_isCeroOrLess__hla_

L816_WhileLp__hla_:

L817_WhileLpTermination__hla_:
		cmp	cx, 0
		jle	L818_WhileLpDone__hla_

L819_WhileLpBody__hla_:
		sub	cx, bx
		jmp	L816_WhileLp__hla_

L818_WhileLpDone__hla_:
		cmp	cx, 0
		jne	L820_isNotAFactor__hla_
		mov	eax, 0

L820_isNotAFactor__hla_:

L815_isCeroOrLess__hla_:
		push	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		mov	ebx, dword ptr [L813_dEBXRegister__hla_+0]	;/* dEBXRegister */
		mov	ecx, dword ptr [L812_dECXRegister__hla_+0]	;/* dECXRegister */
		mov	edx, dword ptr [L811_dEDXRegister__hla_+0]	;/* dEDXRegister */
		ret
xL809_isNotFactor__hla___hla_:
;L809_isNotFactor__hla_ endp




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


		mov	word ptr [L806_iValue__hla_+0], 16	;/* iValue */
		mov	word ptr [L807_iFactor__hla_+0], 7	;/* iFactor */
		push	word ptr [L806_iValue__hla_+0]	;/* iValue */
		push	word ptr [L807_iFactor__hla_+0]	;/* iFactor */
		call	L809_isNotFactor__hla_
		mov	dword ptr [L808_iAnswer__hla_+0], eax	;/* iAnswer */
		push	dword ptr [L808_iAnswer__hla_+0]	; (type int32 iAnswer)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


