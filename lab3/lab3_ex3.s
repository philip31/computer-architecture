	.file	1 "lab3_ex3.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(source)
	lw	$4,%lo(source)($2) # first value in source
	beq	$4,$0,$L2 
	nop

	lui	$3,%hi(dest)
	addiu	$2,$2,%lo(source) # pointer1 to first value in source
	addiu	$3,$3,%lo(dest) # pointer2 to first value in dest
$L3:
	addiu	$2,$2,4  # increment pointer1 to next value in source
	sw	$4,0($3) # store currently loaded value from source into location from pointer2 
	addiu	$3,$3,4 #increment pointer2 to next value in dest
	lw	$4,0($2) # load value at pointer1
	bne	$4,$0,$L3 # check if loaded value == 0
	nop

$L2:
	move	$2,$0
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.globl	dest
	.section	.bss,"aw",@nobits
	.align	2
	.type	dest, @object
	.size	dest, 40
dest:
	.space	40
	.globl	source
	.data
	.align	2
	.type	source, @object
	.size	source, 28
source:
	.word	3
	.word	1
	.word	4
	.word	1
	.word	5
	.word	9
	.word	0
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
