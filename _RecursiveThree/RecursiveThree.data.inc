		label	L806_iDataValue1__hla_ word
		dw 	00h
		label	L807_iDataValue2__hla_ word
		dw 	00h
		label	L809_returnAddress__hla_ dword
		rb	4
		label	L810_temp__hla_ word
		rb	2
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
