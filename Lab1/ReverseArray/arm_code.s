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
	mov r9, #2
	ldr r0, =SRC
	ldr r1, = SRC + (12)

loop
	ldr r4, [r0]
	ldr r5, [r1]
	mov r4, r6
	mov r5, r4
	mov r6, r5
	str r4, [r0], #4
	str r5, [r1], #-4
	subs r9, #1
	cmp r9, #0
	bne loop
	
STOP
	B	STOP
	
SRC	DCD	0X1, 0X2, 0X3, 0X4

	AREA	mydata,	DATA,	READWRITE
	
	END
	
	