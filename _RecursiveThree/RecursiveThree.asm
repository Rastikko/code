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

		include	'RecursiveThree.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'RecursiveThree.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'RecursiveThree.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'RecursiveThree.consts.inc'

		include	'RecursiveThree.ro.inc'

; Code begins here:
L808_isDivideableByThreeRec__hla_:
		pop	dword ptr [L809_returnAddress__hla_+0]	;/* returnAddress */
		pop	word ptr [L810_temp__hla_+0]	;/* temp */
		pop	word ptr [ebp+8]	;/* n */
		push	dword ptr [L809_returnAddress__hla_+0]	;/* returnAddress */
		cmp	word ptr [ebp+8], 0	;/* n */
		je	L811_ReturnTrue__hla_
		cmp	word ptr [ebp+8], 0	;/* n */
		jle	L812_ReturnFalse__hla_
		jmp	L813_Neither__hla_

L811_ReturnTrue__hla_:
		mov	eax, 1
		jmp	L814_ExitSequence__hla_

L812_ReturnFalse__hla_:
		mov	eax, 0
		jmp	L814_ExitSequence__hla_

L813_Neither__hla_:
		sub	word ptr [ebp+8], 3	;/* n */
		push	word ptr [ebp+8]	;/* n */
		push	word ptr [L810_temp__hla_+0]	;/* temp */
		call	L808_isDivideableByThreeRec__hla_
		jmp	L814_ExitSequence__hla_

L814_ExitSequence__hla_:
		ret
xL808_isDivideableByThreeRec__hla___hla_:
;L808_isDivideableByThreeRec__hla_ endp




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


		push	L828_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iDataValue1__hla_+0], ax	;/* iDataValue1 */
		pop	eax
		push	word ptr [L806_iDataValue1__hla_+0]	;/* iDataValue1 */
		push	word ptr [L807_iDataValue2__hla_+0]	;/* iDataValue2 */
		call	L808_isDivideableByThreeRec__hla_
		cmp	eax, 1
		je	L837_ISDIVISIBLE__hla_
		jmp	L838_NOTDIVISIBLE__hla_

L837_ISDIVISIBLE__hla_:
		push	L852_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L857_EndProgram__hla_

L838_NOTDIVISIBLE__hla_:
		push	L871_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L857_EndProgram__hla_
		call	STDOUT_NEWLN	; newln

L857_EndProgram__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


