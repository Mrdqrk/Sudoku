.arch armv8-a
.global checkRow
.type checkRow, %function

checkRow:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov w3, #0             // col = 0
    mov w5, #9             // constant 9 into w5

    mul w4, w1, w5         // row offset = row * 9

row_loop:
    cmp w3, #9
    bge row_done

    add w6, w4, w3         // index = offset + col
    uxtw x7, w6            // zero-extend to x7
    ldrb w8, [x0, x7]      // load puzzle[index]
    cmp w8, w2
    beq found_in_row

    add w3, w3, #1
    b row_loop

found_in_row:
    mov w0, #1
    b row_exit

row_done:
    mov w0, #0

row_exit:
    ldp x29, x30, [sp], #16
    ret
