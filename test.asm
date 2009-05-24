          NOP
BEGIN     LDA   READ_DATA
          STA   FFFF_DATA
          LDA   FFFF_DATA
          ADD   ADD_DATA
          SUB   ADD_DATA
          AND   HALF
          OR    STRIPS

          LDA   ONE
          CMP   TWO
          ADD   ONE
          CMP   TWO
          ADD   ONE
          CMP   TWO
          JMP   EXIT
          NOP
          NOP
          NOP
EXIT      HLT   

ADD_DATA  CON   0x0101  ; some data to add 
FFFF_DATA CON   0xFFFF  ; some data to read 
READ_DATA CON   0xA0A0  ; some data to read 
HALF      CON   0x00FF  ; some data to do bitwise add with
STRIPS    CON   0x0F0F  ; some data to do bitwise or with

ONE       CON   1
TWO       CON   2
