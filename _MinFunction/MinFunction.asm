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

		include	'MinFunction.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'MinFunction.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'MinFunction.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'MinFunction.consts.inc'

		include	'MinFunction.ro.inc'

; Code begins here:
L809_min__hla_ :
		mov	dword ptr [L813_iRegisterValue__hla_+0], ebx	;/* iRegisterValue */
		pop	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [L812_iTemporary__hla_+0]	;/* iTemporary */
		pop	word ptr [L812_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L812_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+8], bl	;/* c */
		pop	word ptr [L812_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L812_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+12], bl	;/* b */
		pop	word ptr [L812_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L812_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+16], bl	;/* a */
		push	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	dword ptr [L813_iRegisterValue__hla_+0]	;/* iRegisterValue */
		mov	dh, byte ptr [ebp+16]	;/* a */
		sub	dh, byte ptr [ebp+12]	;/* b */
		cmp	dh, 0
		jl	L814_AisMin__hla_
		jmp	L815_BisMin__hla_

L814_AisMin__hla_:
		mov	dh, byte ptr [ebp+16]	;/* a */
		sub	dh, byte ptr [ebp+8]	;/* c */
		cmp	dh, 0
		jl	L816_PutAinDH__hla_
		jmp	L817_PutCinDH__hla_

L815_BisMin__hla_:
		mov	dh, byte ptr [ebp+12]	;/* b */
		sub	dh, byte ptr [ebp+8]	;/* c */
		cmp	dh, 0
		jl	L818_PutBinDH__hla_
		jmp	L817_PutCinDH__hla_

L816_PutAinDH__hla_:
		mov	dh, byte ptr [ebp+16]	;/* a */
		jmp	L819_ExitSequence__hla_

L818_PutBinDH__hla_:
		mov	dh, byte ptr [ebp+12]	;/* b */
		jmp	L819_ExitSequence__hla_

L817_PutCinDH__hla_:
		mov	dh, byte ptr [ebp+8]	;/* c */
		jmp	L819_ExitSequence__hla_

L819_ExitSequence__hla_:
		pop	ebx
		ret
xL809_min__hla___hla_:
;L809_min__hla_  endp




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


		push	L833_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_iValue1__hla_+0], al	;/* iValue1 */
		pop	eax
		push	L855_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L807_iValue2__hla_+0], al	;/* iValue2 */
		pop	eax
		push	L877_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L808_iValue3__hla_+0], al	;/* iValue3 */
		pop	eax
		push	L899_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	bx, 0
		mov	bl, byte ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	bx
		mov	bx, 0
		mov	bl, byte ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		push	bx
		mov	bx, 0
		mov	bl, byte ptr [L808_iValue3__hla_+0]	;/* iValue3 */
		push	bx
		mov	bx, 0
		push	bx
		call	L809_min__hla_
		push	L917_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L935_str__hla_
		call	STDOUT_PUTS	; puts
		sub	esp, 4
		mov	byte ptr [ESP+0], dh
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


