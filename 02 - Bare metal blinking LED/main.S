
.long               0x20000000                     
.long               _start

#define PERIPH_BASE           (0x40000000) /*!< Peripheral base address in the alias region */
#define AHBPERIPH_BASE        (PERIPH_BASE + 0x00020000)
#define RCC_BASE              (AHBPERIPH_BASE + 0x00001000)

#define PERIPH_BASE           ((uint32_t)0x40000000) /*!< Peripheral base address in the alias region */
#define AHB2PERIPH_BASE       (PERIPH_BASE + 0x08000000)
#define GPIOC_BASE            (AHB2PERIPH_BASE + 0x00000800)


_start:

    @ Enable clock for GPIOC peripheral in RCC registers
    LDR r0, =(0x40021000 + 0x14)
    LDR r1, =(1 << 19)
    STR r1, [r0]     @Store R0 value to r1
   
    @ Enable GPIOC pin 9 asi output
    LDR r0, =(0x48000800 + 0x00)
    LDR r1, =(1 << 18)
    STR r1, [r0]     @Store R0 value to r1
   

loop:

    @ Write high to pin PC9
    LDR r0, =(0x48000800 + 0x14)
    LDR r1, =(1 << 9)
    STR r1, [r0]     @Store R1 value to address pointed by R0
   
    @ Dummy counter to slow down my loop
    LDR R0, =0
    LDR R1, =200000
    l0:
    ADD R0, R0, #1
    cmp R0, R1
    bne l0

   
    @ Write low to PC9
    LDR r0, =(0x48000800 + 0x14)
    LDR r1, =(0)
    STR r1, [r0]     @Store R1 value to address pointed by R0

    @ Dummy counter to slow down my loop
    LDR R0, =0
    LDR R1, =200000
    l1:
    ADD R0, R0, #1
    cmp R0, R1
    bne l1

   
b loop
   
.global _start
