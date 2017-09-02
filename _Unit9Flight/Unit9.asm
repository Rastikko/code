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

		include	'Unit9.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Unit9.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Unit9.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Unit9.consts.inc'

		include	'Unit9.ro.inc'

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


		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETD	; getd
		mov	ebx, eax
		pop	eax
		mov	dl, 0
		mov	edi, 1

L834_forLoopTerminationCondition__hla_:
		cmp	dl, 7
		jg	L835_forLoopEnd__hla_

L836_forLoopBody__hla_:

L837_compareBitZero__hla_:
		cmp	dl, 0
		jne	L838_compareBitOne__hla_
		test	ebx, edi
		jz	L839_forLoopIncrement__hla_
		add	dword ptr [L807_iFlightCost__hla_+0], 25	;/* iFlightCost */
		inc	byte ptr [L809_iFlightBags__hla_+0]	;/* iFlightBags */
		jmp	L839_forLoopIncrement__hla_

L838_compareBitOne__hla_:
		cmp	dl, 1
		jne	L840_compareBitTwo__hla_
		test	ebx, edi
		jz	L839_forLoopIncrement__hla_
		add	dword ptr [L807_iFlightCost__hla_+0], 50	;/* iFlightCost */
		add	byte ptr [L809_iFlightBags__hla_+0], 2	;/* iFlightBags */
		jmp	L839_forLoopIncrement__hla_

L840_compareBitTwo__hla_:
		cmp	dl, 2
		jne	L841_compareBitThree__hla_
		test	ebx, edi
		jz	L839_forLoopIncrement__hla_
		add	dword ptr [L808_iFlightMiles__hla_+0], 100	;/* iFlightMiles */
		add	dword ptr [L807_iFlightCost__hla_+0], 50	;/* iFlightCost */
		jmp	L839_forLoopIncrement__hla_

L841_compareBitThree__hla_:
		cmp	dl, 3
		jne	L842_compareBitFour__hla_
		test	ebx, edi
		jz	L839_forLoopIncrement__hla_
		add	dword ptr [L808_iFlightMiles__hla_+0], 200	;/* iFlightMiles */
		add	dword ptr [L807_iFlightCost__hla_+0], 100	;/* iFlightCost */
		jmp	L839_forLoopIncrement__hla_

L842_compareBitFour__hla_:
		cmp	dl, 4
		jne	L843_compareBitFive__hla_
		test	ebx, edi
		jz	L839_forLoopIncrement__hla_
		add	dword ptr [L808_iFlightMiles__hla_+0], 400	;/* iFlightMiles */
		add	dword ptr [L807_iFlightCost__hla_+0], 200	;/* iFlightCost */
		jmp	L839_forLoopIncrement__hla_

L843_compareBitFive__hla_:
		cmp	dl, 5
		jne	L844_compareBitSix__hla_
		test	ebx, edi
		jz	L839_forLoopIncrement__hla_
		add	dword ptr [L808_iFlightMiles__hla_+0], 800	;/* iFlightMiles */
		add	dword ptr [L807_iFlightCost__hla_+0], 400	;/* iFlightCost */
		jmp	L839_forLoopIncrement__hla_

L844_compareBitSix__hla_:
		cmp	dl, 6
		jne	L845_compareBitSeven__hla_
		test	ebx, edi
		jz	L839_forLoopIncrement__hla_
		mov	byte ptr [L810_bFlightMeal__hla_+0], 1	;/* bFlightMeal */
		add	dword ptr [L807_iFlightCost__hla_+0], 10	;/* iFlightCost */
		jmp	L839_forLoopIncrement__hla_

L845_compareBitSeven__hla_:
		cmp	dl, 7
		jne	L839_forLoopIncrement__hla_
		test	ebx, edi
		jz	L839_forLoopIncrement__hla_
		mov	byte ptr [L811_bFlightFirstClass__hla_+0], 1	;/* bFlightFirstClass */
		mov	ecx, dword ptr [L807_iFlightCost__hla_+0]	;/* iFlightCost */
		add	dword ptr [L807_iFlightCost__hla_+0], ecx	;/* iFlightCost */
		jmp	L839_forLoopIncrement__hla_

L839_forLoopIncrement__hla_:
		inc	dl
		rol	edi, 1
		jmp	L834_forLoopTerminationCondition__hla_

L835_forLoopEnd__hla_:

L846_displayTicketPrice__hla_:
		cmp	dword ptr [L808_iFlightMiles__hla_+0], 0	;/* iFlightMiles */
		je	L847_displayErrorMessage__hla_

L848_firstClass__hla_:
		cmp	byte ptr [L811_bFlightFirstClass__hla_+0], 1	;/* bFlightFirstClass */
		jne	L849_displayEconomy__hla_
		push	L863_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L868_bags__hla_

L849_displayEconomy__hla_:
		push	L882_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L868_bags__hla_:
		cmp	byte ptr [L809_iFlightBags__hla_+0], 0	;/* iFlightBags */
		jne	L887_displayBags__hla_
		push	L901_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L906_meal__hla_

L887_displayBags__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [L809_iFlightBags__hla_+0]	; (type int8 iFlightBags)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L926_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L906_meal__hla_:
		cmp	byte ptr [L810_bFlightMeal__hla_+0], 0	;/* bFlightMeal */
		jne	L931_displayMeal__hla_
		push	L945_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L950_miles__hla_

L931_displayMeal__hla_:
		push	L964_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L950_miles__hla_:
		push	dword ptr [L808_iFlightMiles__hla_+0]	; (type int32 iFlightMiles)
		call	STDOUT_PUTI32	; puti32
		push	L988_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L1006_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_iFlightCost__hla_+0]	; (type int32 iFlightCost)
		call	STDOUT_PUTI32	; puti32
		jmp	L1013_endOfDisplay__hla_

L847_displayErrorMessage__hla_:
		push	L1027_str__hla_
		call	STDOUT_PUTS	; puts

L1013_endOfDisplay__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


