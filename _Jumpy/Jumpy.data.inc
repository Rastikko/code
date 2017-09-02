		label	L807_iLbl1Location__hla_ dword
		dd	L806_lbl1__hla_
		label	L809_iLbl2Location__hla_ dword
		dd	L808_lbl2__hla_
		label	L811_iLbl3Location__hla_ dword
		dd	L810_lbl3__hla_
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
