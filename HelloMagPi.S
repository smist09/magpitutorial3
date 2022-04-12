@
@ Assembler program print out "Hello MagPi Readers"
@ using the Pico SDK.
@
@ R0 - first parameter to printf
@ R1 - second parameter to printf
@ R7 - index counter
@

.thumb_func		    @ Necessary because sdk uses BLX
.global main	    @ Provide program starting address to linker

main:
	MOV	R7, #0		@ initialize counter to 0
	BL	stdio_init_all	@ initialize uart or usb
loop:
	LDR	R0, =hellomagpi	@ load address of hellomagpi string
	ADD	R7, #1		@ Increment counter
	MOV	R1, R7		@ Move the counter to second parameter
	BL	printf		@ Call pico_printf
	B	loop		@ loop forever
		
.data
.align  4			@ necessary alignment
hellomagpi: .asciz   "Hello MagPi Readers %d\n"
