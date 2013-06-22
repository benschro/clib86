global _puts

extern _GetStdHandle
extern _WriteFile

section .data
  newline  db  0x0A, 0x00

section .bss
  dummy  resd  1
  
section .text
_puts:
  push   ebp
  mov    ebp, esp

  xor    ebx, ebx          ;Clear ebx register for use
  jmp    _puts_count       ;Count how many chars to print

_puts_api:
  push   -11               ;Ask for stdout
  call   _GetStdHandle     ;Populate eax with stdout handle
  
  mov    ecx, [esp+8]      ;Move string pointer back into ecx  
  push   eax               ;Store stdout handle on the stack
  
  push   dword 0           ;Overlapped - null
  push   dummy             ;Dummy pointer for amount of chars written
  push   ebx               ;String length
  push   ecx               ;String pointer
  push   eax               ;Handle to stdout
  call   _WriteFile        ;Write string to stdout
  
  pop    eax               ;Retrieve stdout handle from the stack
  
  push   dword 0           ;Overlapped - null
  push   dummy             ;Dummy pointer for amount of chars written
  push   dword 1           ;String length
  push   newline           ;String pointer
  push   eax               ;Handle to stdout
  call   _WriteFile        ;Write newline to stdout

  pop    ebp
  ret
  
_puts_count:
  mov    eax, [esp+8]      ;Move string pointer into eax
  add    eax, ebx          ;Add offset to string pointer
  mov    al, [eax]         ;Move value of pointer into al
  or     al, al            ;Check if al is zero
  jz    _puts_api          ;Jump if zero
  inc    ebx               ;Increment offset
  jmp    _puts_count       ;Loop through next character
  
  