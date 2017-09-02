		label	L806_iFirstValue__hla_ dword
		dd	00h
		label	L807_iSecondValue__hla_ dword
		dd	00h
		label	L808_bFirstIteration__hla_ byte
		db	01h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
