		label	L806_inputChar__hla_ byte
		rb	1
		label	L808_iReturnAddress__hla_ dword
		rb	4
		label	L809_iRegisterValue__hla_ dword
		rb	4
		label	L810_iPadNumber__hla_ word
		rb	2
		label	L811_iThree__hla_ byte
		db	03h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
