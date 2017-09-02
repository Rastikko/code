		label	L806_iValue1__hla_ dword
		dd	00h
		label	L807_iValue2__hla_ dword
		dd	00h
		label	L809_iReturnAddress__hla_ dword
		rb	4
		label	L810_iMax__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
