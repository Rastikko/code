
		align	4
		label	L820_len__hla_ word
		dd	023h
		dd	023h
		label	L820_str__hla_ byte
		db	"Please provide a value to inspect: "
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
		dd	03h
		dd	03h
		label	L853_str__hla_ byte
		db	" = "
		db	0


		align	4
		label	L864_len__hla_ word
		dd	05h
		dd	05h
		label	L864_str__hla_ byte
		db	" has "
		db	0

		db	0
		db	0

		align	4
		label	L878_len__hla_ word
		dd	0ch
		dd	0ch
		label	L878_str__hla_ byte
		db	" set bit(s)."
		db	0

		db	0
		db	0
		db	0
