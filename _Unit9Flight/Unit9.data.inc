		label	L806_iFlight__hla_ dword
		dd	00h
		label	L807_iFlightCost__hla_ dword
		dd	00h
		label	L808_iFlightMiles__hla_ dword
		dd	00h
		label	L809_iFlightBags__hla_ byte
		db	00h
		label	L810_bFlightMeal__hla_ byte
		db	00h
		label	L811_bFlightFirstClass__hla_ byte
		db	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
