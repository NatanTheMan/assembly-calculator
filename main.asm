section .bss
  first_num: resb 10
  second_num: resb 10

section .data
  msg_first_input: db "Enter first number: "
  msg_second_input: db "Enter second number: "

section .text
  global _start

_start:
  call read_first_number
  call read_second_number
  
  jmp exit

read_first_number:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_first_input
  mov rdx, 20
  syscall

  mov rsi, first_num
  call read_input
  ret

read_second_number:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_second_input
  mov rdx, 21
  syscall

  mov rsi, second_num
  call read_input
  ret


read_input:
  mov rax, 0
  mov rdi, 0
  mov rdx, 10
  syscall
  ret

exit:
  mov rax, 60
  xor rdi, rdi
  syscall
