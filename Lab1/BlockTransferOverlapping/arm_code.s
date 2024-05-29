	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD	0x10001000       ; Initial stack pointer value
	DCD	Reset_Handler    ; Reset handler address
	
	ALIGN
	
	AREA mycode, CODE, READONLY ; Read-only area for code
	ENTRY
	EXPORT	Reset_Handler
	
Reset_Handler
	movs r9, #4             ; Initialize r9 with the value 4
	ldr r0, =SRC            ; Load the address of SRC into r0
	ldr r2, =DST            ; Load the address of DST into r2
	
loop
	str r9, [r0]            ; Store the value of r9 into the address pointed by r0 (SRC)
	str r9, [r2]            ; Store the value of r9 into the address pointed by r2 (DST)
	adds r0, r0, #4         ; Increment the address in r0 by 4
	adds r2, r2, #4         ; Increment the address in r2 by 4
	subs r9, r9, #1         ; Decrement r9 by 1
	cmp r9, #0              ; Compare r9 with 0
	bne loop                ; If r9 is not zero, branch to loop
	
STOP
	b STOP                 ; Infinite loop to halt execution
	
	AREA mydata, DATA, READWRITE ; Read-write area for data
SRC DCD 0                  ; Define SRC with an initial value of 0
DST DCD 0                  ; Define DST with an initial value of 0
	
	END
