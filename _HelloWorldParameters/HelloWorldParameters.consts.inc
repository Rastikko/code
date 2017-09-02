
		align	4
		label	L822_len__hla_ word
		dd	017h
		dd	017h
		label	L822_str__hla_ byte
		db	"Hello, World Procedure!"
		db	0


		align	4
		label	L840_len__hla_ word
		dd	0eh
		dd	0eh
		label	L840_str__hla_ byte
		db	"value of AX = "
		db	0

		db	0

		align	4
		label	L864_len__hla_ word
		dd	012h
		dd	012h
		label	L864_str__hla_ byte
		db	"value of iValue = "
		db	0

		db	0

		align	4
		label	L888_len__hla_ word
		dd	018h
		dd	018h
		label	L888_str__hla_ byte
		db	"Calling Hello Parameters"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L906_len__hla_ word
		dd	01eh
		dd	01eh
		label	L906_str__hla_ byte
		db	"Returned from Hello Parameters"
		db	0

		db	0
