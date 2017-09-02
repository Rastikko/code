		global2	__imp__MessageBoxA@16,dword
		global2	__imp__ExitProcess@4,dword

		section	'.text' code readable executable align 16
		global	STDOUT_PUTI32
		global	STDOUT_NEWLN
		global	DefaultExceptionHandler__hla_
		global	abstract__hla_
		global	HardwareException__hla_
		global	BuildExcepts__hla_
		global	STDOUT_PUTW
		global	STDOUT_PUTS
		global	Raise__hla_
		global	shortDfltExcept__hla_

		public	MainPgmCoroutine__hla_
		public	DfltExHndlr__hla_
		public	_HLAMain
		public	HWexcept__hla_
L948_str__hla_  equ	L864_str__hla_	;
L924_str__hla_  equ	L840_str__hla_	;
