TEST1       LDA   TEST1_A
            STA   A
            LDA   TEST1_B
            STA   B
            JMP   START
TEST2       LDA   TEST2_A
            STA   A
            LDA   TEST2_B
            STA   B
            JMP   START
TEST3       LDA   TEST3_A
            STA   A
            LDA   TEST3_B
            STA   B
            JMP   START

START       LDA   TEST_NUM
            ADD   ONE
            STA   TEST_NUM
            ;-- parse A ---
            LDA   A
            AND   FRACT_MASK
            OR    FIRST_ONE
            STA   FRACTION_A
            LDA   A
            AND   EXPON_MASK
            SRA   11
            CMP   NULL  ; check if argument is NULL of INFINITY
            JE    IF_NULL
            STA   EXPONENT_A
            ;-- parse B ---
            LDA   B
            AND   FRACT_MASK
            OR    FIRST_ONE
            STA   FRACTION_B
            LDA   B
            AND   EXPON_MASK
            SRA   11
            CMP   NULL  ; check if argument is NULL of INFINITY
            JE    IF_NULL
            STA   EXPONENT_B
            ;-- calculate EXPONENT ---
            ; now we have exponent of B in rA
            LDA   EXPONENT_A
            ADD   EXPONENT_B
            SUB   EXPON_XCS
            STA   EXPON_RES
            ;-- calculate FRACTION ---
            LDA   FRACTION_A
            MUL   FRACTION_B
            SLAX  5
            AND   FRACT_MASK    ; delete unnecessary "1"
            STA   FRACT_RES
            ; TODO:
            ;-- correct EXPONENT if needed

            ;--
            LDA   EXPON_RES
            SLA   11
            OR    FRACT_RES
            STA   RESULT
            JMP   FINISH
            
            ;----- if NULL ----
IF_NULL     STA   RESULT
            JMP   FINISH
            ;------ END ---------
FINISH      LDA   TEST_NUM
            CMP   TWO
            JL    TEST2
            CMP   THREE
            JL    TEST3

            HLT

; ------- VAR & CONST ----------------
            ORIG  128
    ;- - INPUT DATA & RESULT - - - -
A           CON   0x0000
B           CON   0x0000
RESULT      CON   0x0000
    ;- - - CONSTANTS - - - - - - - -
NULL        CON   0
ONE         CON   1
TWO         CON   2
THREE       CON   3
FOUR        CON   4
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

TEST_NUM    CON   0

            ORIG  220
FRACT_RES   CON   0x0000
EXPON_RES   CON   0x0000
    ;- - - TEST CASES - - - - - - - 
TEST1_A     CON   0x4800 ; (1+0)*2^2 = 4
TEST1_B     CON   0x5000 ; (1+0)*2^3 = 8
TEST2_A     CON   0x4000
TEST2_B     CON   0x0000 ; 0
TEST3_A     CON   0x3A00 ; 1.25
TEST3_B     CON   0x3900 ; 1.125
