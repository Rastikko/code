		label	L807_iReturnAddress__hla_ dword
		rb	4
		label	L808_iRegisterValue__hla_ dword
		rb	4
		label	L809_modtwo__hla_ byte
		db	02h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
