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

		include	'MaxFunction.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'MaxFunction.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'MaxFunction.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'MaxFunction.consts.inc'

		include	'MaxFunction.ro.inc'

; Code begins here:
L808_max__hla_ :
		pop	dword ptr [L809_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	dword ptr [ebp+8]	;/* y */
		pop	dword ptr [ebp+12]	;/* x */
		push	dword ptr [L809_iReturnAddress__hla_+0]	;/* iReturnAddress */
		mov	edx, dword ptr [ebp+12]	;/* x */
		sub	edx, dword ptr [ebp+8]	;/* y */
		cmp	edx, 0
		jg	L811_XisMax__hla_
		jmp	L812_YisMax__hla_

L811_XisMax__hla_:
		push	dword ptr [ebp+12]	;/* x */
		pop	dword ptr [L810_iMax__hla_+0]	;/* iMax */
		jmp	L813_ExitSequence__hla_

L812_YisMax__hla_:
		push	dword ptr [ebp+8]	;/* y */
		pop	dword ptr [L810_iMax__hla_+0]	;/* iMax */
		jmp	L813_ExitSequence__hla_

L813_ExitSequence__hla_:
		mov	edx, dword ptr [L810_iMax__hla_+0]	;/* iMax */
		ret
xL808_max__hla___hla_:
;L808_max__hla_  endp




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


		push	L827_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_iValue1__hla_+0], eax	;/* iValue1 */
		pop	eax
		push	L849_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L807_iValue2__hla_+0], eax	;/* iValue2 */
		pop	eax
		push	L871_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	dword ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	dword ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		call	L808_max__hla_
		push	L889_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L907_str__hla_
		call	STDOUT_PUTS	; puts
		push	edx
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


