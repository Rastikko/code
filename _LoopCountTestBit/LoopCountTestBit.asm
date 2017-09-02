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

		include	'LoopCountTestBit.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'LoopCountTestBit.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'LoopCountTestBit.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'LoopCountTestBit.consts.inc'

		include	'LoopCountTestBit.ro.inc'

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
		mov	dword ptr [L806_iDataValue__hla_+0], eax	;/* iDataValue */
		pop	eax
		mov	ebx, dword ptr [L806_iDataValue__hla_+0]	;/* iDataValue */
		mov	ecx, dword ptr [L806_iDataValue__hla_+0]	;/* iDataValue */
		mov	dh, 0
		mov	edi, 1

L829_forLoop__hla_:

L830_forLoopInit__hla_:
		mov	dl, 0

L831_forLoopTerminationCondition__hla_:
		cmp	dl, 31
		jg	L832_forLoopEnd__hla_

L833_forLoopBody__hla_:
		test	ebx, edi
		setnz	al
		add	dh, al
		rol	edi, 1

L834_forLoopIncrement__hla_:
		inc	dl
		jmp	L831_forLoopTerminationCondition__hla_

L832_forLoopEnd__hla_:
		push	L848_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_iDataValue__hla_+0]	; (type int32 iDataValue)
		call	STDOUT_PUTI32	; puti32
		push	L859_str__hla_
		call	STDOUT_PUTS	; puts
		push	ecx
		call	STDOUT_PUTD	; putd
		push	L870_str__hla_
		call	STDOUT_PUTS	; puts
		sub	esp, 4
		mov	byte ptr [ESP+0], dh
		call	STDOUT_PUTI8	; puti8
		push	L884_str__hla_
		call	STDOUT_PUTS	; puts

L885_ifDHequalsOne__hla_:
		cmp	dh, 1
		je	L886_endifDHequalsOne__hla_
		push	L900_str__hla_
		call	STDOUT_PUTS	; puts

L886_endifDHequalsOne__hla_:
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


