.arch armv8-a
.align 2

.text
.global findBlock
.type findBlock, %function

findBlock:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // w0 = input: cell index

    mov w10, #9
    udiv w1, w0, w10      // w1 = row = index / 9

    mov w10, #9
    udiv w2, w0, w10      // w2 = temp for modulo
    msub w2, w2, w10, w0  // w2 = index - (index/9)*9 => col

    mov w10, #3
    udiv w5, w1, w10      // block_row = row / 3

    mov w10, #3
    udiv w6, w2, w10      // block_col = col / 3

    mov w10, #3
    mul w7, w5, w10       // block_row * 3
    add w0, w7, w6        // block = block_row * 3 + block_col

    ldp x29, x30, [sp], #16
    ret
