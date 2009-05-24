            LDA   A
            AND   FRACT_MASK
            STA   FRACTION_A
            LDA   A
            AND   EXPON_MASK
            SRA   11
            STA   EXPONENT_A
            HLT

; ------- VAR & CONST ----------------
            ORIG  128
    ;- - INPUT DATA & RESULT - - - -
A           CON   0x3801 ; 1*2^1 = 2
B           CON   0x3801 ; 1*2^1 = 2
RESULT      CON   0x0000
    ;- - - CONSTANTS - - - - - - - -
FRACT_MASK  CON   0x07FF ; b"0000011111111111"
EXPON_MASK  CON   0x7800 ; b"0111100000000000"
    ;- - - VARIABLES - - - - - - - -
            ORIG  200
FRACTION_A  CON   0x0000
FRACTION_B  CON   0x0000
EXPONENT_A  CON   0X0000
EXPONENT_B  CON   0x0000
