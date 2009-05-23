          NOP   
BEGIN     LDA   READ_DATA 
          STA   FFFF_DATA 
          LDA   FFFF_DATA 
          ADD   ADD_DATA 
          ;SUB   0xAD 
          JMP   BEGIN 
          HLT   
ADD_DATA  CON   0x0101;  some data to add 
FFFF_DATA CON   0xFFFF;  some data to read 
READ_DATA CON   0xA0A0;  some data to read 
