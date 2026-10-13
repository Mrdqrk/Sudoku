.arch armv8-a
.global checkCol
.type checkCol, %function

checkCol:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov w3, #0             // row = 0
    mov w5, #9             // constant 9 into w5

col_loop:
    cmp w3, #9
    bge col_done

    mul w4, w3, w5         // row * 9
    add w6, w4, w1         // + col
    uxtw x7, w6
    ldrb w8, [x0, x7]      // load puzzle[index]
    cmp w8, w2
    beq found_in_col

    add w3, w3, #1
    b col_loop

found_in_col:
    mov w0, #1
    b col_exit

col_done:
    mov w0, #0

col_exit:
    ldp x29, x30, [sp], #16
    ret
