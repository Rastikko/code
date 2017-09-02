
		align	4
		label	L820_len__hla_ word
		dd	01bh
		dd	01bh
		label	L820_str__hla_ byte
		db	"Enter a hexadecimal value: "
		db	0


		align	4
		label	L834_len__hla_ word
		dd	01bh
		dd	01bh
		label	L834_str__hla_ byte
		db	"The value you entered was $"
		db	0


		align	4
		label	L848_len__hla_ word
		dd	025h
		dd	025h
		label	L848_str__hla_ byte
		db	"In decimal, the value you entered is "
		db	0

		db	0
		db	0
