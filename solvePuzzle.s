.arch armv8-a
.align 2

.global solvePuzzle
.type solvePuzzle, %function

.extern findBlank
.extern checkRow
.extern checkCol
.extern checkBlock

solvePuzzle:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // x0 = puzzle pointer
    mov x19, x0
    bl findBlank
    cmp w0, #-1
    beq puzzleSolved

    // Save blank index
    mov w20, w0

    mov w21, #1              // try numbers 1 to 9
try_loop:
    cmp w21, #10
    b.eq try_fail            // no valid number found

    // Check if safe to place w21 at index w20
    mov x0, x19              // puzzle
    mov w1, w20              // index
    mov w2, w21              // number
    bl checkRow
    cmp w0, #0
    b.ne next_number

    mov x0, x19
    mov w1, w20
    mov w2, w21
    bl checkCol
    cmp w0, #0
    b.ne next_number

    mov x0, x19
    mov w1, w20
    mov w2, w21
    bl checkBlock
    cmp w0, #0
    b.ne next_number

    // Safe to place the number
    uxtw x1, w20
    strb w21, [x19, x1]

    mov x0, x19
    bl solvePuzzle
    cmp w0, #1
    beq puzzleSolved

    // Backtrack
    mov w22, #0
    uxtw x1, w20
    strb w22, [x19, x1]

next_number:
    add w21, w21, #1
    b try_loop

try_fail:
    mov w0, #0
    b end

puzzleSolved:
    mov w0, #1

end:
    ldp x29, x30, [sp], #16
    ret
