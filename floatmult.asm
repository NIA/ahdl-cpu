            ;-- parse A --
            LDA   A
            AND   FRACT_MASK
            OR    FIRST_ONE
            STA   FRACTION_A
            LDA   A
            AND   EXPON_MASK
            SRA   11
            STA   EXPONENT_A
            ;-- parse B
            LDA   B
            AND   FRACT_MASK
            OR    FIRST_ONE
            STA   FRACTION_B
            LDA   B
            AND   EXPON_MASK
            SRA   11
            STA   EXPONENT_B
            ;-- calculate EXPONENT ---
            LDA   EXPONENT_A
            ADD   EXPONENT_B
            SUB   EXPON_XCS
            STA   EXPON_RES
            
            
            ;------ END ---------
            HLT

; ------- VAR & CONST ----------------
            ORIG  128
    ;- - INPUT DATA & RESULT - - - -
A           CON   0x4000 ; (1+0)*2^1 = 2
B           CON   0x4000 ; (1+0)*2^1 = 2
RESULT      CON   0x0000
    ;- - - CONSTANTS - - - - - - - -
FRACT_MASK  CON   0x07FF ; b"0000011111111111"
EXPON_MASK  CON   0x7800 ; b"0111100000000000"

FIRST_ONE   CON   0x0800 ; b"0000100000000000"

EXPON_XCS   CON   7 ; exponent excess to present negative exponent as positive
    ;- - - VARIABLES - - - - - - - -
            ORIG  200
FRACTION_A  CON   0x0000
FRACTION_B  CON   0x0000
EXPONENT_A  CON   0X0000
EXPONENT_B  CON   0x0000
            
            ORIG  220
FRACT_RES   CON   0x0000
EXPON_RES   CON   0x0000
