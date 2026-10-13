.arch armv8-a
.global checkBlock
.type checkBlock, %function

checkBlock:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov w10, #9
    mov w11, #3

    udiv w3, w1, w10       // row = index / 9
    msub w4, w3, w10, w1   // col = index - (row * 9)

    udiv w5, w3, w11       // block_row = row / 3
    udiv w6, w4, w11       // block_col = col / 3

    mul w7, w5, w11        // block_row_start = block_row * 3
    mul w8, w6, w11        // block_col_start = block_col * 3

    mov w9, #0             // i = 0

block_row_loop:
    cmp w9, #3
    bge block_done

    mov w12, #0            // j = 0

block_col_loop:
    cmp w12, #3
    bge next_block_row

    add w13, w7, w9         // block_row_start + i
    mov w14, #9
    mul w13, w13, w14       // (row_start+i) * 9
    add w15, w8, w12        // (col_start+j)
    add w13, w13, w15       // final index = (row_start+i)*9 + (col_start+j)

    uxtw x16, w13
    ldrb w17, [x0, x16]     // load puzzle[index]
    cmp w17, w2
    beq found_in_block

    add w12, w12, #1
    b block_col_loop

next_block_row:
    add w9, w9, #1
    b block_row_loop

found_in_block:
    mov w0, #1
    b block_exit

block_done:
    mov w0, #0

block_exit:
    ldp x29, x30, [sp], #16
    ret
