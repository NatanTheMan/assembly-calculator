section .text
  global _start

_start:
  
  jmp exit

exit:
  mov rax, 60
  xor rdi, rdi
  syscall
