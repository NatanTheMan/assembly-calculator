section .bss
  buf: resb 10

section .text
  global _start

_start:
  call read_input
  
  jmp exit

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
