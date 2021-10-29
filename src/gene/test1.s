BITS 64
movsd xmm0,[rdx+0*8]
mulsd xmm0,[rdi+1*8]
movsd [rsi+0*8], xmm0
movsd xmm0,[rdx+0*8]
mulsd xmm0,[rdi+5*8]
movsd [rsi+1*8], xmm0
movsd xmm0,[rdi+3*8]
mulsd xmm0,[rdi+7*8]
movsd [rsi+2*8], xmm0
movsd xmm0,[rdi+3*8]
mulsd xmm0,[rsi+2*8]
movsd [rsi+3*8], xmm0
movsd xmm0,[rdi+3*8]
mulsd xmm0,[rdi+3*8]
movsd [rsi+4*8], xmm0
movsd xmm0,[rsi+4*8]
mulsd xmm0,[rsi+1*8]
movsd [rsi+5*8], xmm0
movsd xmm0,[rdi+4*8]
mulsd xmm0,[rsi+3*8]
movsd [rsi+6*8], xmm0
movsd xmm0,[rdi+6*8]
mulsd xmm0,[rsi+5*8]
movsd [rsi+7*8], xmm0
movsd xmm0,[rsi+6*8]
addsd xmm0,[rsi+7*8]
movsd [rsi+8*8], xmm0
movsd xmm0,[rdi+6*8]
mulsd xmm0,[rsi+4*8]
movsd [rsi+9*8], xmm0
movsd xmm0,[rdi+3*8]
mulsd xmm0,[rsi+1*8]
movsd [rsi+10*8], xmm0
movsd xmm0,[rdi+4*8]
mulsd xmm0,[rsi+2*8]
movsd [rsi+11*8], xmm0
movsd xmm0,[rdi+6*8]
mulsd xmm0,[rsi+10*8]
movsd [rsi+12*8], xmm0
movsd xmm0,[rsi+11*8]
addsd xmm0,[rsi+12*8]
movsd [rsi+13*8], xmm0
movsd xmm0,[rsi+0*8]
mulsd xmm0,[rsi+13*8]
movsd [rsi+14*8], xmm0
movsd xmm0,[rdi+4*8]
mulsd xmm0,[rsi+4*8]
movsd [rsi+15*8], xmm0
movsd xmm0,[rdi+0*8]
mulsd xmm0,[rsi+8*8]
movsd [rsi+16*8], xmm0
movsd xmm0,[rdi+2*8]
mulsd xmm0,[rsi+14*8]
movsd [rsi+17*8], xmm0
movsd xmm0,[rsi+16*8]
addsd xmm0,[rsi+17*8]
movsd [rsi+18*8], xmm0
movsd xmm0,[rdi+2*8]
mulsd xmm0,[rsi+13*8]
movsd [rsi+19*8], xmm0
movsd xmm0,[rsi+0*8]
mulsd xmm0,[rsi+2*8]
movsd [rsi+20*8], xmm0
movsd xmm0,[rdi+0*8]
mulsd xmm0,[rsi+3*8]
movsd [rsi+21*8], xmm0
movsd xmm0,[rdi+2*8]
mulsd xmm0,[rsi+20*8]
movsd [rsi+22*8], xmm0
movsd xmm0,[rsi+21*8]
addsd xmm0,[rsi+22*8]
movsd [rsi+23*8], xmm0
movsd xmm0,[rdx+0*8]
mulsd xmm0,[rsi+0*8]
movsd [rsi+24*8], xmm0
movsd xmm0,[rsi+24*8]
mulsd xmm0,[rsi+10*8]
movsd [rsi+25*8], xmm0
movsd xmm0,[rdi+0*8]
mulsd xmm0,[rsi+5*8]
movsd [rsi+26*8], xmm0
movsd xmm0,[rdi+2*8]
mulsd xmm0,[rsi+25*8]
movsd [rsi+27*8], xmm0
movsd xmm0,[rsi+26*8]
subsd xmm0,[rsi+27*8]
movsd [rsi+28*8], xmm0
movsd xmm0,[rdi+6*8]
mulsd xmm0,[rdi+3*8]
movsd [rsi+29*8], xmm0
movsd xmm0,[rsi+24*8]
mulsd xmm0,[rsi+29*8]
movsd [rsi+30*8], xmm0
movsd xmm0,[rdi+0*8]
mulsd xmm0,[rsi+9*8]
movsd [rsi+31*8], xmm0
movsd xmm0,[rdi+2*8]
mulsd xmm0,[rsi+30*8]
movsd [rsi+32*8], xmm0
movsd xmm0,[rsi+31*8]
subsd xmm0,[rsi+32*8]
movsd [rsi+33*8], xmm0
movsd xmm0,[rdi+4*8]
mulsd xmm0,[rdi+7*8]
movsd [rsi+34*8], xmm0
movsd xmm0,[rdi+6*8]
mulsd xmm0,[rsi+1*8]
movsd [rsi+35*8], xmm0
movsd xmm0,[rsi+34*8]
addsd xmm0,[rsi+35*8]
movsd [rsi+36*8], xmm0
movsd xmm0,[rsi+0*8]
mulsd xmm0,[rsi+36*8]
movsd [rsi+37*8], xmm0
movsd xmm0,[rdi+3*8]
mulsd xmm0,[rdi+4*8]
movsd [rsi+38*8], xmm0
movsd xmm0,[rdi+0*8]
mulsd xmm0,[rsi+13*8]
movsd [rsi+39*8], xmm0
movsd xmm0,[rdi+2*8]
mulsd xmm0,[rsi+37*8]
movsd [rsi+40*8], xmm0
movsd xmm0,[rsi+39*8]
addsd xmm0,[rsi+40*8]
movsd [rsi+41*8], xmm0
movsd xmm0,[rsi+0*8]
mulsd xmm0,[rsi+41*8]
movsd [rsi+42*8], xmm0
movsd xmm0,[rsi+0*8]
mulsd xmm0,[rsi+38*8]
movsd [rsi+43*8], xmm0
movsd xmm0,[rdi+0*8]
mulsd xmm0,[rsi+15*8]
movsd [rsi+44*8], xmm0
movsd xmm0,[rdi+2*8]
mulsd xmm0,[rsi+43*8]
movsd [rsi+45*8], xmm0
movsd xmm0,[rsi+44*8]
addsd xmm0,[rsi+45*8]
movsd [rsi+46*8], xmm0
movsd xmm0,[rdi+0*8]
mulsd xmm0,[rsi+18*8]
movsd [rsi+47*8], xmm0
movsd xmm0,[rdi+2*8]
mulsd xmm0,[rsi+42*8]
movsd [rsi+48*8], xmm0
movsd xmm0,[rsi+47*8]
addsd xmm0,[rsi+48*8]
movsd [rsi+49*8], xmm0
ret
