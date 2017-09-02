
		align	4
		label	L820_len__hla_ word
		dd	017h
		dd	017h
		label	L820_str__hla_ byte
		db	"Hello, World Procedure!"
		db	0


		align	4
		label	L838_len__hla_ word
		dd	0eh
		dd	0eh
		label	L838_str__hla_ byte
		db	"value of AX = "
		db	0

		db	0

		align	4
		label	L862_len__hla_ word
		dd	016h
		dd	016h
		label	L862_str__hla_ byte
		db	"Calling Hello Register"
		db	0

		db	0

		align	4
		label	L880_len__hla_ word
		dd	01ch
		dd	01ch
		label	L880_str__hla_ byte
		db	"Returned from Hello Register"
		db	0

		db	0
		db	0
		db	0
