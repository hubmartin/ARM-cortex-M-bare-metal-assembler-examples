all: main.bin

main.o: main.S
	arm-none-eabi-as -mthumb -o main.o main.S

main.elf: main.o
	arm-none-eabi-ld -Ttext 0x8000000 main.o -o main.elf
   
main.bin: main.elf   
	arm-none-eabi-objcopy -S -O binary main.elf main.bin
	arm-none-eabi-size main.elf
   
clean:
	rm main.elf main.o main.bin a.out
