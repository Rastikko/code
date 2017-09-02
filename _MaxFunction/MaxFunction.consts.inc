
		align	4
		label	L827_len__hla_ word
		dd	0fh
		dd	0fh
		label	L827_str__hla_ byte
		db	"gimme a value: "
		db	0


		align	4
		label	L849_len__hla_ word
		dd	015h
		dd	015h
		label	L849_str__hla_ byte
		db	"gimme another value: "
		db	0

		db	0
		db	0

		align	4
		label	L871_len__hla_ word
		dd	014h
		dd	014h
		label	L871_str__hla_ byte
		db	"Calling Max Function"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L889_len__hla_ word
		dd	01ah
		dd	01ah
		label	L889_str__hla_ byte
		db	"Returned from Max Function"
		db	0

		db	0

		align	4
		label	L907_len__hla_ word
		dd	06h
		dd	06h
		label	L907_str__hla_ byte
		db	"max = "
		db	0

		db	0
