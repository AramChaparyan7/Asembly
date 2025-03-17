extern scanf
extern printf
section .data
    text db "there is no 0 power of 0",10,0
    ffrt db "answer is %d",10,0
    cfrt db "%d %d",0
section .bss
section .text
global main:
zz:
    mov rdi,text
    call printf
    jmp end
zero:
    cmp dword[rbp-4],0
    je zz
    mov rdi,ffrt
    mov rsi,1
    call printf
    jmp end
main:
    push rbp
    mov rbp,rsp
    
    sub rsp,16
    mov rdi,cfrt
    lea rsi,[rbp-4]
    lea rdx,[rbp-8]
    call scanf
    mov rcx,0
    mov rbx,0
    mov ebx,dword[rbp-4]
    mov ecx,dword[rbp-8]
    mov rax,1
    cmp dword[rbp-8],0
    je zero
L:
    mul rbx
    loop L

    mov rdi,ffrt
    mov qword[rbp-16],rax
    mov rsi,qword[rbp-16]
    call printf
end:
    mov rsp,rbp
    pop rbp
