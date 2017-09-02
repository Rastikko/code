		label	L807_dReturnAddress__hla_ dword
		rb	4
		label	L808_wDIRegister__hla_ word
		dw 	00h
		label	L809_wDXRegister__hla_ word
		dw 	00h
		label	L810_dEAXRegister__hla_ dword
		dd	00h
		label	L811_dEBXRegister__hla_ dword
		dd	00h
		label	L812_dECXRegister__hla_ dword
		dd	00h
		label	L813_sData__hla_ dword
		rb	4
		label	L817_dReturnAddress__hla_ dword
		rb	4
		label	L818_wDXRegister__hla_ word
		dw 	00h
		label	L819_dEBXRegister__hla_ dword
		dd	00h
		label	L822_stringData__hla_ dword
		rb	4
		label	L824_dReturnAddress__hla_ dword
		rb	4
		label	L825_dEDXRegister__hla_ dword
		dd	00h
		label	L826_dECXRegister__hla_ dword
		dd	00h
		label	L827_dEBXRegister__hla_ dword
		dd	00h
		label	L828_iMaxLenght__hla_ dword
		dd	050h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
