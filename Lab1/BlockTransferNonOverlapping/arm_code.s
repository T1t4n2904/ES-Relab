	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD	0x10001000
	DCD	Reset_Handler
	
	ALIGN
	
	AREA mycode, CODE, READONLY;	readonly when code : in ram, or code memory
	ENTRY
	EXPORT	Reset_Handler
	
Reset_Handler
	mov r9, #4
	
	ldr r0, =SRC
	ldr r2, =DST
	
	
	
loop
	ldr r1, [r0], #4
	str r1, [r2], #4
	subs r9, #1
	cmp r9, #0
	bne loop
	
STOP
	B	STOP
	
SRC	DCD	0X1, 0X2, 0X3, 0X4

	AREA	mydata,	DATA,	READWRITE
DST	DCD	0
	
	END
	
	