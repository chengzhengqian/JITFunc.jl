
BITS 64
movapd xmm0,  [rsi]
addpd xmm0, xmm0
movapd  [rdi],  xmm0
ret
