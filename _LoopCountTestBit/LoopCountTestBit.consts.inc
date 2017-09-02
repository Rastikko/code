
		align	4
		label	L820_len__hla_ word
		dd	023h
		dd	023h
		label	L820_str__hla_ byte
		db	"Please provide a value to inspect: "
		db	0


		align	4
		label	L848_len__hla_ word
		dd	0ah
		dd	0ah
		label	L848_str__hla_ byte
		db	"The value "
		db	0

		db	0

		align	4
		label	L859_len__hla_ word
		dd	03h
		dd	03h
		label	L859_str__hla_ byte
		db	" = "
		db	0


		align	4
		label	L870_len__hla_ word
		dd	05h
		dd	05h
		label	L870_str__hla_ byte
		db	" has "
		db	0

		db	0
		db	0

		align	4
		label	L884_len__hla_ word
		dd	08h
		dd	08h
		label	L884_str__hla_ byte
		db	" set bit"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L900_len__hla_ word
		dd	01h
		dd	01h
		label	L900_str__hla_ byte
		db	"s"
		db	0

		db	0
		db	0
