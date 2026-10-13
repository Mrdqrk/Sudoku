.arch armv8-a
.align 2

.global main
.type main, %function

.extern loadPuzzle
.extern printPuzzle
.extern solvePuzzle

.data
puzzle:
    .space 81

.text
main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    adr x0, puzzle
    bl loadPuzzle

    adr x0, puzzle
    bl printPuzzle

    adr x0, puzzle
    bl solvePuzzle

    adr x0, puzzle
    bl printPuzzle

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
