
		align	4
		label	L820_len__hla_ word
		dd	020h
		dd	020h
		label	L820_str__hla_ byte
		db	"Gimme a decimal value to print: "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L840_len__hla_ word
		dd	04h
		dd	04h
		label	L840_str__hla_ byte
		db	" is "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L854_len__hla_ word
		dd	01h
		dd	01h
		label	L854_str__hla_ byte
		db	"_"
		db	0

		db	0
		db	0
