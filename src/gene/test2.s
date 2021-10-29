
BITS 64
movsd xmm0,  [rdi]
addsd xmm0,xmm0
movsd  [rdi], xmm0
movsd  [rsi], xmm0
movsd  [rdx], xmm0
movsd  [rcx], xmm0
movsd  [r8], xmm0
movsd  [r9], xmm0
ret
