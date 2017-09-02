
		align	4
		label	L820_len__hla_ word
		dd	021h
		dd	021h
		label	L820_str__hla_ byte
		db	"Enter a decimal value to double: "
		db	0

		db	0
		db	0

		align	4
		label	L842_len__hla_ word
		dd	017h
		dd	017h
		label	L842_str__hla_ byte
		db	"Twice the input equals "
		db	0


		align	4
		label	L866_len__hla_ word
		dd	02ah
		dd	02ah
		label	L866_str__hla_ byte
		db	"Enter a (positive) decimal value to halve:"
		db	0

		db	0

		align	4
		label	L888_len__hla_ word
		dd	016h
		dd	016h
		label	L888_str__hla_ byte
		db	"Half the input equals "
		db	0

		db	0

		align	4
		label	L912_len__hla_ word
		dd	029h
		dd	029h
		label	L912_str__hla_ byte
		db	"Enter a positive/negative value to halve:"
		db	0

		db	0
		db	0
