		label	L806_iValueX__hla_ byte
		db	00h
		label	L807_iValueY__hla_ byte
		db	00h
		label	L808_iValueZ__hla_ byte
		db	00h
		label	L809_xAddress__hla_ dword
		dd	00h
		label	L810_yAddress__hla_ dword
		dd	00h
		label	L811_zAddress__hla_ dword
		dd	00h
		label	L813_dReturnAddress__hla_ dword
		rb	4
		label	L814_iTemporary__hla_ byte
		rb	1
		label	L815_dEDXRegister__hla_ dword
		dd	00h
		label	L816_dECXRegister__hla_ dword
		dd	00h
		label	L817_dEBXRegister__hla_ dword
		dd	00h
		label	L819_iReturnAddress__hla_ dword
		rb	4
		label	L820_dEDXRegister__hla_ dword
		dd	00h
		label	L821_dECXRegister__hla_ dword
		dd	00h
		label	L822_dEBXRegister__hla_ dword
		dd	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
