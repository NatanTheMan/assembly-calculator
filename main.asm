section .bss
  num1 resb 10
  num2 resb 10

section .data
  msg_first_num: db "Enter first number: "
  msg_first_num_len: equ $ - msg_first_num

  msg_second_num: db "Enter second number: "
  msg_second_num_len: equ $ - msg_second_num

section .text
  global _start

_start:
  mov rax, msg_first_num
  mov rdi, msg_first_num_len
  call print_msg

  mov rax, num1
  call read_num

  mov rax, msg_second_num
  mov rdi, msg_second_num_len
  call print_msg

  mov rax, num1
  call read_num
  
  jmp exit

print_msg:
  mov rsi, rax
  mov rdx, rdi

  mov rax, 1
  mov rdi, 1
  syscall
  ret

read_num:
  mov rsi, rax

  mov rax, 0
  mov rdi, 0
  mov rdx, 10
  syscall
  ret

exit:
  mov rax, 60
  xor rdi, rdi
  syscall
