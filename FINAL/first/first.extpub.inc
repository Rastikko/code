		global2	__imp__MessageBoxA@16,dword
		global2	__imp__ExitProcess@4,dword

		section	'.text' code readable executable align 16
		global	STR_FREE
		global	MEM_ALLOC
		global	STDIN_FLUSHINPUT
		global	STDOUT_NEWLN
		global	DefaultExceptionHandler__hla_
		global	abstract__hla_
		global	HardwareException__hla_
		global	BuildExcepts__hla_
		global	STDOUT_PUTS
		global	STDOUT_PUTD
		global	STDOUT_PUTC
		global	Raise__hla_
		global	STDIN_A_GETS
		global	shortDfltExcept__hla_

		public	MainPgmCoroutine__hla_
		public	DfltExHndlr__hla_
		public	_HLAMain
		public	HWexcept__hla_
