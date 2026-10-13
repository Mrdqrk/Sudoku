
.arch armv8-a
.text
.global loadPuzzle
.type loadPuzzle, %function

loadPuzzle:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    mov x1, x0       // x1 = puzzle pointer

    // Row 0
    mov w2, #5
    strb w2, [x1, #0]
    mov w2, #3
    strb w2, [x1, #1]
    mov w2, #0
    strb w2, [x1, #2]
    strb w2, [x1, #3]
    mov w2, #7
    strb w2, [x1, #4]
    mov w2, #0
    strb w2, [x1, #5]
    strb w2, [x1, #6]
    strb w2, [x1, #7]
    strb w2, [x1, #8]

    // Row 1
    mov w2, #6
    strb w2, [x1, #9]
    mov w2, #0
    strb w2, [x1, #10]
    strb w2, [x1, #11]
    mov w2, #1
    strb w2, [x1, #12]
    mov w2, #9
    strb w2, [x1, #13]
    mov w2, #5
    strb w2, [x1, #14]
    mov w2, #0
    strb w2, [x1, #15]
    strb w2, [x1, #16]
    strb w2, [x1, #17]

    // Row 2
    mov w2, #0
    strb w2, [x1, #18]
    mov w2, #9
    strb w2, [x1, #19]
    mov w2, #8
    strb w2, [x1, #20]
    mov w2, #0
    strb w2, [x1, #21]
    strb w2, [x1, #22]
    strb w2, [x1, #23]
    mov w2, #6
    strb w2, [x1, #24]
    strb w2, [x1, #25]
    strb w2, [x1, #26]

    // Row 3
    mov w2, #8
    strb w2, [x1, #27]
    mov w2, #0
    strb w2, [x1, #28]
    strb w2, [x1, #29]
    mov w2, #0
    strb w2, [x1, #30]
    mov w2, #6
    strb w2, [x1, #31]
    mov w2, #0
    strb w2, [x1, #32]
    strb w2, [x1, #33]
    mov w2, #3
    strb w2, [x1, #34]

    // Row 4
    mov w2, #4
    strb w2, [x1, #36]
    mov w2, #0
    strb w2, [x1, #37]
    mov w2, #0
    strb w2, [x1, #38]
    mov w2, #8
    strb w2, [x1, #39]
    mov w2, #0
    strb w2, [x1, #40]
    mov w2, #3
    strb w2, [x1, #41]
    mov w2, #0
    strb w2, [x1, #42]
    strb w2, [x1, #43]
    mov w2, #1
    strb w2, [x1, #44]

    // Row 5
    mov w2, #7
    strb w2, [x1, #45]
    mov w2, #0
    strb w2, [x1, #46]
    strb w2, [x1, #47]
    mov w2, #0
    strb w2, [x1, #48]
    mov w2, #2
    strb w2, [x1, #49]
    mov w2, #0
    strb w2, [x1, #50]
    strb w2, [x1, #51]
    mov w2, #6
    strb w2, [x1, #52]

    // Row 6
    mov w2, #0
    strb w2, [x1, #54]
    mov w2, #6
    strb w2, [x1, #55]
    mov w2, #0
    strb w2, [x1, #56]
    strb w2, [x1, #57]
    strb w2, [x1, #58]
    mov w2, #0
    strb w2, [x1, #59]
    mov w2, #2
    strb w2, [x1, #60]
    mov w2, #8
    strb w2, [x1, #61]

    // Row 7
    mov w2, #0
    strb w2, [x1, #63]
    mov w2, #0
    strb w2, [x1, #64]
    strb w2, [x1, #65]
    mov w2, #4
    strb w2, [x1, #66]
    mov w2, #1
    strb w2, [x1, #67]
    mov w2, #9
    strb w2, [x1, #68]
    mov w2, #0
    strb w2, [x1, #69]
    strb w2, [x1, #70]
    mov w2, #5
    strb w2, [x1, #71]

    // Row 8
    mov w2, #0
    strb w2, [x1, #72]
    mov w2, #0
    strb w2, [x1, #73]
    mov w2, #0
    strb w2, [x1, #74]
    mov w2, #0
    strb w2, [x1, #75]
    mov w2, #8
    strb w2, [x1, #76]
    mov w2, #0
    strb w2, [x1, #77]
    mov w2, #0
    strb w2, [x1, #78]
    mov w2, #7
    strb w2, [x1, #79]
    mov w2, #9
    strb w2, [x1, #80]

    ldp x29, x30, [sp], 16
    ret
