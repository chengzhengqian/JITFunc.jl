BITS 64
movq xmm0,    [rdi+ 0]
mulsd xmm0,   [rdi+ 8]
movq   [rdi+ 32],xmm0
movq xmm0,    [rdi+ 0]
mulsd xmm0,   [rdi+ 32]
mulsd xmm0,   [rdi+ 88]
movq   [rdi+ 64],xmm0
movq xmm0,  [rdi+ 64]
addsd xmm0,    [rdi+ 16]
addsd xmm0,    [rdi+ 96]
movq     [rdi+ 40],xmm0
movq xmm0,    [rdi+ 32]
movq   [rdi+ 72],xmm0
movq xmm0,    [rdi+ 40]
mulsd xmm0,   [rdi+ 40]
movq   [rdi+ 80],xmm0
movq xmm0,  [rdi+ 72]
addsd xmm0,    [rdi+ 80]
movq     [rdi+ 48],xmm0
movq xmm0,    [rdi+ 32]
mulsd xmm0,   [rdi+ 40]
mulsd xmm0,   [rdi+ 40]
movq   [rdi+ 56],xmm0
ret
