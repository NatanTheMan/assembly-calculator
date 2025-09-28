section .bss
  buf: resb 10

section .data
  msg_first_input: db "Enter first number: "

section .text
  global _start

_start:
  call read_first_number
  
  jmp exit

read_first_number:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_first_input
  mov rdx, 20
  syscall

  call read_input
  ret


read_input:
  mov rax, 0
  mov rdi, 0
  mov rsi, buf
  mov rdx, 10
  syscall
  ret

exit:
  mov rax, 60
  xor rdi, rdi
  syscall
