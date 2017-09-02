		label	L806_iValue1__hla_ byte
		db	00h
		label	L807_iValue2__hla_ byte
		db	00h
		label	L808_iValue3__hla_ byte
		db	00h
		label	L810_iReturnAddress__hla_ dword
		rb	4
		label	L811_iMin__hla_ byte
		rb	1
		label	L812_iTemporary__hla_ word
		rb	2
		label	L813_iRegisterValue__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
