# in PKg mode, dev JITFunc
using Revise

using JITFunc

asm="
	mov \$0x1, %eax		;
        retq
"
# by defautl, one use the gas
func=Func(asm,"test1")
@call func(()=>Int64,)
disassemble(func)

# a more complex example
asm="
    movsd  (%rsi),%xmm0
    addsd %xmm0, %xmm0
    movsd  %xmm0,(%rdi)
    retq
"
# rdi for &a, rsi for &b
func=Func(asm, "test2")
a=Vector{Float64}(undef,1)
b=Vector{Float64}(undef,1)
b[1]=2.0
@time @call func((Ptr{Float64},Ptr{Float64})=>Cvoid,a,b)
# notice this is only work here, but can not used inside a function
disassemble(func,syntax="intel")
# now, we check the function of saveing a func
saveFunc(func,"./test2.bin")
func_=loadFunc("test2.bin")
disassemble(func_,syntax="intel")
@time @call func_((Ptr{Float64},Ptr{Float64})=>Cvoid,a,b)

# func_=loadFunc("/home/chengzhengqian/share_workspace/czq_julia_package/JITFunc/src/gene/test2")

function test_problem(func::Func)
    @call func((Ptr{Float64},Ptr{Float64})=>Cvoid,a,b)
end

# test_problem(func) this will crushed!!

# now, we show the same code using nasm syntax. notice the BITS 64
# To use a nasm syntax
asm="
BITS 64
    movsd xmm0,  [rsi]
    addsd xmm0, xmm0
    movsd  [rdi],  xmm0
    ret
"
a=Vector{Float64}(undef,1)
b=Vector{Float64}(undef,1)
b[1]=2.0
func=Func(asm, "test3",mode="nasm")
@time @call func_((Ptr{Float64},Ptr{Float64})=>Cvoid,a,b)

# now,we address our solution of dynamicall call the function.
# rdi is the address for the default buffer
asm="
BITS 64
    movsd xmm0,  [rdi]
    movsd xmm1,  [rdi+8]
    addsd xmm0, xmm1
    movsd  [rdi+8*2],  xmm0
    ret
"
mem=Array{Float64}(undef,10)
mem[1:2]=[1,2]
func=Func(asm, "test4",mode="nasm")
# this works only outside the range
@time @call func((Ptr{Float64},)=>Cvoid,mem)
mem[1:2]=[1,2]
@time runFunc(func,mem)
# we add a new interface
func(mem)
# this takes a single point as the buffer for the function, all the input and output should within this buffer.

disassemble(func)


# now, we use nasm

