global _memcpy

section .text
_memcpy:
  push   ebp
  mov    ebp, esp
  
  xor    ebx, ebx          ;Clear ebx register for use
  mov    ebx, [esp+16]     ;Store number of characters
  mov    ecx, [esp+12]     ;Store pointer to source
  mov    edi, [esp+8]      ;Store pointer to destination
  jmp    _memcpy_move      ;Begin moving data
  
_memcpy_done:
  mov    eax, [esp+8]      ;Move destination to be returned
  pop    ebp
  ret

_memcpy_move:
  mov    al, [ecx]         ;Load single byte
  stosb                    ;Store byte at edi
  inc    ecx               ;Increment byte location
  dec    ebx               ;Decrement counter
  or     ebx, ebx          ;Check if counter is zero
  jz     _memcpy_done      ;Finished if zero
  jmp    _memcpy_move      ;Move next byte if non-zero
  