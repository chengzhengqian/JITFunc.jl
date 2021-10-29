module JITFunc

export Func, @call, remove, disassemble, runFunc, saveFunc, loadFunc,reg
    
mutable struct Func
    ptr:: Ptr{UInt8}
    size::Vector{Int64}
end

# notice ccall must use a const lib path
const  libpath="$(@__DIR__)/libjitfunc.so"
const genepath="$(@__DIR__)/gene"
if(!isdir(genepath))
    mkdir(genepath)
end


"""
add finalizer
this should only be used privatied
"""
function loadFuncFromGene(filename)
    dir=@__DIR__
    filename="$(genepath)/$(filename)"
    loadFunc(filename)
end

function loadFunc(filename)
    size=Vector{Int64}(undef,1)
    ptr_func=ccall((:loadBinary,libpath),Ptr{UInt8},(Ptr{UInt8},Ptr{Int64}),pointer(filename),size)
    result=Func(ptr_func,size)
    f(result)=(@async println("remove $(result)");remove(result))
    finalizer(f,result)
end


function Base.show(io::IO, jitFunc::Func)
    print(io::IO,"Func at $(UInt64(jitFunc.ptr)) with size $(jitFunc.size[1])")
end

# since this is the default pattern, we use
# we now implement up to six pointer like parameters.
# As we used the code in linux, one should following the
"""
System V AMD64 ABI
The first six integer or pointer arguments are passed in registers 
RDI, RSI, RDX, RCX, R8, R9
"""

function reg(i)
    ["rdi","rsi","rdx","rcx","r8","r9"][i]
end


function runFunc(jitFunc::Func,arg1::Vector{Float64})
    ccall((:runFunc1,libpath),Cvoid,(Ptr{Cvoid},Ptr{Float64}),jitFunc.ptr,arg1)
end

function runFunc(jitFunc::Func,arg1::Vector{Float64},arg2::Vector{Float64})
    ccall((:runFunc2,libpath),Cvoid,(Ptr{Cvoid},Ptr{Float64},Ptr{Float64}),jitFunc.ptr,arg1,arg2)
end

function runFunc(jitFunc::Func,arg1::Vector{Float64},arg2::Vector{Float64},arg3::Vector{Float64})
    ccall((:runFunc3,libpath),Cvoid,(Ptr{Cvoid},Ptr{Float64},Ptr{Float64},Ptr{Float64}),jitFunc.ptr,arg1,arg2,arg3)
end

function runFunc(jitFunc::Func,arg1::Vector{Float64},arg2::Vector{Float64},arg3::Vector{Float64},arg4::Vector{Float64})
    ccall((:runFunc4,libpath),Cvoid,(Ptr{Cvoid},Ptr{Float64},Ptr{Float64},Ptr{Float64},Ptr{Float64}),jitFunc.ptr,arg1,arg2,arg3,arg4)
end

function runFunc(jitFunc::Func,arg1::Vector{Float64},arg2::Vector{Float64},arg3::Vector{Float64},arg4::Vector{Float64},arg5::Vector{Float64})
    ccall((:runFunc5,libpath),Cvoid,(Ptr{Cvoid},Ptr{Float64},Ptr{Float64},Ptr{Float64},Ptr{Float64},Ptr{Float64}),jitFunc.ptr,arg1,arg2,arg3,arg4,arg5)
end

function runFunc(jitFunc::Func,arg1::Vector{Float64},arg2::Vector{Float64},arg3::Vector{Float64},arg4::Vector{Float64},arg5::Vector{Float64},arg6::Vector{Float64})
    ccall((:runFunc6,libpath),Cvoid,(Ptr{Cvoid},Ptr{Float64},Ptr{Float64},Ptr{Float64},Ptr{Float64},Ptr{Float64},Ptr{Float64}),jitFunc.ptr,arg1,arg2,arg3,arg4,arg5,arg6)
end


function (func::Func)(x...)
    if(length(x)>6)
        error("only support up to 6 parameters")
    else
        runFunc(func,x...)
    end
    
end

function remove(jitFunc::Func)
    ccall((:free_page,libpath),Cvoid,(Ptr{UInt8},Int64),jitFunc.ptr,jitFunc.size[1])
end


function convertToCall(jitFunc,types,args...)
    jitFuncPtr=:($(jitFunc).ptr)
    para_types=types.args[2]
    return_types=types.args[3]
    Expr(:call,:ccall,jitFuncPtr,return_types,para_types,args...)
end

macro call( expr)
    esc(convertToCall(expr.args[1],expr.args[2],expr.args[3:end]...))
end

function writeString(filename,content)
    f=open(filename,"w")
    write(f,content)
    close(f)
end


"""
mode can bet gas or nasm,
use different assembler to compile the source string
for asm, one require `BITS 64` at the beginning
add different mode
"""
function compileAsm(asm,filebase; mode="gas")
    dir=@__DIR__
    filebase="$(genepath)/$(filebase)"
    asmfile="$(filebase).s"
    writeString(asmfile,asm)
    if(mode=="gas")
        objfile="$(filebase).o"
        run(`as $(asmfile) -o $(objfile) `)
        run(`ld --oformat binary  $(objfile) -o $(filebase)`)
    end
    if(mode=="nasm")
        run(`nasm $(asmfile) -f bin -o $(filebase)`)
    end
    if(mode=="arm")
        objfile="$(filebase).o"
        run(`as $(asmfile) -o $(objfile) `)
        # ld does not work on arm
        run(`objcopy -O binary -j .text $(objfile) $(filebase)`)
    end    
end


function Func(asm::String,filename::String;mode="gas")
    compileAsm(asm,filename;mode=mode)
    loadFuncFromGene(filename)
end

function saveFunc(jitFunc::Func,filename)
    file=open(filename,"w")
    [write(file,unsafe_load(jitFunc.ptr,i)) for i in 1:jitFunc.size[1]]
    close(file)
end

# dumpJITFunc(jitFunc,"./test_dumpfunc.bin")

"""
syntax could be : att, intel,
see objdump for more information
"""
function disassemble(jitFunc::Func;syntax="att")
    filename="$(genepath)/czq_dump_jit.bin"
    saveFunc(jitFunc::Func,filename)
    if(syntax=="arm")
        run(`objdump -b binary  -m aarch64 -D $(filename)`)
    else
        run(`objdump -b binary -M $(syntax) -m i386:x86-64 -D $(filename)`)
    end
end

end
