@ Vector table start
.long               0x20001000                     
.long               _start
@ Vector table end

_start:

loop:
    ADD R0, R0, #1
b loop
   
.global _start
