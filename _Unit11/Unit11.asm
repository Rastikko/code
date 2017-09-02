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

		include	'Unit11.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Unit11.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Unit11.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Unit11.consts.inc'

		include	'Unit11.ro.inc'

; Code begins here:
L809_middleFinder__hla_:
		pop	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [ebp+8]	;/* z */
		pop	word ptr [ebp+12]	;/* y */
		pop	word ptr [ebp+16]	;/* x */
		push	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	dx
		push	cx
		mov	al, 0
		mov	dx, word ptr [ebp+16]	;/* x */
		mov	cx, 0
		cmp	dx, word ptr [ebp+12]	;/* y */
		jg	L811_xIsGreaterY__hla_
		je	L812_xIsEqualY__hla_

L813_xIsSmallerY__hla_:
		mov	dx, word ptr [ebp+16]	;/* x */
		mov	cx, word ptr [ebp+12]	;/* y */
		jmp	L814_compareDToZ__hla_

L811_xIsGreaterY__hla_:
		mov	dx, word ptr [ebp+12]	;/* y */
		mov	cx, word ptr [ebp+16]	;/* x */
		jmp	L814_compareDToZ__hla_

L812_xIsEqualY__hla_:
		mov	dx, word ptr [ebp+16]	;/* x */
		mov	cx, word ptr [ebp+16]	;/* x */
		inc	al

L814_compareDToZ__hla_:
		cmp	dx, word ptr [ebp+8]	;/* z */
		jg	L815_dIsGreaterZ__hla_
		je	L816_dIsEqualZ__hla_

L817_dIsSmallerZ__hla_:
		jmp	L818_compareZtoC__hla_

L815_dIsGreaterZ__hla_:
		jmp	L819_endOfProcedure__hla_

L816_dIsEqualZ__hla_:
		inc	al
		jmp	L819_endOfProcedure__hla_

L818_compareZtoC__hla_:
		cmp	word ptr [ebp+8], cx	;/* z */
		jg	L820_zIsGreaterC__hla_
		je	L821_zIsEqualC__hla_

L822_zIsSmaller__hla_:
		mov	dx, word ptr [ebp+8]	;/* z */
		jmp	L819_endOfProcedure__hla_

L820_zIsGreaterC__hla_:
		mov	dx, cx
		jmp	L819_endOfProcedure__hla_

L821_zIsEqualC__hla_:
		inc	al

L819_endOfProcedure__hla_:
		push	edx
		call	STDOUT_PUTU16	; putu16
		push	L836_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		pop	cx
		pop	dx
		ret
xL809_middleFinder__hla___hla_:
;L809_middleFinder__hla_ endp




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


		push	L854_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iValue1__hla_+0], ax	;/* iValue1 */
		pop	eax
		push	L876_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_iValue2__hla_+0], ax	;/* iValue2 */
		pop	eax
		push	L898_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_iValue3__hla_+0], ax	;/* iValue3 */
		pop	eax
		push	word ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	word ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		push	word ptr [L808_iValue3__hla_+0]	;/* iValue3 */
		call	L809_middleFinder__hla_
		cmp	al, 2
		je	L907_numberEqual__hla_
		push	L921_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L922_endOfProgram__hla_

L907_numberEqual__hla_:
		push	L936_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L954_str__hla_
		call	STDOUT_PUTS	; puts

L922_endOfProgram__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


