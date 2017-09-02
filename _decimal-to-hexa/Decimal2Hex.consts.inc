
		align	4
		label	L820_len__hla_ word
		dd	017h
		dd	017h
		label	L820_str__hla_ byte
		db	"Input a decimal value: "
		db	0


		align	4
		label	L842_len__hla_ word
		dd	0ah
		dd	0ah
		label	L842_str__hla_ byte
		db	"The value "
		db	0

		db	0

		align	4
		label	L853_len__hla_ word
		dd	0ch
		dd	0ch
		label	L853_str__hla_ byte
		db	" in hex is $"
		db	0

		db	0
		db	0
		db	0
