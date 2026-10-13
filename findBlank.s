.arch armv8-a
.align 2

.text
.global findBlank
.type findBlank, %function

findBlank:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov x1, x0      // x1 = puzzle base address
    mov w2, #0      // w2 = index

find_loop:
    cmp w2, #81
    bge no_blank    // if index >= 81, no blank found

    uxtw x3, w2          // extend w2 -> x3
    ldrb w4, [x1, x3]    // load puzzle[index] into w4
    cbz w4, found_blank  // if puzzle[index] == 0, found it

    add w2, w2, #1
    b find_loop

found_blank:
    mov w0, w2           // return the index
    ldp x29, x30, [sp], #16
    ret

no_blank:
    mov w0, #-1
    ldp x29, x30, [sp], #16
    ret

