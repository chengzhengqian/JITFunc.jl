
BITS 64
movsd xmm0,  [rdi]
movsd xmm1,  [rdi+8]
addsd xmm0, xmm1
movsd  [rdi+8*2],  xmm0
ret
