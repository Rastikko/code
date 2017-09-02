
		align	4
		label	L827_len__hla_ word
		dd	018h
		dd	018h
		label	L827_str__hla_ byte
		db	"Starting from the top..."
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L845_len__hla_ word
		dd	01ch
		dd	01ch
		label	L845_str__hla_ byte
		db	"about to: jmp( EAX ); (lbl1)"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L863_len__hla_ word
		dd	016h
		dd	016h
		label	L863_str__hla_ byte
		db	"---> here I am at lbl2"
		db	0

		db	0

		align	4
		label	L881_len__hla_ word
		dd	026h
		dd	026h
		label	L881_str__hla_ byte
		db	"about to: jmp( iLbl3Location ); (lbl3)"
		db	0

		db	0

		align	4
		label	L899_len__hla_ word
		dd	016h
		dd	016h
		label	L899_str__hla_ byte
		db	"---> here I am at lbl1"
		db	0

		db	0

		align	4
		label	L917_len__hla_ word
		dd	01ch
		dd	01ch
		label	L917_str__hla_ byte
		db	"about to: jmp( EBX ); (lbl2)"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L936_len__hla_ word
		dd	016h
		dd	016h
		label	L936_str__hla_ byte
		db	"---> here I am at lbl3"
		db	0

		db	0
