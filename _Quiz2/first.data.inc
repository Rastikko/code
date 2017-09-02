		label	L807_temporalNumber__hla_ dword
		rb	4
		label	L808_iRegisterValue__hla_ dword
		rb	4
		label	L809_iReturnAddress__hla_ dword
		rb	4
		label	L810_resultValue__hla_ dword
		rb	4
		label	L811_one__hla_ dword
		rb	4
		label	L812_two__hla_ dword
		rb	4
		label	L813_originalValue__hla_ byte
		rb	1
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
