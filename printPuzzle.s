.arch armv8-a
.align 2
.section .rodata
format:
    .asciz "%d "
newline:
    .asciz "\n"

.text
.global printPuzzle
.type printPuzzle, %function

printPuzzle:
    // Prologue
    stp fp, lr, [sp, -16]!
    mov fp, sp

    mov x20, #0              // index = 0
    mov x19, x0              // x19 points to puzzle base

loop:
    ldrb w1, [x19, x20]      // Load byte into w1 (unsigned)
    ldr x0, =format
    bl printf                // Print the number

    add x20, x20, #1
    mov x21, x20
    mov x22, #9
    udiv x23, x21, x22       // x23 = index / 9
    msub x23, x23, x22, x21  // x23 = index % 9

    cmp x23, #0              // If index % 9 == 0, print newline
    b.ne skip_newline

    ldr x0, =newline
    bl printf

skip_newline:
    cmp x20, #81             // Loop until index == 81
    b.lt loop

    // Epilogue
    ldp fp, lr, [sp], 16
    ret




   